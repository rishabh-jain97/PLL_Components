`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 04:38:01 PM
// Design Name: 
// Module Name: pi_adder
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


module integral_adder 
    #(parameter I =10000)(input rst, input x, input clk, 
    output reg [19:0] ki_add, output reg [19:0] ki_sub
    );
 
 
     //to assure no delay of this module, the output will be of two register 
     //one is the stored value + the desired shift 
     //the other is the stored value - the desired shift 


    reg [19:0] adder = 0;
    
    //active low reset
    always @ (*) begin
    
        if (!rst) begin 
            ki_sub =0;
            ki_add = I;
        end

    //adder is the register which contains the current total of the integrator filter
    //if adder = 0, then z_sub should remain zero 
        else begin 
            if (adder ==0) begin
                ki_sub = 0; 
                ki_add = adder +I;
            end
    
            else begin
                ki_sub = adder -I;
                ki_add = adder + I;
            end
        end
    end 
    
    
    always @ (posedge clk or negedge rst) 
    begin 
    
        if (!rst) begin
            adder <= 0; 
        end   
        
    
        else begin 
        
            if (x) begin 
    
                //if the phase detector produces a 1, increase adder but only up to the limit    
                if ((adder + I) >= 1048575)
                    adder <= 1048575 - I;
        
            else
                adder <= adder + I; 
            end
        
        //else x =0 from PD
        
           //if adders = 0, then substracting by A would result in a negative number so just keep as 0 
            else if (adder < I) 
                adder <= 0;
          
          
                // if adder != 0 and the phase detector output is zero, subsract normally
            else if (adder != 0)  
               adder <= adder - I;
        
     
        end
   end

endmodule
