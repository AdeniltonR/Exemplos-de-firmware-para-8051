#line 1 "G:/Meu Drive/Meus Projetos/GitHub/Exemplos-de-Codigo/8051/Exemplos-de-firmware-para-8051/ATMEL-AT89S52/1-Pisca-led/pisca-led/pisca-led.c"
#line 21 "G:/Meu Drive/Meus Projetos/GitHub/Exemplos-de-Codigo/8051/Exemplos-de-firmware-para-8051/ATMEL-AT89S52/1-Pisca-led/pisca-led/pisca-led.c"
void main() {

 while(1) {
 P1 ^=  (1<<P1_1) ;
 delay_ms(1000);
 }
}
