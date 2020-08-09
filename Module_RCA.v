`timescale 1ns / 1ps

// Create Date:    16:46:51 08/09/2020 

module Module_RCA(
    input [3:0] A,              // input 1
    input [3:0] B,              // input 2
    output [3:0] Res            // result or output
    );

    wire [3:0] C;                   // Carry bits

Module_HA g1(A[0],B[0],Res[0],C[0]);
Module_FA g2(A[1],B[1],C[0],Res[1],C[1]);
Module_FA g3(A[2],B[2],C[1],Res[2],C[2]);
Module_FA g4(A[3],B[3],C[2],Res[3],C[3]);

endmodule
