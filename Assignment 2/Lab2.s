	AREA	FirstProgram, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR 	r0, =0x343		; input value 256
	MOV		r1, #0			; count =0
	MOV 	r2, #0			; cleared bits
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	MOVS	r0, r0, LSR #1	; tmp = tmp >> 1, C-flag = shiftout
	ADC		r1, r1, #0		;count = count + C-flag
	
	RSB		r2, r1, #0x9 	;number of bits cleared
	
stop	B	stop

	END	