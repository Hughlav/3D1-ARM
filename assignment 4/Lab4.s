	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		LDR r0, =str ; loading sting into r0
		MOV r1, #0	;setting counter for number of words
		LDRB r4, [r0]
		CMP r4, #0
		BEQ skipover
		ADD r1, r1, #1 ;adding 1 for first word (assuming no spaces befor first word or after last word)
skipover
loop	LDRB r2, [r0], #1 ;loading first char into r2
		LDRB r3, [r0] ; loading second char into r3
		
		CMP r2, r3 ;skipping over word counter if two chars side by side are he same (for two spaces)
		BEQ skip
		CMP r2, #0x20 ; skipping over word counter if the first char isnt a space
		BNE jump

		ADD r1, r1 , #1 ; counting each space between words

skip		
jump	CMP r2, #0 ; looping back to top unless null character is in r2
		BNE loop



stop	B	stop
	AREA TestData, DATA, READWRITE
str		DCB "it   is a   beautiful  day",0 ; input string to be tested
	END	