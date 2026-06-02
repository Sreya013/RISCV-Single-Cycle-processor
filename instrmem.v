`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:14:55
// Design Name: 
// Module Name: instrmem
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


module instr_mem(
    input [31:0] addr,          // address from PC
    output [31:0] instruction   // fetched instruction
);

reg [31:0] mem[0:255];         // instruction memory (256 words)

initial
begin
    $readmemh("program.mem", mem);
end

assign instruction = mem[addr[9:2]];

endmodule