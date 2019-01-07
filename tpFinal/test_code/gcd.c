#include <stdio.h>

// Recursive function to return gcd of a and b
int gcd(int a, int b)
{
    while (1)
    {
        // Everything divides 0
        if (a == 0)
           return b;
        if (b == 0)
           return a;

        // base case
        if (a == b)
            return a;

        // a is greater
        if (a > b)
        {
            a = a - b;
        }
        else
        {
            b = b - a;
        }
    }
}

// Driver program to test above function
int main()
{
    for (int a = 90; a < 100; a++)
    {
        for (int b = 50; b < 60; b++)
        {
            printf("GCD of %d and %d is %d\n", a, b, gcd(a, b));
        }
    }
    return 0;
}
