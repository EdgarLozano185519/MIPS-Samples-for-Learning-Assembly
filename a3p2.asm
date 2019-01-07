################################################################################
# Name:		Edgar Lozano
#
#
# Date:		08/09/2017
################################################################################
#void CoutCstr(char cstr[]);
#void CoutCstrNL(char cstr[]);
#void CoutOneInt(int oneInt);
#void PopulateArray(int a[], int* usedPtr, int cap);
#void CloneA1ToA2A3(int used1, int a1[], int a2[], int a3[], int* used2Ptr, int* used3Ptr);
#void Trim2Lim(int a[], int* usedPtr, int loLim, int hiLim);
#int  GetTrimCode(int iter, int delim1, int delim2, int delim3, int target);
#void IterTrim(int a[], int* usedPtr, int iter, int delim1, int delim2, int delim3);
#void ProcArrays(int* used3Ptr, int a1[], int a2[], int a3[], int* used1Ptr, int* used2Ptr,
#                int loLim, int hiLim, int delim1, int delim2, int delim3);
#void ShowArray(int a[], int used);
#void ShowArrayLabeled(int a[], int used, char label[]);
#
			.text
			.globl main
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#int main()
###############################################################################
main:
#################
# Register usage:
#################
# $v1: holder for a value/address
# $t0: loLim
# $t1: delim1
# $t2: delim2
# $t3: delim3
# $t9: hiLim
# (usual ones for syscall & function call)
###############################################################################
			# PROLOG:
			addiu $sp, $sp, -384
			sw $ra, 380($sp)
			sw $fp, 376($sp)
			addiu $fp, $sp, 384
#{
			# BODY:
#			int a1[12],
#			    a2[12],
#			    a3[12];
#			char reply;
#			int used1,
#			    used2,
#			    used3,
#			    loLim,
#			    hiLim,
#			    delim1,
#			    delim2,
#			    delim3;
#			char begA1Str[]  = "beginning a1: ";
#			char procA1Str[] = "processed a1: ";
#			char procA2Str[] = "          a2: ";
#			char procA3Str[] = "          a3: ";
#			char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
#			char dlStr[]     = "================================";
#			char byeStr[]    = "bye...";
			j begDataInitM					# "clutter-reduction" jump
endDataInitM:
#			loLim = 0;
			li $t0, 0
#			hiLim = 9;
			li $t9, 9
#			delim1 = 5;
			li $t1, 5
#			delim2 = 4;
			li $t2, 4
#			delim3 = 6;
			li $t3, 6
#			reply = 'y';
			li $t4, 'y'
#			goto WTest1;
			j WTest1
