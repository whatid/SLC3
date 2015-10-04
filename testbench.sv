module testbench; 

timeunit 10ns; 
timeprecision 1ns; 

	
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
	
	#2 Reset = 0; 
	
	#2 Reset = 1; 
	
	#3 Run = 0; 
	#5 Continue = 0; 

	
	

	end

endmodule 