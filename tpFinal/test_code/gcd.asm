    li $s2, 99                      # maxA = 99;
    li $s3, 59                      # maxB = 59;
    li $s4, 0                       # idx = 0;

    li $s0, 90                      # a = 90;
a_loop_start:                       # do {
    li $s1, 50                      #   b = 50;
b_loop_start:                       #   do {
    move $t0, $s0                   #
    move $t1, $s1
    b gcd_loop_start                #     res = gcd(a,b);
gcd_return:
    sw $t2, 0($s4)                  #     results[idx] = res;
    addi $s4, $s4, 4                #     idx++;
    addi $s1, $s1, 1                #     b++
    ble $s1, $s3, b_loop_start      #   } while (b <= maxB)
    addi $s0, $s0, 1                #   a++
    ble $s0, $s2, a_loop_start      # } while (a <= maxA)
    b endProg                       # return;

gcd_loop_start:                     # while (1) {
    beq $t0, $zero, ret_b           #   if (a == 0) return b;
    beq $t1, $zero, ret_a           #   if (b == 0) return a;
    beq $t0, $t1, ret_a             #   if (a == b) return a;
    bge $t0, $t1, a_greater_than_b  #   if (a < b) {
    sub $t1, $t1, $t0               #     b -= a;
    b gcd_loop_start                #   }
a_greater_than_b:                   #   else {
    sub $t0, $t0, $t1               #     a -= b;
    b gcd_loop_start                #   }
                                    # }

ret_a:
    move $t2, $t0
    b gcd_return
ret_b:
    move $t2, $t1
    b gcd_return

endProg:
