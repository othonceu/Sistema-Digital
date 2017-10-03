
module sing(
    input [11:0] PTX,
    input [11:0] PTY,

    input [11:0] P1X,
    input [11:0] P1Y,

    input [11:0] P2X,
    input [11:0] P2Y,

    output sin
);

    wire signed [11:0] Sub1;
    wire signed [11:0] Sub2;
    wire signed [11:0] Sub3;
    wire signed [11:0] Sub4;

    wire signed [22:0] Sub5;

    wire signed [22:0] Mult1;
    wire signed [22:0] Mult2;


    assign Sub1 = PTX - P2X;
    assign Sub2 = P1Y - P2Y;
    assign Sub3 = P1X - P2X;
    assign Sub4 = PTY - P2Y;

    assign Mult1 = Sub1 * Sub2;
    assign Mult2 = Sub3 * Sub4;

    assign Sub5 = Mult1 - Mult2;

    assign sin = (Sub5 >= 0) ? 1 : 0;

endmodule

module PointInTriangle(
    input clk,
    input [11:0] PTX,
    input [11:0] PTY,

    output inTriangle
);
    reg [11:0] P1X;
    reg [11:0] P1Y;

    reg [11:0] P2X;
    reg [11:0] P2Y;

    reg [11:0] P3X;
    reg [11:0] P3Y;

    reg [2:0] count = 0;

    wire sin1;
    wire sin2;
    wire sin3;

    sing S1(PTX, PTY, P1X, P1Y, P2X, P2Y, sin1);
    sing S2(PTX, PTY, P2X, P2Y, P3X, P3Y, sin2);
    sing S3(PTX, PTY, P3X, P3Y, P1X, P1Y, sin3);

    assign inTriangle = (sin1 == sin2 && sin2 == sin3) ? 1 : 0;

    always @ (clk) begin
            if(count == 0) begin
                P1X = -6;
                P1Y = -1;

                P2X =  3;
                P2Y =  3;

                P3X =  3;
                P3Y = -3;

                count <= count + 1;
            end

            if(count == 1) begin
                P1X =  20;
                P1Y = -2;

                P2X =  -1;
                P2Y =   8;

                P3X =  20;
                P3Y =  12;

                count <= count + 1;
            end

            if(count == 2) begin
                P1X =  -17;
                P1Y =  -4;

                P2X =     5;
                P2Y =   15;

                P3X =  -43;
                P3Y =   20;

                count <= 0;
            end
    end

endmodule

module test;

    reg [11:0] PTX;
    reg [11:0] PTY;

    reg clk;

    wire InTriangle;

    PointInTriangle P(clk , PTX, PTY, InTriangle);


    initial begin
        $dumpvars(0, P);
        #1
        clk <= 1;
        PTX <= -3;
        PTY <= 3;
        #1
        PTX <= -14;
        PTY <=  12;
        #10

        #1
        clk <= 0;
        PTX <= -3;
        PTY <= 3;
        #1
        PTX <= -14;
        PTY <=  12;
        #10

        #1
        clk <= 1;
        PTX <= -3;
        PTY <= 3;
        #1
        PTX <= -14;
        PTY <=  12;
        #10
        $finish;
    end
endmodule
