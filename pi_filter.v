`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 05:33:44 PM
// Design Name: 
// Module Name: pi_filter
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


module pi_filter
    (
    input rst,x,clk, output reg [19:0] dac
    );

    //this is the proportional gain
    localparam [19:0] p_gain = 5;
    wire [19:0] ki_add;
    wire [19:0] ki_sub;

    //this module contains the integrator which will increment or decrement 
    //at every clock cycle 
    //the max value has been calibrated to 20 bits
    //integrator module
    integral_adder integral_adder
        (.rst(rst),.x(x),.clk(clk),.ki_add(ki_add),.ki_sub(ki_sub)
        );


    //always @ (x or rst or ki_add or ki_sub )
    
    //always @ (posedge clk or negedge rst)
    always @ (posedge clk or negedge rst)
    begin  
    
        if (!rst) 
            dac <=0;
            
        else begin 
        //if the PD output is 1 check if we hit max value (2^20)
        //if max value than stay there 
        //else add normally 
            if (x) begin 
    
                if ((dac + ki_add) >= 1048575 )
                    dac <= 1048575;
    
                else
                    dac <= ki_add + p_gain;
                end 
    
    
        //if the value of the integrator is smaller than the proportional gain 
        //and we see a zero fron the PD, just keep the value at 0 because no negatives are wanted 
        //else susbtract from integrator value as needed 
            else if (!x) begin 
                if (ki_sub < p_gain)
                    dac <= 0; 
                else 
                    dac <= ki_sub - p_gain;
            end
        end
    
    end

endmodule
