`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:26:44
// Design Name: 
// Module Name: branchunit
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


module branch_unit(
input branch,
input zero,
input less_than,
input [2:0] funct3,
output reg take_branch
);

always @(*)
begin

case(funct3)

3'b000: take_branch = branch & zero;        // BEQ
3'b001: take_branch = branch & ~zero;       // BNE
3'b100: take_branch = branch & less_than;   // BLT
3'b101: take_branch = branch & ~less_than;  // BGE

default: take_branch = 0;

endcase

end

endmodule