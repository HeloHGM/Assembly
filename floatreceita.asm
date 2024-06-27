.data
ZERO: .float 0.0# nome da variavel tipo float, valor

.text


.macro print (%str)# função p imprimir string
.data
	msg: .asciiz %str
.text
	li $v0,4
	la $a0,msg
	syscall
.end_macro



	
print ("quati vc ganha")
li $v0,6 #por definição o valor digitado fica guardado em f0
syscall

#passo 1 : definir recurso para auxiliar no uso das instruções (add.s)
lwc1 $f1, ZERO
add.s $f2, $f1, $f0 # guarda em f2 oq ta em f1 e f0
print ("quanto vc deve?")
li $v0, 6
syscall
add.s $f3, $f1, $f0 
sub.s $f12, $f2, $f3 # vc coloca o valor em f0 e pra vc colocar onde ele ta no final é o f12
print ("seu saldo e:")
li $v0, 2 # li imprime quem ta no 12
syscall

li $v0, 10
syscall
