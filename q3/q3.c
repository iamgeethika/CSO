// Given a number N check if it is prime. You can use the function from part 2.
#include <stdio.h>
extern long long int CheckWhetherPrimeOrNot(long long int N);

int main()
{
    long long int N;
    scanf("%lld", &N);
    if (CheckWhetherPrimeOrNot(N) == 1)
    {
        printf("True\n");
    }
    else
    {
        printf("False\n");
    }
    return 0;
}