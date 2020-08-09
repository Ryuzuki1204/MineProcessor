`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:17:38 03/19/2020 
// Design Name: 
// Module Name:    Module_FA 
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
module Module_FA(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );

wire W1,W2,W3,W4;

//To calculate the sum
xor g1(W1,A,B);
xor g2(Sum,W1,Cin);

//To calculate the carry
or g3(W2,A,B);
and g4(W3,W2,Cin);
and g5(W4,A,B);
or g6(Cout,W3,W4);

endmodule
