`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2018 18:26:06
// Design Name: 
// Module Name: carpark_counter
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


module carpark_counter(
    input clk,
    input [3:0] sw,

    //input btnL,
    //input btnR,
//    input sens_1,
//    input sens_2,
    output [2:0] led,
    output [6:0] LED_out,
    output [3:0] Anode_Activate,
    output exit_flag, enter_flag
    );
    
    // Constants
    
    // Local variables
    wire enter;
    wire exit;
    wire reset;
    wire sens_1, sens_2;
    wire [6:0] count;
    reg enter_cap_ff;
    reg exit_cap_ff;
    wire [15:0] seven_seg_test_num;
    
    // Continuous assignments
    assign led[0] = enter_cap_ff;
    assign led[1] = exit_cap_ff;
    assign reset = sw[0];
    assign led[2] = sw[3];
    assign seven_seg_test_num = 16'hab04;
    
    counter Icounter(.clk(clk),
                     .reset(reset),
                     .inc(enter),
                     .dec(exit),
                     .count(count));
                     
    carpark_fsm Icarpark_fsm(
    .clk(clk),
    .reset(reset),
    .a(sens_1),
    .b(sens_2),
    .exit(exit),
    .enter(enter)
    );
    
    
    seven_seg_ctrl Iseven_seg_ctrl(
    .clk(clk),
    .reset(reset),
    .number(count),
    .LED_out(LED_out),
    .Anode_Activate(Anode_Activate)
    );
    
   debouncer Idebouncer_sw1(
   .clk(clk),
   .reset(reset),
   .button(sw[1]),
   .button_db(sens_1)
   ); 
      
   debouncer Idebouncer_sw2(
   .clk(clk),
   .reset(reset),
   .button(sw[2]),
   .button_db(sens_2)
   );
   
    always @(posedge clk, posedge reset) begin
        if (reset) exit_cap_ff <= 1'b0;
        else if (exit) exit_cap_ff <= 1'b1;
        else exit_cap_ff <= exit_cap_ff;
    end
    
    always @(posedge clk, posedge reset) begin
        if (reset) enter_cap_ff <= 1'b0;
        else if (enter) enter_cap_ff <= 1'b1;
        else enter_cap_ff <= enter_cap_ff;
    end
    
    
    assign exit_flag = exit_cap_ff;
    assign enter_flag = enter_cap_ff;
    
endmodule