begW1:
#			PopulateArray(a1, &used1, 12);
			addi $a0, $sp, 232
			addi $a1, $sp, 220
			li $a2, 12
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal PopulateArray
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			ShowArrayLabeled(a1, used1, begA1Str);
			addi $a0, $sp, 232
			lw $a1, 220($sp)
			addi $a2, $sp, 48
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal ShowArrayLabeled
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			ProcArrays(&used3, a1, a2, a3, &used1, &used2, 
#				   loLim, hiLim, delim1, delim2, delim3);
			addi $a0, $sp, 228
			addi $a1, $sp, 232
			addi $a2, $sp, 280
			addi $a3, $sp, 328
			########## (9) ##########
			addi $v1, $sp, 220
			sw $v1, 16($sp)
			addi $v1, $sp, 224
			sw $v1, 20($sp)
			sw $t0, 24($sp)
			sw $t9, 28($sp)
			sw $t1, 32($sp)
			sw $t2, 36($sp)
			sw $t3, 40($sp)
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal ProcArrays
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			ShowArrayLabeled(a1, used1, procA1Str);
			addi $a0, $sp, 232
			lw $a1, 220($sp)
			addi $a2, $sp, 96
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal ShowArrayLabeled
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			ShowArrayLabeled(a2, used2, procA2Str);
			addi $a0, $sp, 280
			lw $a1, 224($sp)
			addi $a2, $sp, 111
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal ShowArrayLabeled			
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			ShowArrayLabeled(a3, used3, procA3Str);
			addi $a0, $sp, 328
			lw $a1, 228($sp)
			addi $a2, $sp, 126
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal ShowArrayLabeled			
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			cout << dacStr;
			addi $a0, $sp, 141
			sw $t0, 200($sp)				# save $t0 (caller-saved)
			sw $t9, 204($sp)				# save $t9 (caller-saved)
			sw $t1, 208($sp)				# save $t1 (caller-saved)
			sw $t2, 212($sp)				# save $t2 (caller-saved)
			sw $t3, 216($sp)				# save $t3 (caller-saved)
			jal CoutCstr
			lw $t0, 200($sp)				# restore $t0 (caller-saved)
			lw $t9, 204($sp)				# restore $t9 (caller-saved)
			lw $t1, 208($sp)				# restore $t1 (caller-saved)
			lw $t2, 212($sp)				# restore $t2 (caller-saved)
			lw $t3, 216($sp)				# restore $t3 (caller-saved)
#			cin >> reply;
			li $v0, 12
			syscall
			move $t4, $v0					# $t4 is reply			
			# newline to offset shortcoming of syscall #12
			li $v0, 11
			li $a0, '\n'
			syscall
WTest1:
#			if (reply == 'n') goto xitW1;
#			if (reply != 'N') goto begW1;
			li $v1, 'n'
			beq $t4, $v1, xitW1
			li $v1, 'N'
			bne $t4, $v1, begW1
xitW1:
#			cout << dlStr << '\n';
			addi $a0, $sp, 63
			jal CoutCstrNL			
#			cout << byeStr << '\n';
			addi $a0, $sp, 187
			jal CoutCstrNL			
#			cout << dlStr << '\n';
			addi $a0, $sp, 63
			jal CoutCstrNL			
#			return 0;
#}
			# EPILOG:
			lw $fp, 376($sp)
			lw $ra, 380($sp)
			addiu $sp, $sp, 384
			li $v0, 10
			syscall


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutCstr(char cstr[])
###############################################################################
CoutCstr:
#################
# Register usage:
#################
# (usual ones for syscall)
###############################################################################
			# PROLOG:
									# no stack frame needed
#{
			# BODY:
#			cout << cstr;
			li $v0, 4
			syscall
#}
			# EPILOG:
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutCstrNL(char cstr[])
###############################################################################
CoutCstrNL:
#################
# Register usage:
#################
# (usual ones for syscall & function call)
###############################################################################
			# PROLOG:
			addiu $sp, $sp, -32
			sw $ra, 28($sp)
			sw $fp, 24($sp)
			addiu $fp, $sp, 32
#{
			# BODY:
#			CoutCstr(cstr);
			jal CoutCstr
#			cout << '\n';
			li $a0, '\n'
			li $v0, 11
			syscall
#}
			# EPILOG:
			lw $fp, 24($sp)
			lw $ra, 28($sp)
			addiu $sp, $sp, 32
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutOneInt(int oneInt)
###############################################################################
CoutOneInt:
#################
# Register usage:
#################
# (usual ones for syscall)
###############################################################################
			# PROLOG:
									# no stack frame needed
#{
			# BODY:
#			cout << oneInt;
			li $v0, 1
			syscall
#}
			# EPILOG:
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutOneIntNLNDC(int oneInt)
###############################################################################
CoutOneIntNLNDC:
#################
# Register usage:
#################
# (usual ones for syscall)
###############################################################################
			# PROLOG:
									# no stack frame needed
#{
			# BODY:
#			cout << oneInt;
			li $v0, 1
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
#}
			# EPILOG:
#########################################
# no deliberate clobbering of caller-saved
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void PopulateArray(int a[], int* usedPtr, int cap)
###############################################################################
PopulateArray:
#################
# Register usage:
#################
# $s1: hopPtr
# $t0: holder for a value/address
# $t1: another holder for a value/address
# $t2: yet another holder for a value/address
# $t4: reply
# (usual ones for syscall & function call)
###############################################################################
			# PROLOG:
			addiu $sp, $sp, -120
			sw $ra, 116($sp)
			sw $fp, 112($sp)
			addiu $fp, $sp, 120
	
			sw $a1, 4($fp)					# usedPtr as received saved in caller's frame
			sw $a2, 8($fp)					# cap as received saved in caller's frame
			sw $s1, 16($sp)					# save $s1 (callee-saved)
#{
			# BODY:
#			char reply;
#			char einStr[]    = "Enter integer #";
#			char moStr[]     = "Max of ";
#			char ieStr[]     = " ints entered...";
#			char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
#			int *hopPtr;
			j begDataInitPA					# "clutter-reduction" jump
endDataInitPA:
#			reply = 'y';
			li $t4, 'y'					# $t4 is reply
#			*usedPtr = 0;
			sw $0, 0($a1)					# $a1 still has usedPtr as received
#			hopPtr = a;
			move $s1, $a0					# $a0 still has a as received
#			goto WTest2;
			j WTest2
begW2:
#			CoutCstr(einStr);
			addi $a0, $sp, 24
			jal CoutCstr
#			CoutOneInt(*usedPtr + 1);
			lw $a1, 4($fp)					# usedPtr as received re-loaded into $a1
									# CoutCstr might have clobbered $a1
			lw $a0, 0($a1)					# $a0 has *usedPtr
			addi $a0, $a0, 1				# *usedPtr + 1 as arg1
			jal CoutOneInt
#			cout << ':' << ' ';
			li $v0, 11
			li $a0, ':'
			syscall
			li $a0, ' '
			syscall
#			cin >> *hopPtr;
			li $v0, 5			
			syscall						# $v0 has user-entered int
			sw $v0, 0($s1)					# $s1 is hopPtr
#			++(*usedPtr);
			lw $a1, 4($fp)					# usedPtr as received re-loaded into $a1
									# CoutOneInt might have clobbered $a1
			lw $t1, 0($a1)					# $t1 has *usedPtr
			addi $t1, $t1, 1				# $t1 has *usedPtr + 1
			sw $t1, 0($a1)					# ++(*usedPtr)
#			++hopPtr;
			addi $s1, $s1, 4				# $s1 is hopPtr
#			if (*usedPtr >= cap) goto else1;
			lw $a2, 8($fp)					# cap as received re-loaded into $a2
									# CoutOneInt might have clobbered $a2
			bge $t1, $a2, else1				# if (*usedPtr >= cap) goto else1
									# $t1 still has up-to-date *usedPtr
#			CoutCstr(emiStr);
			addi $a0, $sp, 48
			jal CoutCstr
#			cin >> reply;
			li $v0, 12
			syscall
			move $t4, $v0					# $t4 is reply
			# newline to offset shortcoming of syscall #12
			li $v0, 11
			li $a0, '\n'
			syscall
#			goto endI1;
			j endI1
else1:
#			CoutCstr(moStr);
			addi $a0, $sp, 40
			jal CoutCstr
#			CoutOneInt(cap);
			lw $a0, 8($fp)					# cap as received loaded into $a0
									# not using $a2 as CoutCstr might have clobbered it
			jal CoutOneInt
#			CoutCstr(ieStr);
			addi $a0, $sp, 94
			jal CoutCstr
#			cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#			reply = 'n';
			li $t4, 'n'					# $t4 is reply
endI1:
WTest2:
#			if (reply == 'n') goto xitW2;
#			if (reply != 'N') goto begW2;
			li $t0, 'n'
			beq $t4, $t0, xitW2
			li $t0, 'N'
			bne $t4, $t0, begW2
xitW2:
#			return;
#}
			# EPILOG:
			lw $s1, 16($sp)					# restore $s1 (callee-saved)
			lw $fp, 112($sp)
			lw $ra, 116($sp)
			addiu $sp, $sp, 120  
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void ShowArray(int a[], int used)
#{
###############################################################################
ShowArray:
#################
# Register usage:
#################
# $t1: hopPtr
# $t9: endPtr
# $a1: used (as received)
# (usual ones for syscall & function call)
###############################################################################
			# PROLOG:
									# no stack frame needed
			# BODY:
#			int *hopPtr;
#			int *endPtr;

#			if (used <= 0) goto endI2;
			blez $a1, endI2
#			hopPtr = a;
			move $t1, $a0
#			endPtr = a + used;
			move $t9, $a1					# $t9 has used
			sll $t9, $t9, 2					# $t9 has 4*used
			add $t9, $t9, $t1				# $t9 has &a[used]
begDW1:
#			cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t1)					# $a0 has *hopPtr
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#			++hopPtr;
			addi $t1, $t1, 4
endDW1:
DWTest1:
#			if (hopPtr < endPtr) goto begDW1;
			blt $t1, $t9, begDW1
endI2:
#			cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#}
			# EPILOG:
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void ShowArrayLabeled(int a[], int used, char label[])
###############################################################################
ShowArrayLabeled:
#################
# Register usage:
#################
# $t1: i
# $v1: holder for a value/address
# (usual ones for function call)
###############################################################################
			# PROLOG:
			addiu $sp, $sp, -32
			sw $ra, 28($sp)
			sw $fp, 24($sp)
			addiu $fp, $sp, 32
			
			sw $a0, 0($fp)					# a as received saved in caller's frame
			sw $a1, 4($fp)					# used as received saved in caller's frame
#{			
			# BODY:
#			CoutCstr(label);
			move $a0, $a2
			jal CoutCstr
#			ShowArray(a, used);
			lw $a0, 0($fp)					# a as received re-loaded into $a0
			lw $a1, 4($fp)					# used as received re-loaded into $a1
									# CoutCstr might have clobbered $a0 & $a1
			jal ShowArray			
#}
			# EPILOG:
			lw $fp, 24($sp)
			lw $ra, 28($sp)
			addiu $sp, $sp, 32  
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CloneA1ToA2A3(int used1, int a1[], int a2[], int a3[], int* used2Ptr, int* used3Ptr)
#void CloneA1ToA2A3(      $a0,      $a1,      $a2,      $a3,       16($sp),       20($sp))
###############################################################################
CloneA1ToA2A3:
#################
# Register usage:
#################
# $t0: intHolder
# $t1: hopPtr1
# $t2: hopPtr2
# $t3: hopPtr3
# $t4: endPtr1
# $t9: holder for a value/address
# $v1: holder for a value/address
###############################################################################
			########## (25) ##########
			# PROLOG:					# no stack frame needed
#{
			# BODY:
#			int* hopPtr1;
#			int* hopPtr2;
#			int* hopPtr3;
#			int* endPtr1;
#			int intHolder;

#			*used2Ptr = 0;
			li $t9, 0
			lw $t0, 16($sp)
			sw $t9, 0($t0)
#			*used3Ptr = 0;
			lw $t0, 20($sp)
			sw $t9, 0($t0)
#			hopPtr1 = a1;
			move $t1, $a1
#			hopPtr2 = a2;
			move $t2, $a2
#			hopPtr3 = a3;
			move $t3, $a3
#			endPtr1 = a1 + used1;
			sll $t9, $a0, 2
			add $t4, $a1, $t9
#			goto WTest3;
			j WTest3
begW3:
#			intHolder = *hopPtr1;
			lw $t0, 0($t1)
#			*hopPtr2 = intHolder;
			sw $t0, 0($t2)
#			++(*used2Ptr);
			lw $t9, 16($sp)
			lw $v1, 0($t9)
			addi $v1, $v1, 1
			sw $v1, 0($t9)
#			++hopPtr2;
			addi $t2, $t2, 4
#			*hopPtr3 = intHolder;
			sw $t0, 0($t3)
#			++(*used3Ptr);
			lw $t9, 20($sp)
			lw $v1, 0($t9)
			addi $v1, $v1, 1
			sw $v1, 0($t9)
#			++hopPtr3;
			addi $t3, $t3, 4
#			++hopPtr1;
			addi $t1, $t1, 4
WTest3:
#			if (hopPtr1 < endPtr1) goto begW3;
			blt $t1, $t4, begW3
#}
			# EPILOG:
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void Trim2Lim(int a[], int* usedPtr, int loLim, int hiLim)
#void Trim2Lim(    $a0,          $a1,       $a2,       $a3)
###############################################################################
Trim2Lim:
#################
# Register usage:
#################
# $t0: target
# $t1: hopPtr
# $t2: hopPtrAux
# $t9: endPtr
# $v1: holder for a value/address
###############################################################################
			########## (21) ##########
			# PROLOG:					# no stack frame needed
#{			
			# BODY:
#			int* hopPtr;
#			int* hopPtrAux;
#			int* endPtr;
#			int target;

#			hopPtr = a;
			move $t1, $a0
#			endPtr = a + *usedPtr;
			lw $v1, 0($a1)
			sll $v1, $v1, 2
			add $t9, $a0, $v1
#			goto FTest1;
			j FTest1
begF1:
#			target = *hopPtr;
			lw $t0, 0($t1)
#			if (target < loLim) goto goodI4;
			blt $t0, $a2, goodI4
#			if (target <= hiLim) goto endI4;
			ble $t0, $a3, endI4
goodI4:
#			hopPtrAux = hopPtr + 1;
			addi $t2, $t1, 4
#			goto FTest2;
			j FTest2
begF2:
#			*(hopPtrAux - 1) = *hopPtrAux;
			lw $v1, 0($t2)
			sw $v1, -4($t2)
#			++hopPtrAux;
			addi $t2, $t2, 4
FTest2:
#			if (hopPtrAux < endPtr) goto begF2;
			blt $t2, $t9, begF2
#			--(*usedPtr);
			lw $v1, 0($a1)
			addi $v1, $v1, -1
			sw $v1, 0($a1)
#			--endPtr;
			addi $t9, $t9, -4
#			--hopPtr;
			addi $t1, $t1, -4
endI4:
#			++hopPtr;
			addi $t1, $t1, 4
FTest1:
#			if (hopPtr < endPtr) goto begF1;
			blt $t1, $t9, begF1
#}
			# EPILOG:
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#int GetTrimCode(int iter, int delim1, int delim2, int delim3, int target)
#int GetTrimCode(     $a0,        $a1,        $a2,        $a3,    16($sp))
###############################################################################
GetTrimCode:
#################
# Register usage:
#################
# $v0: retVal (gibes with conventional "return value via $v0")
# $v1: holder for a value/address
###############################################################################
			########## (15) ##########
			# PROLOG:					# no stack frame needed
#{			
			# BODY:
#			int retVal;

#			if (iter != 1) goto chk2_GTC;
			li $v1, 1
			bne $a0, $v1, chk2_GTC
#			if (target == delim1) goto else_GTC;
			lw $v1, 16($sp)
			beq $v1, $a1, else_GTC
chk2_GTC:
#			if (iter != 2) goto chk3_GTC;
			li $v1, 2
			bne $a0, $v1, chk3_GTC
#			if (target <= delim2) goto else_GTC;
			lw $v1, 16($sp)
			ble $v1, $a2, else_GTC
chk3_GTC:
#			if (iter != 3) goto default_GTC;
			li $v1, 3
			bne $a0, $v1, default_GTC
#			if (target >= delim3) goto else_GTC;
			lw $v1, 16($sp)
			bge $v1, $a3, else_GTC
default_GTC:
#			retVal = 0;
			li $v0, 0
#			goto end_GTC;
			j end_GTC
else_GTC:
#			retVal = 1;
			li $v0, 1
end_GTC:
#			return retVal;
#}
			# EPILOG:
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
#			li $v0, 999999999				# don't want to also clobber return value!
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void IterTrim(int a[], int* usedPtr, int iter, int delim1, int delim2, int delim3)
#void IterTrim(    $a0,          $a1,      $a2,        $a3,    16($fp),    20($fp))
###############################################################################
IterTrim:
#################
# Register usage:
#################
# $s0: count
# $t0: holder for a value/address
# $t1: hopPtr
# $t5: target
# $t9: endPtr
# $v0: trimCode (gibes with conventional "return value via $v0")
# $v1: holder for a value/address
###############################################################################
			########## (52) ##########
			# PROLOG:
			addiu $sp, $sp, -40
			sw $ra, 36($sp)
			sw $fp, 32($sp)
			addiu $fp, $sp, 40
			sw $s0, 20($sp)
			sw $a0, 0($fp)
			sw $a1, 4($fp)
			sw $a2, 8($fp)
			sw $a3, 12($fp)
#{			
			# BODY:
#			int target;
#			int trimCode;
#			int count;
#			int* hopPtr;
#			int* endPtr;

#			count = 0;
			li $s0, 0
#			hopPtr = a;
			lw $t1, 0($fp)
#			endPtr = a + *usedPtr;
			lw $t0, 0($a1)
			sll $t0, $t0, 2
			add $t9, $a0, $t0
#			goto Ftest_IT;
			j Ftest_IT
begF_IT:
#			target = *hopPtr;
			lw $t5, 0($t1)
#			trimCode = GetTrimCode(iter, delim1, delim2, delim3, target);
			lw $a0, 8($fp)
			lw $a1, 12($fp)
			lw $a2, 16($fp)
			lw $a3, 20($fp)
			sw $t5, 16($sp)
			sw $t1, 24($sp)
			sw $t9, 28($sp)
			jal GetTrimCode
			lw $t1, 24($sp)
			lw $t9, 28($sp)
#			if (trimCode != 0) goto else_ITa;
			bnez $v0, else_ITa
#			++count;
			addi $s0, $s0, 1
#			goto end_ITa;
			j end_ITa
else_ITa:
#			if (count == 0) goto end_ITb;
			beqz $s0, end_ITb
#			*(hopPtr - count) = *hopPtr;
			lw $t0, 0($t1)
			sll $v1, $s0, 2
			sub $v1, $t1, $v1
			sw $t0, 0($v1)
end_ITb:
end_ITa:
#			++hopPtr;
			addi $t1, $t1, 4
Ftest_IT:
#			if (hopPtr < endPtr) goto begF_IT;
			blt $t1, $t9, begF_IT
#			*usedPtr -= count;
			lw $a1, 4($fp)
			lw $t0, 0($a1)
			sub $t0, $t0, $s0
			sw $t0, 0($a1)
#			if (*usedPtr != 0) goto end_ITc;
			lw $t0, 0($a1)
			bnez $t0, end_ITc
#			hopPtr = a;
			lw $t1, 0($fp)
#			*hopPtr = -99;
			li $t0, -99
			sw $t0, 0($t1)
#			++(*usedPtr);
			lw $t0, 0($a1)
			addi $t0, $t0, 1
			sw $t0, 0($a1)
end_ITc:
#			return;
#}
			# EPILOG:
			lw $s0, 20($sp)
			lw $ra, 36($sp)
			lw $fp, 32($sp)
			addiu $sp, $sp, 40
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void ProcArrays(int* used3Ptr, int a1[], int a2[], int a3[], int* used1Ptr, int* used2Ptr,
#void ProcArrays(          $a0,      $a1,      $a2,      $a3,       16($fp),       20($fp),
#			int loLim, int hiLim, int delim1, int delim2, int delim3)
#                         24($fp),   28($fp),    32($fp),    36($fp),    40($fp))
#{
###############################################################################
ProcArrays:
#################
# Register usage:
#################
# $s0: iter
# $t0: holder for a value/address
# $v1: holder for a value/address
# (usual ones for function call)
###############################################################################
			# PROLOG:
			addiu $sp, $sp, -56
			sw $ra, 52($sp)
			sw $fp, 48($sp)
			addiu $fp, $sp, 56
			
			sw $a0, 0($fp)					# used3Ptr as received saved in caller's frame
			sw $a1, 4($fp)					# a1 as received saved in caller's frame
			sw $a2, 8($fp)					# a2 as received saved in caller's frame
			sw $a3, 12($fp)					# a3 as received saved in caller's frame
			sw $s0, 24($sp)					# save $s0 (callee-saved)
			
			# BODY:
#			char nn09A1Str[] = "a1 (noneg09): ";
			j begDataInitPrAr				# "clutter-reduction" jump			
endDataInitPrAr:			
#			int iter;

#			if (*used1Ptr <= 0) goto endI3;
			lw $t0, 16($fp)					# used1Ptr as received (via stack) loaded into $t0
			lw $v1, 0($t0)					# $v1 has *used1Ptr
			blez $v1, endI3

#			Trim2Lim(a1, used1Ptr, loLim, hiLim);
			########## (4) ##########
			lw $a0, 4($fp)
			lw $a1, 16($fp)
			lw $a2, 24($fp)
			lw $a3, 28($fp)
			jal Trim2Lim
#			ShowArrayLabeled(a1, *used1Ptr, nn09A1Str);
			lw $a0, 4($fp)					# a1 as received (saved on stack coming in) as arg1
			lw $t0, 16($fp)					# $t0 has used1Ptr as received (via stack)
			lw $a1, 0($t0)					# *used1Ptr as arg2 
			addi $a2, $sp, 32				# &nn09A1Str[0] as arg3
			jal ShowArrayLabeled
#			CloneA1ToA2A3(*used1Ptr, a1, a2, a3, used2Ptr, used3Ptr);
			########## (9) ##########
			lw $t0, 16($fp)
			lw $a0, 0($t0)
			lw $a1, 4($fp)
			lw $a2, 8($fp)
			lw $a3, 12($fp)
			lw $t0, 20($fp)
			sw $t0, 16($sp)
			lw $t0, 0($fp)
			sw $t0, 20($sp)
			jal CloneA1ToA2A3
#			. . .#			iter = 0;
			li $s0, 0
begDW3:
#			++iter;
			addi $s0, $s0, 1
#			if (iter != 1) goto else6;
			li $v1, 1
			bne $s0, $v1, else6
#			IterTrim(a1, used1Ptr, iter, delim1, delim2, delim3);
			########## (8) ##########
			lw $a0, 4($fp)
			lw $a1, 16($fp)
			move $a2, $s0
			lw $a3, 32($fp)
			lw $t0, 36($fp)
			sw $t0, 16($sp)
			lw $t0, 40($fp)
			sw $t0, 20($sp)
			jal IterTrim
#			goto endI6;
			j endI6
else6:
#			if (iter != 2) goto elseI10;
			li $v1, 2
			bne $s0, $v1, elseI10
#			IterTrim(a2, used2Ptr, iter, delim1, delim2, delim3);
			########## (8) ##########
			lw $a0, 8($fp)
			lw $a1, 20($fp)
			move $a2, $s0
			lw $a3, 32($fp)
			lw $t0, 36($fp)
			sw $t0, 16($sp)
			lw $t0, 40($fp)
			sw $t0, 20($sp)
			jal IterTrim
#			goto endI10;
			j endI10
elseI10:
#			IterTrim(a3, used3Ptr, iter, delim1, delim2, delim3);
			########## (8) ##########
			lw $a0, 12($fp)
			lw $a1, 0($fp)
			move $a2, $s0
			lw $a3, 32($fp)
			lw $t0, 36($fp)
			sw $t0, 16($sp)
			lw $t0, 40($fp)
			sw $t0, 20($sp)
			jal IterTrim
endI10:
endI6:
DWTest3:
#			if (iter < 3) goto begDW3;
			li $v1, 3
			blt $s0, $v1, begDW3
endI3:
#			return;
#}
			# EPILOG:
			lw $s0, 24($sp)					# restore $s0 (callee-saved)
			lw $fp, 48($sp)
			lw $ra, 52($sp)
			addiu $sp, $sp, 56  
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
			jr $ra


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# main's string initialization code moved out of the way to reduce clutter
###############################################################################
begDataInitM:
			li $t0, 'b'
			sb $t0, 48($sp)
			li $t0, 'e'
			sb $t0, 49($sp)
			li $t0, 'g'
			sb $t0, 50($sp)
			li $t0, 'i'
			sb $t0, 51($sp)
			li $t0, 'n'
			sb $t0, 52($sp)
			li $t0, 'n'
			sb $t0, 53($sp)
			li $t0, 'i'
			sb $t0, 54($sp)
			li $t0, 'n'
			sb $t0, 55($sp)
			li $t0, 'g'
			sb $t0, 56($sp)
			li $t0, ' '
			sb $t0, 57($sp)
			li $t0, 'a'
			sb $t0, 58($sp)
			li $t0, '1'
			sb $t0, 59($sp)
			li $t0, ':'
			sb $t0, 60($sp)
			li $t0, ' '
			sb $t0, 61($sp)
			li $t0, '\0'
			sb $t0, 62($sp)
			li $t0, '='
			sb $t0, 63($sp)
			li $t0, '='
			sb $t0, 64($sp)
			li $t0, '='
			sb $t0, 65($sp)
			li $t0, '='
			sb $t0, 66($sp)
			li $t0, '='
			sb $t0, 67($sp)
			li $t0, '='
			sb $t0, 68($sp)
			li $t0, '='
			sb $t0, 69($sp)
			li $t0, '='
			sb $t0, 70($sp)
			li $t0, '='
			sb $t0, 71($sp)
			li $t0, '='
			sb $t0, 72($sp)
			li $t0, '='
			sb $t0, 73($sp)
			li $t0, '='
			sb $t0, 74($sp)
			li $t0, '='
			sb $t0, 75($sp)
			li $t0, '='
			sb $t0, 76($sp)
			li $t0, '='
			sb $t0, 77($sp)
			li $t0, '='
			sb $t0, 78($sp)
			li $t0, '='
			sb $t0, 79($sp)
			li $t0, '='
			sb $t0, 80($sp)
			li $t0, '='
			sb $t0, 81($sp)
			li $t0, '='
			sb $t0, 82($sp)
			li $t0, '='
			sb $t0, 83($sp)
			li $t0, '='
			sb $t0, 84($sp)
			li $t0, '='
			sb $t0, 85($sp)
			li $t0, '='
			sb $t0, 86($sp)
			li $t0, '='
			sb $t0, 87($sp)
			li $t0, '='
			sb $t0, 88($sp)
			li $t0, '='
			sb $t0, 89($sp)
			li $t0, '='
			sb $t0, 90($sp)
			li $t0, '='
			sb $t0, 91($sp)
			li $t0, '='
			sb $t0, 92($sp)
			li $t0, '='
			sb $t0, 93($sp)
			li $t0, '='
			sb $t0, 94($sp)
			li $t0, '\0'
			sb $t0, 95($sp)
			li $t0, 'p'
			sb $t0, 96($sp)
			li $t0, 'r'
			sb $t0, 97($sp)
			li $t0, 'o'
			sb $t0, 98($sp)
			li $t0, 'c'
			sb $t0, 99($sp)
			li $t0, 'e'
			sb $t0, 100($sp)
			li $t0, 's'
			sb $t0, 101($sp)
			li $t0, 's'
			sb $t0, 102($sp)
			li $t0, 'e'
			sb $t0, 103($sp)
			li $t0, 'd'
			sb $t0, 104($sp)
			li $t0, ' '
			sb $t0, 105($sp)
			li $t0, 'a'
			sb $t0, 106($sp)
			li $t0, '1'
			sb $t0, 107($sp)
			li $t0, ':'
			sb $t0, 108($sp)
			li $t0, ' '
			sb $t0, 109($sp)
			li $t0, '\0'
			sb $t0, 110($sp)
			li $t0, ' '
			sb $t0, 111($sp)
			li $t0, ' '
			sb $t0, 112($sp)
			li $t0, ' '
			sb $t0, 113($sp)
			li $t0, ' '
			sb $t0, 114($sp)
			li $t0, ' '
			sb $t0, 115($sp)
			li $t0, ' '
			sb $t0, 116($sp)
			li $t0, ' '
			sb $t0, 117($sp)
			li $t0, ' '
			sb $t0, 118($sp)
			li $t0, ' '
			sb $t0, 119($sp)
			li $t0, ' '
			sb $t0, 120($sp)
			li $t0, 'a'
			sb $t0, 121($sp)
			li $t0, '2'
			sb $t0, 122($sp)
			li $t0, ':'
			sb $t0, 123($sp)
			li $t0, ' '
			sb $t0, 124($sp)
			li $t0, '\0'
			sb $t0, 125($sp)
			li $t0, ' '
			sb $t0, 126($sp)
			li $t0, ' '
			sb $t0, 127($sp)
			li $t0, ' '
			sb $t0, 128($sp)
			li $t0, ' '
			sb $t0, 129($sp)
			li $t0, ' '
			sb $t0, 130($sp)
			li $t0, ' '
			sb $t0, 131($sp)
			li $t0, ' '
			sb $t0, 132($sp)
			li $t0, ' '
			sb $t0, 133($sp)
			li $t0, ' '
			sb $t0, 134($sp)
			li $t0, ' '
			sb $t0, 135($sp)
			li $t0, 'a'
			sb $t0, 136($sp)
			li $t0, '3'
			sb $t0, 137($sp)
			li $t0, ':'
			sb $t0, 138($sp)
			li $t0, ' '
			sb $t0, 139($sp)
			li $t0, '\0'
			sb $t0, 140($sp)
			li $t0, 'D'
			sb $t0, 141($sp)
			li $t0, 'o'
			sb $t0, 142($sp)
			li $t0, ' '
			sb $t0, 143($sp)
			li $t0, 'a'
			sb $t0, 144($sp)
			li $t0, 'n'
			sb $t0, 145($sp)
			li $t0, 'o'
			sb $t0, 146($sp)
			li $t0, 't'
			sb $t0, 147($sp)
			li $t0, 'h'
			sb $t0, 148($sp)
			li $t0, 'e'
			sb $t0, 149($sp)
			li $t0, 'r'
			sb $t0, 150($sp)
			li $t0, ' '
			sb $t0, 151($sp)
			li $t0, 'c'
			sb $t0, 152($sp)
			li $t0, 'a'
			sb $t0, 153($sp)
			li $t0, 's'
			sb $t0, 154($sp)
			li $t0, 'e'
			sb $t0, 155($sp)
			li $t0, '?'
			sb $t0, 156($sp)
			li $t0, ' '
			sb $t0, 157($sp)
			li $t0, '('
			sb $t0, 158($sp)
			li $t0, 'n'
			sb $t0, 159($sp)
			li $t0, ' '
			sb $t0, 160($sp)
			li $t0, 'o'
			sb $t0, 161($sp)
			li $t0, 'r'
			sb $t0, 162($sp)
			li $t0, ' '
			sb $t0, 163($sp)
			li $t0, 'N'
			sb $t0, 164($sp)
			li $t0, ' '
			sb $t0, 165($sp)
			li $t0, '='
			sb $t0, 166($sp)
			li $t0, ' '
			sb $t0, 167($sp)
			li $t0, 'n'
			sb $t0, 168($sp)
			li $t0, 'o'
			sb $t0, 169($sp)
			li $t0, ','
			sb $t0, 170($sp)
			li $t0, ' '
			sb $t0, 171($sp)
			li $t0, 'o'
			sb $t0, 172($sp)
			li $t0, 't'
			sb $t0, 173($sp)
			li $t0, 'h'
			sb $t0, 174($sp)
			li $t0, 'e'
			sb $t0, 175($sp)
			li $t0, 'r'
			sb $t0, 176($sp)
			li $t0, 's'
			sb $t0, 177($sp)
			li $t0, ' '
			sb $t0, 178($sp)
			li $t0, '='
			sb $t0, 179($sp)
			li $t0, ' '
			sb $t0, 180($sp)
			li $t0, 'y'
			sb $t0, 181($sp)
			li $t0, 'e'
			sb $t0, 182($sp)
			li $t0, 's'
			sb $t0, 183($sp)
			li $t0, ')'
			sb $t0, 184($sp)
			li $t0, ' '
			sb $t0, 185($sp)
			li $t0, '\0'
			sb $t0, 186($sp)
			li $t0, 'b'
			sb $t0, 187($sp)
			li $t0, 'y'
			sb $t0, 188($sp)
			li $t0, 'e'
			sb $t0, 189($sp)
			li $t0, '.'
			sb $t0, 190($sp)
			li $t0, '.'
			sb $t0, 191($sp)
			li $t0, '.'
			sb $t0, 192($sp)
			li $t0, '\0'
			sb $t0, 193($sp)
			j endDataInitM				# back to main

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# PopulateArray's string initialization code moved out of the way to reduce clutter
###############################################################################
begDataInitPA:
			li $t0, 'E'
			sb $t0, 24($sp)
			li $t0, 'n'
			sb $t0, 25($sp)
			li $t0, 't'
			sb $t0, 26($sp)
			li $t0, 'e'
			sb $t0, 27($sp)
			li $t0, 'r'
			sb $t0, 28($sp)
			li $t0, ' '
			sb $t0, 29($sp)
			li $t0, 'i'
			sb $t0, 30($sp)
			li $t0, 'n'
			sb $t0, 31($sp)
			li $t0, 't'
			sb $t0, 32($sp)
			li $t0, 'e'
			sb $t0, 33($sp)
			li $t0, 'g'
			sb $t0, 34($sp)
			li $t0, 'e'
			sb $t0, 35($sp)
			li $t0, 'r'
			sb $t0, 36($sp)
			li $t0, ' '
			sb $t0, 37($sp)
			li $t0, '#'
			sb $t0, 38($sp)
			li $t0, '\0'
			sb $t0, 39($sp)
			li $t0, 'M'
			sb $t0, 40($sp)
			li $t0, 'a'
			sb $t0, 41($sp)
			li $t0, 'x'
			sb $t0, 42($sp)
			li $t0, ' '
			sb $t0, 43($sp)
			li $t0, 'o'
			sb $t0, 44($sp)
			li $t0, 'f'
			sb $t0, 45($sp)
			li $t0, ' '
			sb $t0, 46($sp)
			li $t0, '\0'
			sb $t0, 47($sp)
			li $t0, 'E'
			sb $t0, 48($sp)
			li $t0, 'n'
			sb $t0, 49($sp)
			li $t0, 't'
			sb $t0, 50($sp)
			li $t0, 'e'
			sb $t0, 51($sp)
			li $t0, 'r'
			sb $t0, 52($sp)
			li $t0, ' '
			sb $t0, 53($sp)
			li $t0, 'm'
			sb $t0, 54($sp)
			li $t0, 'o'
			sb $t0, 55($sp)
			li $t0, 'r'
			sb $t0, 56($sp)
			li $t0, 'e'
			sb $t0, 57($sp)
			li $t0, ' '
			sb $t0, 58($sp)
			li $t0, 'i'
			sb $t0, 59($sp)
			li $t0, 'n'
			sb $t0, 60($sp)
			li $t0, 't'
			sb $t0, 61($sp)
			li $t0, 's'
			sb $t0, 62($sp)
			li $t0, '?'
			sb $t0, 63($sp)
			li $t0, ' '
			sb $t0, 64($sp)
			li $t0, '('
			sb $t0, 65($sp)
			li $t0, 'n'
			sb $t0, 66($sp)
			li $t0, ' '
			sb $t0, 67($sp)
			li $t0, 'o'
			sb $t0, 68($sp)
			li $t0, 'r'
			sb $t0, 69($sp)
			li $t0, ' '
			sb $t0, 70($sp)
			li $t0, 'N'
			sb $t0, 71($sp)
			li $t0, ' '
			sb $t0, 72($sp)
			li $t0, '='
			sb $t0, 73($sp)
			li $t0, ' '
			sb $t0, 74($sp)
			li $t0, 'n'
			sb $t0, 75($sp)
			li $t0, 'o'
			sb $t0, 76($sp)
			li $t0, ','
			sb $t0, 77($sp)
			li $t0, ' '
			sb $t0, 78($sp)
			li $t0, 'o'
			sb $t0, 79($sp)
			li $t0, 't'
			sb $t0, 80($sp)
			li $t0, 'h'
			sb $t0, 81($sp)
			li $t0, 'e'
			sb $t0, 82($sp)
			li $t0, 'r'
			sb $t0, 83($sp)
			li $t0, 's'
			sb $t0, 84($sp)
			li $t0, ' '
			sb $t0, 85($sp)
			li $t0, '='
			sb $t0, 86($sp)
			li $t0, ' '
			sb $t0, 87($sp)
			li $t0, 'y'
			sb $t0, 88($sp)
			li $t0, 'e'
			sb $t0, 89($sp)
			li $t0, 's'
			sb $t0, 90($sp)
			li $t0, ')'
			sb $t0, 91($sp)
			li $t0, ' '
			sb $t0, 92($sp)
			li $t0, '\0'
			sb $t0, 93($sp)
			li $t0, ' '
			sb $t0, 94($sp)
			li $t0, 'i'
			sb $t0, 95($sp)
			li $t0, 'n'
			sb $t0, 96($sp)
			li $t0, 't'
			sb $t0, 97($sp)
			li $t0, 's'
			sb $t0, 98($sp)
			li $t0, ' '
			sb $t0, 99($sp)
			li $t0, 'e'
			sb $t0, 100($sp)
			li $t0, 'n'
			sb $t0, 101($sp)
			li $t0, 't'
			sb $t0, 102($sp)
			li $t0, 'e'
			sb $t0, 103($sp)
			li $t0, 'r'
			sb $t0, 104($sp)
			li $t0, 'e'
			sb $t0, 105($sp)
			li $t0, 'd'
			sb $t0, 106($sp)
			li $t0, '.'
			sb $t0, 107($sp)
			li $t0, '.'
			sb $t0, 108($sp)
			li $t0, '.'
			sb $t0, 109($sp)
			li $t0, '\0'
			sb $t0, 110($sp)
			j endDataInitPA				# back to PopulateArray
			
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# ProcArrays' string initialization code moved out of the way to reduce clutter
###############################################################################
begDataInitPrAr:
			li $t0, 'a'
			sb $t0, 32($sp)
			li $t0, '1'
			sb $t0, 33($sp)
			li $t0, ' '
			sb $t0, 34($sp)
			li $t0, '('
			sb $t0, 35($sp)
			li $t0, 'n'
			sb $t0, 36($sp)
			li $t0, 'o'
			sb $t0, 37($sp)
			li $t0, 'n'
			sb $t0, 38($sp)
			li $t0, 'e'
			sb $t0, 39($sp)
			li $t0, 'g'
			sb $t0, 40($sp)
			li $t0, '0'
			sb $t0, 41($sp)
			li $t0, '9'
			sb $t0, 42($sp)
			li $t0, ')'
			sb $t0, 43($sp)
			li $t0, ':'
			sb $t0, 44($sp)
			li $t0, ' '
			sb $t0, 45($sp)
			li $t0, '\0'
			sb $t0, 46($sp)
			j endDataInitPrAr			# back to ProcArrays
			
			j always_skip_if_reaches_here						

##########################################################################################
# following are some code segments meant to be TEMPORARILY inserted (during debugging & at
# strategic points) to display the values of certain integer items (so the values of the
# items can be checked against what they are expected to be)
##########################################################################################

####### BEG_debug_print_int ###			
move $gp, $a0
move $a0, $v1					# debug_print $v1 
jal CoutOneIntNLNDC
move $a0, $gp
####### END_debug_print_int ###			

####### BEG_debug_print_int ###			
move $gp, $a0
lw $t0, 16($fp)					# $t0 has used1Ptr as received (via stack)
lw $a0, 0($t0)					# debug_print *used1Ptr 
jal CoutOneIntNLNDC
move $a0, $gp
####### END_debug_print_int ###			

always_skip_if_reaches_here:
