module testbench;
reg [3:0] in;
wire[3:0] out;

test a(.in(in),.out(out));
initial begin
    in=4'b0000;//initial state setting
    #5 //when time = 5ns
    $display("%b\n",out);//output in binary form

    #20 //when time = 20ns 
    in=4'b1011;//testcase
    #5 //when time = 5ns
    $display("%b\n",out);
    
    $finish;
end
endmodule

module test(in,out);

input [3:0] in;
output [3:0]out;

reg [3:0]out;

always@(in)
begin
    if(in[3]==0)
     begin
     out=in>>1;
     end
     else
     begin
     out=in>>1;
     out[3]=1;
     end
 
 end

endmodule