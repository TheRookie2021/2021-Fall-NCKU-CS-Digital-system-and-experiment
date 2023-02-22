`define TimeExpire 32'd25000000


module test1(clock,reset,in,out);
input clock,reset,in;
output[6:0]out;

wire div_clk;// 改成wire
wire [2:0]cur;
wire [6:0]out;


clk_div a(.clk(clock),.reset(reset),.div_clk(div_clk));

moor b(.clk(div_clk),.reset(reset),.in(in),.out(cur));//少加一個 "." 

seven c(.in(cur),.out(out));

endmodule

module moor(clk,reset,in,out);
input clk,reset,in;
output [2:0]out;

reg [2:0]out;
reg [2:0]next;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;

			//改 不用宣告bit
always@(posedge clk or negedge reset)//改 or negedge reset
begin
	if(reset==0)
	begin
		out=s0;
	end
	else
	begin
		out=next;
	end
end

always@(in or out )//改 in or out
begin
	if(reset==0)
	begin
		out=s0;
		if(in==0)
		begin
			next=s1;
		end
		else
		begin
			next=s3;
		end
	end		
	else
	begin
		if(in==0)
		begin
			case(out)
				s0: next=s3;
				s1: next=s5;
				s2: next=s0;
				s3: next=s1;
				s4: next=s2;
				s5: next=s4;
			
			endcase
		end
		else
		begin
			case(out)
				s0: next=s1;
				s1: next=s2;
				s2: next=s3;
				s3: next=s4;
				s4: next=s5;
				s5: next=s0;
					
			endcase
		
		end
		end
end

endmodule



module clk_div(clk,reset,div_clk);
input clk,reset;
output div_clk;

reg div_clk;
reg [31:0]count;

always@(posedge clk)
begin
	if(reset==0)
	begin
		count<=32'd0;
		div_clk<=1'b0;
	end
	else
	begin
		if(count== `TimeExpire)
		begin
			count<=32'd0;
			div_clk<= ~div_clk;
		end
		else
			count<= count+32'd1;
		begin
		
		end
	end
	
end



endmodule

module seven(in,out);
input [2:0]in;
output [6:0]out;

reg [6:0]out;

always@(in)
begin
	case(in)
		4'b0000: begin
		out=7'b1000000;
		end
		
		4'b0001: begin
		out=7'b1111001;
		end
		
		4'b0010: begin
		out=7'b0100100;
		end
		4'b0011: begin
		out=7'b0110000;
		end
		4'b0100: begin
		out=7'b0011001;
		end
		
		4'b0101: begin
		out=7'b0010010;
		end
		
		4'b0110: begin
		out=7'b0000010;
		end
		
		4'b0111: begin
		out=7'b1111000;
		end
		
		4'b1000: begin
		out=7'b0000000;
		end
		
		4'b1001: begin
		out=7'b0010000;
		end
		
		4'b1010: begin
		out=7'b0001000;
		end
		
		4'b1011: begin
		out=7'b0000011;
		end
		
		4'b1100: begin
		out=7'b1000110;
		end
		
		4'b1101: begin
		out=7'b0100001;
		end
		
		4'b1110: begin
		out=7'b0000110;
		end
		
		4'b1111: begin
		out=7'b0001110;
	end
	endcase


end


endmodule