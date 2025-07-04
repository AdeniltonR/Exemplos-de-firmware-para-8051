# _Botão_

![https://img.shields.io/badge/Firmware_version-1.0.0-blue](https://img.shields.io/badge/Firmware_version-1.0.0-blue)

---

## Sumário

- [Histórico de Versão](#histórico-de-versão)
- [Resumo](#resumo)
- [Links para estudos](#links-para-estudos)
- [Fluxograma](#fluxograma)
    - [Configuração do Gravador USBASP](#configuração-do-gravador-usbasp)
    - [ATMEL AT89S52](#atmel-at89s52)
    - [Pinos do projeto eletrônico](#pinos-do-projeto-eletrônico)
- [Configuração do simulador PICSimLab](#configuração-do-simulador-picsimlab)
- [Configuração do Firmware](#configuração-do-firmware)
- [Informações](#informações)

## Histórico de Versão

| Versão | Data       | Autor       | Descrição         |
|--------|------------|-------------|-------------------|
| 1.0.0  | 03/07/2025 | Adenilton R | Início do Projeto |

## Resumo

Este documento tem como objetivo demonstrar como configurar o simulador PICSimLab para executar um firmware que faz a leitura de um botão do microcontrolador, fazendo acender um led.

## Links para estudos

[Informações do ATMEL AT89S52;](https://www.microchip.com/en-us/product/at89s52)

[Datasheet do microcontrolador;](https://ww1.microchip.com/downloads/en/DeviceDoc/doc1919.pdf)

[Vídeo de configuração do ambiente;](https://www.youtube.com/watch?v=QY_adW902Uw&t)

[Site de compra do ATMEL AT89S52;](https://www.saravati.com.br/microcontrolador-at89s52-24pu-dip-40-pin.html)

## Fluxograma

![Fluxograma.png](Docs/Fluxograma.png)

### Configuração do Gravador USBASP

USBasp é um gravador para controladores Atmel AVR com uma conexão USB construída em sua placa. É constituído de um ATMega8 e outros simples componentes eletrônicos. O gravador apenas utiliza de um driver USB para comunicação, não sendo necessário um controlador USB especial.

![Gravador.png](Docs/Gravador.png)

Esquemático eletrônico:

![Pinout_gravador.png](Docs/Pinout_gravador.png)

**Informações Técnicas:**

- **`Funciona em diversos sistemas operacionais:`** Linux, Mac OS X e Windows (32 e 64 Bits);
- Permite a leitura ou escrita na EEPROM do microcontrolador, firmware, fuse bits e lock bits;
- Velocidade de programação é maior que 5kBytes/seg;
- Opção de modo lento SCK para alvos com baixo clock (<1.5Mhz);
- Interface ISP 10 pinos;
- Dimensões: 7cm x 2cm;

Para atualizar o software, baixe o [**`ZADIG-2.9`**](https://github.com/pbatard/libwdi/releases/tag/v1.5.1) e siga o passo a passo para a atualização no [**`USBASP`**](https://www.instructables.com/USBASP-Installation-in-Windows-10/).

Para o software de gravação, assista ao vídeo [**`Como gravar um 8051 com USBASP`**](https://www.youtube.com/watch?v=EKlpHcpSUzQ) e baixe o arquivo no [**`AVR ProgISP Programmer`**](https://github.com/ioelectro/avr-progisp-programmer).

![software_gravador.png](Docs/software_gravador.png)

### ATMEL AT89S52

O **AT89S52** é um microcontrolador de 8 bits de baixo consumo de energia e alto desempenho, com 8 KB de memória Flash programável internamente. Fabricado pela Atmel, é compatível com o conjunto de instruções e a pinagem padrão da arquitetura 8051. Ele permite reprogramação no sistema ou através de um programador externo.

![8051.png](Docs/8051.png)

Esquemático eletrônico.

![Pin_config.png](Docs/Pin_config.png)

**Informações Técnicas:**

- **`Modelo:`** AT89S52-24PU DIP 40 Pin;
- **`Encapsulamento:`** PDIP 40 Pin (Plastic Dual In line Package);
- **`Terminais:`** 40 pinos;
- **`Faixa de Operação de`**: 4,0 V a 5,5 V;
- **`Memória Flash:`** 8 KB de memória flash programável (para armazenagem de código);
- **`Memória RAM:`** 256 Bytes;
- **`Tipo de Memória:`** EEPROM;
- **`Clock:`** 0 Hz a 33 MHz;
- Interface serial de comunicação (UART);
- **`Corrente de saída:`** 15 mA;
- **`Entradas e saídas digitais:`** 32 divididas em 4 ports de 8 bits cada;
- Dois temporizadores/contadores de 16 bits;
- **`Durabilidade:`** 10.000 ciclos de gravação/apagamento;
- **`Temperatura de operação:`** -40 a 85 Graus Celsius;
- **`Cor:`** Preto;
- **`Tamanho:`** 55mm Largura x 15mm Profundidade x 4mm Altura;
- **`Peso:`** 5g;

### Pinos do projeto eletrônico

| Nome        | Pino       |
|-------------|------------|
| PIN_led     | P1.1       |
| PIN_button  | P3.2       |

## Configuração do simulador PICSimLab

Depois que vc instalar simulador [**`aqui`**](https://github.com/AdeniltonR/Exemplos-de-firmware-para-8051/tree/main?tab=readme-ov-file#instala%C3%A7%C3%A3o-picsimlab), abra esse arquivo para ter o [**`Kit de simulação`**]().

## Configuração do Firmware

![pisca-led.gif](Docs/esquematico.png)

[**`Firmware`**]() para teste:

```c
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
```

## Informações

| Info        | Modelo              |
|-------------|---------------------|
| uC          | AT89S52             |
| Placa       | PICSimLab           |
| Arquitetura | MCS-51              |
| IDE         | MikroC PRO for 8051 |