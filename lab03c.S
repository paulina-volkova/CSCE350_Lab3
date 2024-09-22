.section .text
.globl lab03c

lab03c:
	//X0 is j, X1 is i
	MOV X0, #9
	SUB X1, X1, X1
	
	//load address of my_array into X3
	ADRP X3, my_array
	ADD X3, X3, :lo12:my_array

for_loop:
	SUBS X2, X1, #10 // i-10 condition for for loop
	B.GE Exit
	LSL X4, X1, #2
	ADD X3, X3, X4 //gets address of my_array[i]
	STUR X1, [X3, 0]
	ADD X0, X0, #1 //j++
	ADD X1, X1, #1 //i++
	B for_loop
Exit:
	BR X30

.section .data

my_array: .space 10

	
