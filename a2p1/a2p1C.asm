# Edgar Lozano
# The following tasks, in order:
# - Allocate a global array (i.e., space in the data segment) enough for storing 4 integers and
# initialize the array (from 1st to 4th element) with 8, 1, 3 and 2 at the same time (i.e., DON'T
# write code to put in these values instead).
# - Display a labeled output about the array's initial contents (from 1st to 4th element).
# IMPORTANT:
# You are to load the values of the array elements from memory and use those values to generate the
# labeled output.
# (You are not to simply display a hard-coded, preset string.)
# - Re-order the values in the array so that the contents of the array in memory (from 1st to 4th element) becomes 2, 3, 1 and 8, using the following operations (in order):
# -- Swap the contents in memory of the 1st and 4th elements of the array.
# -- Swap the contents in memory of the 2nd and 3rd elements of the array.
# IMPORTANT:
# When performing each of the two swap operations above, you can re-use (where expedient) the
# array's base address in register (loaded when performing the display of the array's initial
# contents) but you MUST re-load the values of the associated array elements fresh from memory
# (i.e., assuming no knowledge that certain values might have already existed in some registers due
# to prior operations).
# - Display a labeled output about the array's contents (from 4th to 1st element) after the 2
# swapping operations above.
# NOTE: It is from 4th to 1st element and not from 1st to 4th element.
# IMPORTANT:
# Similar to when performing the two swap operations above, you can re-use (where expedient) the
# array's base address in register (loaded when performing the prior operations) but you MUST
# re-load the values of the array elements fresh from memory (i.e., assuming no knowledge that
# certain values might have already existed in some registers due to prior operations).

		.data
Array: .word 8, 1, 3, 2
initialMsg: .asciiz "Initial values of array are: "
reverseMsg: .asciiz "The elements (from fourth to first) are: "
		.text
		.globl main
main:
		li $v0, 4
		la $a0, initialMsg
		syscall
		la $t0, Array
		lw $a0, 0($t0)
		li $v0, 1
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		lw $a0, 4($t0)
		li $v0, 1
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		lw $a0, 8($t0)
		li $v0, 1
		syscall
		li $a0, 32
		li $v0, 11
		syscall
		lw $a0, 12($t0)
		li $v0, 1
		syscall
		lw $t1, 0($t0)
		lw $t2, 12($t0)
		sw $t1, 12($t0)
		sw $t2, 0($t0)
		lw $t1, 4($t0)
		lw $t2, 8($t0)
		sw $t1, 8($t0)
		sw $t2, 4($t0)
		li $v0, 11
		li $a0, 10
		syscall
		li $v0, 4
		la $a0, reverseMsg
		syscall
		lw $a0, 12($t0)
		li $v0, 1
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		lw $a0, 8($t0)
		li $v0, 1
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		lw $a0, 4($t0)
		li $v0, 1
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		lw $a0, 0($t0)
		li $v0, 1
		syscall
		li $v0, 11
		li $a0, 10
		syscall
		li $v0, 10
		syscall
