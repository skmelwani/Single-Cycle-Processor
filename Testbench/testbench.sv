// Code your testbench here
// or browse Examples
module testbench();
  reg clk, reset; 
  
  RISC_V_Processor RISC_P(.clk(clk), .reset(reset));
  
  always
    begin
      #5
      clk = ~clk;
    end
  
  initial
    begin
      clk = 0;
      reset = 1;
      #7
      reset = 0;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
//       $monitor("Time = %d --> Clk = %d, Reset = %d ",$time, clk, reset);
      
    end
endmodule
