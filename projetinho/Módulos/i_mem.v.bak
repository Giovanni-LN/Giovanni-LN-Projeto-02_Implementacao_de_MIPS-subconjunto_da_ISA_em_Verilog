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