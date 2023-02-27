`timescale 1ns / 1ps
module tb_3x3();

reg        clk     ;
reg        rstn    ;
reg  [7:0] dataR ;
reg  [7:0] dataG ;
reg  [7:0] dataB ;
wire  [7:0] dout0;
wire  [7:0] dout1;
wire  [7:0] dout2;
wire  [7:0] dout3;
wire  [7:0] dout4;
wire  [7:0] dout5;
wire  [7:0] dout6;
wire  [7:0] dout7;
wire  [7:0] dout8;
Matrix_Generate_3x3_8Bit Matrix_Generate_3x3_8Bit_u(
   .clk    (clk  ),  //nput            clk        ,
   .rstn   (rstn ),  //nput            rstn       ,
   .dataR  (dataR),  //nput      [7:0] dataR      ,
   .dataG  (dataG),  //nput      [7:0] dataG      ,
   .dataB  (dataB),  //nput      [7:0] dataB      ,
   .dout0  (dout0),  //utput     [7:0] dout0      ,
   .dout1  (dout1),  //utput     [7:0] dout1      ,
   .dout2  (dout2),  //utput     [7:0] dout2      ,
   .dout3  (dout3),  //utput     [7:0] dout3      ,
   .dout4  (dout4),  //utput     [7:0] dout4      ,
   .dout5  (dout5),  //utput     [7:0] dout5      ,
   .dout6  (dout6),  //utput     [7:0] dout6      ,
   .dout7  (dout7),  //utput     [7:0] dout7      ,
   .dout8  (dout8)   //utput     [7:0] dout8       
);
always#10 clk <= !clk;
initial begin
   clk     = 0;
   rstn    = 0;
   dataR = 0;
   dataG = 0;
   dataB = 0;
   #100;
   rstn = 1;
end
always@(posedge clk or negedge rstn)
   begin
      if(!rstn)begin
         dataR <= 0;
      end else begin
         dataR <= dataR+1;
      end
   end
always@(posedge clk or negedge rstn)
   begin
      if(!rstn)begin
         dataG <= 0;
      end else begin
         dataG <= dataG+1;
      end
   end
always@(posedge clk or negedge rstn)
   begin
      if(!rstn)begin
         dataB <= 0;
      end else begin
         dataB <= dataB+1;
      end
   end
endmodule
