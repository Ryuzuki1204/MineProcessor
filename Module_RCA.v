`timescale 1ns / 1ps

// Create Date:    16:46:51 08/09/2020 

module Module_RCA(
    input [3:0] A,              // input 1
    input [3:0] B,              // input 2
    output [3:0] Res            // result or output
    output C;                   // the last carry generated
    );

    wire C0;                   // Carry bits
    wire C1;
    wire C2;

    Module_FA fa0(A[0], B[0], 1'b0, Res[0], C0);
    Module_FA fa1(A[1], B[1], C0, Res[1], C1);
    Module_FA fa3(A[2], B[2], C1, Res[2], C2);
    Module_FA fa4(A[3], B[3], C2, Res[3], C);

endmodule
