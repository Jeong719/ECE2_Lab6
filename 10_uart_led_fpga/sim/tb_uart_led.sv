`timescale 1ns/1ps
module tb_uart_led;
    initial begin $dumpfile("wave.vcd"); $dumpvars(0, tb_uart_led); end
reg clk=0,rst=1,rx=1; always #5 clk=~clk;
wire tx; wire [7:0] led;
lab6_uart #(.CLK_HZ(160000),.BAUD(10000)) dut(clk,rst,rx,tx,led);
wire [7:0] echoed; wire valid,err;
uart_rx #(.DIV(16)) monitor(clk,rst,tx,echoed,valid,err);
reg [7:0] expected; integer count=0;
always @(posedge clk) if(valid) begin
 if(echoed!==expected) $fatal(1,"echo mismatch"); count=count+1;
end
task send(input [7:0] value,input [7:0] want);
 integer i,old_count;
 begin
 expected=value;old_count=count;
 @(negedge clk);rx=0;repeat(16) @(negedge clk);
 for(i=0;i<8;i=i+1) begin rx=value[i];repeat(16) @(negedge clk);end
 rx=1;repeat(200) @(negedge clk);
 if(led!==want || count!=old_count+1) $fatal(1,"LED or echo failure");
 end
endtask
initial begin
 repeat(5) @(negedge clk);rst=0;repeat(5) @(negedge clk);
send("0",0);send("1",1);send("1",1);send("2",0);send("2",1);send("a",1);send("0",0);
 $display("PASS UART echo and LED");$finish;
end
initial begin #100000; $fatal(1,"timeout");end
endmodule
