# LAB6 STM32 UART 통신 및 FPGA 서보·SRAM·DAC 실습

정현재 · 2023440127

STM32 제공 예제 2개와 과제 3개, FPGA 개별 실험 3개 및 STM32 과제용 FPGA 수신 보조 코드 2개를 포함합니다. LAB3처럼 각 실험을 독립 폴더에 두고 소스, 실행 설정과 도구를 보관하며, STM32에는 빌드에 필요한 드라이버와 프로젝트 설정을 포함합니다. 빌드 캐시, 시뮬레이션 파형, Vivado 자동 생성 프로젝트와 비트스트림은 제외합니다.

| 폴더 | 내용 |
|---|---|
| 01_example_pc_echo | PC 문자 입출력 제공 예제 |
| 02_example_uart_forward | PC → MCU → FPGA 전송 제공 예제 |
| 03_task5_pc_hex | 과제 5: PC 입력 문자의 문자·16진수 출력 |
| 04_task6_fpga_echo | 과제 6: UART3로 FPGA에 데이터 전달 |
| 05_task7_fpga_led | 과제 7: FPGA LED 제어 명령 전달 |
| 06_servo_ctrl | FPGA 개별 실험: 서보모터 제어 |
| 07_sram | FPGA 개별 실험: SRAM 읽기·쓰기 |
| 08_dac | FPGA 개별 실험: 8비트 DAC 인터페이스 |
| 09_uart_echo_fpga | STM32 과제 6용 FPGA 수신·PC 에코 보조 코드 |
| 10_uart_led_fpga | STM32 과제 7용 FPGA 수신·LED 제어 보조 코드 |

## STM32 실행

각 폴더의 `ece2_474.code-workspace`를 VS Code에서 엽니다. STM32 확장을 설치하고 Configure → Build → F5 순서로 실행합니다. `main`에서 멈추면 다시 F5를 누릅니다. NUCLEO-G474RE용이며 작성한 실험 코드는 `Core/Src/ece2_474_routine.c`에 있습니다. `Drivers/`, `cmake/`, 시작 코드와 링커 스크립트도 포함되어 있습니다.

PC 통신은 ST-LINK VCP, 9600 baud, 8N1, 줄바꿈 없음 설정입니다. 과제 6은 04와 09, 과제 7은 05와 10을 함께 사용합니다. MCU PC10(TX)을 FPGA EX2 5번(EXT0/G10)에 연결하고 GND를 공통으로 연결합니다. FPGA에서 PC로 전달한 문자는 FPGA의 별도 COM 포트에서 확인합니다. 과제 7 명령은 `0`=끄기, `1`=켜기, `2`=반전입니다.

## FPGA 실행

각 폴더의 `FPGA.code-workspace`를 엽니다. Python과 Icarus Verilog를 설치한 뒤 Ctrl+Shift+B의 `02 Simulate`로 시뮬레이션하고, `03 Open waveform`으로 생성된 `build/sim/wave.vcd`를 VaporView에서 확인합니다. `src/`는 설계 RTL, `sim/`은 테스트벤치, `constraints/`는 핀 제약이며 `simulation.json`과 `tools/fpga_lab.py`가 실행 설정과 도구입니다.

06~08의 설계 RTL 8개는 조교 교안 그대로입니다. 테스트벤치 3개에는 요청받은 VCD 저장 호출만 추가했으며 입력·검사 코드는 유지했습니다. 09·10은 STM32 과제를 위한 보조 코드입니다.

Vivado 2026.1, `xc7s75fgga484-1`을 사용했습니다. 각 `create_project.tcl`은 사용자 실습 환경인 `C:/Users/hihj3/lab6/` 아래에 소스를 복사하여 프로젝트를 만듭니다. 다른 PC에서는 Tcl의 `dest` 경로를 본인 환경에 맞게 설정합니다. 핀 배정은 각 폴더의 `constraints/`에 있는 XDC에서 확인합니다.

## 확인 범위

STM32 5개 프로젝트의 ARM GCC Debug 빌드, FPGA 5개 프로젝트의 테스트벤치 시뮬레이션과 VCD 생성, Vivado 합성·구현·비트스트림 생성을 확인했습니다. 실제 보드 다운로드와 동작 측정은 수업에서 확인합니다.

LAB3 기준으로 파일 구성을 정리한 제출 버전은 `v1.1` 태그로 식별합니다.
