module gf2_matrix_inverter 
	(input clk,
	 input rst,
	 input str,
	 input [15:0] input_matrix,
	 output [15:0] output_matrix,
	 output bsy,
	 output fin);
	 
	 //Controller FSM
	 localparam s0 = 0;
	 localparam s1 = 1;
	 localparam s2 = 2;
	 localparam s3 = 3;
	 localparam s4 = 4;
	 localparam s5 = 5;
	 localparam s6 = 6;
	 
	 reg [2:0] present_state = s0;
	 reg [2:0] next_state;
	 reg done, done_next;
	 
	 always@(*)
	 begin
		case (present_state)
			s0 : begin
					if (str == 1)
						next_state = s1;
					else
						next_state = s0;
					done_next = 0;
				  end
			s1 : begin
					next_state = s2;
					done_next = 0;
				  end
			s2 : begin
					next_state = s3;
					done_next = 0;
				  end
			s3 : begin
					next_state = s4;
					done_next = 0;
				  end
			s4 : begin
					next_state = s5;
					done_next = 0;
				  end
			s5 : begin
					next_state = s6;
					done_next = 0;
				  end
			s6 : begin
					next_state = s0;
					done_next = 1;
				  end
		   default : begin
							next_state = s0;
							done_next = 0;
						 end
		endcase
	 end
		
	 //Data-path
	 reg [15:0] intermediate;
	 reg [15:0] inverse;
	 reg [15:0] intermediate_next;
	 reg [15:0] inverse_next;
	 
	 always@(*)
	 begin
		case (present_state)
			s0 : begin
					intermediate_next = input_matrix;
					inverse_next = 16'h8421;
				  end
				  
			s1 : begin
					intermediate_next = intermediate;
					inverse_next = inverse;
					if (intermediate[11] == 1)
					begin
						intermediate_next[11:8] = intermediate[11:8] ^ intermediate[15:12];
						inverse_next[11:8] = inverse[11:8] ^ inverse[15:12];	
					end
					if (intermediate[7] == 1)
					begin
						intermediate_next[7:4] = intermediate[7:4] ^ intermediate[15:12];
						inverse_next[7:4] = inverse[7:4] ^ inverse[15:12];	
					end
					if (intermediate[3] == 1)
					begin
						intermediate_next[3:0] = intermediate[3:0] ^ intermediate[15:12];
						inverse_next[3:0] = inverse[3:0] ^ inverse[15:12];	
					end
				  end
				  
			s2 : begin
					intermediate_next = intermediate;
					inverse_next = inverse;
					if (intermediate[6] == 1)
					begin
						intermediate_next[7:4] = intermediate[7:4] ^ intermediate[11:8];
						inverse_next[7:4] = inverse[7:4] ^ inverse[11:8];	
					end
					if (intermediate[2] == 1)
					begin
						intermediate_next[3:0] = intermediate[3:0] ^ intermediate[11:8];
						inverse_next[3:0] = inverse[3:0] ^ inverse[11:8];	
					end
				  end
				  
		   s3 : begin
					intermediate_next = intermediate;
					inverse_next = inverse;
					if (intermediate[1] == 1)
					begin
						intermediate_next[3:0] = intermediate[3:0] ^ intermediate[7:4];
						inverse_next[3:0] = inverse[3:0] ^ inverse[7:4];	
					end
				  end
				  
			s4 : begin
					intermediate_next = intermediate;
					inverse_next = inverse;
					if (intermediate[12] == 1)
					begin
						intermediate_next[15:12] = intermediate[15:12] ^ intermediate[3:0];
						inverse_next[15:12] = inverse[15:12] ^ inverse[3:0];	
					end
					if (intermediate[8] == 1)
					begin
						intermediate_next[11:8] = intermediate[11:8] ^ intermediate[3:0];
						inverse_next[11:8] = inverse[11:8] ^ inverse[3:0];	
					end
					if (intermediate[4] == 1)
					begin
						intermediate_next[7:4] = intermediate[7:4] ^ intermediate[3:0];
						inverse_next[7:4] = inverse[7:4] ^ inverse[3:0];	
					end
				  end
				  
			s5 : begin
					intermediate_next = intermediate;
					inverse_next = inverse;
					if (intermediate[13] == 1)
					begin
						intermediate_next[15:12] = intermediate[15:12] ^ intermediate[7:4];
						inverse_next[15:12] = inverse[15:12] ^ inverse[7:4];	
					end
					if (intermediate[9] == 1)
					begin
						intermediate_next[11:8] = intermediate[11:8] ^ intermediate[7:4];
						inverse_next[11:8] = inverse[11:8] ^ inverse[7:4];	
					end
				  end
				  
		   s6 : begin
					intermediate_next = intermediate;
					inverse_next = inverse;
					if (intermediate[14] == 1)
					begin
						intermediate_next[15:12] = intermediate[15:12] ^ intermediate[11:8];
						inverse_next[15:12] = inverse[15:12] ^ inverse[11:8];	
					end
				  end 
				  
		   default : begin
							intermediate_next = input_matrix;
							inverse_next = 16'h8421;
						 end
			
		endcase
	 end
	 
	 //State and register update block
	 always@(posedge clk)
	 begin
		if (rst == 0)
		begin
			present_state <= s0;
			intermediate <= 16'd0;
			inverse <= 16'd0;
			done <= 0;
		end
		else
		begin
			present_state <= next_state;
			intermediate <= intermediate_next;
			inverse <= inverse_next;
			done <= done_next;
		end
	 end
	 
	 assign output_matrix = done ? inverse : 16'bx;
	 assign bsy = (present_state != s0) ? 1'b1 : 1'b0;
	 assign fin = done;
	 
endmodule
