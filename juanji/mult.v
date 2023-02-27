// 乘法器模块
module mult(
	input clk,
	input rst_n,
	input [7 : 0] a,
	input [7 : 0] b,
	output [7 : 0] result

);

reg [15:0]result_reg;

assign result = result_reg[15:8];

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		result_reg <= 16'b0;
	end
	
	else
	begin
		result_reg <= a * b;
	end

end 


endmodule
