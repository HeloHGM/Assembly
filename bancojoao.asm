.data
vaSaldo: .word 1000
senha_correta: .word 1234

#-----------------------
.macro print (%local)
    .data
    msg: .asciiz %local
    .text
    li $v0, 4
    la $a0, msg
    syscall
.end_macro   
#-----------------------

#-----------------------
.macro pegaInt (%int)
    .text
    li $v0, 5
    syscall
    move %int, $v0
.end_macro       
#-----------------------

.text
j msgId

# Prompt para ID
msgId:
    print("Digite seu Id:")
    pegaInt($t0)
    jal senha

# Prompt para senha
senha:
    print("Digite sua Senha:")
    pegaInt($t1)    
    beq $t0, $t1, menu
    j sair

# Menu principal
menu:
    print("Digite 1 para saldo.\n 2 para depositar.\n 3 para sacar.\n 4 encerrar programa")
    pegaInt($t2)

    # Lidar com opções do menu
    beq $t2, 1, saldo
    beq $t2, 2, deposito
    beq $t2, 3, saque
    beq $t2, 4, encerrar_programa
    j sair

# Exibir saldo da conta
saldo:
    lw $t0, vaSaldo
    print("Saldo: ")
    move $a0, $t0
    li $v0, 1
    syscall
    j menu

# Depositar fundos
deposito:
    print("Digite a quantia do depósito:")
    pegaInt($t1)
    add $t0, $t0, $t1
    print("Saldo depositado")
    j menu

# Sacar fundos
saque:
    print("Digite o Valor do Saque:")
    pegaInt($t1)
    bgt $t0, $t1, fazerSaque
    print("Saldo insuficiente")
    j menu

fazerSaque:
    sub $t0, $t0, $t1
    print("Operação de saque bem-sucedida")
    j menu

# Confirmar encerramento do programa
encerrar_programa:
    print("Digite 1 para confirmar o encerramento ou 0 para cancelar:")
    pegaInt($t0)
    beq $t0, 1, encerrar
    j menu

# Encerrar programa
encerrar:
    print("Programa encerrado.")
    li $v0, 10
    syscall

# Nenhuma correspondência encontrada
sair:
    print("Não Houve Correspondencia")
    j menu