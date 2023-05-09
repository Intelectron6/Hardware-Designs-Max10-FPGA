module gf2_matrix_inverter_test;

reg clk, rst, str;
reg [15:0] input_matrix;
wire [15:0] output_matrix;
wire bsy, fin;

gf2_matrix_inverter gf2mi (clk, rst, str, input_matrix, output_matrix, bsy, fin);

initial 
begin
	clk = 0;
	rst = 0; 
	str = 0; #10;
	rst = 1; #20;
	str = 1;
	input_matrix = 16'hCA31; #10;
	str = 0; #100;
	str = 1;
	input_matrix = 16'h8421; #10;
	str = 0;
end

always
begin
	clk = ~clk; #5;
end

endmodule
