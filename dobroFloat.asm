.data 
msg: .asciiz "o dobro é: "



.text
li $s0, 2 #numero para dobrar



mul $t1, $s0, $s0

li $v0,4
la $a0, msg
syscall


li $v0, 1
move $a0, $t1
syscall




li $v0,10
syscall

