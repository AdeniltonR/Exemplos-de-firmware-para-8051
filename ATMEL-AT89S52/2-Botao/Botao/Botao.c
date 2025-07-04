/*
 * NOME: Adenilton Ribeiro
 * DATA: 03/07/2025
 * PROJETO: Botao
 * VERSAO: 1.0.0
 * DESCRICAO: - feat: Acende o LED quando o botao e pressionado e apaga quando solto
 *            - docs: MikroC PRO for 8051 v3.6.0 - PICSimLab Simulador 0.9.1
 * LINKS:
*/

// ========================================================================================================
//---MAPEAMENTO DE HARDWARE---

//---define o LED no pino P1.1---
#define PIN_led P1_1
//---define o botao no pino P3.2---
#define PIN_button P3_2

// ========================================================================================================
/**
 * @brief Void main
 *
*/
void main() {
     //---inicializa a porta P1 (todos os pinos em 1)---
     P1 = 0xFF;
     
     while(1) {
              if(P3 & (1<<PIN_button)) {
                    P1 |= (1<<PIN_led);
              }else{
                    P1 &= ~(1<<PIN_led);
              }
     }

}