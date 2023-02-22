module testbench;

reg x,y,c_in;

wire s,c;

FA adder(.x(x),.y(y),.c_in(c_in),.sum(s),.c_out(c));

initial begin

x = 0;

y = 0;

c_in = 0;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 1;

y = 0;

c_in = 0;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 0;

y = 1;

c_in = 0;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 1;

y = 1;

c_in = 0;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 0;

y = 0;

c_in = 1;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 1;

y = 0;

c_in = 1;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 0;

y = 1;

c_in = 1;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

#20

x = 1;

y = 1;

c_in = 1;

#5

$display ("X = %d , Y = %d , C_in = %d , C_out = %d , S = %d\n",x,y,c_in,c,s);

$finish;

end

endmodule



module HA(a, b, sum, carry);

input a, b;

output sum, carry;

reg sum, carry;

always@(a or b)

begin

sum = a^b;

carry = a&b;

end

endmodule



module FA(x,y,c_in,sum,c_out);

input x,y,c_in;

output sum,c_out;

/* modify the code here*/

//structural description

wire sum1;
wire c1;
wire sum2;
wire c2;
HA half_adder1(x,y,sum1,c1);
HA half_adder2(sum1,c_in,sum,c2);
or(c_out,c2,c1);

//Data flow description:

assign sum=(c_in^(x^y));
assign c_out=( (x&y) | ((x^y)&c_in) );


//Behavior description:

reg s1, c1, s2, c2, sum, c_out;
always@(x or y)
begin
s1=x^y;
c1=x&y;
sum=c_in^s1;

c2=c_in&s1;
c_out=c1|c2;
end



endmodule