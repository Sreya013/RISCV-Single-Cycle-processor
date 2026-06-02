`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2026 23:39:54
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(
input clk,
input rst,
output [7:0] leds
);

wire [31:0] pc;
wire [31:0] pc_next;
wire [31:0] instruction;

wire reg_write;
wire mem_write;
wire mem_read;
wire alu_src;
wire mem_to_reg;
wire branch;
wire jump;
wire jalr;
wire lui;
wire auipc;

wire [3:0] alu_ctrl;

wire [31:0] rd1;
wire [31:0] rd2;
wire [31:0] imm;

wire [31:0] alu_b;
wire [31:0] alu_result;

wire [31:0] mem_data;

wire zero;
wire less_than;

wire branch_taken;

wire [31:0] cycle_count;
wire [31:0] instr_count;


/* PROGRAM COUNTER */

pc PC(
.clk(clk),
.rst(rst),
.halt(1'b0),
.pc_next(pc_next),
.pc(pc)
);


/* INSTRUCTION MEMORY */

instr_mem IMEM(
.addr(pc),
.instruction(instruction)
);


/* CONTROL UNIT */

control_unit CU(
.opcode(instruction[6:0]),
.funct3(instruction[14:12]),
.funct7(instruction[31:25]),

.reg_write(reg_write),
.mem_write(mem_write),
.mem_read(mem_read),
.alu_src(alu_src),
.mem_to_reg(mem_to_reg),
.branch(branch),
.jump(jump),
.jalr(jalr),
.lui(lui),
.auipc(auipc),
.alu_ctrl(alu_ctrl)
);


/* REGISTER FILE */

regfile RF(
.clk(clk),
.we(reg_write),
.ra1(instruction[19:15]),
.ra2(instruction[24:20]),
.wa(instruction[11:7]),
.wd(alu_result),
.rd1(rd1),
.rd2(rd2)
);


/* IMMEDIATE GENERATOR */

immgen IMM(
.instr(instruction),
.imm(imm)
);


/* ALU INPUT SELECT */

assign alu_b =
(alu_src) ? imm : rd2;


/* ALU */

alu ALU(
.a(rd1),
.b(alu_b),
.alu_ctrl(alu_ctrl),
.result(alu_result),
.zero(zero),
.less_than(less_than)
);


/* DATA MEMORY */

data_mem DMEM(
.clk(clk),
.mem_write(mem_write),
.mem_read(mem_read),
.addr(alu_result),
.wd(rd2),
.rd(mem_data)
);


/* BRANCH UNIT */

branch_unit BU(
.branch(branch),
.zero(zero),
.less_than(less_than),
.funct3(instruction[14:12]),
.take_branch(branch_taken)
);


/* NEXT PC LOGIC */

assign pc_next =
(branch_taken) ? pc + imm :
(jump) ? pc + imm :
(jalr) ? rd1 + imm :
pc + 4;


/* PERFORMANCE COUNTER */

perf_counter PERF(
.clk(clk),
.rst(rst),
.enable(1'b1),
.cycle_count(cycle_count),
.instr_count(instr_count)
);


/* SIMPLE IO (LED OUTPUT) */

simple_io IO(
.clk(clk),
.rst(rst),
.cpu_data(alu_result),
.write_enable(mem_write && alu_result == 32'hFFFF0000),
.leds(leds)
);

endmodule
