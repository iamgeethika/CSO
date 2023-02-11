.global SumOfSquares
.text

                                                       # Here The Sum Is Stored in %rax
                                                       # n is Stored in %rdi
                                                       # initially sq stored in %rbx
SumOfSquares:
    movq $0, %rax                                      # 0 is moved to %rax ... sum = 0
    movq %rdi, %rcx                                    # move n to %rcx ... i = n
    cmpq $1, %rcx                                      # here we compare 1 and i
    jge LL1                                            # if i >= 1 (j is greater than or equal to) then jump to LL1

LL1:
    movq %rcx, %rbx                                    # moving i into a register rbx
    imul %rbx, %rbx                                    # multiplying i and i.... i*i
    addq %rbx, %rax                                    # Add sq to sum ... sum = sum + sq
    dec %rcx                                           # Decrementing i .... i--
    cmpq $1, %rcx                                      # here we compare 1 and i
    jmp check
move:
    cmpq $0, %rcx
    jg LL1                                             # if i >= 1 (j is greater than or equal to) then jump to LL1
    ret                                                # returning the Value of Sum

check:
    movq $9223372036854775807, %r12
loop:
    sub %r12, %rax
    jge loop
    add %r12, %rax
    jmp move
