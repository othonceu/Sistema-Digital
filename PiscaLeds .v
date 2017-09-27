module PiscaLeds(
	input CLOCK_50,
	input[3:0] KEY,
	input [9:0]SW,
	output [7:0] LEDG,
	output [9:0] LEDR

);
   reg [25:0] cont = 0;
	reg luz;
	
	assign LEDG = luz;
	assign LEDR = SW;
	
	always @(posedge CLOCK_50) begin 
	  
	  if (cont == 50000000)  begin
			luz = ~luz;
			cont = 0;
	  end 
	  else begin
	    cont = cont + 1;
	  end
	    
	end
	
endmodule 


module testbench;
	
	wire led;
	reg clk = 0;
	
	PiscaLeds Leds1(clk, led);
	
	always #50000  clk = ~clk;

	initial begin
    $dumpvars;
    clk <= 0;
    #100000;
   
	 $finish;
  end

endmodule




