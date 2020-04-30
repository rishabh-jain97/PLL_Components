`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 12:14:48 AM
// Design Name: 
// Module Name: pll_top
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


module pll_top

    (input x_in,input rst, input fref, input fdiv, output [19:0] dac
    );
    
    wire phase_error;  
    wire rst_debounce;
    
    //debounce the reset signal  
    debouncer debounce(.signal(rst),.clk(fref),.signal_out(rst_debounce)); 
    
    //phase detector to determine phase error  
    phase_detector pd(.x_in(x_in),.rst(rst_debounce),.fref(fref), .fdiv(fdiv), .dir(phase_error));
    
    pi_filter filter(.rst(rst_debounce),.x(phase_error),.clk(fref),.dac(dac));   
    
    
endmodule
