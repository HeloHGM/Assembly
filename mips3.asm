.data
msgMenu: .asciiz "Digite 1: para calcular a média de 4 notas, 2: para calcular o saldo, 3: para calcular o quadrado de um número: "
msgNotas: .asciiz "Digite 4 notas do aluno (0 a 10): "
msgMedia: .asciiz "A media é: "
msgReceita: .asciiz "Digite a receita e as despesas: "
msgSaldo: .asciiz "O saldo é: "
msgNumInteiro: .asciiz "Digite um número inteiro: "
msgQuadrado: .asciiz "O quadrado do inteiro é: "

.text 
main:
	li $v0, 4
	la $a0, msgMenu
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	beq $t0, 1, media
	beq $t0, 2, saldo
	beq $t0, 3, quadradoDoNumero
	j exit

media:
	li $v0, 4
	la $a0, msgNotas
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 5
	syscall
	move $t2, $v0

	li $v0, 5
	syscall
	move $t3, $v0

	li $v0, 5
	syscall
	move $t4, $v0

	add $s0, $t1, $t2
	add $s1, $s0, $t3
	add $s2, $s1, $t4

	li $t5, 4
	div $s2, $t5
	mflo $s2
  
	j imprimirMedia

saldo:
	li $v0, 4
	la $a0, msgReceita
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 5
	syscall
	move $t2, $v0
	sub $s2, $t1, $t2
	j imprimirSaldo

quadradoDoNumero:
	li $v0, 4
	la $a0, msgNumInteiro
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	mul $s2, $t1, $t1
	j imprimirQuadrado

imprimirMedia:
    
	li $v0,4
	la $a0,msgMedia
   	syscall
    
   	li $v0, 1
  	move $a0,$s2 
   	syscall
   	j exit

imprimirSaldo:
	
	li $v0,4
	la $a0,msgSaldo
	syscall
	
	li $v0, 1
	move $a0,$s2
	syscall
	j exit
	
imprimirQuadrado:
	
	li $v0,4
	la $a0,msgQuadrado
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	j exit

exit:
   	li $v0, 10
   	syscall