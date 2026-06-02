`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2026 00:06:13
// Design Name: 
// Module Name: simple_io
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


module simple_io(
    input clk,
    input rst,
    input [31:0] cpu_data,
    input write_enable,
    output reg [7:0] leds
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        leds <= 8'b00000000;        // reset LEDs

    else if (write_enable)
        leds <= cpu_data[7:0];      // lower 8 bits sent to LEDs
end

endmodule