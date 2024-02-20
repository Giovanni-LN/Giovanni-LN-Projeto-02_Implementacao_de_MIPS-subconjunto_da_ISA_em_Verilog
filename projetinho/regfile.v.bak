module regfile (
    input [4:0] ReadAddr1,
    input [4:0] ReadAddr2,
    input [4:0] WriteAddr,
    input [31:0] WriteData,
    input Clock,
    input RegWrite,
    input Reset,
    output [31:0] ReadData1,
    output [31:0] ReadData2
);

    // Declaração do banco de registradores
    reg [31:0] registers [31:0];

    // Leitura assíncrona
    assign ReadData1 = registers[ReadAddr1];
    assign ReadData2 = registers[ReadAddr2];

    // Escrita síncrona
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            // Reseta todos os registradores para 0
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'h00000000;
            end
        end else if (RegWrite && WriteAddr != 5'b00000) begin
            // Escreve no registrador especificado
            registers[WriteAddr] <= WriteData;
        end
    end

endmodule