
_main:
	MOV SP+0, #128
;Botao.c,39 :: 		void main() {
;Botao.c,41 :: 		P1 = 0xFF;
	MOV P1+0, #255
;Botao.c,43 :: 		while(1) {
L_main0:
;Botao.c,44 :: 		if(P3 & (1<<PIN_button)) {
	MOV A, P3+0
	ANL A, #4
	JZ L_main2
;Botao.c,45 :: 		P1 |= (1<<PIN_led);
	ORL P1+0, #2
;Botao.c,46 :: 		}else{
	SJMP L_main3
L_main2:
;Botao.c,47 :: 		P1 &= ~(1<<PIN_led);
	ANL P1+0, #253
;Botao.c,48 :: 		}
L_main3:
;Botao.c,49 :: 		}
	SJMP L_main0
;Botao.c,51 :: 		}
	SJMP #254
; end of _main
