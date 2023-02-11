//Given two numbers M and N calculate the GCD(M, N). You can use the function from part 1
#include<stdio.h>

extern long long int  cal_gcd(long long int  M, long long int  N);

int  main()
{
    long long int  M,N;
    printf("Program to find GCD of two numbers:\n");
    printf("Give two Numbers as input:\n");

    scanf("%lld %lld",&M,&N);

    printf ("%lld\n",cal_gcd(M, N));

}
