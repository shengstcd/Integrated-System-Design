`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2018 19:09:34
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input reset,
    input inc,
    input dec,
    output [6:0] count
    );

// Constants

// Local Variables
reg [6:0] count_ff, count_nxt;

// Continuous Assignments
assign count = count_ff;

// Synchronous logic
always @ (posedge clk, posedge reset) begin
    if (reset) begin
        count_ff <= 7'b0;
    end else begin
        count_ff <= count_nxt;
    end
end

// Combinational logic
always @ (*) begin
// Default assignments
    count_nxt               = count_ff;
    if (inc) count_nxt      = &count_ff ? 7'd127          : count_ff + 7'b1;
    else if (dec) count_nxt = count_ff  ? count_ff - 7'b1 : 7'b0;
end

endmodule
