# FPGA 개별 실험 원문 대조

기준: 조교 매뉴얼 FPGA_additional.md의 서보·SRAM·DAC 코드 블록.
설계 파일 8개는 원문 그대로이며, 별도 보드 연결·버튼 처리 RTL은 포함하지 않습니다.
테스트벤치 3개는 사용자 요청에 따라 아래 VCD 저장 블록만 추가했습니다. 이 블록을 제외하면 조교 원문과 일치합니다.

```verilog
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
end
```

세 TB의 모듈명 tb, 입력·검사·종료 코드를 유지했습니다.
06~08 모두 시뮬레이션 PASS 및 신호와 시간 진행을 포함한 VCD 생성 확인 완료.
workspace와 C:/Users/hihj3/lab6의 해당 테스트벤치 사본에 동일하게 반영했습니다.
설계가 바뀌지 않아 기존 비트스트림은 그대로 사용합니다.
