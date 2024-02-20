// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// seleciona entre duas entradas (read_d2 e signExtended32) com base no valor da entrada ALUsrc.
// Se ALUsrc for 0, a saída ALUin2 será igual a read_d2. Se ALUsrc for 1, a saída ALUin2 será igual a signExtended32.
// Caso contrário, a saída terá um valor padrão de 32'hxxxx_xxxx. 

module mux_final (
    input ALUsrc,
    input [31:0] read_d2,
    input [31:0] signExtended32,
    output reg [31:0] ALUin2
);

always @* begin
    // Seleção do valor de saída com base na entrada ALUsrc
    if (ALUsrc == 0)
        ALUin2 = read_d2;
    else if (ALUsrc == 1)
        ALUin2 = signExtended32;
    else
        ALUin2 = 32'hxxxx_xxxx; // Valor padrão em caso de seleção inválida
end

endmodule
//seleciona entre read e sign