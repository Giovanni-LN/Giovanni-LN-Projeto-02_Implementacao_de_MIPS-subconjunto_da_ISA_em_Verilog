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