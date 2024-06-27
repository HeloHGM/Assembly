.data
menu: .asciiz "Escolha uma opção:\n1média  \n2receitas e despesas   \n3quadrado\n"
msg: .asciiz "Digite a nota %d: "
media: .asciiz "A média é: "
receita: .asciiz "Digite o valor da receita: "
despesa: .asciiz "Digite o valor da despesa: "
saldo_result: .asciiz "O saldo é: "
nota_inv_msg: .asciiz "Nota inválida. Insira uma nota de 0 a 10.\n"

.text
main:
    li $v0, 4
    la $a0, menu
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
#------------------
    beq $t0, 1, media_notas
    beq $t0, 2, saldo
    beq $t0, 3, quadrado
    j exit
#-----------------

media_notas:
    li $t0, 4          #notas
    li $t1, 0          #soma notas
    li $t2, 0          #p nota
    li $t3, 0          #armazenar a média

loop_media:
    
    la $a0, msg      
    move $a1, $t0       
    li $v0, 4         
    syscall


    li $v0, 5         
    syscall
    move $t2, $v0  


    blt $t2, 0, error_media  #se nota menor que 0, exibe erro
    bgt $t2, 10, error_media #se nota maior que 10, exibe erro


    add $t1, $t1, $t2
    sub $t0, $t0, 1

    # Verifica se todas as notas foram lidas
    bnez $t0, loop_media

    div $t1, $t3, 4

    li $v0, 4
    la $a0, media
    syscall

    move $a0, $t3#media
    li $v0, 1
    syscall
    li $v0, 10
    syscall

error_media:

    li $v0, 4
    la $a0, nota_inv_msg
    syscall
    li $v0, 10
    syscall
#=======================================================================
saldo:
    li $v0, 4
    la $a0, receita
    syscall
    li $v0, 5
    syscall
    move $s0, $v0  
    
    
    li $v0, 4
    la $a0, despesa
    syscall
    li $v0, 5
    syscall
    move $s1, $v0  

    sub $s2, $s0, $s1

    li $v0, 4
    la $a0, saldo_result
    syscall
    
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 10
    syscall


#=======================================================================
quadrado:
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    move $s0, $v0  

 
    mul $s1, $s0, $s0

    li $v0, 4
    la $a0, media
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 10
    syscall


exit:
    li $v0, 10
    syscall
