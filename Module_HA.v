`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:35 04/07/2020 
// Design Name: 
// Module Name:    Module_HA 
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
module Module_HA(
    input A,
    input B,
    output S,
    output C
    );

//Calculating sum
xor g1(S,A,B);

//Calculating carry
and g2(C,A,B);

endmodule
