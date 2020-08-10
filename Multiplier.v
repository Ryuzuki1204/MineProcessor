
////////////////////////////////////////// full adder
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

///////////////////////////////////////// Ripple carry adder
module Module_RCA(
    input [3:0] A,              // input 1
    input [3:0] B,              // input 2
    output [3:0] Res,            // result or output
    output C                   // the last carry generated
    );

    wire C0;                   // Carry bits
    wire C1;
    wire C2;

    Module_FA fa0(A[0], B[0], 1'b0, Res[0], C0);
    Module_FA fa1(A[1], B[1], C0, Res[1], C1);
    Module_FA fa3(A[2], B[2], C1, Res[2], C2);
    Module_FA fa4(A[3], B[3], C2, Res[3], C);

endmodule
///////////////////////////////////////// 4-bit multiplier
module Module_mul4(
	input [3:0] A,
	input [3:0] B,
	output [7:0] P
	);
	
	wire [3:0] Augend0, Addend0, Sum0;
	wire C0;
	wire [3:0] Augend1, Addend1, Sum1;
	wire C1;
	wire[3:0] Augend2, Addend2, Sum2;
	
	and(P[0], B[0], A[0]);
	and(Augend0[0], B[0], A[1]);
	and(Augend0[1], B[0], A[2]);
	and(Augend0[2], B[0], A[3]);
	assign Augend0[3] = 0;
	
	and(Addend0[0], B[1], A[0]);
	and(Addend0[1], B[1], A[1]);
	and(Addend0[2], B[1], A[2]);
	and(Addend0[3], B[1], A[3]);
	
	Module_RCA rca0(Augend0, Addend0, Sum0, C0);
	assign P[1] = Sum0[0];
	
	assign Augend1[0] = Sum0[1];
	assign Augend1[1] = Sum0[2];
	assign Augend1[2] = Sum0[3];
	assign Augend1[3] = C0;
	
	and(Addend1[0], B[2], A[0]);
	and(Addend1[1], B[2], A[1]);
	and(Addend1[2], B[2], A[2]);
	and(Addend1[3], B[2], A[3]);
	
	Module_RCA rc1(Augend1, Addend1, Sum1, C1);
	assign P[2] = Sum1[0];
	
	assign Augend2[0] = Sum1[1];
	assign Augend2[1] = Sum1[2];
	assign Augend2[2] = Sum1[3];
	assign Augend2[3] = C1;
	
	and(Addend2[0], B[3], A[0]);
	and(Addend2[1], B[3], A[1]);
	and(Addend2[2], B[3], A[2]);
	and(Addend2[3], B[3], A[3]);
	
	Module_RCA rc2(Augend2, Addend2, P[6:3], P[7]);
	
endmodule
	