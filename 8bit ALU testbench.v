module test;
  reg[7:0]ain;
  reg[7:0]bin;
  reg clk,rst,s;
  wire[31:0]out;
  
  mult mt(.ain(ain),
          .bin(bin),
          .clk(clk),
          .rst(rst),
          .s(s),
          .out(out));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // clock period = 10ns
end

initial begin
    rst = 0;
    s   = 0;
    ain = 0;
    bin = 0;
    
    #12 rst = 1;  // Release reset
    #10 s = 1;    // Enable FSM

    ain = 8'd10; bin = 8'd3;
    
    #40 ain = 8'd8; bin = 8'd2;
    #40 ain = 8'd15; bin = 8'd5;
    #40 $stop;    // End simulation
end

  
  initial
  $monitor("Time=%0t | pstate=%b | ain=%d | bin=%d | out=%d", $time, mt.pstate, ain, bin, out);
  
    
    
endmodule    