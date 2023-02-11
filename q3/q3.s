.global	CheckWhetherPrimeOrNot
.text
                          # Initially we store N in %rdi 
CheckWhetherPrimeOrNot: 
cmpq    $1, %rdi
jle   LL5
movq    $0, %rax          # moving 0 to %rax	
movq	$2, %rsi          # moving 2 to %rsi


LL1:                                 
	cmpq	%rdi, %rsi    # comparing values in %rdi and %rsi
	jge	LL3               # if rsi greater than or equal to rdi jump to LL3
	movq %rdi, %rax       # moving value in %rdi to %rax                      
	cqto
	idivq %rsi            # stores remainder in %rsi
	cmpq	$0, %rdx      # comparing 0 and %rdx
	jne	LL2               # if not equal(rdx is not equal to 0) then jump to LL2
	movq	$0, %rax      # moving 0 to %rax
	jmp	LL4               # jumping to LL4


LL2:                                
	addq    $1, %rsi      # add 1 to rsi.... rsi = rsi +1
	jmp	LL1               # jumping to LL1


LL3:
	movq	$1, %rax      # moving 1 to %rax

    
LL4:
	retq                  # return the value
LL5:
    movq    $0, %rax
    retq
    