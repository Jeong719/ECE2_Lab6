# 보드 핀 배정

장비 제공 예제 XDC 및 S7 핀맵 기준.

| 포트 | FPGA 핀 |
|---|---|
| clk_50mhz | B6 |
| rst_p | K4 |
| uart_rxd | G10 |
| uart_txd | F6 |
| led[0] | N5 |
| led[1] | M1 |
| led[2] | M3 |
| led[3] | M7 |
| led[4] | N7 |
| led[5] | M2 |
| led[6] | M4 |
| led[7] | L4 |

UART RX는 EX2 5번(EXT0/G10), MCU PC10 연결. GND는 EX2 45/46/47/48/49/50 중 하나. USB 출력 F6.
