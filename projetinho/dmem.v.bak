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