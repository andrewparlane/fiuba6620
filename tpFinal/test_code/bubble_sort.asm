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

# t1 dirección de el último valor
# t2 cambiado? flag
# t3 dirección de valor corriente
# t4 valor1
# t5 valor2
startOuter:                         # do
                                    # {
    li $t2, 0                       #   bool cambiado = 0;
    li $t3, 0                       #   uint8_t *ptr = 0; // primer valor es a dirección 0

startInner:                         #   do
                                    #   {
        lw $t4, 0($t3)              #     valor1 = ptr[0];
        lw $t5, 4($t3)              #     valor2 = ptr[1];
        ble $t4, $t5, noSwap        #     if (valor1 > valor2)
                                    #     {
        sw $t4, 4($t3)              #       ptr[1] = valor1;
        sw $t5, 0($t3)              #       ptr[0] = valor2;
        li $t2, 1                   #       cambiado = 1;
                                    #     }
noSwap:
        addi $t3, $t3, 4            #     ptr++;
        beq $t3, $t1, endLoop
        b startInner                #   } while (ptr != úlimo)

endLoop:
        li $t6, 1
        beq $t2, $t6, startOuter    # } while (cambiado)

