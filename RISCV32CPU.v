`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:12:18
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,                 // system clock
    input rst,                 // reset signal
    input halt,                // halt control (for ECALL/EBREAK support)
    input [31:0] pc_next,      // next PC value from control logic
    output reg [31:0] pc       // current PC value
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        pc <= 32'b0;           // reset PC to address 0
    else if (!halt)
        pc <= pc_next;         // update PC normally
end

endmodule