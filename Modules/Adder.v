module Adder(
  input [63:0] a, b,
  output reg [63:0] out
);
  
  initial
    begin
      assign out = a + b;
    end
  
endmodule