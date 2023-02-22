module checkkeypad(clk,rst,keypadRow,keypadCol);
input clk,rst;
input [3:0]keypadCol;
output [3:0]keypadRow;

reg [3:0]keypadRow;
reg [3:0]keypadBuf;
reg [31:0]keypadDisplay;

always@(posedge clk)
begin
	if(!rst)
	begin
		keypadRow<= 4'b1110;
		keypadBuf <=4'b0000;
		keypadBuf <=4'b0000;
	end
endmodule