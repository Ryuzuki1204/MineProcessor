`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:40 08/11/2020 
// Design Name: 
// Module Name:    parallel_register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 4 bit wide and 1 bit long register
//
//////////////////////////////////////////////////////////////////////////////////
module parallel_register(
    input clk,
    input enable,
    input [3:0] Inp,
    output [3:0] Outp
    );

	// Declare the parallel register
	reg [3:0] sr;

	// Shift everything over, load the incoming bit
	always @ (posedge clk)
	begin
		if (enable == 1'b1)
		begin
			sr <= Inp;
		end
	end

	// Catch the outgoing bit
	assign Outp = sr;

endmodule
