# Hardware-Designs-Max10-FPGA
Basic digital hardware designs that are synthesized and implemented on Max10 FPGA using Intel Quartus Prime Lite and ModelSim Altera. </br>
The designs are first verified traditionally using test-bench and tested using scan-chain (not always exhaustively). <br/>
They are then wrapped using a standard interfacing system and interfaced with NIOS-II processor using Platform Designer (formerly Qsys). </br>
Eclipse IDE is used to write C-codes that illustrate how these (and similar) hardware designs can be used in practical applications. </br>

1) 4x4 Matrix Inversion over Galois Field 2
2) XOR Neural Network using 16-bit Fixed Point Representation and LUT-based Sigmoid Function
3) 4-tap Low Pass FIR Filter using 16-bit Fixed Point Representation

Note: Max-10 FPGA and compatible USB power cable and USB-Blaster are necessary. Refer to Intel website for tutorials on how to use the tools and the devices. Similar steps can be followed for other Intel FPGAs as well.
