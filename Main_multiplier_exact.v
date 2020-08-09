`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:48:53 03/19/2020 
// Design Name: 
// Module Name:    Main_multiplier 
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
module Main_multiplier_exact(
    input [7:0] A,
    input [7:0] B,
    output [15:0] Res_out
    );
	 
wire [9:0] PW1,PW2,PW3,PW4; //Wires that will hold the values of the partial products
wire [9:0] C1,C2,C3;  //Wires to hold the carry out generated while adding partial products
wire [9:0] PRW1,PRW2; //Wires that hold the added or reduced partial products

//Generating four partial products
Module_EA_1 P1 (A,B[0],B[1],PW1); //Exact Adder
Module_EA_1 P2 (A,B[2],B[3],PW2);  
Module_EA_1 P3 (A,B[4],B[5],PW3); 
Module_EA_1 P4 (A,B[6],B[7],PW4);

//Adding the partial products P1 and P2
assign Res_out[1:0] = PW1[1:0];
Module_FA f12_1 (PW1[2],PW2[0],1'b0,Res_out[2],C1[0]);
Module_FA f12_2 (PW1[3],PW2[1],C1[0],Res_out[3],C1[1]);
Module_FA f12_3 (PW1[4],PW2[2],C1[1],PRW1[0],C1[2]);
Module_FA f12_4 (PW1[5],PW2[3],C1[2],PRW1[1],C1[3]);
Module_FA f12_5 (PW1[6],PW2[4],C1[3],PRW1[2],C1[4]);
Module_FA f12_6 (PW1[7],PW2[5],C1[4],PRW1[3],C1[5]);
Module_FA f12_7 (PW1[8],PW2[6],C1[5],PRW1[4],C1[6]);
Module_FA f12_8 (PW1[9],PW2[7],C1[6],PRW1[5],C1[7]);
Module_FA f12_9 (1'b0,PW2[8],C1[7],PRW1[6],C1[8]);
Module_FA f12_10 (1'b0,PW2[9],C1[8],PRW1[7],C1[9]);
assign PRW1[8] = C1[9];
assign PRW1[9] = 1'b0;

//Adding PRW1 and P3
Module_FA f23_1 (PRW1[0],PW3[0],1'b0,Res_out[4],C2[0]);
Module_FA f23_2 (PRW1[1],PW3[1],C2[0],Res_out[5],C2[1]);
Module_FA f23_3 (PRW1[2],PW3[2],C2[1],PRW2[0],C2[2]);
Module_FA f23_4 (PRW1[3],PW3[3],C2[2],PRW2[1],C2[3]);
Module_FA f23_5 (PRW1[4],PW3[4],C2[3],PRW2[2],C2[4]);
Module_FA f23_6 (PRW1[5],PW3[5],C2[4],PRW2[3],C2[5]);
Module_FA f23_7 (PRW1[6],PW3[6],C2[5],PRW2[4],C2[6]);
Module_FA f23_8 (PRW1[7],PW3[7],C2[6],PRW2[5],C2[7]);
Module_FA f23_9 (PRW1[8],PW3[8],C2[7],PRW2[6],C2[8]);
Module_FA f23_10 (PRW1[9],PW3[9],C2[8],PRW2[7],C2[9]);
assign PRW2[8] = C2[9];
assign PRW2[9] = 1'b0;

//Adding PRW2 and PW4
Module_FA f34_1 (PRW2[0],PW4[0],1'b0,Res_out[6],C3[0]);
Module_FA f34_2 (PRW2[1],PW4[1],C3[0],Res_out[7],C3[1]);
Module_FA f34_3 (PRW2[2],PW4[2],C3[1],Res_out[8],C3[2]);
Module_FA f34_4 (PRW2[3],PW4[3],C3[2],Res_out[9],C3[3]);
Module_FA f34_5 (PRW2[4],PW4[4],C3[3],Res_out[10],C3[4]);
Module_FA f34_6 (PRW2[5],PW4[5],C3[4],Res_out[11],C3[5]);
Module_FA f34_7 (PRW2[6],PW4[6],C3[5],Res_out[12],C3[6]);
Module_FA f34_8 (PRW2[7],PW4[7],C3[6],Res_out[13],C3[7]);
Module_FA f34_9 (PRW2[8],PW4[8],C3[7],Res_out[14],C3[8]);
Module_FA f34_10 (PRW2[9],PW4[9],C3[8],Res_out[15],C3[9]);

endmodule 