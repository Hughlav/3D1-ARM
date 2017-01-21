	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR r12, =STK_TOP 
	LDR r0, =str  ;loading parenthesis string to r0
	LDR r1, =0		;answer resgister
	MOV r3, r12
loop	
	LDRB r2, [r0], #1 ;loadinging first parenthisis into r2
	CMP r2, #0x29	;cmp with closing bracket
	BEQ notopening ;if it is closing skip next line
	STR r2, [r12, #-4]! ;storing closing parenthesis in stack
	
notopening
	CMP r2, #0x28 ;cmp with opening bracket
	BEQ notclosing ;if it is closing then execute next line
	LDR r2, [r12], #4 ;pop opening bracket as a closing was found
	CMP r12, r3 ;checking if more closing brackets then opening
	BLE okay
	LDR r12, =0xA400000A ;if there are then set the adress of r12 to 
						 ;something above the starting point and end program
	LDR r1, =0  ;string not balanced
	B	end	
okay
notclosing
	LDRB r2, [r0] 
	CMP r2, #0 ;check for null string
	BNE loop
	;if r12 is back at starting address (0xA1000000)
	;then number of opening brackets = number of closing brackets
	CMP r12, r3
	BNE equal
	LDR r1, =1
	B end 
equal 
	LDR r1, =0
end
stop	B	stop

STK_SZ EQU 0x400 ; 1K stack
	AREA Stack, DATA, READWRITE
STK_MEM SPACE STK_SZ
STK_TOP
	AREA TestData, DATA, READWRITE
str		DCB "()))" ,0 ; input string to be tested

	END	