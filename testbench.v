`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 14:50:52
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench();
reg clk;
wire [2:0] LED;
wire enter;


reg [3:0] sw_tb;
wire inc, dec;
reg a,b, reset;
carpark_counter hsgwh ( .clk(clk),.sw(sw_tb), .led(LED), .exit_flag(exit), .enter_flag(enter));  //exit and enter out
counter_tb dhwed (.clk(clk),. reset(reset),.inc(inc),.dec(dec), .count(count)); //exit and enter re inputd
fsm_tb vdehewdgj (.clk(clk), .reset(reset),.a(a),.b(b), .exit(dec), .enter(inc)); //fsm exit and enter are outputs

//test begin
initial 
begin
clk = 0;
forever #20 clk = ~clk; 
end
initial begin
//1
#40;
sw_tb[0] = 1'b1; //reset
reset = 1'b1;
#40;
sw_tb[0] = 1'b0;
reset = 1'b0;

#40;
sw_tb[1] = 1'b0;
a = 1'b0;
sw_tb[2] = 1'b0;
b = 1'b0;

#40;
//2
sw_tb[1] = 1'b1;
a = 1'b1;
sw_tb[2] = 1'b0;      
b = 1'b0;
#40;
//3
sw_tb[1] = 1'b1; 
a = 1'b1;
sw_tb[2] = 1'b1;
b = 1'b1;
#40;
//4
sw_tb[1]=1'b0;
a = 1'b0;
sw_tb[2]=1'b1;
b = 1'b1;
#40;

sw_tb[1]=1'b0;
a = 1'b0;
sw_tb[2]=1'b0;
b = 1'b0;
if(count !==1)$display("Failed");

if

#40;
#40;
#40;
#40;
#40; 

$stop;
end
  
endmodule
