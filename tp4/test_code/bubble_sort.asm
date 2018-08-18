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

# t1 end of inner loop
# t2 changed flag
# t3 loopIdx (for loopIdx = 0; loopIdx < $t1; loopIdx++)
# t4 read var 1
# t5 read var 2
startOuter:
    li $t2, 0   # changed
    li $t3, 0   # idx
startInner:
        lw $t4, 0($t3)
        lw $t5, 4($t3)
        ble $t4, $t5, noSwap    # if the first is <= the second then don't swap
        # swap
        sw $t4, 4($t3)
        sw $t5, 0($t3)
        addi $t2, $t2, 1 # set the changed flag

noSwap:
        addi $t3, $t3, 4
        beq $t3, $t1, endLoop
        b startInner

endLoop:
        beq $t2, $zero, done
        b startOuter

done:

