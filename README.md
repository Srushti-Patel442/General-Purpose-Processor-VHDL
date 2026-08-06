# General Purpose Processor (VHDL)

An 8-bit General Purpose Processor designed and implemented in VHDL, integrating a register unit, finite state machine, decoder, arithmetic logic unit (ALU), and seven-segment display into a modular processor architecture deployed on an FPGA.

---

## Overview

The General Purpose Processor is a custom digital processor developed using VHDL to demonstrate the design, simulation, and implementation of a modular processor architecture. The project integrates multiple hardware components—including a register unit, finite state machine, decoder, arithmetic logic unit, and display driver—into a complete datapath capable of executing arithmetic and logical operations.

The processor was verified through waveform simulation in Intel Quartus Prime before being successfully deployed on an FPGA development board.

---

## Features

- Custom 8-bit processor architecture designed in VHDL
- Modular register unit for operand storage
- Moore finite state machine for processor control
- 4×16 decoder for instruction and control signal generation
- Arithmetic Logic Unit supporting arithmetic and logical operations
- Seven-segment display output for result visualization
- Functional simulation using waveform analysis
- FPGA implementation and hardware verification

---

## Tech Stack

| Category | Technologies |
|----------|--------------|
| Hardware Description Language | VHDL |
| FPGA Design | Intel Quartus Prime |
| Hardware Platform | Intel Cyclone II FPGA |
| Digital Design | Finite State Machines, ALU Design, Register Architecture |
| Verification | Waveform Simulation |

---

## Processor Components

### Register Unit

- Stores two 8-bit operands
- Synchronous data loading using clocked registers

### Control Unit

- Moore Finite State Machine
- Generates processor control signals for instruction execution

### Decoder

- 4×16 decoder used for instruction decoding and microcode generation

### Arithmetic Logic Unit

Supported operations include:

- Addition
- Subtraction
- AND
- OR
- XOR
- XNOR
- NAND
- NOR
- NOT

### Display Unit

- Displays processor output using dual seven-segment displays

---

## Verification

The processor was verified through simulation and FPGA implementation.

Testing included:

- Register loading
- FSM state transitions
- Decoder functionality
- Arithmetic operations
- Logical operations
- Seven-segment display output
- Complete processor integration

---

## Installation

Clone the repository:

```bash
git clone https://github.com/Srushti-Patel442/General-Purpose-Processor-VHDL.git
```

Open the project using Intel Quartus Prime and compile the design before programming the FPGA development board.

---

## Roadmap

- Expand the processor instruction set
- Add register file support
- Integrate RAM and instruction memory
- Implement branching and jump instructions
- Develop a simple instruction execution pipeline

---

## Author

**Srushti Patel**
