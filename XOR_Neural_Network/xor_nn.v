module neuron_1 (input clk,
					  input rst,
					  input en,
					  input [15:0] x1, 
					  output reg [15:0] f);

	reg signed [15:0] xa;
	wire signed [15:0] fa;
	
	always@(posedge clk)
	begin
		if (rst)
		begin
			xa <= 16'd0;
			f <= 16'd0;
		end
		else if (en)
		begin
			xa <= x1 << 4;
			f <= fa;
		end
	end			   
	
	sigmoid sgmd (xa, fa);
	
endmodule


module neuron_2 (input clk,
					  input rst,
					  input en,
					  input [15:0] x1, 
					  output reg [15:0] f);

	reg signed [15:0] xa;
	wire signed [15:0] fa;
	
	always@(posedge clk)
	begin
		if (rst)
		begin
			xa <= 16'd0;
			f <= 16'd0;
		end
		else if (en)
		begin
			xa <= -(x1 << 4);
			f <= fa;
		end
	end			   
	
	sigmoid sgmd (xa, fa);
	
endmodule


module neuron_3 (input clk,
					  input rst,
					  input en,
					  input [15:0] x1, 
					  input [15:0] x2,
					  output reg [15:0] f);

	reg signed [15:0] xa;
	wire signed [15:0] fa;
	
	always@(posedge clk)
	begin
		if (rst)
		begin
			xa <= 16'd0;
			f <= 16'd0;
		end
		else if (en)
		begin
			xa <= (((x1 + x2) << 4) - ((16'd24) << 8));
			f <= fa;
		end
	end			   
	
	sigmoid sgmd (xa, fa);
	
endmodule


module neuron_4 (input clk,
					  input rst,
					  input en,
					  input [15:0] x1, 
					  input [15:0] x2,
					  output reg [15:0] f);

	reg signed [15:0] xa;
	wire signed [15:0]	fa;
	
	always@(posedge clk)
	begin
		if (rst)
		begin
			xa <= 16'd0;
			f <= 16'd0;
		end
		else if (en)
		begin
			xa <= (((x1 + x2) << 4) - ((16'd8) << 8));
			f <= fa;
		end
	end			   
	
	sigmoid sgmd (xa, fa);
	
endmodule
	   
	   
module xor_nn (input clk,
					input rst,
					input en,
					input [15:0] x1,
					input [15:0] x2,
					output cl);
			   
	wire signed [15:0] f1, f2, f3, f4, f5, f6, f7;
	
	neuron_1 n1 (clk, rst, en, x1, f1);
	neuron_1 n2 (clk, rst, en, x2, f2);
	neuron_2 n3 (clk, rst, en, x1, f3);
	neuron_2 n4 (clk, rst, en, x2, f4);
	neuron_3 n5 (clk, rst, en, f1, f2, f5);
	neuron_3 n6 (clk, rst, en, f3, f4, f6);
	neuron_4 n7 (clk, rst, en, f5, f6, f7);
	
	assign cl = ~f7[8];
	
endmodule
