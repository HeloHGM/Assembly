.data
msgpositivo: .asciiz "este numero e positivo \n"
msgnegativo: .asciiz "este numero e negativo \n"
msgentrada: .asciiz "digite um numero \n"
fim: .asciiz "fim do programa \n"


.text
#carregamento imediato, inicializar, entrada
li, $v0, 4
la $a0, msgentrada
syscall 

#preparese o usuario vai digitar
li $v0, 5
#chamada no sistema
syscall 

move $t0, $v0

#se oq ta em t0 for igual ao zero, pule pra algum local do código, por exemplo o sair
beq $t0, $0, sair

#se beq não contecer faça isso:
jal verifica
verifica:
#se maior-- se oq ta em t0 for MAIOR que 0 vá para MAIOR
bgt $t0, $0, maior
#se menor-- se oq ta em t0 for MENOR que 0 vá para MENOR
blt $t0, $0, menor

maior:
li $v0, 4
la $a0, msgpositivo
syscall 
#sair
j sair

menor:
li $v0, 4
la $a0, msgnegativo
syscall 
#sair
j sair

#se o usuario digitar 0 o programa acaba
sair:
#pre´pra registrador que quero manda uma msg
li $v0, 4
#mostra esta msg
la $a0, fim
syscall 
li $v0, 10
syscall 