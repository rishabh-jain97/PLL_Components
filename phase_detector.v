`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2019 10:54:05 AM
// Design Name: 
// Module Name: phase_detector
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


module phase_detector(input x_in,input rst, input fref, input fdiv, output wire dir
    );
    
wire Q_ref,Q_fb,clear; 
wire up,dn,dn1;
wire clear1;

wire dir_1,dir_2;

ff feed_back(x_in,clear,fdiv,Q_fb);
ff reference(1'b1,clear,fref,Q_ref);



assign clear1 = (Q_ref & Q_fb);
assign clear = ~(~rst | clear1);
assign up = (Q_ref & ~Q_fb);
assign dn = (~Q_ref & Q_fb);

nor (dir_1 , up , dir_2 );
nor (dir_2 , dn , dir_1 );

assign dir = dir_2;
    
endmodule
