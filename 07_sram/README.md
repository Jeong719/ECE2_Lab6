# sram

조교 매뉴얼의 Verilog 설계와 TB 입력·검사 코드를 유지합니다. 사용자 요청으로 TB에 VCD 저장 호출만 추가했습니다.
설계 top: sram. 시뮬레이션 top: tb. 테스트벤치 파일명은 sim/tb_sram.sv입니다.
FPGA.code-workspace에서 Ctrl+Shift+B → 02 Simulate로 원문 테스트벤치를 실행합니다.
02 Simulate 실행 시 build/sim/wave.vcd가 생성됩니다. 03 Open waveform으로 확인합니다.
Vivado 프로젝트: C:/Users/hihj3/lab6/02_sram/02_sram.xpr
보드 핀 배정: constraints/sram.xdc.
