.data
#criar uma fun��o usa o macro com o nome que quiser, como printf s� pra rememter oq faz
#str s�pra remeter o argumento, a % � 
.macro printf(%str)
	.data
		msg: .asciiz %str
	
	.text
	# comando pra receber alguma coisa, para mostrar alguma coisa
		li $v0, 4
		la $a0, msg #a0 vai receber msg
		syscall 
	
#fechar a macro
.end_macro 
.text 
.globl principal

principal:
printf("oie turma \n")
printf ("oie de novo")
