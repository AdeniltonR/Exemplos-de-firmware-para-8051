/*
 * NOME: Adenilton Ribeiro
 * DATA: 03/07/2025
 * PROJETO: Pisca Led
 * VERSAO: 1.0.0
 * DESCRICAO: - feat: Fazer MCU piscar um led.
 *            - docs: MikroC PRO for 8051 v3.6.0 - PICSimLab Simulador 0.9.1
 * LINKS: Tutorial: https://www.youtube.com/watch?v=QY_adW902Uw&t
*/

// ========================================================================================================
//---MAPEAMENTO DE HARDWARE---

#define PIN_led (1<<P1_1)

// ========================================================================================================
/**
 * @brief Void main
 *
*/
void main() {

     while(1) {
              P1 ^= PIN_led;
              delay_ms(1000);
     }
}