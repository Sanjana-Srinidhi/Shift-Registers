module tb;
    reg d, clk, reset;
    wire [3:0]q;
    sipo a(d, clk, reset, q);
    initial
    begin
        $dumpfile("sipo_test.vcd");
        $dumpvars(0, tb);
        $monitor("time=",$time,", clk=%b, reset=%b,  d=%b, q=%b", clk, reset, d, q);
    end
    initial
    begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial
    begin
        reset = 1'b1;
        #10 reset = 1'b0; d = 1;
        #10 d = 0;
        #10 d = 0;
        #10 d = 1;
        #50 $finish;
    end 
endmodule
