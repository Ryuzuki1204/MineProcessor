// Decoder3to8 Sample Testbench Code
module test();
  reg [2:0] opcode, E;
  wire [7:0] Res;
  decoder dec(.opcode(opcode), .E(E), .Res(Res));
  
  initial begin
    
    $display("Input 100b.");
    opcode[2:0] = 3'b100;
    E = 1'b1;
    display;

  end
  
  task display;
    #1 $display("Input: %0b, Output:%0b",
                opcode[2:0], Res[7:0]);
  endtask

endmodule
