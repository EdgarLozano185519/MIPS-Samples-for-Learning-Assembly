# Edgar Lozano
# Prompt the user to enter each of the following, read the user's input,
# and display a labeled output about the user's input.
# - An integer.
# - A string of up to 20 characters long.
# String entered MUST be stored in separate storage space
# (i.e., not overwriting the storage space used by prompt and label strings)
# allocated just enough (no more, no less)
# to accommodate up to the maximum number of characters indicated.
# - A character.
#
# Note that it involves a character, NOT a one-character string. You will get no credits if you do it
# using a one-character string even though the same output is obtained.
# Be sure to do the "prompting-reading-displaying" for each type separately, i.e. first prompt, read
# and display the integer, then prompt, read and display the string, and finally prompt, read and
# display the character. (You will incur penalty if you prompt for all three together, then read all
# three together and finally display all three together.)
# Be sure to introduce appropriate spaces and newlines to make what appears on the Run I/O window (of
# MARS) reasonably readable. (You will incur penalty, for instance, if different items appear running
# together.)

.data
integerPrompt:   .asciiz "Enter an integer: "
genOutput:   "You entered: "
stringPrompt:   .asciiz "Enter a string: "
stringInput:   .space 21
charPrompt:   "enter a character: "
.text
.globl main
main:
li $v0, 4
la $a0, integerPrompt
syscall
li $v0, 5
syscall
addi $t0, $v0, 0
li $v0, 4
la $a0, genOutput
syscall
li $v0, 1
addi $a0, $t0, 0
syscall
li $a0, 10
li $v0, 11
syscall
syscall
li $v0, 4
la $a0, stringPrompt
syscall
li $v0, 8
la $a0, stringInput
li $a1, 21
syscall
li $v0, 4
la $a0, genOutput
syscall
la $a0, stringInput
syscall
li $a0, 10
li $v0, 11
syscall
syscall
li $v0, 4
la $a0, charPrompt
syscall
li $v0, 12
syscall
addi $t0, $v0, 0
li $v0, 4
la $a0, genOutput
syscall
li $v0, 11
addi $a0, $t0, 0
syscall
li $v0, 10
syscall
