`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2019 11:50:23 AM
// Design Name: 
// Module Name: pd_tb
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


module top_tb();

reg rst,fref,fdiv;
wire [19:0] dac;
pll_top topper(rst,fref,fdiv,dac
    );

//ff moop(1'b1,rst,fref,dir);

always begin #1 fref = ~fref; end
always begin #4 fdiv = ~fdiv; end

initial begin 
fref = 1'b0;
rst = 1'b0;
fdiv = 1'b0; 

#10 
rst = 1'b1;

    #100


$finish;
end
endmodule
