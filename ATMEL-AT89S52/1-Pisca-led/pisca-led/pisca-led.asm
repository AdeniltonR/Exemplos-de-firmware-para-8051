
_main:
	MOV SP+0, #128
;pisca-led.c,21 :: 		void main() {
;pisca-led.c,23 :: 		while(1) {
L_main0:
;pisca-led.c,24 :: 		P1 ^= PIN_led;
	XRL P1+0, #2
;pisca-led.c,25 :: 		delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;pisca-led.c,26 :: 		}
	SJMP L_main0
;pisca-led.c,27 :: 		}
	SJMP #254
; end of _main
