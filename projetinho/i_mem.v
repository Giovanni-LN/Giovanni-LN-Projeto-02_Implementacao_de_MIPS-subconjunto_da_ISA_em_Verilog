// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// possui duas portas: uma entrada chamada address (um barramento de 32 bits)
// e uma saída chamada i_out (também de 32 bits). A memória mem é declarada como um vetor de registradores de 32 bits,
// indexado de 0 a 2^20 - 1 (ou seja, 1.048.575 posições), e armazena as instruções.
// No bloco initial, a memória é inicializada a partir de um arquivo externo chamado “instruction.list”.
// A saída i_out é determinada com base no endereço de entrada address. Se o endereço estiver dentro do alcance da memória,
// o valor correspondente é lido; caso contrário, um valor padrão (32'hxxxxxxxx) é atribuído à saída

module i_mem(
    input wire [31:0] address,
    output reg [31:0] i_out
);

    localparam FILENAME = "instruction.list"; // Nome do arquivo externo
    
    reg [31:0] mem [0: (1<<20)-1]; // Memória de instrução
    
    // Inicialização da memória a partir do arquivo externo
    initial begin
        $readmemh(FILENAME, mem);
    end

    // Saída da memória de instrução
    always @* begin
        if (address < (1<<20))
            i_out = mem[address];
        else
            i_out = 32'hxxxxxxxx; // Valor padrão se o endereço estiver fora do alcance da memória
    end

endmodule