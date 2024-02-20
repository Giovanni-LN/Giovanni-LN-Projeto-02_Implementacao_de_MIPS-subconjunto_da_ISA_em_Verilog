// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// possui as seguintes portas: operand1 e operand2 (sinais de 32 bits) e result (saída de 32 bits).
// A saída result é calculada somando-se os valores de operand1 e operand2.

module soma32 (
    input [31:0] operand1,
    input [31:0] operand2,
    output reg [31:0] result
);

    always @* begin
        result = operand1 + operand2;
    end

endmodule