module test(in_0,in_1,out_0);
	input [2:0]in_0,in_1;
	output [6:0] out_0;

	reg [6:0] out_0;
	reg [3:0] temp;
	
	always@(in_0 or in_1)
		begin
		{temp}=in_0+in_1;
		case(temp)
			4'b0000: begin
				out_0=7'b1000000;
			end
			
			4'b0001: begin
				out_0=7'b1111001;
			end
			
			4'b0010: begin
				out_0=7'b0100100;
			end
			4'b0011: begin
				out_0=7'b0110000;
			end
			4'b0100: begin
				out_0=7'b0011001;
			end
			
			4'b0101: begin
				out_0=7'b0010010;
			end
			
			4'b0110: begin
				out_0=7'b0000010;
			end
			
			4'b0111: begin
				out_0=7'b1111000;
			end
			
			4'b1000: begin
				out_0=7'b0000000;
			end
			
			4'b1001: begin
				out_0=7'b0010000;
			end
			
			4'b1010: begin
				out_0=7'b0001000;
			end
			
			4'b1011: begin
				out_0=7'b0000011;
			end
			
			
			4'b1100: begin
				out_0=7'b1000110;
			end
		
			4'b1101: begin
				out_0=7'b0100001;
			end
			
			4'b1110: begin
				out_0=7'b0000110;
			end
			
			4'b1111: begin
				out_0=7'b0001110;
			end
		
		endcase
		end
endmodule