.global MaximumPrimeFactor
.text

                                                                   # Intially we store n in %rdi
                                                                   # r10 holds i*i
                                                                   # macPrimeFactor in %rbx
                                                                   # i in %rcx
                                                                   # i+2 in %r8
                                                                   # r9 is temp register

MaximumPrimeFactor:
    movq $-1, %rbx                                                 # MaximumPrimeFactor = -1
    movq %rdi, %rsi                                                # rsi = n
    cmpq $0, %rsi                                                  # if n<0
    jl LL1
    jge LL2
    LL1:
        imul $-1, %rsi;                                            # n = n*-1

    LL2:
    cqto
    movq $2, %r9                                                   # moving 2 to r9
    movq %rdi, %rax                                                # moving rdi to rax

    idivq %r9                                                      # n%2= 0
                                                                   # now %rdx has the rem

    cmpq $0, %rdx                                                  # while rem =0
    je LL3
    jne LL4
    LL3:
        cqto
        movq $2, %r9                                               # moving 2 to r9 
        movq %rdi, %rax                                            # moving rdi to rax
        idivq %r9                                                  # n = n/2
        cmpq $0, %rdx                                              # while rem =0
        jne LL4
                                                                   # now rax has the quotient
        movq %rax, %rdi                                            # sending n back to rdi
        movq $2, %rbx                                              # setting MaximumPrimeFactor to 2
        cmpq $0, %rdx                                              # while rem =0
        je LL3

    LL4:
    cqto
    movq $3, %r9                                                   # moving 3 to r9 
    movq %rdi, %rax                                                # moving rdi to rax

    idivq %r9                                                      # N%3
                                                                   # now %rdx has the rem

    cmpq $0, %rdx                                                  # while rem = 0
    je LL5
    jne LL6
    LL5:
        cqto
        movq $3, %r9                                               # moving 3 to r9 
        movq %rdi, %rax                                            # moving rdi to rax
        idivq %r9                                                  # n= n/3
        cmpq $0, %rdx                                              # while rem =0
        jne LL6
                                                                   # now rax has the quotient
        movq %rax, %rdi                                            # sending n back to rdi
        movq $3, %rbx                                              # setting MaximumPrimeFactor to 3
        cmpq $0, %rdx                                              # while rem =0
        je LL5
        
    LL6:
    movq $5, %rcx                                                  # i = 5
    movq %rcx, %r10 
    imul %r10, %r10                                                # r10 now has i*i
    cmpq %rsi, %r10                                                # i<=n
    jle LL7
    jg LL8

    LL7:
        cqto
        movq %rdi, %rax                                            # moving rdi to rax
        idivq %rcx                                                 # n%i == 0
                                                                   # now rem in %rdx

        cmpq $0, %rdx                                              # if n%i=0
        je LL9
        jne LL10                                                   # if n%i not = 0
        LL9:
            movq %rcx, %rbx                                        # maxPrimeFac = i
            cqto
            movq %rdi, %rax                                        # moving rdi to rax
            idivq %rcx                                             # n= n/i
            cmpq $0, %rdx                                          # while rem =0
            jne LL10
                                                                   # rax has quotient
            movq %rax, %rdi                                        # move n back into rdi
            cmpq $0, %rdx                                          # if n%i=0
            je LL9

        LL10:
       #  movq %rcx, %rax                                          # moving i into rax to get i+2
        addq $2, %rcx                                              # now rax has i+2

        movq %rdi, %rax                                            # moving rdi to rax
        cqto
        idivq %rcx                                                 # n%(i+2)
                                                                   # rem in rdx

        cmpq $0, %rdx                                              # if N%(i+2)=0
        je LL11
        jne LL12
        LL11:
            movq %rcx, %rax                                        # moving i into rax to get i+2
            addq $2, %rax                                          # now rax has i+2
            movq %rax, %rbx                                        # moving i+2 to MaximumPrimeFactor
            
            cqto
            idivq %rdi                                             # n/(i+2)
            cmpq $0, %rdx                                          # while rem =0
            jne LL12
            # quotient in rax
            movq %rax, %rdi                                        # moving new n into rdi
            cmpq $0, %rdx                                          # if N%(i+2)=0
            je LL11

        LL12: 
        addq $6, %rcx                                              # i+=6
        movq %rcx, %r10 
        imul %r10, %r10                                            # r10 now has i*i
        cmpq %rsi, %r10                                            # i<=root
        jle LL7

        LL8:
        cmpq $0, %rdi                                              # if n<0
        jl LL13
        jge LL14
        LL13:
            imul $-1, %rdi                                         # converting to positive
            movq %rdi, %rbx

        LL14:
        cmpq $4, %rdi                                              # if n>4 
        jg LL15
        jl LL16
        LL15:
            movq %rdi, %rbx                                        # MaximumPrimeFactor = n

        LL16:
        movq %rbx, %rax                                            # moving to return
        ret
