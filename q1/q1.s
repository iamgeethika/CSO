.global quotient
.global remaind

.text

                                                                      # x in rdi
                                                                      # y in rsi
                                                                      # dividend in rbx
                                                                      # divisor in rcx
                                                                      # remainder in r8
                                                                      # quotient in r9
 
quotient:

    movq %rdi, %rbx                                                   # moving x to %rbx
    movq %rsi, %rcx                                                   # moving to %rcx

    cmpq $0, %rsi                                                     # comparing 0 and y
    je LL1

    cmpq $0, %rdi                                                     # comparing 0 and x
    jl LL2                                                            # if x<0 jump to LL2
    jg LL3                                                         # if x>0 jump to ll9
    LL2:
        imul $-1, %rdi                                                # making x positive
        
    LL3:
    cmpq $0, %rsi                                                     # comparing 0 and %rsi
    jg ll9
    jl .L3
    .L3:
        imul $-1, %rsi                                                # making y positive
        
    ll9:
    movq $0, %r9                                                       # quotient = 0

    cmpq %rsi, %rdi                                                   
    jge loop
    jl ll12

loop:
    subq %rsi, %rdi                                                  # subtract y from x
    inc %r9                                                          # increment quotient.. quotient++
    cmpq %rsi, %rdi                                                  # comparing x and y
    jge loop                                                         # if x>=y

    ll12:
    cmpq $0, %rdi 
    je .L4
    jne ll10
    .L4:                                                             # if x =0
        cmpq $0, %rbx                                                # if dividend<0
        jle .L7                                                      # if %rbx is less than or equal to 0 jump to .L7
        jg ll11                                                      # if %rbx>0 then jump to ll11

        ll11:
        cmpq $0, %rcx                                                # if divisor<0
        jle LL16
        jge ll10
        LL16: 
            imul $-1, %r9                                            # quotient *-1
            movq %r9, %rax
            ret
    
    ll10:

    cmpq $0, %rbx                                                    # if dividend<0
    jg ll14
    jl .L8
    .L8:
        cmpq $0, %rcx                                               # if divisor > 0
        jg .L9
        .L9:
            imul $-1, %r9                                           # quo *-1
            subq $1, %r9                                            # quotient--


    ll14:
    cmpq $0, %rcx                                                   # if divisor<0
    jl LL10
    jg .ll15
    LL10:
        cmpq $0, %rbx                                               # if dividend > 0
        jg LL11
        LL11:
            imul $-1, %r9                                            # quo *-1
            subq $1, %r9                                          # quotient--

    .ll15:
    movq %r9, %rax                                              # moving quo to rax to return
    ret 


.L7:
    cmpq $0, %rcx                                              #     if divisor<0
    jl LL12
    jg .ll16
    LL12:
        movq %r9, %rax                                          # moving quotient to rax to return
        ret

    .ll16:
    imul $-1, %r9                                                      # quo *-1
    movq %r9, %rax
    ret   

.L6:
    movq %r9, %rax
    ret   

LL1:
    movq $-1, %rax                                                   # return 1
    ret


remaind:

    movq %rdi, %rbx                                                  # moving dividend = x
    movq %rsi, %rcx                                                 # moving divisor = y

    cmpq $0, %rsi                                                      
    je LL1                                                           # if y=0

    cmpq $0, %rdi
    jl LL4                                                             # if x<0
    jg LL30
    LL4:
        imul $-1, %rdi                                          # making x positive
        
    LL30:
    cmpq $0, %rsi                                                    # if y<0
    jg LL31
    jl .R3
    .R3:
        imul $-1, %rsi                                            # making y positive
        
    LL31:
    movq $0, %r9                                                      # quotient = 0

    cmpq %rsi, %rdi 
    jge LL5                                                            # x>=y jump to LL5
    jl LL32                                                            # x <y jump to LL32
 
LL5:
    subq %rsi, %rdi                                               # subtract y from x
    inc %r9                                                             # quotient++
    cmpq %rsi, %rdi                                                       # x>=y 
    jge LL5                                                           # jump to LL5

    LL32:

    movq %rdi, %r8                                                          # remainder = x

    cmpq $0, %rdi                                                           # if x=0
    je LL13

    cmpq $0, %rbx                                                         # if dividend <0
    jl LL6
    jg LL35
    LL6:
        cmpq $0, %rcx                                                     # if divisor < 0
        jl LL7
        jg LL35
        LL7:
            imul $-1, %r8                                                  # rem * -1
            movq %r8, %rax
            ret

    LL35:
    cmpq $0, %rbx                                                         # if dividend<0
    jg LL33
    jl LL8
    LL8:
        cmpq $0, %rcx                                                     # if divisor > 0
        jg LL14
        LL14:
            imul $-1, %r9                                                   # quo *-1
            subq $1, %r9                                                     # quotient--
            imul %r9, %rcx                                                # divisor * quo
            subq %rcx, %rbx                                            # rem = dividend - (div*qou)
            movq %rbx, %r8                                              # moving rem back to rbx
                                                                      # here rcx has the remainder

    LL33:
    cmpq $0, %rcx                                                         # if divisor<0
    jl LL60
    jg LL34
    LL60:
        cmpq $0, %rbx                                                     # if dividend > 0
        jg LL15
        LL15:
            imul $-1, %r9                                                       # quo *-1
            subq $1, %r9                                                          # quotient--
            imul %r9, %rcx                                                        # divisor * quo
            subq %rcx, %rbx                                                  # rem = dividend - (div*qou)
            movq %rbx, %r8                                                  # moving rem back to rbx
                                                                       # here rcx has the remainder
    
    LL34:
        movq %r8, %rax                                                           # MOVING %r8 to %rax
        ret


LL13:
    movq $0, %rax                                                                    #  returning 0
    ret 
    