`timescale 1ns / 1ps
module Matrix_Generate_3x3_8Bit(
   input            clk        ,
   input            rstn       ,
   input      [7:0] dataR      ,
   input      [7:0] dataG      ,
   input      [7:0] dataB      ,
   output reg  [7:0] dout0      ,
   output reg  [7:0] dout1      ,
   output reg  [7:0] dout2      ,
   output reg  [7:0] dout3      ,
   output reg  [7:0] dout4      ,
   output reg  [7:0] dout5      ,
   output reg  [7:0] dout6      ,
   output reg  [7:0] dout7      ,
   output reg  [7:0] dout8       
);

wire [7:0] Rrow1_data;
wire [7:0] Rrow2_data;
reg  [7:0] Rrow3_data;

wire [7:0] Grow1_data;
wire [7:0] Grow2_data;
reg  [7:0] Grow3_data;

wire [7:0] Brow1_data;
wire [7:0] Brow2_data;
reg  [7:0] Brow3_data;

always@(posedge clk or negedge rstn)
   begin
      if(!rstn)begin
         Rrow3_data <= 0;
      end else begin
         Rrow3_data <= dataR;
      end
   end 
shift8bit_64 shift8bit_64_uR (
	.clock    (clk),
	.clken    (1),
	.shiftin  (Rrow3_data),
	.shiftout (),
	.taps0x   (Rrow2_data),
	.taps1x   (Rrow1_data)
);


always@(posedge clk or negedge rstn)
   begin
      if(!rstn)begin
         Grow3_data <= 0;
      end else begin
         Grow3_data <= dataG;
      end
   end 
shift8bit_64 shift8bit_64_uG (
	.clock    (clk),
	.clken    (1),
	.shiftin  (Grow3_data),
	.shiftout (),
	.taps0x   (Grow2_data),
	.taps1x   (Grow1_data)
);


always@(posedge clk or negedge rstn)
   begin
      if(!rstn)begin
         Brow3_data <= 0;
      end else begin
         Brow3_data <= dataB;
      end
   end 
   
shift8bit_64 shift8bit_64_uB (
	.clock    (clk),
	.clken    (1),
	.shiftin  (Brow3_data),
	.shiftout (),
	.taps0x   (Brow2_data),
	.taps1x   (Brow1_data)
);

reg [7:0] Rp[8:0];
reg [7:0] Gp[8:0];
reg [7:0] Bp[8:0];
always@(posedge clk or negedge rstn)
    begin
        if(!rstn)begin
            {Rp[0],Rp[1],Rp[2]} <= 24'd0;
            {Rp[3],Rp[4],Rp[5]} <= 24'd0;
            {Rp[6],Rp[7],Rp[8]} <= 24'd0;
        end else begin
            {Rp[0],Rp[1],Rp[2]} <= {Rp[1],Rp[2],Rrow1_data};
            {Rp[3],Rp[4],Rp[5]} <= {Rp[4],Rp[5],Rrow2_data};
            {Rp[6],Rp[7],Rp[8]} <= {Rp[7],Rp[8],Rrow3_data};
        end
    end
always@(posedge clk or negedge rstn)
    begin
        if(!rstn)begin
            {Gp[0],Gp[1],Gp[2]} <= 24'd0;
            {Gp[3],Gp[4],Gp[5]} <= 24'd0;
            {Gp[6],Gp[7],Gp[8]} <= 24'd0;
        end else begin
            {Gp[0],Gp[1],Gp[2]} <= {Gp[1],Gp[2],Grow1_data};
            {Gp[3],Gp[4],Gp[5]} <= {Gp[4],Gp[5],Grow2_data};
            {Gp[6],Gp[7],Gp[8]} <= {Gp[7],Gp[8],Grow3_data};
        end
    end
always@(posedge clk or negedge rstn)
    begin
        if(!rstn)begin
            {Bp[0],Bp[1],Bp[2]} <= 24'd0;
            {Bp[3],Bp[4],Bp[5]} <= 24'd0;
            {Bp[6],Bp[7],Bp[8]} <= 24'd0;
        end else begin
            {Bp[0],Bp[1],Bp[2]} <= {Bp[1],Bp[2],Brow1_data};
            {Bp[3],Bp[4],Bp[5]} <= {Bp[4],Bp[5],Brow2_data};
            {Bp[6],Bp[7],Bp[8]} <= {Bp[7],Bp[8],Brow3_data};
        end
    end
wire [3:0] yinshu1[8:0];
wire [3:0] yinshu2[8:0];
wire [3:0] yinshu3[8:0];
assign yinshu1[0] = 1;
assign yinshu1[1] = 2;
assign yinshu1[2] = 3;
assign yinshu1[3] = 4;
assign yinshu1[4] = 5;
assign yinshu1[5] = 6;
assign yinshu1[6] = 7;
assign yinshu1[7] = 8;
assign yinshu1[8] = 9;

assign yinshu2[0] = 9;
assign yinshu2[1] = 8;
assign yinshu2[2] = 7;
assign yinshu2[3] = 6;
assign yinshu2[4] = 5;
assign yinshu2[5] = 4;
assign yinshu2[6] = 3;
assign yinshu2[7] = 2;
assign yinshu2[8] = 1;

assign yinshu3[0] = 1;
assign yinshu3[1] = 4;
assign yinshu3[2] = 7;
assign yinshu3[3] = 2;
assign yinshu3[4] = 5;
assign yinshu3[5] = 8;
assign yinshu3[6] = 3;
assign yinshu3[7] = 6;
assign yinshu3[8] = 9;
reg [7:0] Rpadd[8:0];
reg [7:0] Gpadd[8:0];
reg [7:0] Bpadd[8:0];
reg [7:0] Rpadd_d;
reg [7:0] Gpadd_d;
reg [7:0] Bpadd_d;
reg [3:0] k,k2;

always@(posedge clk or negedge rstn)
    begin
        if(!rstn)begin
            for(k=0;k<9;k=k+1)
                begin
                    Rpadd[k] <= 0;
                    Gpadd[k] <= 0;
                    Bpadd[k] <= 0;

                end                   
                Rpadd_d <= 0;
                    Gpadd_d <= 0;
                    Bpadd_d <= 0;
        end else begin
            for(k=0;k<9;k=k+1)
                begin
                    Rpadd[k] <= Rp[k] * yinshu1[k];
                    Gpadd[k] <= Gp[k] * yinshu2[k];
                    Bpadd[k] <= Bp[k] * yinshu3[k];
                    
                end
            Rpadd_d <= Rpadd[0]+Rpadd[1]+Rpadd[2]+Rpadd[3]+Rpadd[4]+Rpadd[5]+Rpadd[6]+Rpadd[7]+Rpadd[8];
            Gpadd_d <= Gpadd[0]+Gpadd[1]+Gpadd[2]+Gpadd[3]+Gpadd[4]+Gpadd[5]+Gpadd[6]+Gpadd[7]+Gpadd[8];
            Bpadd_d <= Bpadd[0]+Bpadd[1]+Bpadd[2]+Bpadd[3]+Bpadd[4]+Bpadd[5]+Bpadd[6]+Bpadd[7]+Bpadd[8];
    end
    end
wire [7:0] dout;
adder u_adder(
    .clk(clk),
    .rst_n(rstn),
    .a(Rpadd_d),
    .b(Gpadd_d),
    .c(Bpadd_d),
    .result(dout)
);  
wire [7:0] taps0x;
wire [7:0] taps1x;
shift8bit_64 shift8bit_64_uu (
	.clock    (clk),
	.clken    (1),
	.shiftin  (dout),
	.shiftout (),
	.taps0x   (taps0x),
	.taps1x   (taps1x)
);  
always@(posedge clk or negedge rstn)
    begin
        if(!rstn)begin
            {dout0,dout1,dout2} <= 24'd0;
            {dout3,dout4,dout5} <= 24'd0;
            {dout6,dout7,dout8} <= 24'd0;
        end else begin
            {dout0,dout1,dout2} <= {dout1,dout2,dout};
            {dout3,dout4,dout5} <= {dout4,dout5,taps0x};
            {dout6,dout7,dout8} <= {dout7,dout8,taps1x};
        end
    end
endmodule
