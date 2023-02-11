.global cal_gcd

.text

                                                                                       # intitially %rdi holds n1
                                                                                       # intitially %rsi holds n2
                                                                                       # intitially %rcx holds rem

cal_gcd:
    cmpq $0, %rdi                                                                      # compare n1 with 0
    jg .L5                                                                             # if n1>0
    jl .L1                                                                             # if n1<0
    je .L7                                                                             # if n1=0
    jne .L10                                                                           # if n1 != 0


    .L1:
        imulq $-1, %rdi                                                                # n1 = n1 *-1
        movq %rdi, %rax                                                                # moving -n1 to %rax
    .L5:
        cmp $0, %rsi                                                                   # compare n2 with 0
        je .L12 # if n2=0
        movq %rax, %rdi                                                                # moving %rax to %rdi
        movq %rsi, %rax                                                                # moving n2 to %rax
        cmpq $0, %rax                                                                  # comparing n2 to 0
        jge .L6                                                                        # if n2>0
        jl .L4                                                                         # if n2<0
        .L4:
            imul $-1, %rax  # n2 = n2 * -1
        .L6:
            movq %rax, %rsi                                                            # moving n2 back to %rsi
            movq %rdi, %rax                                                            # moving n1 to %rax
            
    movq $1, %rcx                                                                      # rem = 1
    cmpq $0, %rcx                                                                      # checking if rem not equal to 0
    jne loop                                                                           # if rem != 0 enter loop

loop: 
    cqto                                                                               # extend register
    movq %rdi , %rax                                                                   # moving n1 to %rax to divide
    idivq %rsi                                                                         # %rax by %rsi ---- n1/n2
    # now rem in %rdx
    movq %rsi, %rdi                                                                    # n1=n2
    movq %rdx, %rsi                                                                    # n2 = rem
    movq %rdx, %rcx                                                                    # rem = n1 % n2 
    cmpq $0, %rcx                                                                      # checking if rem not equal to 0
    jne loop                                                                           # enter loop if rem not = 0
    movq %rdi, %rax                                                                    # moving n1 to %rax to return it
    ret

.L7:
        cmpq $0, %rsi # checking if n2 is 0
        je .L8                                                                        # if n2 = 0
        jg .L9                                                                       # if n2 != 0
        jl .L13
        .L13:
        imulq $-1, %rsi                                                                # n1 = n1 *-1
        movq %rsi, %rax
        ret
        .L8:
            movq %rsi, %rax                                                           # move n2 to %rax 
            ret
        
        .L9:
            movq %rsi, %rax                                                           # move n2 to %rax
            ret
    .L10:
        cmpq $0, %rsi                                                                 # check if n2 = 0
        je .L11                                                                       # if n2 is 0 and n1 not 0
        .L11:
            movq %rdi, %rax                                                           # move n1 to %rax
            ret

.L12:
    movq %rdi, %rax                                                                   # move n1 to %rax
    ret
