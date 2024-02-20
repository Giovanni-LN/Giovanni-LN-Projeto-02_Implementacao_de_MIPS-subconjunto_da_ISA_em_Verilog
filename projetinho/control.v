// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// responsável por controlar várias operações relacionadas a um processador ou circuito digital.
// Ele recebe um código de operação (opcode) e, com base nesse valor, configura várias saídas,
// como destino do registrador, operação da ALU e controle de memória.

module controL(
    input [4:0] opcode, 
    input reset,
    output reg [1:0] reg_dst, mem_to_reg, 
    output reg jump, branch, mem_read, mem_write, alu_src, reg_write, sign_or_zero,
	 output reg [3:0] alu_op
);

always @(*)
begin
    if(reset == 1'b1) begin
        reg_dst = 2'b00;
        mem_to_reg = 2'b00;
        alu_op = 4'b0000;
        jump = 1'b0;
        branch = 1'b0;
        mem_read = 1'b0;
        mem_write = 1'b0;
        alu_src = 1'b0;
        reg_write = 1'b0;
        sign_or_zero = 1'b1;
    end
    else begin
        case(opcode)
            5'b00000: begin // add
                reg_dst = 2'b01;
                mem_to_reg = 2'b00;
                alu_op = 4'b0000;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
            5'b00001: begin // sli
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0010;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b0;
            end
            5'b00010: begin // j
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0000;
                jump = 1'b1;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b0;
                sign_or_zero = 1'b1;
            end
            5'b00011: begin // jal
                reg_dst = 2'b10;
                mem_to_reg = 2'b10;
                alu_op = 4'b0000;
                jump = 1'b1;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
            5'b00100: begin // lw
                reg_dst = 2'b00;
                mem_to_reg = 2'b01;
                alu_op = 4'b0011;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b1;
                mem_write = 1'b0;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
            5'b00101: begin // sw
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0011;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                alu_src = 1'b1;
                reg_write = 1'b0;
                sign_or_zero = 1'b1;
            end
            5'b00110: begin // beq
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0001;
                jump = 1'b0;
                branch = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b0;
                sign_or_zero = 1'b1;
            end
            5'b00111: begin // addi
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0011;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
				  5'b01000: begin // slti
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0011;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
				  5'b01001: begin //sltiu
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b1000;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
				  5'b01010: begin // ori
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 4'b0101;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b0;
            end
				  5'b01011: begin // xori
                reg_dst = 2'b00;
                mem_to_reg = 2'b00;
                alu_op = 2'b0110;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b1;
                reg_write = 1'b1;
                sign_or_zero = 1'b0;
            end		
				
            default: begin
                reg_dst = 2'b01;
                mem_to_reg = 2'b00;
                alu_op = 4'b0000;
                jump = 1'b0;
                branch = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b1;
                sign_or_zero = 1'b1;
            end
        endcase
    end
end

endmodule
