// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// Representa uma memória de dados com operações de leitura e escrita.
// Quando a leitura é ativada, ele retorna o conteúdo da posição de memória especificada;
// quando a escrita é ativada, ele atualiza o conteúdo da memória com os dados fornecidos.

module dmem (
    input [31:0] Address,
    input [31:0] WriteData,
    input MemWrite,
    input MemRead,
    output reg [31:0] ReadData
);

    // Declaração da memória de dados
    reg [31:0] memory [0:31];

    // Leitura assíncrona
    always @(Address) begin
        if (MemRead) begin
            ReadData = memory[Address];
        end else begin
            ReadData = 32'bz;  // Alta impedância
        end
    end

    // Escrita assíncrona
    always @(Address or WriteData or MemWrite) begin
        if (MemWrite) begin
            memory[Address] = WriteData;
        end
    end

endmodule