// UFRPE
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Caio Fontes, Giovanni Lima e Raphael Barbosa de Melo
// Descrição do módulo:
// Verifica se a concatenação das entradas alu_op e funct é igual a 6'b001000.
// Se for verdadeiro, a saída JRControl é 1; caso contrário, é 0.

module controlejr( input[1:0] alu_op, 
       input [3:0] funct,
       output JRControl
    );
assign JRControl = ({alu_op,funct}==6'b001000) ? 1'b1 : 1'b0;
endmodule