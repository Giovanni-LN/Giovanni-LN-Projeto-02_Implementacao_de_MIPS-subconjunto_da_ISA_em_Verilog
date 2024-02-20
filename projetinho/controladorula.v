// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// Realiza várias operações lógicas e aritméticas com base no valor da entrada OP.
// As operações incluem AND, OR, ADD, XOR, NOR, SLT (Set on Less Than), SUBTRACT, SET ON LESS THAN UNSIGNED,
// shifts lógicos e aritméticos, além de instruções I-type (ADDI, ANDI, ORI, XORI, BEQ, BNE, SLTI, SLTIU, LUI, LW, SW)
// e instruções J-type (J). O resultado é atualizado com base nas entradas e no sinal de clock,
// e a operação padrão é definida como zero quando OP não corresponde a nenhuma operação válida.
module controladorula(
    input [3:0] ALUOp,  // Entrada do sinal ALUOp da unidade de controle
    input [5:0] func,   // Entrada dos 6 bits menos significativos da instrução
    output reg [4:0] op // Saída que indica a operação a ser realizada pela ULA
);

// Lógica para determinar a operação da ULA com base nos sinais de entrada
always @* begin
    case(ALUOp)
        // Caso ALUOp seja 0, 1 ou 2, a operação depende dos bits da instrução func
        0: op = func[5:3]; // Utiliza os bits 5 a 3 de func para indicar a operação
        1: op = func[5:3]; // Utiliza os bits 5 a 3 de func para indicar a operação
        2: op = func[5:3]; // Utiliza os bits 5 a 3 de func para indicar a operação
        default: op = 5'b00000; // Valor padrão, a operação padrão será o AND
    endcase
    
    // Determinação da operação da ULA com base em func
    // Por exemplo:
    case(func)
        6'b100100: op = 5'b00000; // AND
        6'b100110: op = 5'b00001; // OR
        6'b100000: op = 5'b00010; // ADD
        6'b100101: op = 5'b00011; // XOR  
        6'b100111: op = 5'b00100; // NOR
        6'b101011: op = 5'b00101; // SLT
        6'b100010: op = 5'b00110; // SUB
        6'b101010: op = 5'b00111; // SLTU 
        6'b000010: op = 5'b01000; // SLL
        6'b000000: op = 5'b01001; // SRL
        6'b000111: op = 5'b01010; // SRA
        6'b000110: op = 5'b01011; // SLLV
        6'b000100: op = 5'b01100; // SRLV
        6'b000011: op = 5'b01101; // SRAV
        
    endcase
end

endmodule