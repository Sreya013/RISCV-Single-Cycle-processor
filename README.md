# Single Cycle RISC-V RV32I Processor

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20Vivado-orange)

## Overview
A fully functional Single Cycle RISC-V RV32I Processor designed and 
implemented in Verilog HDL. This processor executes one instruction per 
clock cycle and supports the complete RV32I base integer instruction set.

## Architecture
The processor is built using a classic single-cycle datapath with the 
following modules:

| Module | File | Description |
|--------|------|-------------|
| Top Level CPU | `RISCV32CPU.v` | Top-level integration module |
| CPU Datapath | `cpu_top.v` | Main datapath connections |
| ALU | `alu.v` | Arithmetic & Logic Unit |
| Control Unit | `ctrlunit.v` | Instruction decoder & control signals |
| Register File | `regfile.v` | 32 x 32-bit general purpose registers |
| Instruction Memory | `instrmem.v` | ROM for instruction storage |
| Data Memory | `datamem.v` / `data_mem.v` | RAM for load/store operations |
| Immediate Generator | `immgen.v` | Immediate value sign extension |
| Branch Unit | `branchunit.v` | Branch condition evaluation |
| Performance Counter | `perfcounter.v` | Cycle and instruction counters |
| Testbench | `tb_cpu.v` | Functional verification testbench |

## Supported Instructions
- **R-Type:** ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU
- **I-Type:** ADDI, ANDI, ORI, XORI, SLTI, LW, JALR
- **S-Type:** SW
- **B-Type:** BEQ, BNE, BLT, BGE
- **U-Type:** LUI, AUIPC
- **J-Type:** JAL

## Tools Used
- **HDL:** Verilog
- **Simulator:** Xilinx Vivado 2024
- **Target:** Functional Simulation

## How to Run Simulation
1. Open Xilinx Vivado
2. Create a new project and add all `.v` files as sources
3. Set `tb_cpu.v` as the simulation top module
4. Run Behavioral Simulation
5. Observe waveforms in the Vivado simulator

## Key Learnings
- Single-cycle datapath design and implementation
- RISC-V ISA (RV32I) instruction encoding and decoding
- Control unit design for multi-format instruction support
- RTL design methodology using Verilog HDL

## Author
**Sreya** — B.Tech ECE, Sreenidhi Institute of Science and Technology  
GitHub: [@Sreya013](https://github.com/Sreya013)
