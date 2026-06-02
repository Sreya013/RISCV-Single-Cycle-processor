`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2026 00:04:04
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input clk,
    input mem_write,
    input mem_read,
    input [31:0] addr,
    input [31:0] wd,
    output reg [31:0] rd
);

reg [31:0] mem [0:255];   // 256-word memory

// READ operation
always @(*)
begin
    if(mem_read)
        rd = mem[addr[9:2]];
    else
        rd = 32'b0;
end

// WRITE operation
always @(posedge clk)
begin
    if(mem_write)
        mem[addr[9:2]] <= wd;
end

endmodule