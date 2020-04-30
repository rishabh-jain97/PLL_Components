`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2018 12:50:30 PM
// Design Name: 
// Module Name: Debouncer
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


module debouncer 
    #(parameter divider = 10)(input signal, input clk_in, 
    output signal_out
    );

    // input signal is the actual signals to be debounced.
    // output sungal_out is the clean debounced signals.
    // this circuit will divide down the input clock and if the signal in is held high for
    //at least one clock cycle of the divided clock, it will be outputted for one pulse (one clock cycle)
    
    //example: if input clock is 1Mhz and divider is 1000000, the signal must be held high for 1 second for it to be considered "stable" 
    //the signal will then be outputted for one clock cycle of the didvided clock (1hz / 1 second)
    
    wire signal_Q1;
    wire signal_Q2;
    
    wire signal_Q2_bar;
    
    wire clk_divided;
    
    Debounce_Clock_Div #(divider) div(clk_in, clk_divided);
    
    Flip_Flop signal_Cap_One (clk_divided, signal, signal_Q1);
    Flip_Flop signal_Cap_Two (clk_divided, signal_Q1, signal_Q2);
    
    assign signal_Q2_bar = ~signal_Q2;
    
    //the signal will be outputted high for one clock pulse of the divided clk
    assign signal_out = signal_Q1 & signal_Q2_bar;
     
    endmodule
    
    
     module Flip_Flop(input FF_Clk, input D, output reg Q);
    
        always @(posedge FF_Clk) 
            begin
                
                Q <= D;   
        end
    endmodule
    
    
    
    
    module Debounce_Clock_Div #(parameter divider = 1000)(clk_in, clk_out
        );
    input clk_in; // input clock
    output reg clk_out; // output clock after dividing the input clock by divisor
    reg[27:0] counter=28'd0;
    
    // The frequency of the output clk_out
    //  = The frequency of the input clk_in divided by divider
    
    always @(posedge clk_in)
    begin
        counter <= counter + 28'd1;
        
        if(counter>=(divider-1))
            counter <= 28'd0;
      
        if (counter <= divider/2)
            clk_out <=1'b0;
            
        else if (counter > divider/2)
            clk_out <=1'b1;
        
    end
endmodule
