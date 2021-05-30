module Instruction_Memory(
  input [63:0] Inst_Address,
  output reg [31:0] Instruction

	

);
  
  reg [7:0] Instruction_Memory [107:0];
  
  initial
    begin 
     
      
      {Instruction_Memory[87], Instruction_Memory[86], Instruction_Memory[85], Instruction_Memory[84]} = 32'hfc0008e3;

      Instruction_Memory[83] = 8'b00000001;	//23th (sw)
      Instruction_Memory[82] = 8'b00000011;
      Instruction_Memory[81] = 8'b10110000;
      Instruction_Memory[80] = 8'b00100011;

      Instruction_Memory[79] = 8'b00000000;		//22th (sw)
      Instruction_Memory[78] = 8'b01000100;
      Instruction_Memory[77] = 8'b00110000;
      Instruction_Memory[76] = 8'b00100011;

      {Instruction_Memory[75], Instruction_Memory[74], Instruction_Memory[73], Instruction_Memory[72]} = 32'h00a70433;

      {Instruction_Memory[71], Instruction_Memory[70], Instruction_Memory[69], Instruction_Memory[68]} = 32'h00a283b3;

      {Instruction_Memory[67], Instruction_Memory[66], Instruction_Memory[65], Instruction_Memory[64]} = 32'h00078233;

      {Instruction_Memory[63], Instruction_Memory[62], Instruction_Memory[61], Instruction_Memory[60]} = 32'h00000e63;

      {Instruction_Memory[59], Instruction_Memory[58], Instruction_Memory[57], Instruction_Memory[56]} = 32'hfc6b18e3;

      {Instruction_Memory[55], Instruction_Memory[54], Instruction_Memory[53], Instruction_Memory[52]}= 32'h001b0b13;

      {Instruction_Memory[51], Instruction_Memory[50], Instruction_Memory[49], Instruction_Memory[48]} = 32'h0x00828293;

      {Instruction_Memory[47], Instruction_Memory[46], Instruction_Memory[45], Instruction_Memory[44]} = 32'hfebb92e3;

      {Instruction_Memory[43], Instruction_Memory[42], Instruction_Memory[41], Instruction_Memory[40]} = 32'h00870713;

      {Instruction_Memory[39], Instruction_Memory[38], Instruction_Memory[37], Instruction_Memory[36]} = 32'h001b8b93;

      {Instruction_Memory[35], Instruction_Memory[34], Instruction_Memory[33], Instruction_Memory[32]} = 32'h0307c063;

      Instruction_Memory[31] = 8'b00000000;		// 10th lw
      Instruction_Memory[30] = 8'b00000100;
      Instruction_Memory[29] = 8'b00111000;
      Instruction_Memory[28] = 8'b00000011;
		
      Instruction_Memory[27] = 8'b00000000;		// 9th (lw --> ld) funct3 = 010 --> 011
      Instruction_Memory[26] = 8'b00000011;
      Instruction_Memory[25] = 8'b10110111;
      Instruction_Memory[24] = 8'b10000011;

      {Instruction_Memory[23], Instruction_Memory[22], Instruction_Memory[21], Instruction_Memory[20]} = 32'h00a70433;

      {Instruction_Memory[19], Instruction_Memory[18], Instruction_Memory[17], Instruction_Memory[16]} = 32'h00a283b3;

      {Instruction_Memory[15],  Instruction_Memory[14], Instruction_Memory[13], Instruction_Memory[12]} = 32'h00028733;

      {Instruction_Memory[11], Instruction_Memory[10], Instruction_Memory[9],Instruction_Memory[8]} = 32'h000b0bb3;

      {Instruction_Memory[7], Instruction_Memory[6],Instruction_Memory[5], Instruction_Memory[4]} = 32'h00000b13;

      {Instruction_Memory[3], Instruction_Memory[2], Instruction_Memory[1], Instruction_Memory[0]}= 32'h00000293;

    end
  
  always @ (Inst_Address)
    begin
      Instruction = {Instruction_Memory[Inst_Address+3], Instruction_Memory[Inst_Address+2], Instruction_Memory[Inst_Address+1], Instruction_Memory[Inst_Address+0]};
    end
  
endmodule