// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// realiza várias operações lógicas e aritméticas com base no valor da entrada OP.
// As operações incluem AND, OR, ADD, XOR, NOR, SLT (Set on Less Than), SUBTRACT, SET ON LESS THAN UNSIGNED,
// shifts lógicos e aritméticos, além de instruções I-type (ADDI, ANDI, ORI, XORI, BEQ, BNE, SLTI, SLTIU, LUI, LW, SW)
// e instruções J-type (J). O resultado é atualizado com base nas entradas e no sinal de clock,
// e a operação padrão é definida como zero quando OP não corresponde a nenhuma operação válida.

module ula (
    input [31:0] In1,   // Operando 1
    input [31:0] In2,   // Operando 2
    input [4:0] OP,   // Operação a ser realizada
    input clock,   // Sinal de clock
    output reg [31:0] Result,   // Resultado da operação
    output reg Zero_flag,   // Flag que indica que o resultado é zero
    inout [31:0] D_mem   // Memória de dados
);
    reg [31:0] mem_value; // Variável interna para armazenar o valor a ser escrito na memória de dados
    
    always @(*) begin
        case (OP)
            5'b00000: begin   // Operação de AND
                Result = In1 & In2;
            end
            5'b00001: begin   // Operação de OR
                Result = In1 | In2;
            end
            5'b00010: begin   // Operação de ADD
                Result = In1 + In2;
            end
            5'b00011: begin   // Operação de XOR
                Result = In1 ^ In2;
            end
            5'b00100: begin   // Operação de NOR
                Result = ~(In1 | In2);
            end
            5'b00101: begin   // Operação de SLT (Set on Less Than)
                Result = (In1 < In2) ? 32'h1 : 32'h0;
            end
            5'b00110: begin   // Operação de SUBTRACT
                Result = In1 - In2;
            end
            5'b00111: begin   // Operação de SET ON LESS THAN UNSIGNED
                Result = ($unsigned(In1) < $unsigned(In2)) ? 32'h1 : 32'h0;
            end
            5'b01000: begin   // Operação de SHIFT LEFT LOGICAL
                Result = In1 << In2[4:0];
            end
            5'b01001: begin   // Operação de SHIFT RIGHT LOGICAL
                Result = In1 >> In2[4:0];
            end
            5'b01010: begin   // Operação de SHIFT RIGHT ARITHMETIC
                Result = $signed(In1) >>> In2[4:0];
            end
            5'b01011: begin   // Operação de SHIFT LEFT LOGICAL VARIABLE
                Result = In1 << (In2 & 5'h1F);
            end
            5'b01100: begin   // Operação de SHIFT RIGHT LOGICAL VARIABLE
                Result = In1 >> (In2 & 5'h1F);
            end
            5'b01101: begin   // Operação de SHIFT RIGHT ARITHMETIC VARIABLE
                Result = $signed(In1) >>> (In2 & 5'h1F);
            end
            5'b01110: begin   // Operação de JUMP REGISTER (JR)
                Result = In1;
            end
            5'b01111: begin   // Operação inválida (padrão)
                Result = 32'h0;
            end
            // I-type instructions
            5'b10000: begin   // Operação de ADDI
                Result = In1 + {16'b0, In2};
            end
            5'b10001: begin   // Operação de ANDI
                Result = In1 & {16'b0, In2};
            end
            5'b10010: begin   // Operação de ORI
                Result = In1 | {16'b0, In2};
            end
            5'b10011: begin   // Operação de XORI
                Result = In1 ^ {16'b0, In2};
            end
            5'b10100: begin   // Operação de BEQ
                Result = In1 == In2 ? 32'h1 : 32'h0;
            end
            5'b10101: begin   // Operação de BNE
                Result = In1 != In2 ? 32'h1 : 32'h0;
            end
            5'b10111: begin   // Operação de SLTI
                Result = (In1 < {16'b0, In2}) ? 32'h1 : 32'h0;
            end
            5'b11000: begin   // Operação de SLTIU
                Result = ($unsigned(In1) < {16'b0, In2}) ? 32'h1 : 32'h0;
            end
            5'b11001: begin   // Operação de LUI
                Result = {In2, 16'b0};
            end
            5'b11010: begin   // Operação de LW
                mem_value = D_mem[In1 + {16'b0, In2}];
                Result = In1;
            end
            5'b11011: begin   // Operação de SW
                mem_value = In2;
                Result = In1;
            end
            // J-type instructions
            5'b100000: begin   // Operação de J
                Result = {In1[31:28], In2, 2'b00};
            end
            5'b100001: begin   // Operação de JAL
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