# uart_echo

구성: src / sim / constraints / tools, simulation.json, FPGA.code-workspace. build는 실행 시 생성됩니다.
FPGA.code-workspace를 열고 Ctrl+Shift+B → 02 Simulate. 03 Open waveform으로 build/sim/wave.vcd를 엽니다.
보드 top: lab6_uart. 시뮬레이션 top: tb_uart_echo.
Vivado 프로젝트: C:/Users/hihj3/lab6/04_uart_echo/04_uart_echo.xpr
Vivado 프로젝트는 LAB5처럼 소스를 로컬 폴더에 복사해 사용합니다. workspace를 수정하면 대응하는 Vivado 소스 사본도 갱신하고 다시 빌드하세요.
핀 배정: constraints/uart_echo.xdc.
UART RX는 PORT A I/O00(BDIO00/F8)입니다. MCU PC10 → PORT A I/O00, GND 공통, 9600 8N1.

UART RX 연결 변경(2026-10-26): 신호등 모듈이 EX2를 가리므로 PORT A I/O00(F8)을 사용합니다. MCU PC10 → I/O00, MCU GND → 보드 GND, PORT A ENABLE ON. 이 배정으로 다시 생성한 비트스트림을 다운로드합니다.
