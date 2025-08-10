# 8-bit Arithmetic Logic Unit (ALU)

## Project Overview
This repository contains the design and implementation of an 8-bit Arithmetic Logic Unit (ALU) capable of performing basic arithmetic and logic operations including addition, subtraction, multiplication, and modulo. The project is developed using Verilog HDL and includes detailed documentation of the control logic through ASM charts, state diagrams, and register operations.

## Features
- **8-bit Input Operands**: Operates on two 8-bit binary numbers.
- **Operations Supported**:
  - Addition
  - Subtraction
  - Multiplication
  - Modulo
- **Control Unit**: Designed using ASM (Algorithmic State Machine) chart to manage operation sequencing.
- **State Diagram**: Visual representation of the ALU states during operation execution.
- **Register Operations**: Detailed handling of operand storage, intermediate results, and output registers.

  ## Getting Started

### Prerequisites
- Hardware Description Language (HDL) simulator (e.g., EDA playground,ModelSim, Vivado Simulator)
- FPGA development board (optional) (e.g., Vivado)

## Project Structure
1. Register Transfer Operations
Your FSM has 4 states: t0, t1, t2, t3.
For each clock cycle:

State	Operation Type	Register Transfers
t0	Addition	A ← ain ; B ← bin ; OUT ← A + B
t1	Subtraction	A ← ain ; B ← bin ; OUT ← A - B
t2	Multiplication	A ← ain ; B ← bin ; OUT ← A × B
t3	Modulus	A ← ain ; B ← bin ; OUT ← A % B

2. State Diagram
      +-----+    s=1     +-----+    s=1     +-----+    s=1     +-----+
   | t0  | ---------> | t1  | ---------> | t2  | ---------> | t3  |
   +-----+            +-----+            +-----+            +-----+
     ^                  |                  |                  |
     |   s=0            | s=0              | s=0              | s=0
     +------------------+------------------+------------------+
Reset → t0

On s=1, FSM moves to the next state.

On s=0, FSM stays in the current state.

3. ASM Chart (Algorithmic State Machine)
           ┌──────────────────────────┐
        │ Reset: pstate ← t0        │
        └──────────┬───────────────┘
                   │
              ┌────▼────┐
              │  t0     │
              │ A←ain   │
              │ B←bin   │
              │ OUT←A+B │
              └────┬────┘
          s=1 /    │    \ s=0
              ┌────▼────┐
              │  t1     │
              │ A←ain   │
              │ B←bin   │
              │ OUT←A-B │
              └────┬────┘
          s=1 /    │    \ s=0
              ┌────▼────┐
              │  t2     │
              │ A←ain   │
              │ B←bin   │
              │ OUT←A×B │
              └────┬────┘
          s=1 /    │    \ s=0
              ┌────▼────┐
              │  t3     │
              │ A←ain   │
              │ B←bin   │
              │ OUT←A%B │
              └────┬────┘
                   │ s=1
                   └──────> back to t0
