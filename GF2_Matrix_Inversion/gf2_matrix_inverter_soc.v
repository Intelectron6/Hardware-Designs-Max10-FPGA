module gf2_matrix_inverter_soc (input clk, rstn);

wire [3:0] user_extra_inputs_export;
wire [3:0] user_extra_outputs_export;
wire [31:0] user_input_0_export;
wire [31:0] user_input_1_export;
wire [31:0] user_output_export;

wire [15:0] coproc_inp, coproc_outp;
reg  coproc_inp_valid;
wire coproc_outp_valid;
wire coproc_ongoing;
reg [31:0] sig_user_output_export;
reg [31:0] coproc_inp_reg, coproc_outp_reg;
reg [31:0] coproc_command_reg, coproc_status_reg;

localparam s0 = 0;
localparam s1 = 1;
localparam s2 = 2;
localparam s3 = 3;
localparam s4 = 4;
localparam s5 = 5;
localparam s6 = 6;
localparam s7 = 7;
reg [2:0] state = s0;

wire rst;
reg dummy;

assign rst = ~rstn;

Processing_System mps (clk, rst,           
					   user_extra_inputs_export,  
					   user_extra_outputs_export,
					   user_input_0_export,       
					   user_input_1_export,      
					   user_output_export);
								  
gf2_matrix_inverter gf2mi (clk, rst, 
						   coproc_inp_valid,
						   coproc_input,
						   coproc_output,
						   coproc_ongoing,
						   coproc_outp_valid);
					  
assign user_output_export = sig_user_output_export;  
assign coproc_inp = coproc_inp_reg [15:0];
  
always@(posedge clk)
begin
	if (rst == 0)
		sig_user_output_export <= 32'd0;
	else
	begin
		case (user_extra_inputs_export)
			4'b1111 : sig_user_output_export <= coproc_command_reg;
						 
			4'b0010 : sig_user_output_export <= coproc_outp_reg;

			default : dummy <= 0;
		endcase
	end
end
 
always@(posedge clk)
begin
	if (rst == 0)
	begin
		state <= s0; 
		coproc_inp_valid <= 0;
      coproc_inp_reg <= 32'd0;
		coproc_outp_reg <= 32'd0;
      coproc_command_reg <= 32'd0; 
		coproc_status_reg <= 32'd0;
	end
	else
	begin
		coproc_inp_valid <= 0;
		if (user_extra_inputs_export == 4'b0000 && user_input_0_export == 32'hffffffff)
		begin
			state <= s1;
			coproc_inp_reg <= 32'd0;
			coproc_outp_reg <= 32'd0;
			coproc_command_reg <= 32'd0; 
			coproc_status_reg <= 32'd0;
		end
		else
		begin
			case (state)
				s0 : dummy <= 0;
				
				s1 : begin
							if (user_extra_inputs_export == 4'b0001)
							begin
								coproc_inp_reg <= user_input_0_export;
								state <= s2;
							end
					  end		
				
				s2 : if (user_extra_inputs_export == 4'b0000)
							if(user_input_0_export == 16'd1)
							begin
								coproc_command_reg <= user_input_0_export; 
								state <= s3;
							end 
				s3 : begin
							coproc_inp_valid <= 1;
							state <= s4;
					  end
				s4 : begin
							coproc_inp_valid <= 0;
							if (coproc_outp_valid == 1)
							begin
								state <= s5;
								coproc_status_reg <= 32'd1;
								coproc_outp_reg <= {16'h0000, coproc_outp[15:0]};
							end
					  end
				s5 : state <= s0;
					  
			   default : dummy <= 0;
			endcase
      end
	end
end
 
endmodule
