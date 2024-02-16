#tem como função, predefinir variaveis 
.data

#criar uma função usa o macro com o nome que quiser, como PegarNumero só pra rememter oq faz
#local só´pra remeter o argumento
.macro pegarNumero (%local)

#tem como função, predefinir variaveis 
	.data
#ta falando que vai ter uma variavel chamada text que ela vai imprimir um texto
		text: .asciiz "digite o número: "
#tem como função apresentar o código/ sequencia lógica
	.text
#preparar um processador para receber string 
#pega a msg que ta guardada la em cima no text e imprimila
#la significa carregar o endereço, 
#$a0 printa oq ta na strinng
#syscall é pro li e o la rodar/funfar
		li $v0, 4
		la $a0, text
		syscall 

#preparar um processador para exibir um inteiro 
#syscall é pro li e o la rodar/funfar
#fala pro processador que vamos mover quem da vez que esta em %local para a v0
		li $v0, 5
		syscall 
		move %local, $v0
		
#fechando a macro
.end_macro 

#criar uma função usa o macro com o nome que quiser, como print só pra rememter oq faz
#resultado só´pra remeter o argumento
.macro print (%resultado)
#tem como função, predefinir variaveis 
	.data
	
#ta falando que vai ter uma variavel chamada text que ela vai imprimir um texto
		msg: .asciiz "o resultado eh: "
		
#tem como função apresentar o código/ sequencia lógica						
	.text
	
#preparar um processador para receber string 
#pega a msg que ta guardada la em cima no text e imprimila
#la significa carregar o endereço, 
#$a0 printa oq ta na strinng
#syscall é pro li e o la rodar/
		li $v0, 4
		la $a0, msg
		syscall 
		
#preparar um processador para exibir um inteiro 
#syscall é pro li e o la rodar/funfar
		li $v0, 1
		la $a0 (%resultado)
		syscall 
.end_macro 

#tem como função apresentar o código/ sequencia lógica						
.text
#em qual registrador vc vai guardar seu numero
pegarNumero($t0)
#em qual registrador vc vai guardar seu numer
pegarNumero($t1)
#em qual registrador vc vai guardar seu numer
pegarNumero($t2)
#em qual registrador vc vai guardar seu numer
pegarNumero($t3)


#aqui voce vai adicionar num lugar vazio, como o t4, a soma de quem ta em t0 e t1
add $t4, $t0, $t1
#aqui voce vai adicionar num lugar vazio, como o t5, a soma de quem ta em t4 e t2
add $t5, $t4, $t2
#aqui voce vai adicionar num lugar vazio, como o t6, a soma de quem ta em t5 e t3
add $t6, $t5, $t3

#imprimindo oq esta guardado em t6 que é a resposta
print ($t6)

#fechando o programa
    li $v0, 10
    syscall
