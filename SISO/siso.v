module dff(d, clk, reset, q);
    input d, clk, reset;
    output q;
    reg q = 0;
    always @ (posedge clk)
    begin
        if(reset == 1'b1)
            q <= 1'b0;
        else
        begin
            q <= d;
        end
    end
endmodule 

module siso(d, clk, reset, q1, q2, q3, q4);
    input d, clk, reset;
    output q1, q2, q3, q4;
    dff aa(d, clk,reset, q1);
    dff bb(q1, clk,reset, q2);
    dff cc(q2, clk,reset, q3);
    dff dd(q3, clk,reset, q4); 
endmodule
