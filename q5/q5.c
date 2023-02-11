//Create a program to compute the square of the sum from 1 to n. Specifically, compute the sum of integers from 1 to n and then square the value.
#include<stdio.h>
extern long long int  SumOfSquares(long long int n);

int  main()
{
    long long int n;
    printf("Program to find Sum of Squares of first n Natural Numbers:\n");
    printf("Value of n:\n");

    scanf("%lld",&n);

    printf ("%lld\n", SumOfSquares(n));

}