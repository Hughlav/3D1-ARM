	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		MOV r2, #0 
		MOV r3, #1 ; flag for + or - (0 is negative)
		LDR r0, =str ; loading sting into r0
		LDR r1, =data1 ;creating empty register
		MOV r4, #0 ;where answer is stored
		
		LDRB r2, [r0], #1 ; loading first bit into r2
		CMP r2, #0x2D ; if input string is neg 
		BNE skip ;change +/- flag to negative
		MOV r3, #0 ;neg
skip
loop1
		LDRB r2, [r0], #1 ; loading next bit into r2
		
		CMP r2, #0x78 
		BNE loop1 ;looping past 0 to x
		
jump
		LDRB r2, [r0] ; loading first bit into r2
		CMP r2, #0 ;if null char then finish looping over string
		BEQ finish
		
		
		CMP r2, #0x39
		BLS letter ;if the char is a letter 
		SUB r2, r2, #0x37 ; sub 37 from it to get letter in one byte
		B endif1
		
		
letter
		SUB r2, r2, #0x30 ;else sub 30 (number)
endif1
		LSL r4, #4 ;make room in r4 for next byte
		ORR r4, r4, r2 ;adding num/letter in byte in r2 to r1
		LDRB r2, [r0], #1 ;loading next char into r2
		CMP r2, #0x00 ;if not null then loop to top
		BNE jump
finish		

		CMP r3, #1 ;if input string was negative
		BEQ nonneg 
		NEG r4, r4 ;flip to 2's complement negative
nonneg
		STR r4, [r1]
stop	B	stop

	AREA TestData, DATA, READWRITE
data1 SPACE 100
str		DCB "-0xB35A" ,0 ; input string to be tested

	END	