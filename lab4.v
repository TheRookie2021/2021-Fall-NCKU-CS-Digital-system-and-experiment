// Adder-Subtractor to DE0-CV

module test(a,b,select,out,overflow);
input [1:0]a,[1:0]b, select;
output [1:0]out,overflow;

reg [1:0]out,overflow;

always @(a or b or select)
begin
	if(select)
	begin		
		{overflow,out}=a+b;
	end
	else
	begin
		{overflow,out}=a-b;
	end
end

endmodule