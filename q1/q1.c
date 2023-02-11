//Given two numbers M and N compute the quotient and remainder for M/N
#include<stdio.h>
#include<math.h>

extern long long int  quotient(long long int  M, long long int  N);

extern long long int  remaind(long long int  M,long long int  N);

int  main()
{
    long long int  M,N;
    printf("Program to find Quotient and Remainder obtained when Division of two numbers:\n");
    printf("Give two Numbers as input:\n");

    scanf("%lld %lld",&M,&N);

    printf ("%lld\n", quotient(M, N));
    printf("%lld\n",remaind(M,N));

}