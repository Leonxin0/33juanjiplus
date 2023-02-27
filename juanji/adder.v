// 加法器模块
module adder(
	input clk,
	input rst_n,
	input [7 : 0] a,
	input [7 : 0] b,
	input [7 : 0] c,
	output [7 : 0] result
);
reg [9 : 0] result_reg;

assign result = result_reg[7:0];
always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		result_reg <= 8'b0;
	else
	begin
		result_reg <= a + b + c;
	end
end 

endmodule
