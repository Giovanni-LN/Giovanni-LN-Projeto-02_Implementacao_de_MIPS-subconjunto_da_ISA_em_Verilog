// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// possui as seguintes portas: A e B (sinais de 32 bits) e S (sinal de 1 bit).
// A saída Y é determinada pelo valor de S: se S for igual a 1'b1, a saída será igual a B;
// caso contrário, será igual a A.

module mux32(
    input [31:0] A, B,
    input S,
    output reg [31:0] Y
);

    always @* begin
        if (S == 1'b1)
            Y = B;
        else
            Y = A;
    end

endmodule
//1 bit seletor