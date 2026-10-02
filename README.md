# Single Cycle RISC-V RV32I Processor

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20Vivado-orange)

# RISC-V Single-Cycle Processor

This project is a 32-bit single-cycle RISC-V processor designed using Verilog HDL and implemented in Xilinx Vivado.

## About the Project

The processor is based on the RV32I instruction set and follows a single-cycle datapath. The main modules include:

- Program Counter
- Instruction Memory
- Register File
- ALU
- Control Unit
- Immediate Generator
- Data Memory
- Branch Unit
- Performance Counter
- Simple I/O

The processor was tested using simulation and waveform analysis in Vivado.

## Instructions

The design supports instructions from different RISC-V formats including:

- R-type
- I-type
- S-type
- B-type
- U-type
- J-type

Some of the tested instructions include ADD, SUB, ADDI, LW, SW, BEQ, JAL, LUI and AUIPC.

## Static Timing Analysis

I also performed post-implementation Static Timing Analysis using Xilinx Vivado.

- Target FPGA: Artix-7
- Device: xc7a100tcsg324-1
- Clock constraint: 10 ns (100 MHz)
- WNS: +1.675 ns
- WHS: +0.287 ns
- TNS: 0 ns
- THS: 0 ns
- Timing violations: 0

During synthesis, I faced an issue with the `program.mem` file used for instruction memory initialization. I checked the synthesis warnings, added the memory file to the appropriate project sources, and reran synthesis successfully.

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator
- Artix-7 FPGA

## Files

The repository contains the Verilog source files, testbench, instruction memory file and timing constraint file.



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
