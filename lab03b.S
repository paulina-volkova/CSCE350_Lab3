.section .text
.globl lab03b

lab03b:
	/*Line  8	clears register X1 in case if it held anything previously
	  Lines 9-10	loads addres of label <uin> into X1
	  Line  11	stores the value of the label (i.e. 32) in register X2	*/
	SUB X0, X0, X0
	SUB X1, X1, X1
	SUB X2, X2, X2
	ADRP X1, uin		
	ADD X1, X1, :lo12:uin 	
	LDUR X0, [X1, 0]
	
	SUB X2, X2, X2 // X0 will store i, which is initially set to 0

/*Line 19	subtracts i-10 and stores it in register X3
  Line 20	if i >= 10, exit the loop
  Line 21-23	otherwise, decrement uin, increment i and restart loop
*/
for_loop: SUBS X3, X2, #10
	  B.GE Exit
	  SUB X0, X0, #1
	  ADD X2, X2, #1
	  B for_loop

Exit: 
	BR X30	
	 	
.section .data

uin: 
.word 32
