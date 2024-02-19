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