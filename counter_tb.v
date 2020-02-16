`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2020 16:10:17
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(
   input clk,
    input reset,
    input inc,
    input dec,
    output [6:0] count

);
    
    
  
    counter uut (.clk(clk),. reset(reset),.inc(inc),.dec(dec), .count(count));
   
    
              
  
    
    
    
    
   
endmodule



