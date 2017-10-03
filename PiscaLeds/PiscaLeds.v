module PiscaLeds(
	input CLOCK_50,
	input[3:0] KEY,
	input [9:0]SW,
	output [7:0] LEDG,
	output [9:0] LEDR

);
reg[31:0] counter;
reg[3:0] soma=1;

always @(posedge CLOCK_50)
begin
	if(counter<=50000000)
	begin
		counter<= counter+soma;
	end
	else
	begin
		counter<=0;
		LEDR[0]<=~LEDR[0];
	end
		if(SW[0]==1)
		begin
			soma=10;
		end
		if(SW[1]==1)
		begin
			soma=30;
		end
		if(SW[2]==1)
		begin
			soma=60;
		end
	if(counter == 25000000)
	begin 
		LEDG <=~LEDG;
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
