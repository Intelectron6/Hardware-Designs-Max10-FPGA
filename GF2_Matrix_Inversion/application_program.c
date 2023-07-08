#include "sys/alt_stdio.h"
#include "sys/alt_stdio.h"
#include "system.h"
#include "io.h"
#include <stdio.h>
#include <unistd.h>
#include <time.h>

int main()
{ 
	int input_vector, extra_inputs, extra_outputs;
	int output_vector;

	////Test case 1: Input = CA31 => Output = 7F31
	input_vector = 0xFFFFFFFF;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	input_vector = 0x0000CA31;
	extra_inputs=0x1;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	printf("Sending input to HW %d\n", input_vector);

	input_vector = 0x00000001;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	extra_inputs=0xF;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	while (1)
	{
		output_vector = IORD(USER_OUTPUT_BASE, 0);
		IOWR(USER_INPUT_1_BASE, 0, output_vector);
		if (output_vector == 0x00000001) break;
	}

	extra_inputs=0x2;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	output_vector = IORD(USER_OUTPUT_BASE, 0);
	printf("Received output from HW %d\n", output_vector);

	usleep(1); //1 us delay

	////Test case 2: Input = 8421 => Output = 8421
	input_vector = 0xFFFFFFFF;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	input_vector = 0x00008421;
	extra_inputs=0x1;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	printf("Sending input to HW %d\n", input_vector);

	input_vector = 0x00000001;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	extra_inputs=0xF;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	while (1)
	{
		output_vector = IORD(USER_OUTPUT_BASE, 0);
		IOWR(USER_INPUT_1_BASE, 0, output_vector);
		if (output_vector == 0x00000001) break;
	}

	extra_inputs=0x2;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	output_vector = IORD(USER_OUTPUT_BASE, 0);
	printf("Received output from HW %d\n", output_vector);
	
	usleep(1); //1 us delay
	IOWR(USER_INPUT_1_BASE, 0, 0xFFFFFFFF);
	return 0;
}
