module tb;
    reg d, clk, reset;
    wire q1, q2, q3, q4;
    siso a(d, clk, reset, q1, q2, q3, q4);
    initial
    begin
        $dumpfile("siso_test.vcd");
        $dumpvars(0, tb);
    $monitor("time=",$time,", clk=%b, reset=%b, d=%b, q1=%b, q2=%b, q3=%b, q4=%b", clk, reset, d, q1, q2, q3, q4);
    end
    initial
    begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial
    begin
        reset = 1'b1;
        #10 reset  =0; d = 1;
        #10 d = 0;
        #10 d = 0;
        #10 d = 1;
        #50 $finish;
    end 
endmodule
