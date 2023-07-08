module xor_nn_test;

reg clk, rst, en;
reg [15:0] x1, x2;
wire cl;

xor_nn xn (clk, rst, en, x1, x2, cl);

initial 
begin
	clk = 0;
	rst = 0; 
	en = 0; #10;
	rst = 1; #20;
	en = 1;
	x1 = 16'd743;
	x2 = 16'd819; #200;
end

// This is to test the sigmoid unit (if necessary)
/*reg [15:0] x;
wire [15:0]y;

sigmoid sgmd (clk, rst, en, x, y);

initial 
begin
	clk = 0;
	rst = 0; 
	en = 0; #10;
	rst = 1; #20;
	en = 1;
	x = 16'd743; #200;
end

always
begin
	clk = ~clk; #5;
end

endmodule*/
