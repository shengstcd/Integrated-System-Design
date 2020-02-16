//Listing 7.18
module bin_monitor
   #(parameter N=3)
   (
    input wire clk, reset,
    input wire load, a, b,
    input wire [N-1:0] d,
    input wire max_tick, min_tick,
    input wire [N-1:0] q
   );

   reg [N-1:0] q_old, d_old, gold;
   reg  a_old, load_old, b_old;
   reg [39:0] err_msg; // 5-letter message

   initial begin // head
      $display("time  syn_clr/load/en/up  q\n");
   end

   always @(posedge clk) begin
      // _old: the value sampled at the previous clock edge
    
      a_old <= a;
      load_old <= load;
      b_old <= b;
      q_old <= q;
      d_old <= d;

      // calculate the desired "gold" value
      if (reset) begin
         gold = 0;
      end else if (load_old) begin
         gold = d_old;
      end else if (a_old & b_old) begin
         gold = q_old + 1;
      end else if (a_old & ~b_old) begin
         gold = q_old - 1;
      end else begin
         gold = q_old;
      end

      // error message
      if (q==gold) begin
         err_msg = "     ";  // result passes
      end else begin
         err_msg = "ERROR";  // result fails
      end
      //
      $display("%5d,  %b%b%b%b  %d  %s",
               $time, syn_clr, load, en, up, q, err_msg);
   end

endmodule


