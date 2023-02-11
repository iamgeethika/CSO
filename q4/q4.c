//Given a number N, find it largest prime factor. You can use functions from part 3 and part 1.

#include<stdio.h>

extern long long int  MaximumPrimeFactor(long long int  N);
int  main()
{
    long long int N;
    printf("Program to find Largest Prime Factor of a Number:\n");
    printf("Give Number as input:\n");

    scanf("%lld",&N);
    printf("%lld\n",MaximumPrimeFactor(N));

}