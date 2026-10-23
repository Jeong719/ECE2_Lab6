# LAB6 FPGA 실행 안내

06~08은 조교 매뉴얼의 설계와 TB 입력·검사 코드를 유지하며, 사용자 요청으로 TB에 VCD 저장 호출만 추가했습니다.
매뉴얼에 없는 서보 보드 연결 모듈과 버튼 처리 모듈은 제거했습니다.

| Workspace | Vivado 프로젝트 | 설계 top | 시뮬레이션 top |
|---|---|---|---|
| 06_servo_ctrl | C:/Users/hihj3/lab6/01_servo_ctrl/01_servo_ctrl.xpr | servo_ctrl | tb |
| 07_sram | C:/Users/hihj3/lab6/02_sram/02_sram.xpr | sram | tb |
| 08_dac | C:/Users/hihj3/lab6/03_dac/03_dac.xpr | dac | tb |
| 09_uart_echo_fpga | C:/Users/hihj3/lab6/04_uart_echo/04_uart_echo.xpr | lab6_uart | tb_uart_echo |
| 10_uart_led_fpga | C:/Users/hihj3/lab6/05_uart_led/05_uart_led.xpr | lab6_uart | tb_uart_led |

FPGA.code-workspace → Ctrl+Shift+B → 02 Simulate로 제공 TB를 실행합니다.
06~08의 TB에 $dumpfile("wave.vcd")와 $dumpvars(0, tb)를 추가했습니다. 02 Simulate 후 03 Open waveform으로 build/sim/wave.vcd를 확인합니다.
서보 입력은 제공 코드의 left_pulse/right_pulse 그대로이며, 입력 조건은 docs/수업코드_참고.md를 따릅니다.
보드 핀은 각 constraints/*.xdc와 pin_map.md를 확인합니다.
Vivado는 기존 LAB처럼 영문 로컬 폴더의 소스 사본을 사용합니다. workspace 수정 후 해당 소스 사본도 갱신해야 합니다.

09·10은 STM32 과제6·7의 요구 기능을 수행하는 FPGA 수신부입니다.
UART 연결: MCU PC10(TX) → FPGA EX2 5번(EXT0/G10), 공통 GND. PC 출력 F6 USB-UART. 9600 8N1.
실제 보드 다운로드·시연은 별도로 수행합니다.
