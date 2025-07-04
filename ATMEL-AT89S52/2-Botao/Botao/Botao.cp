#line 1 "C:/Users/adenilton.ribeiro/Documents/CEDEPS/Projetos-AWS/Projeto-Documentacao-CEDEPS/projetos.Documentacao.CEDEPS/8051/ATMEL-AT89S52/2-Botao/Botao/Botao.c"
#line 39 "C:/Users/adenilton.ribeiro/Documents/CEDEPS/Projetos-AWS/Projeto-Documentacao-CEDEPS/projetos.Documentacao.CEDEPS/8051/ATMEL-AT89S52/2-Botao/Botao/Botao.c"
void main() {

 P1 = 0xFF;

 while(1) {
 if(P3 & (1<< P3_2 )) {
 P1 |= (1<< P1_1 );
 }else{
 P1 &= ~(1<< P1_1 );
 }
 }

}
