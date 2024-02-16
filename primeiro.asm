.data #tem como função, predefinir variaveis 
msg: .asciiz"hello word"
.text #tem como função apresentar o código/ sequencia lógica
#preparar um processador para receber string 
li $v0, 4
#pega a msg que ta guardada la em cima no msg e imprimila
#la significa carregar o endereço, 
#$a0 printa oq ta na strinng
la $a0, msg #le o endereço da memoria
#tem que usar sempre que usar la
syscall 
#preparar o processador para fechar o programa
li $v0, 10
#fazer erle fechars
syscall