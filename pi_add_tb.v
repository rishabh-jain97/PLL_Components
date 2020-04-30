`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 05:05:25 PM
// Design Name: 
// Module Name: pi_add_tb
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


module pi_add_tb();

reg rst,x,clk;
wire [19:0] ki_add, ki_sub;
integral_adder add_boi(rst,x,clk,ki_add,ki_sub);

always begin #1 clk= ~clk; end

initial begin 

clk = 1'b0;
rst = 1'b0;
x = 1'b0; 

#10 
rst = 1'b1;
x = 1'b1;

#100

x = 1'b0;
#100
rst = 1'b0;
x = 1'b0;
#100 
rst = 1'b1;

$finish;
end
endmodule


