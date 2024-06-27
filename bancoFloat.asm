.data

msg: .asciiz ""
msg_saldo: .float 1000.0# saldo
floatt: .float 0.0


.text
# -----------------------
.macro print (%local)
    li $v0, 4
    la $a0, msg
    syscall
.end_macro
# -----------------------

# ++++++++++++++++++++++++++++++++++++++++++++++++
.macro printr (%reg)
    li $v0, 2#imprimi ponto flutuante
    mov.s $f12, msg#Move o valor float para f12
    syscall
.end_macro
# ++++++++++++++++++++++++++++++++++++++++++++++++

# -----------------------
.macro pegaFloat (%float)
    .text
    li $v0, 6 
    syscall
    mov.s %float, $f0#Move o valor float lido
.end_macro
# -----------------------


li $s0, 1234 # usuario
li $s1, 1234 # senha

j msgId

msgId:
    print("\nDigite seu Id:")
    pegaFloat($f5)
    c.eq.s $f0, $f5#se o ID é igual ao saldo
    bc1t senha

senha:
    print("\nDigite sua senha:")
    pegaFloat($f1)
    c.eq.s $f1, $f1
    bc1t menu
    j encerrarErro
menu:
    print("\ndigite 1 para saldo; 2 para depósito; 3 para saque; 4 para encerrar o programa.")
    pegaFloat($f2)

    li.s $f3, 1.0
    c.eq.s $f2, $f3
    bc1t saldo

    li.s $f3, 2.0
    c.eq.s $f2, $f3
    bc1t deposito

    li.s $f3, 3.0
    c.eq.s $f2, $f3
    bc1t saque

    li.s $f3, 4.0
    c.eq.s $f2, $f3
    bc1t encerrar_programa

    j menu

saldo:
    print("\nSaldo: \n")
    printr(msg_saldo)
    j menu

deposito:
    print("\nDigite a quantia do depósito:\n")
    pegaFloat($f1)
    add.s $f0, $f0, $f1
    print("\nSaldo depositado\n")
    j menu

saque:
    print("\nDigite o limite:")
    pegaFloat($f3)
    
    print("\nDigite o Valor do Saque:\n")
    pegaFloat($f7)
    
    add.s $f2, $f3, $f0
    c.lt.s $f2, $f7
    bc1t limiteSaque
    j fazerSaque

limiteSaque:
    print("\nSaque excedeu o limite. Valor pedido: ")
    printr($f7)
    
    
    print("\nDeseja fazer um empréstimo? (1 para sim, 0 para não):\n")
    pegaFloat($f2)
    
    
    li.s $f3, 1.0
    c.eq.s $f2, $f3#se opção é igual a 1
    bc1t fazer_emprestimo
    j menu

fazerSaque:
    sub.s $f0, $f0, $f7
    print("\nOperação de saque bem-sucedida\n")
    j menu

fazer_emprestimo:
    print("\nDigite o valor do empréstimo:\n")
    pegaFloat($f1)
    add.s $f0, $f0, $f1
    print("\nEmpréstimo adicionado ao saldo.\n")
    j menu

encerrar_programa:
    print("\nDigite 1 para confirmar o encerramento ou 0 para cancelar:\n")
    pegaFloat($f0)
    li.s $f3, 1.0
    c.eq.s $f0, $f3        
    bc1t encerrar
    j menu
    
encerrarErro:
    print("\nPrograma encerrado por erro de senha.\n")
    li $v0, 10
    syscall

encerrar:
    print("\nPrograma encerrado.\n")
    li $v0, 10
    syscall
