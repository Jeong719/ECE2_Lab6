# 04_task6_fpga_echo

ece2_474.code-workspace를 VS Code로 열고 Debug Configure → Build → F5 → main에서 F5.
수정 코드: Core/Src/ece2_474_routine.c
교안: docs/STM32_2.md
PC 통신: ST-LINK VCP, 9600 8N1, 줄바꿈 없음. 1/A/a는 0x31/0x41/0x61.
PC10(TX) → FPGA 확장 GPIO RX, GND 공통. FPGA 출력은 별도 COM 포트로 확인. TX status 0은 MCU 송신 완료만 의미합니다.
