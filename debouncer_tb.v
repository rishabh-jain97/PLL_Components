`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2020 08:04:25 PM
// Design Name: 
// Module Name: debouncer_tb
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


module debouncer_tb(
    );
    
  reg clk; 
  reg signal; 
  wire signal_out;
    
    
 debouncer deb(signal,clk,signal_out);   
    
 always begin #1 clk = ~clk; end
 
 initial begin 
 clk = 1'b0;
 signal = 1;
 
 #10 
 #10
 
 
 $finish;
 end
 endmodule

