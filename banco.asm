.data
# -----------------------
.macro print (%local)
    .data
    msg: .asciiz %local
    .text
    li $v0, 4
    la $a0, msg
    syscall
.end_macro
# -----------------------

.macro printr (%reg)
.text
    li $v0, 1
    la $a0, (%reg)
    syscall
.end_macro

# -----------------------
.macro pegaInt (%int)
    .text
    li $v0, 5
    syscall
    move %int, $v0
.end_macro
# -----------------------

.text
li $s0, 1234  # usuario
li $s1, 1234  # senha
li $t0, 1000   # saldo

j msgId

msgId:
    print("\nDigite seu Id:")
    pegaInt($t5)
    beq $t0, $s0, senha
    

senha:
    print("\nDigite sua senha:")
    pegaInt($t1)
    beq $t1, $s1, menu
    j encerrarErro

menu:
    print("\ndigite 1 para saldo; 2 para depósito; 3 para saque; 4 para encerrar o programa.")
    pegaInt($t2)
    beq $t2, 1, saldo
    beq $t2, 2, deposito
    beq $t2, 3, saque
    beq $t2, 4, encerrar_programa
 



saldo:
    print("\nSaldo: \n")
    printr($t0)
    j menu

deposito:
    print("\nDigite a quantia do depósito:\n")
    pegaInt($t1)
    add $t0, $t0, $t1
    print("\nSaldo depositado\n")
    j menu

saque:
    print("\nDigite o limite:")
    pegaInt($t3)
    
    print("\nDigite o Valor do Saque:\n")
    pegaInt($t7)
    
    add $t2, $t3, $t0
    blt $t2, $t7, limiteSaque
    j fazerSaque


    
limiteSaque:
    print("\nSaque excedeu o limite. Valor pedido: ")
    printr($t7)
    print("\nDeseja fazer um empréstimo? (1 para sim, 0 para não):\n")
    pegaInt($t2)
    beq $t2, 1, fazer_emprestimo
    j menu

fazerSaque:
    sub $t0, $t0, $t7
    print("\nOperação de saque bem-sucedida\n")
    j menu


fazer_emprestimo:
    print("\nDigite o valor do empréstimo:\n")
    pegaInt($t1)
    add $t0, $t0, $t1
    print("\nEmpréstimo adicionado ao saldo.\n")
    j menu

encerrar_programa:
    print("\nDigite 1 para confirmar o encerramento ou 0 para cancelar:\n")
    pegaInt($t0)

    beq $t0, 1, encerrar
    j menu
    
encerrarErro:
 print("\nPrograma encerrado por erro de senha.\n")
    li $v0, 10
    syscall


encerrar:
    print("\nPrograma encerrado.\n")
    li $v0, 10
    syscall
