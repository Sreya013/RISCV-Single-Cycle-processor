`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:36:33
// Design Name: 
// Module Name: perfcounter
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


module perf_counter(
input clk,
input rst,
input enable,
output reg [31:0] cycle_count,
output reg [31:0] instr_count
);

always @(posedge clk or posedge rst)
begin

if(rst)
begin
cycle_count <= 0;
instr_count <= 0;
end

else
begin
cycle_count <= cycle_count + 1;

if(enable)
instr_count <= instr_count + 1;
end

end

endmodule