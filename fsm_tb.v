`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2020 16:44:39
// Design Name: 
// Module Name: fsm_tb
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


module fsm_tb(
 input clk,
    input reset,
    input a,
    input b,
    output exit,
    output enter
   
    );
    
    carpark_fsm uut (.clk(clk), .reset(reset),.a(a),.b(b), .exit(exit), .enter(enter));
    
    
    endmodule
