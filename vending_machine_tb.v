`timescale 1ns/1ns
`include "vending_machine.v"

module vending_machine_tb;
reg clk;
reg[1:0] in;
reg rst;

wire out;
wire[1:0] change;

vending_machine uut(.clk(clk),.rst(rst),.in(in),.out(out),.change(change));

initial begin
    $dumpfile("vending_machine_tb.vcd");
    $dumpvars(0,vending_machine_tb);
rst = 1;
clk = 0;

#8  rst  = 0;
    in = 1;
#14 in = 1;
#18 in = 1;
#28 $finish;

end

always #5 clk = ~clk;

endmodule