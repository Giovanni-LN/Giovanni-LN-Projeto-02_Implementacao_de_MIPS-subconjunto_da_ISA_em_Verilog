// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// possui as seguintes portas: rt e rd (sinais de 5 bits cada) e RegDst (sinal de 1 bit).
// A saída imem_to_write_addr é determinada pelo valor de RegDst: se RegDst for igual a 1'b1,
// a saída será igual a rd; caso contrário, será igual a rt.

module mux5(
    input wire [4:0] rt, rd,
    input wire RegDst,
    output reg [4:0] imem_to_write_addr
);
    always @* begin
        if (RegDst == 1'b1)
            imem_to_write_addr = rd;
        else
            imem_to_write_addr = rt;
    end
endmodule
//mux 5 bits