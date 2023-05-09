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
	usleep(1); //1 us delay

	input_vector = 0x0000CA31;
	extra_inputs=0x1;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	usleep(1); //1 us delay

	input_vector = 0x00000001;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	usleep(1); //1 us delay

	extra_inputs=0xF;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	while (1)
	{
	usleep(1); //1 us delay
	output_vector = IORD(USER_OUTPUT_BASE, 0);
	IOWR(USER_INPUT_1_BASE, 0, output_vector);
	usleep(1); //1 us delay
	if (output_vector == 0x00000001) break;
	}

	extra_inputs=0x2;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	output_vector = IORD(USER_OUTPUT_BASE, 0);

	for(int i = 0; i < 5; i++)
	{
	  IOWR(USER_INPUT_1_BASE, 0, output_vector>>8); //display 7F on LEDs
	  usleep(1000000); //1 second delay
	  IOWR(USER_INPUT_1_BASE, 0, output_vector); //display 31 on LEDs
	  usleep(1000000); //1 second delay
	}

    ////Test case 2: Input = 8421 => Output = 8421
	input_vector = 0xFFFFFFFF;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	usleep(1); //1 us delay

	input_vector = 0x00008421;
	extra_inputs=0x1;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	usleep(1); //1 us delay

	input_vector = 0x00000001;
	extra_inputs=0x0;
	IOWR(USER_INPUT_0_BASE, 0, input_vector);
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	usleep(1); //1 us delay

	extra_inputs=0xF;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);

	while (1)
	{
		usleep(1); //1 us delay
		output_vector = IORD(USER_OUTPUT_BASE, 0);
		IOWR(USER_INPUT_1_BASE, 0, output_vector);
		usleep(1); //1 us delay
		if (output_vector == 0x00000001) break;
	}

	extra_inputs=0x2;
	IOWR(USER_EXTRA_INPUTS_BASE, 0, extra_inputs);
	output_vector = IORD(USER_OUTPUT_BASE, 0);

	for(int i = 0; i < 5; i++)
	{
		IOWR(USER_INPUT_1_BASE, 0, output_vector>>8); //display 84 on LEDs
		usleep(1000000); //1 second delay
		IOWR(USER_INPUT_1_BASE, 0, output_vector); //display 21 on LEDs
		usleep(1000000); //1 second delay
	}

	IOWR(USER_INPUT_1_BASE, 0, 0xFFFFFFFF);
	return 0;
}

