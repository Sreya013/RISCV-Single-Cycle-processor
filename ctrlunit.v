`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:24:52
// Design Name: 
// Module Name: ctrlunit
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


module control_unit(
input [6:0] opcode,
input [2:0] funct3,
input [6:0] funct7,

output reg reg_write,
output reg mem_write,
output reg mem_read,
output reg alu_src,
output reg mem_to_reg,
output reg branch,
output reg jump,
output reg jalr,
output reg lui,
output reg auipc,
output reg [3:0] alu_ctrl
);

always @(*)
begin

reg_write = 0;
mem_write = 0;
mem_read = 0;
alu_src = 0;
mem_to_reg = 0;
branch = 0;
jump = 0;
jalr = 0;
lui = 0;
auipc = 0;
alu_ctrl = 4'b0000;

case(opcode)

7'b0110011:
begin
reg_write = 1;

case({funct7,funct3})

10'b0000000000: alu_ctrl = 4'b0000;
10'b0100000000: alu_ctrl = 4'b0001;
10'b0000000111: alu_ctrl = 4'b0010;
10'b0000000110: alu_ctrl = 4'b0011;
10'b0000000100: alu_ctrl = 4'b0100;
10'b0000000001: alu_ctrl = 4'b0101;
10'b0000000101: alu_ctrl = 4'b0110;
10'b0100000101: alu_ctrl = 4'b0111;
10'b0000000010: alu_ctrl = 4'b1000;
10'b0000000011: alu_ctrl = 4'b1001;

endcase

end


7'b0010011:
begin
reg_write = 1;
alu_src = 1;
end


7'b0000011:
begin
reg_write = 1;
mem_read = 1;
mem_to_reg = 1;
alu_src = 1;
end


7'b0100011:
begin
mem_write = 1;
alu_src = 1;
end


7'b1100011:
begin
branch = 1;
end


7'b1101111:
begin
jump = 1;
reg_write = 1;
end


7'b1100111:
begin
jalr = 1;
reg_write = 1;
alu_src = 1;
end


7'b0110111:
begin
lui = 1;
reg_write = 1;
end


7'b0010111:
begin
auipc = 1;
reg_write = 1;
end


endcase

end

endmodule
