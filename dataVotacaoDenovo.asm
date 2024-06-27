.data


#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
.macro print(%str)
.data
msg: .asciiz %str
.text
li $v0, 4
la $a0, msg
syscall 
.end_macro
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
.macro pegaint(%int)
.text
li $v0, 5
syscall 
move %int, $v0
.end_macro 
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


.text
j msgIdade

#----------
condicao:
#finalizar
beq $t0, $zero, sair


#maior que 0
bgt $t0, $zero, vdd


#menor q 0
blt $t0, $zero, invalido
#----------


#----------
sair:
print("Finalizando...")
#prepra registrador que quero manda uma msg
li $v0, 10
syscall 

invalido:
print("Valor inválido \n")
jal msgIdade

vdd:
bgt $t0, 2008, menoridade
ble $t0, 2008, maioridade
#----------

#----------
maioridade:
print("Você PODE votar\n")
jal msgIdade

menoridade:
print("Você NÃO pode votar\n")
jal msgIdade
#----------

msgIdade:
print("Digite sua idade: \n")
pegaint($t0)
jal condicao
