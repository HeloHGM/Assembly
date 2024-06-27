.data
msg: .asciiz "quantos anos vc tem? "


.text

li $v0, 4
la $a0, msg
syscall 

li $v0, 5
syscall 

move $t0, $v0

li $t3, 2024
sub $t2, $t3, $t0   

li $v0, 1
la $a0, ($t2)
syscall 





