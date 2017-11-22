module PiscaLeds(
	input CLOCK_50,
	input[3:0] KEY,
	input [9:0]SW,
	output reg[7:0] LEDG,
	output reg[9:0] LEDR

);
reg[31:0] counter;
reg[3:0] soma = 1;
reg state;
reg state2;
wire r = state;
wire w = state2;


always @(posedge CLOCK_50)
begin
	if(counter <=(50000000 *2))
	begin
		counter <= counter + soma;
	end
	else
	begin
		counter <= 0;
		state <= ~state;
		//r = ~r;
	end
		if(SW[0])
			begin
				 LEDR[0] = r;
				 soma = 100;
				 LEDR[1] = ~r;
				 soma = 100;
				 LEDR[2] = r;
				 soma = 100;
				 LEDR[3] = ~r;
				 soma = 100;
				 LEDR[4] = r;
				 soma = 100;
				 LEDR[5] = ~r;
				 soma = 100;
				 LEDR[6] = r;
				 soma = 100;
				 LEDR[7] = ~r;
				 soma = 100;
				 LEDR[8] = r;
				 soma = 100;
				 LEDR[9] = ~r;
				 soma = 100;
				 LEDG[0] = ~r;
				 soma = 100;
				 LEDG[1] = r;
				 soma = 100;
				 LEDG[2] = ~r;
				 soma = 100;
				 LEDG[3] = r;
				 soma = 100;
				 LEDG[4] = ~r;
				 soma = 100;
				 LEDG[5] = r; 
				 soma = 100;
				 LEDG[6] = ~r; 
				 soma = 100;
				 LEDG[7] = r ;
				 soma = 100;
		end
		
		else
			begin
				 LEDR[0] = r;
				 soma = 1;
				 LEDR[1] = ~r;
				 soma = 1;
				 LEDR[2] = r;
				 soma =  1;
				 LEDR[3] = ~r;
				 soma = 1;
				 LEDR[4] = r;
				 soma = 1;
				 LEDR[5] = ~r;
				 soma = 1;
				 LEDR[6] = r;
				 soma = 1;
				 LEDR[7] = w;
				 soma = 1;
				 LEDR[8] = r;
				 soma = 1;
				 LEDR[9] = w;
				 soma = 1;
				 LEDG[0] = ~r;
				 soma = 1;
				 LEDG[1] = r;
				 soma = 1;
				 LEDG[2] = ~r;
				 soma = 1;
				 LEDG[3] = r;
				 soma = 1;
				 LEDG[4] = ~r;
				 soma = 1;
				 LEDG[5] = r; 
				 soma = 1;
				 LEDG[6] = w; 
				 soma = 1;
				 LEDG[7] = r ;
				 soma = 1;
		end
		if(SW[2])
		begin
			LEDR[0] = r;
				 soma = 500000;
				 LEDR[1] = ~r;
				 soma = 500000;
				 LEDR[2] = r;
				 soma = 500000;
				 LEDR[3] = ~r;
				 soma = 1;
				 LEDR[4] = r;
				 soma = 1;
				 LEDR[5] = w;
				 soma = 1;
				 LEDR[6] = r;
				 soma = 1;
				 LEDR[7] = ~r;
				 soma = 1;
				 LEDR[8] = r;
				 soma = 1;
				 LEDR[9] = w;
				 soma = 1;
				 LEDG[0] = ~r;
				 soma = 1;
				 LEDG[1] = ~w;
				 soma = 1;
				 LEDG[2] = ~r;
				 soma = 1;
				 LEDG[3] = r;
				 soma = 1;
				 LEDG[4] = ~r;
				 soma = 15000;
				 LEDG[5] = r; 
				 soma = 1;
				 LEDG[6] = ~r; 
				 soma = 150000;
				 LEDG[7] = r ;
				 soma = 1;
		end
	if(counter == 25000000)
	begin 
		state2 <= ~state2;
	end
		
	
end
endmodule
