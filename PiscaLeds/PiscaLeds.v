module PiscaLeds(
	input clk,
	output led
);

assign led = clk;

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
