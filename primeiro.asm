.data #tem como fun��o, predefinir variaveis 
msg: .asciiz"hello word"
.text #tem como fun��o apresentar o c�digo/ sequencia l�gica
#preparar um processador para receber string 
li $v0, 4
#pega a msg que ta guardada la em cima no msg e imprimila
#la significa carregar o endere�o, 
#$a0 printa oq ta na strinng
la $a0, msg #le o endere�o da memoria
#tem que usar sempre que usar la
syscall 
#preparar o processador para fechar o programa
li $v0, 10
#fazer erle fechars
syscall