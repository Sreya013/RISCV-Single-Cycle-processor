`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2026 00:13:48
// Design Name: 
// Module Name: tb_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_cpu();

reg clk;
reg rst;

wire [7:0] leds;

cpu_top uut(
.clk(clk),
.rst(rst),
.leds(leds)
);

always #5 clk = ~clk;

initial
begin

clk = 0;
rst = 1;

#20 rst = 0;

#5000 $finish;

end

endmodule