	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		MOV r0, #32			; r0 = 32 i
		LDR r1, =0x3	; r1 = 200 input
		MOV r2, #0 			; r2 = 0 carry 
		MOV r3, #0			; r3 = 0 output
		
while 
		CMP r0, #0			; while (r2 != 0)
		BLS endwh			; {
		
		MOVS r1, r1, LSR #1 ;taking right most bit and adding to carry
		ADC r2, r2 , #0		; adding r2 to carry
		
		SUBS r0,r0, #1		; r0 = r0 - 1 
		
		LSL r2, r2, r0		; shifting r2 to oppisite bit from where it came
		ADD r3, r3, r2		; adding that to the output
		MOV r2, #0			; resetting where carry was added/shifted
		
		
		B while				; }
		
endwh	


stop	B	stop

	END	