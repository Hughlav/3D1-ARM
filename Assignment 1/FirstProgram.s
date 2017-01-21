	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start
		
start
	MOV r0, #0x2  ;input value for x
	MOV r3, #0x6
	MOV r5, #0x4
	MUL r1, r0, r0
	MUL r2, r1, r1
	MUL r2, r3, r2
	MUL r4, r5, r1
	MUL r6, r3, r0
	SUB r7, r2, r4 
	ADD r7, r6, r7
	
stop	B	stop

	END	