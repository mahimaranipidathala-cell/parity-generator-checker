# 4-Bit Parity Generator and Checker – Verilog

## Description

A **4-bit Even Parity Generator and Checker** designed using Verilog HDL.

The parity generator produces an even parity bit for 4-bit input data, while the parity checker detects whether the received data contains a parity error.

## Features

* 4-bit data input
* Even parity generation
* Parity error detection
* XOR-based implementation
* Combinational logic design
* Verilog testbench included
* Simulation output included

## Folder Structure

```text
Parity-Generator-Checker-Verilog/
│
├── src/
│   └── parity_generator_checker.v
│
├── tb/
│   └── parity_generator_checker_tb.v
│
├── output/
│   └── output.txt
│
└── README.md
```

## Inputs

| Signal            | Width | Description         |
| ----------------- | ----: | ------------------- |
| `data_in`         | 4-bit | Input data          |
| `received_parity` | 1-bit | Received parity bit |

## Outputs

| Signal             | Width | Description               |
| ------------------ | ----: | ------------------------- |
| `generated_parity` | 1-bit | Generated even parity bit |
| `error`            | 1-bit | Indicates parity error    |

## Even Parity

For even parity, the total number of `1`s in the data and parity bit must be even.

The generated parity is calculated using XOR:

```text
generated_parity = data_in[3] ^ data_in[2] ^ data_in[1] ^ data_in[0]
```

The error checker uses:

```text
error = data_in[3] ^ data_in[2] ^ data_in[1] ^ data_in[0] ^ received_parity
```

### Error Meaning

| Error | Meaning               |
| ----- | --------------------- |
| `0`   | No parity error       |
| `1`   | Parity error detected |

## Example

For:

```text
Data = 1010
```

Number of `1`s = 2.

Therefore:

```text
Generated parity = 0
```

Correct transmission:

```text
1010 + 0
```

If the receiver gets:

```text
1010 + 0
```

then:

```text
Error = 0
```

If the receiver gets:

```text
1010 + 1
```

then:

```text
Error = 1
```

## Simulation

This project can be simulated using **Icarus Verilog**.

### Compile

```bash
iverilog -o parity_sim src/parity_generator_checker.v tb/parity_generator_checker_tb.v
```

### Run

```bash
vvp parity_sim
```

### Save Output

```bash
vvp parity_sim > output/output.txt
```

## Expected Output

```text
==============================================
       4-BIT PARITY GENERATOR & CHECKER
==============================================
Time    Data    Generated       Received        Error
                Parity          Parity
----------------------------------------------
10      0000    0               0               0
20      0001    1               1               0
30      0011    0               0               0
40      0101    0               0               0
50      0111    1               1               0
60      1001    0               0               0
70      1010    0               1               1
80      1111    0               0               0
----------------------------------------------
Error = 0 -> No parity error
Error = 1 -> Parity error detected
----------------------------------------------
           SIMULATION COMPLETED
==============================================
```

## Learning Outcomes

This project demonstrates:

* XOR gates
* Parity generation
* Error detection
* Combinational logic
* Verilog continuous assignments
* Testbench development
* Digital communication concepts
* Simulation and verification

## Applications

Parity checking is commonly used for simple error detection in:

* Digital communication
* Data transmission
* Serial communication
* Memory systems
* Computer networks

## Future Improvements

The project can be extended to:

* 8-bit parity generator
* Odd parity generation
* Multiple-bit error detection
* UART parity implementation
* FPGA implementation

## Author

**Nikhila**

## License

This project is created for educational and learning purposes.
