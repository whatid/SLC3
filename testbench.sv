module testbench; 

timeunit 10ns; 
timeprecision 1ns; 

	logic [15:0] S; 
	logic	Clk;
	logic Reset;
	logic Run;
	logic Continue;


	slc3_tb processor(.*); 

	always begin: CLOCK_GENERATION
	#1 Clk = ~Clk; 
	end

	initial begin: CLOCK_INITIALIZATION
		Clk = 0; 
	end

	initial begin: TEST_VECTORS

	Reset = 1 ; 
	Run = 1; 
	Continue = 1;
	S = 16'h3; 
	
	#2 Reset = 0; 
	
	#2 Reset = 1; 
	
	#3 Run = 0; 
	#5 Continue = 0;
   #10 S = 16'h5;
	#12 Continue = 1;
	#13 Continue = 0;

	
	

	end

endmodule 