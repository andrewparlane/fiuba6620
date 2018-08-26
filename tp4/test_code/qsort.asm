# first load the data into memory
# addresses 0 - 196

li $t0, 94
li $t1, 0
sw $t0, 0($t1)
li $t0, 29
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 87
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 90
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 73
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 75
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 49
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 58
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 77
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 3
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 8
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 71
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 23
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 100
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 34
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 39
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 34
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 4
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 77
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 13
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 10
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 55
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 15
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 17
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 38
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 1
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 79
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 98
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 66
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 80
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 59
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 72
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 92
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 49
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 90
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 93
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 70
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 45
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 39
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 85
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 100
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 32
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 27
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 77
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 38
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 23
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 76
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 69
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 30
addi $t1, $t1, 4
sw $t0, 0($t1)
li $t0, 6
addi $t1, $t1, 4
sw $t0, 0($t1)

# See quick_sort.c for the C code this is based off

start:
    # set up our stack at address 400
    li $sp, 400

    # call qsort on our array
    # $a0 is a pointer to the first element
    li $a0, 0
    # $a1 is a pointer to the last element
    move $a1, $t1

    # quicksort(first, last)
    # never returns
    # see note below about recursion
    move $ra, $zero
    b qsort


# void quicksort(uint32_t *first, uint32_t *last)
# note we don't use the standard MIPS ABI here.
#   all registers should be saved by caller
#   no SRA, LTA, ABI
# arguments passed in a0, a1
# Recursion and return
    # Because we don't have a JAL and JR instructions
    # we can't do standard returns.
    # Since we are recursive that's a bit of an issue
    # so we use the $ra register as an index as to which
    # label to return to
    # 0: endProg
    # 1: retRecursive1: return from first of two recursive calls
    # 2: retRecursive2: return from second of two recursive calls
# stack
    # layout (12 bytes per frame)
        # RA (see above note)
        # j
        # last
    # stack overflow occurs after 200 bytes
    # My C test code with the same data used here
    # has a maximum of 13 iterations = 13*12 bytes = 156 bytes
    # so we should be safe

qsort:
    # set up the new stack pointer
    subi $sp, $sp, 12

                            # $a0 = first
                            # $a1 = last

    bge $a0, $a1, endQSort  # if (first < last)
                            # {
    move $t0, $a0           #   uint32_t *pivot = first;
    move $t1, $a0           #   uint32_t *i = first;
    move $t2, $a1           #   uint32_t *j = last;

doLoop:                     #   do
                            #   {
    lw $t3, 0($t0)          #       uint32_t $t3 = *pivot;

iLoop:
    lw $t4, 0($t1)          #       uint32_t $t4 = *i;
    sgt $s0, $t4, $t3       #       while((*i <= *pivot) &&
    li $s1, 1               #             (i < last))
    beq $s0, $s1, endILoop
    bge $t1, $a1, endILoop  #       {

    addi $t1, $t1, 4        #           i++;
    b iLoop                 #       }
endILoop:

jLoop:
    lw $t5, 0($t2)          #       uint32_t $t5 = *j;
    ble $t5, $t3, endJLoop  #       while((*j > *pivot) &&
    ble $t2, $a0, endJLoop  #             (j > first))
                            #       {
    subi $t2, $t2, 4        #           j--;
    b jLoop                 #       }
endJLoop:

    bge $t1, $t2, endDoLoop #       if (i >= j) break;

                            #       temp = *i;
    sw $t5, 0($t1)          #       *i = *j;
    sw $t4, 0($t2)          #       *j = temp;

    b doLoop                #   }
endDoLoop:

                            #   temp = *pivot;
    sw $t5, 0($t0)          #   *pivot = *j;
    sw $t3, 0($t2)          #   *j = temp;

    # now for the recursive calls
    # so save $ra, j and last on the stack
    sw $ra, 8($sp)
    sw $t2, 4($sp)
    sw $a1, 0($sp)

    # this is the first recursive call so set up $ra
    # so that we return to retRecursive1
    li $ra, 1

    # set up the arguments
                            #   $a0 = first (already is)
    subi $a1, $t2, 4        #   $a1 = j - 1
    b qsort                 #   qsort(first, j-1);
retRecursive1:

    # this is the second recursive call so set up $ra
    # so that we return to retRecursive2
    li $ra, 2

    # set up the arguments
    lw $a0, 4($sp)
    addi $a0, $a0, 4        #   $a0 = j+1;
    lw $a1, 0($sp)          #   $a1 = last;
    b qsort                 #   qsort(j+1,last);
retRecursive2:

    # recover $ra
    lw $ra, 8($sp)

endQSort:                   # }

    # restore stack pointer
    addi $sp, $sp, 12

    # return (see notes on recursion and returns above)
    beq $ra, $zero, endProg         # if ($ra == 0) exit()
    li $s0, 1
    beq $ra, $s0, retRecursive1     # else if ($ra == 1) return to retRecursive1
    b retRecursive2                 # else return to retRecursive2

    # should never get here
    li $v0, 1   # error flag

endProg:
