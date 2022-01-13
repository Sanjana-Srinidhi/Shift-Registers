module dff(d, clk, reset, q);
    input d, clk, reset;
    output q;
    reg q = 0;
    always @ (posedge clk, posedge reset)
    begin
        if(reset == 1'b1)
            q <= 4'b0000;
        else
            begin
                q <= d;
            end
    end
endmodule 

module sipo(d, clk, reset, q);
    input d, clk, reset;
    output [3:0]q;
    dff aa(d, clk, reset, q[3]);
    dff bb(q[3], clk, reset, q[2]);
    dff cc(q[2], clk, reset, q[1]);
    dff dd(q[1], clk, reset, q[0]);
endmodule
