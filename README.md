# LAB6 STM32 UART 통신 및 FPGA 서보·SRAM·DAC 실습

정현재 · 2023440127

STM32 제공 예제 2개와 과제 3개, FPGA 서보모터·SRAM·DAC 실험의 코드, 보고서 및 증빙 자료입니다. STM32 과제 6·7에 사용하는 FPGA UART 보조 코드도 포함합니다.

## 보고서

- [실험 전 보고서](<report/pre/LAB6 실험전 보고서.pdf>)
- [실험 후 보고서](<report/post/LAB6 실험후 보고서.pdf>)

## 실험 코드

| 구분 | 프로젝트 |
|---|---|
| PC 문자 입출력 제공 예제 | [01_example_pc_echo](01_example_pc_echo/) |
| PC → MCU → FPGA 전송 제공 예제 | [02_example_uart_forward](02_example_uart_forward/) |
| 과제 5: 수신 문자의 문자·16진수 출력 | [03_task5_pc_hex](03_task5_pc_hex/) |
| 과제 6: UART3로 FPGA에 데이터 전달 | [04_task6_fpga_echo](04_task6_fpga_echo/) |
| 과제 7: FPGA LED 제어 명령 전달 | [05_task7_fpga_led](05_task7_fpga_led/) |
| FPGA 실험 1: 서보모터 | [06_servo_ctrl](06_servo_ctrl/) |
| FPGA 실험 2: SRAM | [07_sram](07_sram/) |
| FPGA 실험 3: DAC | [08_dac](08_dac/) |
| 과제 6용 FPGA UART 수신·PC 에코 | [09_uart_echo_fpga](09_uart_echo_fpga/) |
| 과제 7용 FPGA UART 수신·LED 제어 | [10_uart_led_fpga](10_uart_led_fpga/) |

STM32 실습 코드는 각 프로젝트의 `Core/Src/ece2_474_routine.c`에 있습니다. 빌드에 필요한 `Core`, `Drivers`, CMake 설정, 시작 코드와 링커 스크립트를 함께 보관합니다. 각 폴더의 `ece2_474.code-workspace`를 VS Code에서 열고 Configure → Build → F5 순서로 실행합니다.

FPGA는 `src`에 RTL, `sim`에 테스트벤치, `constraints`에 XDC를 보관합니다. `FPGA.code-workspace`를 열고 Ctrl+Shift+B의 `02 Simulate`로 검증하며, `03 Open waveform`으로 VCD를 확인합니다. `simulation.json`, `tools/fpga_lab.py`, `create_project.tcl`은 시뮬레이션 및 Vivado 프로젝트 재생성에 사용합니다.

06~08의 설계 RTL은 조교 교안 그대로이며 테스트벤치에는 요청받은 VCD 저장 호출만 추가했습니다. 09·10은 STM32 과제를 위한 보조 코드입니다.

## UART 연결

- STM32 PC10(UART3 TX) → FPGA PORT A I/O01(BDIO01, FPGA 핀 E8)
- STM32 GND → FPGA GND, PORT A ENABLE ON
- 양쪽 시리얼 모니터: 9600 baud, 8N1, 줄바꿈 없음
- FPGA UART TX는 내부 USB 시리얼 회로에 연결된 F6 핀입니다.
- 과제 6은 04와 09, 과제 7은 05와 10을 함께 사용합니다.
- 과제 7 명령: `0`=끄기, `1`=켜기, `2`=반전

현재 RX 배정은 I/O01(E8)입니다. 기존 I/O00(F8) 비트스트림에는 이 변경이 적용되지 않으므로 현재 XDC로 생성한 비트스트림을 다운로드합니다.

## 실험 증빙

- [VS Code 빌드·시뮬레이션 캡처](evidence/vscode/): STM32 과제 5·6·7 빌드, FPGA 실험 1·2·3 PASS와 전체·확대 파형
- [Vivado 캡처](evidence/vivado/): 서보모터·SRAM·DAC의 PASS, 전체 구간 파형, 비트스트림 생성 완료, DRC, 타이밍 총 15장
- [보드 동작 영상](evidence/board/videos/): STM32 과제 5·6·7, FPGA 실험 1·2·3 총 6개

사진과 영상, 보고서는 실험 폴더의 저장된 파일을 그대로 복사했습니다. Vivado 자료에는 실제 DRC 경고가 포함되며, SRAM 타이밍은 사용자 타이밍 제약이 없어 N/A로 표시됩니다.

## 도구 및 제출 버전

Vivado 2026.1과 `xc7s75fgga484-1`을 사용합니다. 각 `create_project.tcl`은 `C:/Users/hihj3/lab6/` 아래에 프로젝트를 생성합니다. 다른 PC에서는 `dest` 경로를 본인 환경에 맞게 바꿉니다.

기존 코드 제출 태그 `v1.0`, `v1.1`, `v1.2`는 유지합니다. 최종 보고서·증빙 자료와 I/O01(E8) 핀 설정은 이후 `main`에 반영되어 있으므로 최신 자료는 `main`을 기준으로 확인합니다.

빌드 캐시, 생성된 VCD, Vivado 자동 생성 프로젝트와 비트스트림, 중복 교안 및 별도 설명 문서는 제외합니다.
