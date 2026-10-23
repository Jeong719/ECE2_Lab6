# uart_echo

LAB4·5와 같은 구성: src / sim / constraints / tools / docs / build, simulation.json, FPGA.code-workspace.
FPGA.code-workspace를 열고 Ctrl+Shift+B → 02 Simulate. 03 Open waveform으로 build/sim/wave.vcd를 엽니다.
보드 top: lab6_uart. 시뮬레이션 top: tb_uart_echo.
Vivado 프로젝트: C:/Users/hihj3/lab6/04_uart_echo/04_uart_echo.xpr
Vivado 프로젝트는 LAB5처럼 소스를 로컬 폴더에 복사해 사용합니다. workspace를 수정하면 대응하는 Vivado 소스 사본도 갱신하고 다시 빌드하세요.
핀 배정: pin_map.md. 원문: docs/수업코드_참고.md.
UART RX는 EX2 5번(EXT0/G10)입니다. MCU PC10 → EX2 5번, GND 공통, 9600 8N1.
