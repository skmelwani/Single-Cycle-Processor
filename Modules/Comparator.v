module Comparator(
  input [63:0] a,b,
  input [2:0] funct3,
  input branch,
  output reg selection_line
);
  always @(*)
    begin
      if (branch == 1)
        begin
          if (funct3 == 3'b000 & a == b)
            begin
              selection_line = 1;
            end
          
          else if (funct3 == 3'b001 & a != b)
            begin
              selection_line = 1;
            end
          
          else if (funct3 == 3'b100 & a < b)
            begin
              selection_line = 1;
            end

        end
      else
        begin
          selection_line = 0;
        end      
    end
endmodule 