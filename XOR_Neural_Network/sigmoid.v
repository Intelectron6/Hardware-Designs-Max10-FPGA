module sigmoid (input signed [15:0] inp, 
		output reg [15:0] outp);
					 
	reg [15:0] rom [255:0];
	
	wire [7:0] sel;
	
	initial
	begin
		rom[0] = 16'b0000000010000000;
		rom[1] = 16'b0000000010000001;
		rom[2] = 16'b0000000010000010;
		rom[3] = 16'b0000000010000011;
		rom[4] = 16'b0000000010000100;
		rom[5] = 16'b0000000010000101;
		rom[6] = 16'b0000000010000110;
		rom[7] = 16'b0000000010000111;
		rom[8] = 16'b0000000010001000;
		rom[9] = 16'b0000000010001001;
		rom[10] = 16'b0000000010001010;
		rom[11] = 16'b0000000010001011;
		rom[12] = 16'b0000000010001100;
		rom[13] = 16'b0000000010001101;
		rom[14] = 16'b0000000010001110;
		rom[15] = 16'b0000000010001111;
		rom[16] = 16'b0000000010010000;
		rom[17] = 16'b0000000010010001;
		rom[18] = 16'b0000000010010010;
		rom[19] = 16'b0000000010010011;
		rom[20] = 16'b0000000010010100;
		rom[21] = 16'b0000000010010101;
		rom[22] = 16'b0000000010010110;
		rom[23] = 16'b0000000010010111;
		rom[24] = 16'b0000000010011000;
		rom[25] = 16'b0000000010011001;
		rom[26] = 16'b0000000010011010;
		rom[27] = 16'b0000000010011011;
		rom[28] = 16'b0000000010011100;
		rom[29] = 16'b0000000010011101;
		rom[30] = 16'b0000000010011110;
		rom[31] = 16'b0000000010011111;
		rom[32] = 16'b0000000010100000;
		rom[33] = 16'b0000000010100001;
		rom[34] = 16'b0000000010100010;
		rom[35] = 16'b0000000010100011;
		rom[36] = 16'b0000000010100100;
		rom[37] = 16'b0000000010100101;
		rom[38] = 16'b0000000010100110;
		rom[39] = 16'b0000000010100111;
		rom[40] = 16'b0000000010101000;
		rom[41] = 16'b0000000010101001;
		rom[42] = 16'b0000000010101010;
		rom[43] = 16'b0000000010101011;
		rom[44] = 16'b0000000010101100;
		rom[45] = 16'b0000000010101101;
		rom[46] = 16'b0000000010101110;
		rom[47] = 16'b0000000010101111;
		rom[48] = 16'b0000000010110000;
		rom[49] = 16'b0000000010110001;
		rom[50] = 16'b0000000010110010;
		rom[51] = 16'b0000000010110011;
		rom[52] = 16'b0000000010110100;
		rom[53] = 16'b0000000010110101;
		rom[54] = 16'b0000000010110110;
		rom[55] = 16'b0000000010110111;
		rom[56] = 16'b0000000010111000;
		rom[57] = 16'b0000000010111001;
		rom[58] = 16'b0000000010111010;
		rom[59] = 16'b0000000010111011;
		rom[60] = 16'b0000000010111100;
		rom[61] = 16'b0000000010111101;
		rom[62] = 16'b0000000010111110;
		rom[63] = 16'b0000000010111111;
		rom[64] = 16'b0000000011000000;
		rom[65] = 16'b0000000011000001;
		rom[66] = 16'b0000000011000010;
		rom[67] = 16'b0000000011000011;
		rom[68] = 16'b0000000011000100;
		rom[69] = 16'b0000000011000101;
		rom[70] = 16'b0000000011000110;
		rom[71] = 16'b0000000011000111;
		rom[72] = 16'b0000000011001000;
		rom[73] = 16'b0000000011001001;
		rom[74] = 16'b0000000011001010;
		rom[75] = 16'b0000000011001011;
		rom[76] = 16'b0000000011001100;
		rom[77] = 16'b0000000011001101;
		rom[78] = 16'b0000000011001110;
		rom[79] = 16'b0000000011001111;
		rom[80] = 16'b0000000011010000;
		rom[81] = 16'b0000000011010001;
		rom[82] = 16'b0000000011010010;
		rom[83] = 16'b0000000011010011;
		rom[84] = 16'b0000000011010100;
		rom[85] = 16'b0000000011010101;
		rom[86] = 16'b0000000011010110;
		rom[87] = 16'b0000000011010111;
		rom[88] = 16'b0000000011011000;
		rom[89] = 16'b0000000011011001;
		rom[90] = 16'b0000000011011010;
		rom[91] = 16'b0000000011011011;
		rom[92] = 16'b0000000011011100;
		rom[93] = 16'b0000000011011101;
		rom[94] = 16'b0000000011011110;
		rom[95] = 16'b0000000011011111;
		rom[96] = 16'b0000000011100000;
		rom[97] = 16'b0000000011100001;
		rom[98] = 16'b0000000011100010;
		rom[99] = 16'b0000000011100011;
		rom[100] = 16'b0000000011100100;
		rom[101] = 16'b0000000011100101;
		rom[102] = 16'b0000000011100110;
		rom[103] = 16'b0000000011100111;
		rom[104] = 16'b0000000011101000;
		rom[105] = 16'b0000000011101001;
		rom[106] = 16'b0000000011101010;
		rom[107] = 16'b0000000011101011;
		rom[108] = 16'b0000000011101100;
		rom[109] = 16'b0000000011101101;
		rom[110] = 16'b0000000011101110;
		rom[111] = 16'b0000000011101111;
		rom[112] = 16'b0000000011110000;
		rom[113] = 16'b0000000011110001;
		rom[114] = 16'b0000000011110010;
		rom[115] = 16'b0000000011110011;
		rom[116] = 16'b0000000011110100;
		rom[117] = 16'b0000000011110101;
		rom[118] = 16'b0000000011110110;
		rom[119] = 16'b0000000011110111;
		rom[120] = 16'b0000000011111000;
		rom[121] = 16'b0000000011111001;
		rom[122] = 16'b0000000011111010;
		rom[123] = 16'b0000000011111011;
		rom[124] = 16'b0000000011111100;
		rom[125] = 16'b0000000011111101;
		rom[126] = 16'b0000000011111110;
		rom[127] = 16'b0000000011111111;
		rom[128] = 16'b0000000001111111;
		rom[129] = 16'b0000000001111110;
		rom[130] = 16'b0000000001111101;
		rom[131] = 16'b0000000001111100;
		rom[132] = 16'b0000000001111011;
		rom[133] = 16'b0000000001111010;
		rom[134] = 16'b0000000001111001;
		rom[135] = 16'b0000000001111000;
		rom[136] = 16'b0000000001110111;
		rom[137] = 16'b0000000001110110;
		rom[138] = 16'b0000000001110101;
		rom[139] = 16'b0000000001110100;
		rom[140] = 16'b0000000001110011;
		rom[141] = 16'b0000000001110010;
		rom[142] = 16'b0000000001110001;
		rom[143] = 16'b0000000001110000;
		rom[144] = 16'b0000000001101111;
		rom[145] = 16'b0000000001101110;
		rom[146] = 16'b0000000001101101;
		rom[147] = 16'b0000000001101100;
		rom[148] = 16'b0000000001101011;
		rom[149] = 16'b0000000001101010;
		rom[150] = 16'b0000000001101001;
		rom[151] = 16'b0000000001101000;
		rom[152] = 16'b0000000001100111;
		rom[153] = 16'b0000000001100110;
		rom[154] = 16'b0000000001100101;
		rom[155] = 16'b0000000001100100;
		rom[156] = 16'b0000000001100011;
		rom[157] = 16'b0000000001100010;
		rom[158] = 16'b0000000001100001;
		rom[159] = 16'b0000000001100000;
		rom[160] = 16'b0000000001011111;
		rom[161] = 16'b0000000001011110;
		rom[162] = 16'b0000000001011101;
		rom[163] = 16'b0000000001011100;
		rom[164] = 16'b0000000001011011;
		rom[165] = 16'b0000000001011010;
		rom[166] = 16'b0000000001011001;
		rom[167] = 16'b0000000001011000;
		rom[168] = 16'b0000000001010111;
		rom[169] = 16'b0000000001010110;
		rom[170] = 16'b0000000001010101;
		rom[171] = 16'b0000000001010100;
		rom[172] = 16'b0000000001010011;
		rom[173] = 16'b0000000001010010;
		rom[174] = 16'b0000000001010001;
		rom[175] = 16'b0000000001010000;
		rom[176] = 16'b0000000001001111;
		rom[177] = 16'b0000000001001110;
		rom[178] = 16'b0000000001001101;
		rom[179] = 16'b0000000001001100;
		rom[180] = 16'b0000000001001011;
		rom[181] = 16'b0000000001001010;
		rom[182] = 16'b0000000001001001;
		rom[183] = 16'b0000000001001000;
		rom[184] = 16'b0000000001000111;
		rom[185] = 16'b0000000001000110;
		rom[186] = 16'b0000000001000101;
		rom[187] = 16'b0000000001000100;
		rom[188] = 16'b0000000001000011;
		rom[189] = 16'b0000000001000010;
		rom[190] = 16'b0000000001000001;
		rom[191] = 16'b0000000001000000;
		rom[192] = 16'b0000000000111111;
		rom[193] = 16'b0000000000111110;
		rom[194] = 16'b0000000000111101;
		rom[195] = 16'b0000000000111100;
		rom[196] = 16'b0000000000111011;
		rom[197] = 16'b0000000000111010;
		rom[198] = 16'b0000000000111001;
		rom[199] = 16'b0000000000111000;
		rom[200] = 16'b0000000000110111;
		rom[201] = 16'b0000000000110110;
		rom[202] = 16'b0000000000110101;
		rom[203] = 16'b0000000000110100;
		rom[204] = 16'b0000000000110011;
		rom[205] = 16'b0000000000110010;
		rom[206] = 16'b0000000000110001;
		rom[207] = 16'b0000000000110000;
		rom[208] = 16'b0000000000101111;
		rom[209] = 16'b0000000000101110;
		rom[210] = 16'b0000000000101101;
		rom[211] = 16'b0000000000101100;
		rom[212] = 16'b0000000000101011;
		rom[213] = 16'b0000000000101010;
		rom[214] = 16'b0000000000101001;
		rom[215] = 16'b0000000000101000;
		rom[216] = 16'b0000000000100111;
		rom[217] = 16'b0000000000100110;
		rom[218] = 16'b0000000000100101;
		rom[219] = 16'b0000000000100100;
		rom[220] = 16'b0000000000100011;
		rom[221] = 16'b0000000000100010;
		rom[222] = 16'b0000000000100001;
		rom[223] = 16'b0000000000100000;
		rom[224] = 16'b0000000000011111;
		rom[225] = 16'b0000000000011110;
		rom[226] = 16'b0000000000011101;
		rom[227] = 16'b0000000000011100;
		rom[228] = 16'b0000000000011011;
		rom[229] = 16'b0000000000011010;
		rom[230] = 16'b0000000000011001;
		rom[231] = 16'b0000000000011000;
		rom[232] = 16'b0000000000010111;
		rom[233] = 16'b0000000000010110;
		rom[234] = 16'b0000000000010101;
		rom[235] = 16'b0000000000010100;
		rom[236] = 16'b0000000000010011;
		rom[237] = 16'b0000000000010010;
		rom[238] = 16'b0000000000010001;
		rom[239] = 16'b0000000000010000;
		rom[240] = 16'b0000000000001111;
		rom[241] = 16'b0000000000001110;
		rom[242] = 16'b0000000000001101;
		rom[243] = 16'b0000000000001100;
		rom[244] = 16'b0000000000001011;
		rom[245] = 16'b0000000000001010;
		rom[246] = 16'b0000000000001001;
		rom[247] = 16'b0000000000001000;
		rom[248] = 16'b0000000000000111;
		rom[249] = 16'b0000000000000110;
		rom[250] = 16'b0000000000000101;
		rom[251] = 16'b0000000000000100;
		rom[252] = 16'b0000000000000011;
		rom[253] = 16'b0000000000000010;
		rom[254] = 16'b0000000000000001;
		rom[255] = 16'b0000000000000000;
	end
	
	assign sel = inp[9:2];
	
	always@(*)
	begin
		if (inp > 511)
			outp <= 16'b0000000100000000;
		else if (inp < -511)
			outp <= 16'b0000000000000000;
		else
			outp <= rom [sel];
	end
endmodule
