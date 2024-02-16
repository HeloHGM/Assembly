.data 
n1: .asciiz "Digite um número: "
n2: .asciiz " Digite outro Número: "
#r é pra dps que for digitado mostra a resposta
r: .asciiz "A resposta é: "

.text  
# preparese em v0 quero q vc mostre um texto
li $v0, 4
# mostrar a resposta
la $a0, n1
syscall 
li $v0, 5
syscall 
#move o valor que esta temporario em t1 para v0
move $t1, $v0


li $v0, 4
la $a0, n2
syscall
#le oq o usuario digitou 
li $v0, 5
syscall
move $t2, $v0
    
#só soma de 2 em 2, ent: add em t3 oq ta em t1 e t2
add $t3, $t1, $t2

#mostra a resposta
li $v0, 4
la $a0, r
syscall

#mostra o valor, o 1 significa numero inteiro
li $v0, 1
la $a0, ($t3)
syscall 

li $v0, 10
syscall
