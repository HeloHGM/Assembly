.data
n1: .asciiz "Digite o 1� n�: "
n2: .asciiz "Digite o 2� n�: "
n3: .asciiz "Digite o 3� n�: "
n4: .asciiz "Digite o 4� n�: "

r: .asciiz "A resposta �: "



.text
# preparese em v0 quero q vc mostre um texto
li $v0, 4
# mostrar a resposta
la $a0, n1
syscall 
#le oq o usuario digitou 
li $v0, 5
syscall 
#move o valor que esta temporario em t1 para v0
move $t1, $v0

#msm coisa com o numero 2
li $v0, 4
la $a0, n2
syscall 
li $v0, 5
syscall 
move $t2, $v0

#msm coisa com o numero 3
li $v0, 4
la $a0, n3
syscall 
li $v0, 5
syscall 
move $t3, $v0

#msm coisa com o numero 4
li $v0, 4
la $a0, n4
syscall 
li $v0, 5
syscall 
move $t4, $v0

#s� soma de 2 em 2, ent: add em t3 oq ta em t1 e t2
add $t5, $t1, $t2
#s� soma de 2 em 2, ent: 
add $t6, $t5, $t3
#s� soma de 2 em 2, ent: 
add $t7, $t6, $t4


#mostra a resposta
li $v0, 4
la $a0, r
syscall

#mostra o valor, o 1 significa numero inteiro
li $v0, 1
la $a0, ($t7)
syscall 



li $v0, 10
syscall