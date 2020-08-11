`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:55 08/11/2020 
// Design Name: 
// Module Name:    Module_Adder_Subtractor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Module_Adder_Subtractor(
    input [3:0] A,
    input [3:0] B,
	 input subtract_enable,
    output [3:0] Res,
	 output Cout
    );

wire [3:0] B1;

xor(B1[0],B[0],subtract_enable);
xor(B1[1],B[1],subtract_enable);
xor(B1[2],B[2],subtract_enable);
xor(B1[3],B[3],subtract_enable);

assign {Cout,Res} = A + B1 + subtract_enable;
 

endmodule
