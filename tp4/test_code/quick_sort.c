#include <stdio.h>
#include <stdint.h>

uint32_t maxLevel = 0;

void print_spaces(uint32_t level)
{
    for (int i = 0; i < level*2; i++)
    {
        printf(" ");
    }
}

void quicksort(uint32_t level, uint32_t *arr, uint32_t num, uint32_t *first, uint32_t *last)
{
    uint32_t *i;
    uint32_t *j;
    uint32_t *pivot;
    uint32_t temp;

    //print_spaces(level);
    //printf("quicksort: %d %d\n", (i - arr)*4, (j - arr)*4);

    if (level > maxLevel)
    {
        maxLevel = level;
    }

    if(first < last)
    {
        pivot=first;
        i=first;
        j=last;

        do
        {
            while((*i <= *pivot) &&
                  (i < last))
            {
                i++;
            }

            while((*j > *pivot) &&
                  (j > first))
            {
                j--;
            }

            if(i >= j) break;

            /* print_spaces(level);
            printf("Swapping i %u (%u) and j %u %(%u)\n",
                   (i - arr)*4, *i, (j - arr)*4, *j); */

            temp = *i;
            *i = *j;
            *j = temp;

        } while(1);

        /* print_spaces(level);
        printf("Swapping pivot %u (%u) and j %u %(%u)\n",
                   (pivot - arr)*4, *pivot, (j - arr)*4, *j); */

        temp = *pivot;
        *pivot = *j;
        *j = temp;

        /* print_spaces(level);
        for (int i = 0; i < num; i++)
        {
            printf("%u", arr[i]);
        }
        printf("\n");

        print_spaces(level);
        printf("first:\n"); */
        quicksort(level+1, arr, num, first,j-1);

        //print_spaces(level);
        //printf("second:\n");
        quicksort(level+1, arr, num, j+1,last);
    }
}

int main()
{
   uint32_t arr[] = {94, 29, 87, 90, 73, 75, 49, 58, 77, 3, 8, 71, 23, 100, 34, 39, 34, 4, 77, 13, 10, 55, 15, 17, 38, 1, 79, 98, 66, 80, 59, 72, 92, 49, 90, 93, 70, 45, 39, 85, 100, 32, 27, 77, 38, 23, 76, 69, 30, 6};
   uint32_t num = sizeof(arr) / sizeof(arr[0]);

   /* for (int i = 0; i < num; i++)
   {
       printf("%u", arr[i]);
   }
   printf("\n"); */

   quicksort(1, arr, num, &arr[0], &arr[num - 1]);

   uint32_t last = 0;
   for (int i = 0; i < num; i++)
   {
       printf("%u ", arr[i]);
       if (arr[i] < last)
       {
           printf("\nERROR!!!\n\n");
       }
       last = arr[i];
   }
   printf("\n");
   printf("MaxLevel %u\n", maxLevel);

   return 0;
}
