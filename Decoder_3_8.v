//3 to 8 Decoder CU
//Active High
`timescale 1ns / 1ps
module decoder(
  input [2:0] opcode, E,
  output [7:0] Res);
  
  assign Res[0] = E &  ~opcode[2] & ~opcode[1] & ~opcode[0]; //000 Addition
  assign Res[1] = E &  ~opcode[2] & ~opcode[1] & opcode[0]; //001 Subtraction
  assign Res[2] = E &  ~opcode[2] & opcode[1] & ~opcode[0]; //010 MUltiplcation
  assign Res[3] = E &  ~opcode[2] & opcode[1] & opcode[0]; //011 Division
  assign Res[4] = E &  opcode[2] & ~opcode[1] & ~opcode[0]; //100 Move
  assign Res[5] = E &  opcode[2] & ~opcode[1] & opcode[0]; //101
  assign Res[6] = E &  opcode[2] & opcode[1] & ~opcode[0]; //110
  assign Res[7] = E &  opcode[2] & opcode[1] & opcode[0]; //111
  
endmodule