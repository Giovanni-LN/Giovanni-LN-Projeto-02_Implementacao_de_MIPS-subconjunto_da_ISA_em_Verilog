// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// armazena o valor de nextPC na borda de subida do sinal de relógio (clock).
// Ele possui as seguintes portas: clock (entrada de relógio) e nextPC (entrada de 32 bits).
// A saída PC representa o valor atual armazenado no registrador.

module projeto (input clock, input [31:0] nextPC, output reg [31:0] PC);
  always @(posedge clock) begin
    PC <= nextPC;
  end
endmodule