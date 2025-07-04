#line 1 "C:/Users/adenilton.ribeiro/Documents/CEDEPS/Projetos-AWS/Projeto-Documentacao-CEDEPS/projetos.Documentacao.CEDEPS/8051/ATMEL-AT89S52/1-Pisca-led/pisca-led/pisca-led.c"
#line 19 "C:/Users/adenilton.ribeiro/Documents/CEDEPS/Projetos-AWS/Projeto-Documentacao-CEDEPS/projetos.Documentacao.CEDEPS/8051/ATMEL-AT89S52/1-Pisca-led/pisca-led/pisca-led.c"
void delay_ms(unsigned int ms) {
 unsigned int i, j;
 for (i = 0; i < ms; i++) {
 for (j = 0; j < 123; j++);
 }
}




void main() {
 unsigned char i;


 P1 = 0xFF;

 while (1) {

 for (i = 1; i <= 7; i++) {
 P1 = ~(1 << i);
 delay_ms(1000);
 }
 }
}
