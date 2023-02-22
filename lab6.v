`define TimeExpire 32'd25000000

module test(clock,reset,out);

input clock, reset;
output [6:0] out;

wire clock_div;
wire [3:0] count;
wire [6:0] out;

u_FreqDiv a(.clk(clock),.reset(reset), .clk_div(clock_div));

u_counter b(.clk(clock_div), .reset(reset), .count(count));

u_display c(.count(count),.out(out));


endmodule

/*---------------------------------------------------------------*/
module u_FreqDiv (clk, reset,clk_div);

input clk, reset;
output clk_div;

reg clk_div;
reg [31:0]count;

always@(posedge clk)
begin
	if(!reset)
	begin
		count<=32'd0;
		clk_div<=1'b0;
	end
	else
	begin
		if(count==`TimeExpire)
	begin
		count<=32'd0;
		clk_div<= ~clk_div;
	end
	else
	begin
		count<= count+32'd1;
	end
	end
end
endmodule

/*---------------------------------------------------------------*/
module u_counter(clk, reset, count);

input clk,reset;
output [3:0] count;

reg [3:0] count;

always@(posedge clk or negedge reset)
begin
	
	if(!reset)
	begin
		count<= 0;
	end
	
	else
	begin
		count<= count+1;
	end
	
end
endmodule
/*---------------------------------------------------------------*/

module u_display(count, out);

input [3:0]count;
output [6:0] out;

reg [6:0] out;

always@(count)
begin
	
	case(count)
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