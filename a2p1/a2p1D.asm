# Edgar Lozano
# Formula used: avgScore = (128/637)*e1Score+(307/1024)*e2Score+(finScore/2)
# Prompt the user to enter the integer scores for Exam 1, Exam 2 and Final Exam, read the scores,
# compute the weighted average score (using the formula), and display a labeled output
# about the weighted average score.
# IMPORTANT:
# For the purpose of this exercise, be sure to observe the following:
# - You MUST perform (in the appropriate order, of course) ALL the additions, multiplications and
# divisions shown in the given formula. (You should NOT resort to simplifying the formula in some
# way, perhaps to make the computation more efficient.)
# - You MUST use bit-shifting to effect multiplications and divisions involving powers of 2.
# Note that 2, 128 and 1024 correspond to some powers of 2 (but not 307 amd 637).
# Assume it is the intent to simply discard the fractional portion when a division is performed. When
# evaluating the first and second terms on the right hand side (i.e., the Exam 1 and Exam 2
# contributions, respectively), however, you MUST perform (in each case) the division after (NOT
# before) the multiplication (otherwise, accuracy may be unnecessarily lost).
# - For any multiplication and division operation that cannot be effected with simple (one-time)
# bit-shifting, you MUST use another "true" instruction (NOT a pseudoinstruction) instead

		.data
startMSG: .asciiz "Enter three exam grades as follows: \n"
prompt1: .asciiz "Exam 1: "
prompt2: .asciiz "Exam 2: "
prompt3: .asciiz "Final exam: "
avgScoreOut: .asciiz "\nThe weighted average score is: "
		.text
		.globl main
main:
		li $v0, 4
		la $a0, startMSG
		syscall
		la $a0, prompt1
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
		li $v0, 4
		la $a0, prompt2
		syscall
		li $v0, 5
		syscall
		move $t1, $v0
		li $v0, 4
		la $a0, prompt3
		syscall
		li $v0, 5
		syscall
		move $t2, $v0
		sll $t0, $t0, 7
		li $t4, 637
		div $t0, $t4
		mflo $t0
		li $t4, 307
		mult $t1, $t4
		mflo $t1
		srl $t1, $t1, 10
		srl $t2, $t2, 1
		add $t4, $t0, $t1
		add $t4, $t4, $t2
		li $v0, 4
		la $a0, avgScoreOut
		syscall
		li $v0, 1
		move $a0, $t4
		syscall
		li $v0, 10
		syscall
