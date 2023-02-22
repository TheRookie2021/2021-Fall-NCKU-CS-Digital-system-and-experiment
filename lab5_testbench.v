module testbench;



    reg     [3:0]   data_in;

    wire    [6:0]   data_out;



    special_multiplier special_multiplier_u(.num(data_in), .out(data_out));



    initial begin

        #10





        data_in = 4'd0;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);

        

        

        data_in = 4'd1;

        #5

        if(data_out == 7'b1111001)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 1", data_in, data_out);



        

        data_in = 4'd2;

        #5

        if(data_out == 7'b0100100)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 2", data_in, data_out);



        

        data_in = 4'd3;

        #5

        if(data_out == 7'b0000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 8", data_in, data_out);



       

        data_in = 4'd4;

        #5

        if(data_out == 7'b0001000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 10", data_in, data_out);



        

        data_in = 4'd5;

        #5

        if(data_out == 7'b1000110)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 12", data_in, data_out);



        

        data_in = 4'd6;

        #5

        if(data_out == 7'b0001000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 10", data_in, data_out);



        

        data_in = 4'd7;

        #5

        if(data_out == 7'b1000110)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 12", data_in, data_out);



        

        data_in = 4'd8;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd9;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd10;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd11;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd12;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd13;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd14;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);



        

        data_in = 4'd15;

        #5

        if(data_out == 7'b1000000)

            $display ("correct !!!");

        else

            $display ("wrong, data_in = %d, your answer = %d, expect answer = 0", data_in, data_out);





        $finish;



    end



endmodule



module special_multiplier(num, out);

    input   [3:0]   num;

    output  [6:0]   out;


    /* modify the code here */
    reg   [6:0]   out;
    reg   [6:0]   temp;

    always@ (num)
    begin
        case (num)
    /*當輸入為 0~2，輸出值=輸入值*/
        4'b0000:
            temp=num;
        4'b0001:
            temp=num;
        4'b0010:
            temp=num;

    /*當輸入為 3~5，輸出值=輸入值加 1 後，再乘以 2*/

        4'b0011:
            temp=(num+1)*2;
            
        4'b0100:
            temp=(num+1)*2;
            
        4'b0101:
            temp=(num+1)*2;
            
    /*當輸入為 6~7，輸出值=輸入值減 1 後，再乘以 2*/
        
        4'b0110:
            temp=(num-1)*2;
            
        4'b0111:
            temp=(num-1)*2;
            
        default: temp=0;
        endcase
    end
    
    always @(temp)
    begin
    
    case(temp)
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