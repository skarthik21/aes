`timescale 1ns/1ns
`include "aes.v"

module aestb;

reg clk;
reg[127:0] keyin,statein;

wire[127:0] out,keyout;

aes a(out,keyout,keyin,statein,clk);

initial begin
  clk = 0;

  $dumpfile("aes.vcd");
  $dumpvars(0,aestb);
  statein = 128'h 54776f204f6e65204e696e652054776f;
  keyin = 128'h 5468617473206d79204b756e67204675;
  #100;
  $display("keyout");

end

endmodule