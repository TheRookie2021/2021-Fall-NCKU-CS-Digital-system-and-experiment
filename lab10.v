`define TimeExpire_count 32'd25000000
`define TimeExpire_display 32'd2500

module test(clk,reset,dot_row,dot_col,out);

input clk,reset;
output [7:0]dot_row;
output [7:0]dot_col;
output [6:0]out;

wire [1:0]state;//for change display
wire [3:0]counter;//for display and state set
wire clk_count_div,clk_display_div;//two freq div

u_FreqDiv_display a(.clk(clk), .reset(reset),.clk_display_div(clk_display_div));

u_FreqDiv_count b(.clk(clk), .reset(reset),.clk_count_div(clk_count_div));

u_counter d(.clk(clk_count_div), .reset(reset),.state(state), .count(counter)); 

u_display c(.count(counter), .out(out));

controller e( .clk_div(clk_display_div), .rst(reset), .state(state), .dot_row(dot_row), .dot_col(dot_col));


endmodule
/*---------------------------------------------------------------*/


module controller( clk_div,rst,state,dot_row,dot_col);

input clk_div,rst;
input [1:0]state;
output [7:0]dot_row;
output [7:0]dot_col;

reg [7:0]dot_row;
reg [7:0]dot_col;
reg [2:0]row_count;

always@(posedge clk_div or negedge rst )
begin

if(~rst)
	begin
	
	row_count<=0;
	dot_row<=8'd0;
	dot_col<=8'd0;
	end
else 
	begin
	
	
	
	if(state==2'b00)
	begin
	row_count<=row_count+1;
	case(row_count)
		3'd0: dot_row <= 8'b01111111;
		3'd1: dot_row <= 8'b10111111;
		3'd2: dot_row <= 8'b11011111;
		3'd3: dot_row <= 8'b11101111;
		3'd4: dot_row <= 8'b11110111;
		3'd5: dot_row <= 8'b11111011;
		3'd6: dot_row <= 8'b11111101;
		3'd7: dot_row <= 8'b11111110;
		endcase
		case(row_count)
		3'd0: dot_col <= 8'b00001100;
		3'd1: dot_col <= 8'b00001100;
		3'd2: dot_col <= 8'b00011001;
		3'd3: dot_col <= 8'b01111110;
		3'd4: dot_col <= 8'b10011000;
		3'd5: dot_col <= 8'b00011000;
		3'd6: dot_col <= 8'b00101000;
		3'd7: dot_col <= 8'b01001000;
		endcase
		end
		
	else if(state==2'b01)
		begin
		row_count<=row_count+1;
		case(row_count)
		3'd0: dot_row <= 8'b01111111;
		3'd1: dot_row <= 8'b10111111;
		3'd2: dot_row <= 8'b11011111;
		3'd3: dot_row <= 8'b11101111;
		3'd4: dot_row <= 8'b11110111;
		3'd5: dot_row <= 8'b11111011;
		3'd6: dot_row <= 8'b11111101;
		3'd7: dot_row <= 8'b11111110;
		endcase
		case(row_count)
		3'd0: dot_col <= 8'b00000000;
		3'd1: dot_col <= 8'b00100100;
		3'd2: dot_col <= 8'b00111100;
		3'd3: dot_col <= 8'b10111101;
		3'd4: dot_col <= 8'b11111111;
		3'd5: dot_col <= 8'b00111100;
		3'd6: dot_col <= 8'b00111100;
		3'd7: dot_col <= 8'b00000000;
		endcase
		end
	else if(state==2'b10)
		begin
		row_count<=row_count+1;
		case(row_count)
		3'd0: dot_row <= 8'b01111111;
		3'd1: dot_row <= 8'b10111111;
		3'd2: dot_row <= 8'b11011111;
		3'd3: dot_row <= 8'b11101111;
		3'd4: dot_row <= 8'b11110111;
		3'd5: dot_row <= 8'b11111011;
		3'd6: dot_row <= 8'b11111101;
		3'd7: dot_row <= 8'b11111110;
		endcase
		case(row_count)
		3'd0: dot_col <= 8'b00011000;
		3'd1: dot_col <= 8'b00011000;
		3'd2: dot_col <= 8'b00111100;
		3'd3: dot_col <= 8'b00111100;
		3'd4: dot_col <= 8'b01011010;
		3'd5: dot_col <= 8'b00011000;
		3'd6: dot_col <= 8'b00011000;
		3'd7: dot_col <= 8'b00100100;
		endcase

	end
end

end


endmodule
/*---------------------------------------------------------------*/

module u_FreqDiv_display (clk, reset,clk_display_div);

input clk, reset;
output clk_display_div;

reg clk_display_div;
reg [31:0]count;

always@(posedge clk)
begin
	if(!reset)
	begin
		count<=32'd0;
		clk_display_div<=1'b0;
	end
	else
	begin
		if(count==`TimeExpire_display)
	begin
		count<=32'd0;
		clk_display_div<= ~clk_display_div;
	end
	else
	begin
		count<= count+32'd1;
	end
	end
end
endmodule

/*---------------------------------------------------------------*/
module u_FreqDiv_count (clk, reset,clk_count_div);

input clk, reset;
output clk_count_div;

reg clk_count_div;
reg [31:0]count;

always@(posedge clk)
begin
	if(!reset)
	begin
		count<=32'd0;
		clk_count_div<=1'b0;
	end
	else
	begin
		if(count==`TimeExpire_count)
	begin
		count<=32'd0;
		clk_count_div<= ~clk_count_div;
	end
	else
	begin
		count<= count+32'd1;
	end
	end
end
endmodule

/*---------------------------------------------------------------*/
module u_counter(clk, reset,state, count);

input clk,reset;
output  [1:0] state;
output [3:0] count;

reg [3:0] count;
reg [1:0] next;
reg [1:0] state;


always@(posedge clk or negedge reset)
begin
//0:green 1.yellow 2.red

	
	if(!reset)
	begin
		count<= 4'b1111;//15sec
		state<=2'b00;//gree
		next <=2'b01;//yellow
	end
	else
	begin
		
		
		
		if(count==0)//reset the counter depend on the state
			begin
			
			state=next;
			case(state)			
			2'b00: count<=4'b1111;
			2'b01: count<=4'b0101;
			2'b10: count<=4'b1010;				
			endcase
			
		end
		else
		begin
			count<= count-1;
		end
		
		case(state)//set next state
			2'b00: next=2'b01;
			2'b01: next=2'b10;
			2'b10: next=2'b00;
		
		endcase
		
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