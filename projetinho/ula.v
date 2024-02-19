module ula (
    input [31:0] In1,   // Operando 1
    input [31:0] In2,   // Operando 2
    input [5:0] OP,   // Operação a ser realizada
    input clock,   // Sinal de clock
    output reg [31:0] Result,   // Resultado da operação
    output reg Zero_flag,   // Flag que indica que o resultado é zero
    inout [31:0] D_mem   // Memória de dados
);
    reg [31:0] mem_value; // Variável interna para armazenar o valor a ser escrito na memória de dados
    
    always @(*) begin
        case (OP)
            6'b0000: begin   // Operação de AND
                Result = In1 & In2;
            end
            6'b0001: begin   // Operação de OR
                Result = In1 | In2;
            end
            6'b0010: begin   // Operação de ADD
                Result = In1 + In2;
            end
            6'b0011: begin   // Operação de XOR
                Result = In1 ^ In2;
            end
            6'b0100: begin   // Operação de NOR
                Result = ~(In1 | In2);
            end
            6'b0101: begin   // Operação de SLT (Set on Less Than)
                Result = (In1 < In2) ? 32'h1 : 32'h0;
            end
            6'b0110: begin   // Operação de SUBTRACT
                Result = In1 - In2;
            end
            6'b0111: begin   // Operação de SET ON LESS THAN UNSIGNED
                Result = ($unsigned(In1) < $unsigned(In2)) ? 32'h1 : 32'h0;
            end
            6'b1000: begin   // Operação de SHIFT LEFT LOGICAL
                Result = In1 << In2[4:0];
            end
            6'b1001: begin   // Operação de SHIFT RIGHT LOGICAL
                Result = In1 >> In2[4:0];
            end
            6'b1010: begin   // Operação de SHIFT RIGHT ARITHMETIC
                Result = $signed(In1) >>> In2[4:0];
            end
            6'b1011: begin   // Operação de SHIFT LEFT LOGICAL VARIABLE
                Result = In1 << (In2 & 5'h1F);
            end
            6'b1100: begin   // Operação de SHIFT RIGHT LOGICAL VARIABLE
                Result = In1 >> (In2 & 5'h1F);
            end
            6'b1101: begin   // Operação de SHIFT RIGHT ARITHMETIC VARIABLE
                Result = $signed(In1) >>> (In2 & 5'h1F);
            end
            6'b1110: begin   // Operação de JUMP REGISTER (JR)
                Result = In1;
            end
            6'b1111: begin   // Operação inválida (padrão)
                Result = 32'h0;
            end
            // I-type instructions
            6'b10000: begin   // Operação de ADDI
                Result = In1 + {16'b0, In2};
            end
            6'b10001: begin   // Operação de ANDI
                Result = In1 & {16'b0, In2};
            end
            6'b10010: begin   // Operação de ORI
                Result = In1 | {16'b0, In2};
            end
            6'b10011: begin   // Operação de XORI
                Result = In1 ^ {16'b0, In2};
            end
            6'b10100: begin   // Operação de BEQ
                Result = In1 == In2 ? 32'h1 : 32'h0;
            end
            6'b10101: begin   // Operação de BNE
                Result = In1 != In2 ? 32'h1 : 32'h0;
            end
            6'b10111: begin   // Operação de SLTI
                Result = (In1 < {16'b0, In2}) ? 32'h1 : 32'h0;
            end
            6'b11000: begin   // Operação de SLTIU
                Result = ($unsigned(In1) < {16'b0, In2}) ? 32'h1 : 32'h0;
            end
            6'b11001: begin   // Operação de LUI
                Result = {In2, 16'b0};
            end
            6'b11010: begin   // Operação de LW
                mem_value = D_mem[In1 + {16'b0, In2}];
                Result = In1;
            end
            6'b11011: begin   // Operação de SW
                mem_value = In2;
                Result = In1;
            end
            // J-type instructions
            6'b100000: begin   // Operação de J
                Result = {In1[31:28], In2, 2'b00};
            end
            6'b100001: begin   // Operação de JAL
                Result = In1 + 8;
                mem_value = Result;
            end
            default: begin   // Operação inválida (padrão)
                Result = 32'h0;
            end
        endcase
    end

    assign D_mem = mem_value;

    always @(*) begin
        Zero_flag = (Result == 32'h0) ? 1'b1 : 1'b0;
    end
endmodule