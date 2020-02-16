`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2018 17:58:07
// Design Name: 
// Module Name: carpark_fsm
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


module carpark_fsm(
    input clk,
    input reset,
    input a,
    input b,
    output exit,
    output enter
    );
// Constants   
localparam [2:0]
    IDLE            = 3'b000,
    CAR_ENTERING_A  = 3'b001,
    CAR_ENTERING_AB = 3'b010,
    CAR_ENTERING_B  = 3'b011,
    CAR_LEAVING_B   = 3'b100,
    CAR_LEAVING_AB  = 3'b101,
    CAR_LEAVING_A   = 3'b110;
 
 // Local Variables
 reg [2:0] state_ff, state_nxt;
 reg exit_ff, exit_nxt;
 reg enter_ff, enter_nxt;
 
 // Continuous assignments
 assign enter = enter_ff;
 assign exit  = exit_ff;
 
 // Synchronous Logic
 always @(posedge clk, posedge reset) begin
    if (reset) begin
        state_ff <= 3'b0;
        enter_ff <= 1'b0;
        exit_ff  <= 1'b0;
    end else begin
        state_ff <= state_nxt;
        enter_ff <= enter_nxt;
        exit_ff  <= exit_nxt;
    end
 end
 
 // Combinational Logic
 // FSM: Next State Logic
 always @(*) begin
    state_nxt = state_ff;
    exit_nxt  = 1'b0;
    enter_nxt = 1'b0;
    
    case(state_ff)
        IDLE: begin
            if ({a,b} == 2'b01)      state_nxt = CAR_LEAVING_B;
            else if ({a,b} == 2'b10) state_nxt = CAR_ENTERING_A;
        end
        CAR_ENTERING_A:  begin
            if ({a,b} == 2'b11)      state_nxt = CAR_ENTERING_AB;
            else if ({a,b} != 2'b10) state_nxt = IDLE;
        end
        CAR_ENTERING_AB: begin
            if ({a,b} == 2'b01)      state_nxt = CAR_ENTERING_B;
            else if ({a,b} != 2'b11) state_nxt = IDLE;
        end
        CAR_ENTERING_B:  begin
            if ({a,b} != 2'b01)      state_nxt = IDLE;
            if ({a,b} == 2'b00)      enter_nxt = 1'b1;
        end                
        CAR_LEAVING_B:   begin
            if ({a,b} == 2'b11)      state_nxt = CAR_LEAVING_AB;
            else if ({a,b} != 2'b01) state_nxt = IDLE;
        end
        CAR_LEAVING_AB:  begin
            if ({a,b} == 2'b10)      state_nxt = CAR_LEAVING_A;
            else if ({a,b} != 2'b11) state_nxt = IDLE;
        end
        CAR_LEAVING_A:   begin
            if ({a,b} != 2'b10)      state_nxt = IDLE;
            if ({a,b} == 2'b00)      exit_nxt  = 1'b1;
        end
        default:                     state_nxt = IDLE;
    endcase
end

endmodule
