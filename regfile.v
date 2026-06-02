`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:17:54
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input we,                 // write enable
    input [4:0] ra1,          // read address 1
    input [4:0] ra2,          // read address 2
    input [4:0] wa,           // write address
    input [31:0] wd,          // write data
    output [31:0] rd1,        // read data 1
    output [31:0] rd2         // read data 2
);

reg [31:0] regs[0:31];       // 32 registers
integer i;

initial
begin
    for(i = 0; i < 32; i = i + 1)
        regs[i] = 0;
end

assign rd1 = (ra1 == 0) ? 32'b0 : regs[ra1];
assign rd2 = (ra2 == 0) ? 32'b0 : regs[ra2];

always @(posedge clk)
begin
    if(we && wa != 0)
        regs[wa] <= wd;
end

endmodule