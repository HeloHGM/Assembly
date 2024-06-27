.data
msgPegarData: .asciiz "digite sua data de nascimento \n"
msgPodeVotar: .asciiz "Voce PODE votar\n"
msgNaoPodeVotar: .asciiz "Voce NÃO pode votar\n"
fim: .asciiz "fim do programa"
msgntemcomo: .asciiz "dta inválida"

#---------------------------------------------------------------------------------------------
.text

#mostra a msg msgPegarIdade
li $v0, 4
la $a0, msgPegarData
syscall 
#recebe um inteiro
li $v0, 5
syscall 

move $t0, $v0

#se oq ta em t0 for o numero 0 vá para sair
beq $t0, $0, sair
#se beq não contecer faça isso:
jal verifica
verifica:
#se maior-- se oq ta em t0 for MAIOR que 16 vá para MAIORIDADE
bgt $t0, 2008, menoridade
#se menor-- se oq ta em t0 for MENOR que 16 vá para MENORIDADE
blt $t0, 2008, maioridade
#se menor-- se oq ta em t0 for MENOR que 0 vá para ntemcomo
blt $t0, $0, ntemcomo
maioridade:
li $v0, 4
la $a0, msgPodeVotar
syscall 
#sair
j sair
menoridade:
li $v0, 4
la $a0, msgNaoPodeVotar
syscall 
#sair
ntemcomo:
li $v0, 4
la $a0, msgntemcomo
syscall 
#sair
j sair


sair:
#prepra registrador que quero manda uma msg
li $v0, 4
#mostra esta msg
la $a0, fim
syscall 
li $v0, 10
syscall 



