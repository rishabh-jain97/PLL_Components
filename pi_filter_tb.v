`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 05:51:12 PM
// Design Name: 
// Module Name: pi_filter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pi_filter_tb(  );

reg rst,x,clk;
wire [19:0] dac;

pi_filter pi_boi(rst,x,clk, dac);

always begin #1 clk= ~clk; end

initial begin 

clk = 1'b0;
rst = 1'b1;
x = 1'b1; 

#4 
x=1'b0;

#10 
rst = 1'b1;
x = 1'b0;

#100
rst=1;
x = 1'b1;
#100
rst=1'b0;
#20
rst=1'b1;
#100
x=1'b0;
#150
x=1'b1;
#20
x = 1'b0;
#220
#200
x=1'b1;
#200
$finish;
end

endmodule
