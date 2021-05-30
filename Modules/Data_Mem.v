module Data_Memory(
  input clk,
  input [63:0] Mem_Addr,
  input [63:0] Write_Data,
  input MemWrite,
  input MemRead,
  output reg [63:0] Read_Data,
  output [63:0] element1, element2, element3, element4, element5, element6, element7, element8
  
);
  
  reg [63:0] array [7:0];
  reg [7:0] Data_Memory [63:0];
  
  initial
    begin
      for (int i=0; i<64; i=i+1)
        begin
          Data_Memory [i] = 8'd0;
        end
      Data_Memory [0] = 8'h3;
      Data_Memory [8] = 8'h2;
      Data_Memory [16] = 8'h1;
      Data_Memory [24] = 8'h4;
      Data_Memory [32] = 8'h5;
      Data_Memory [40] = 8'h0;
      Data_Memory [48] = 8'h7;
      Data_Memory [56] = 8'h8;
    end
  
  assign element1 = {Data_Memory[7],Data_Memory[6],Data_Memory[5],Data_Memory[4], Data_Memory[3],Data_Memory[2],Data_Memory[1],Data_Memory[0]};
  assign element2 = {Data_Memory[15],Data_Memory[14],Data_Memory[13],Data_Memory[12], Data_Memory[11],Data_Memory[10],Data_Memory[9],Data_Memory[8]};
  assign element3 = {Data_Memory[23],Data_Memory[22],Data_Memory[21],Data_Memory[20], Data_Memory[19],Data_Memory[18],Data_Memory[17],Data_Memory[16]};
  assign element4 = {Data_Memory[31],Data_Memory[30],Data_Memory[29],Data_Memory[28], Data_Memory[27],Data_Memory[26],Data_Memory[25],Data_Memory[24]};
  assign element5 = {Data_Memory[39],Data_Memory[38],Data_Memory[37],Data_Memory[36], Data_Memory[35],Data_Memory[34],Data_Memory[33],Data_Memory[32]};
  assign element6 = {Data_Memory[47],Data_Memory[46],Data_Memory[45],Data_Memory[44], Data_Memory[43],Data_Memory[42],Data_Memory[41],Data_Memory[40]};
  assign element7 = {Data_Memory[55],Data_Memory[54],Data_Memory[53],Data_Memory[52], Data_Memory[51],Data_Memory[50],Data_Memory[49],Data_Memory[48]};
  assign element8 = {Data_Memory[63],Data_Memory[62],Data_Memory[61],Data_Memory[60], Data_Memory[59],Data_Memory[58],Data_Memory[57],Data_Memory[56]};

  
  
  always @ (*)
    begin
      if ( MemRead == 1 )
        begin
          Read_Data = {Data_Memory[Mem_Addr+7], Data_Memory[Mem_Addr+6], Data_Memory[Mem_Addr+5], Data_Memory[Mem_Addr+4], Data_Memory[Mem_Addr+3], Data_Memory[Mem_Addr+2], Data_Memory[Mem_Addr+1], Data_Memory[Mem_Addr+0]};
        end
    end
  
  always @(*) begin
    int k, i;
    k = 0;
    for (i = 0; i < 8; i = i + 1)
      begin
        
        array[i] = {
          Data_Memory[k+7],
          Data_Memory[k+6],
          Data_Memory[k+5],
          Data_Memory[k+4],
          Data_Memory[k+3],
          Data_Memory[k+2],
          Data_Memory[k+1],
          Data_Memory[k+0]
        };
        k = k+8;
      end 
    end
  
  
  always @ (*) $display  ("%p",array);
  
  always @ (posedge clk)
    begin
      if ( MemWrite == 1 )
        begin
          Data_Memory[Mem_Addr+7] = Write_Data[63:56];
          Data_Memory[Mem_Addr+6] = Write_Data[55:48];
          Data_Memory[Mem_Addr+5] = Write_Data[47:40];
          Data_Memory[Mem_Addr+4] = Write_Data[39:32];
          Data_Memory[Mem_Addr+3] = Write_Data[31:24];
          Data_Memory[Mem_Addr+2] = Write_Data[23:16];
          Data_Memory[Mem_Addr+1] = Write_Data[15:8];
          Data_Memory[Mem_Addr+0] = Write_Data[7:0];
        end
    end 
endmodule