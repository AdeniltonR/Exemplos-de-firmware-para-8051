
_delay_ms:
;pisca-led.c,19 :: 		void delay_ms(unsigned int ms) {
;pisca-led.c,21 :: 		for (i = 0; i < ms; i++) {
	MOV delay_ms_i_L0+0, #0
	MOV delay_ms_i_L0+1, #0
L_delay_ms0:
	CLR C
	MOV A, delay_ms_i_L0+0
	SUBB A, FARG_delay_ms_ms+0
	MOV A, delay_ms_i_L0+1
	SUBB A, FARG_delay_ms_ms+1
	JNC L_delay_ms1
;pisca-led.c,22 :: 		for (j = 0; j < 123; j++);  // Aproximadamente 1ms de atraso
	MOV delay_ms_j_L0+0, #0
	MOV delay_ms_j_L0+1, #0
L_delay_ms3:
	CLR C
	MOV A, delay_ms_j_L0+0
	SUBB A, #123
	MOV A, delay_ms_j_L0+1
	SUBB A, #0
	JNC L_delay_ms4
	MOV A, #1
	ADD A, delay_ms_j_L0+0
	MOV delay_ms_j_L0+0, A
	MOV A, #0
	ADDC A, delay_ms_j_L0+1
	MOV delay_ms_j_L0+1, A
	SJMP L_delay_ms3
L_delay_ms4:
;pisca-led.c,21 :: 		for (i = 0; i < ms; i++) {
	MOV A, #1
	ADD A, delay_ms_i_L0+0
	MOV delay_ms_i_L0+0, A
	MOV A, #0
	ADDC A, delay_ms_i_L0+1
	MOV delay_ms_i_L0+1, A
;pisca-led.c,23 :: 		}
	SJMP L_delay_ms0
L_delay_ms1:
;pisca-led.c,24 :: 		}
	RET
; end of _delay_ms

_main:
	MOV SP+0, #128
;pisca-led.c,29 :: 		void main() {
;pisca-led.c,33 :: 		P1 = 0xFF;
	MOV P1+0, #255
;pisca-led.c,35 :: 		while (1) {
L_main6:
;pisca-led.c,37 :: 		for (i = 1; i <= 7; i++) {
	MOV main_i_L0+0, #1
L_main8:
	SETB C
	MOV A, main_i_L0+0
	SUBB A, #7
	JNC L_main9
;pisca-led.c,38 :: 		P1 = ~(1 << i);  // Liga o LED no pino correspondente e apaga os demais
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main11
L__main12:
	CLR C
	RLC A
L__main11:
	DJNZ R1, L__main12
	MOV R0, A
	XRL A, #255
	MOV P1+0, A
;pisca-led.c,39 :: 		delay_ms(1000);  // Atraso de 1 segundo
	MOV R5, 6
	MOV R6, 17
	MOV R7, 253
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;pisca-led.c,37 :: 		for (i = 1; i <= 7; i++) {
	INC main_i_L0+0
;pisca-led.c,40 :: 		}
	SJMP L_main8
L_main9:
;pisca-led.c,41 :: 		}
	SJMP L_main6
;pisca-led.c,42 :: 		}
	SJMP #254
; end of _main
