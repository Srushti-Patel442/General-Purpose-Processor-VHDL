# General Purpose Processor (VHDL)

An 8-bit General Purpose Processor designed in VHDL and implemented on an FPGA. The processor integrates a register unit, finite state machine, decoder, arithmetic logic unit (ALU), and seven-segment display to execute arithmetic and logical operations through microcoded control signals.

---

## Overview

This project demonstrates the complete design, simulation, and implementation of a simple processor architecture using VHDL. Individual hardware modules were developed independently before being integrated into a complete datapath capable of executing arithmetic and logical instructions on an FPGA.

---

## Preview

### Processor Architecture

> Add block diagram here

![Architecture](images/architecture.png)

### FPGA Implementation

> Add image of the complete processor or FPGA setup here

![Processor](images/processor.png)

---

## Status

Completed as part of a Digital Systems project with successful simulation, integration, and FPGA implementation. Future improvements include expanding the instruction set and implementing memory support.

---

## Features

- Custom 8-bit processor architecture
- Modular VHDL design
- Register-based datapath
- Moore Finite State Machine control unit
- 4×16 decoder for microcode generation
- Arithmetic Logic Unit (ALU)
- Seven-segment display driver
- Functional simulation and waveform verification
- FPGA implementation using Intel Quartus Prime

---

## Architecture

The processor consists of five primary hardware modules:

- Register Unit
- Finite State Machine (FSM)
- 4×16 Decoder
- Arithmetic Logic Unit (ALU)
- Seven-Segment Display Driver

The FSM generates control signals that are decoded into microcode instructions, allowing the ALU to execute arithmetic and logical operations before displaying results on the FPGA.

---

## Supported Operations

### Arithmetic

- Addition
- Subtraction

### Logical

- NOT
- NAND
- NOR
- AND
- XOR
- OR
- XNOR

Additional instruction sets were also implemented through alternate ALU configurations.

---

## Technologies

- VHDL
- Intel Quartus Prime
- FPGA Development Board
- Digital Logic Design
- Moore Finite State Machines

---

## Project Structure

```text
General-Purpose-Processor/
│
├── src/
│   ├── alu.vhd
│   ├── decoder.vhd
│   ├── fsm.vhd
│   ├── latch1.vhd
│   ├── latch2.vhd
│   ├── seg7.vhd
│   └── top_level.vhd
│
├── simulation/
│
├── images/
│
└── README.md
```

---

## Results

The processor was successfully verified through simulation and FPGA testing.

Testing included:

- Register loading
- State transitions
- Decoder output validation
- ALU arithmetic operations
- ALU logical operations
- Seven-segment display output
- Complete processor integration

Waveform analysis confirmed correct timing and synchronization between processor modules.

---

## Future Work

- Expand the instruction set
- Add register file support
- Implement RAM and instruction memory
- Add branching and jump instructions
- Design a programmable instruction pipeline
- Develop a simple assembler for custom programs

---

## Author

**Srushti Patel**

Computer Engineering Student

Toronto Metropolitan University
