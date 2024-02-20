// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// controla o próximo endereço de programa (PC) com base em uma condição de salto.
// Se a condição estiver ativa, o próximo endereço de salto incondicional é usado;
// caso contrário, o próximo endereço sequencial é selecionado.

module controladorpc(
    input wire clock,
    input wire [31:0] nextPC_sequential, // Próximo endereço sequencial
    input wire [31:0] nextPC_jump,       // Próximo endereço de salto incondicional
    input wire jump_condition,           // Condição para determinar se um salto deve ocorrer
    output reg [31:0] PC
);

    always @(posedge clock) begin
        if (jump_condition) // Se a condição de salto estiver ativa
            PC <= nextPC_jump; // PC recebe o próximo endereço de salto incondicional
        else
            PC <= nextPC_sequential; // Caso contrário, PC recebe o próximo endereço sequencial
    end

endmodule