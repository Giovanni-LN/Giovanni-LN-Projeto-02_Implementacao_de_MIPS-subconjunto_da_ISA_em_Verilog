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