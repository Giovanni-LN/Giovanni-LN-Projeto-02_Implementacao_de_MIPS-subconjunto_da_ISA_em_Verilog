// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// possui quatro entradas (A, B, C e D) e uma entrada de seleção (S) de 2 bits.
// A saída (Y) é determinada pelo valor de S: quando S é 00, Y é igual a A; quando S é 01, Y é igual a B;
// quando S é 10, Y é igual a C; e quando S é 11, Y é igual a D. Se S não corresponder a nenhum dos casos,
// a saída terá um valor padrão de 32’hxxxx_xxxx.

module mux2_32 (
    input [31:0] A, B, C, D,
    input [1:0] S,
    output reg [31:0] Y
);

always @* begin
    case (S)
        2'b00: Y = A;
        2'b01: Y = B;
        2'b10: Y = C;
        2'b11: Y = D;
        default: Y = 32'hxxxx_xxxx; // Valor padrão em caso de seleção inválida
    endcase
end

endmodule
//2 bit seletor