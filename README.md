# VSCode Debugger using the N-Queens Solver example in C++

This repository contains a C++ implementation of the **N-Queens** problem, along with the necessary configuration files to set up a debugging environment using VSCode.

## Problem Overview

The **N-Queens** problem involves placing `N` queens on an `N×N` chessboard such that no two queens can attack each other. Queens can attack any piece in the same row, column, or diagonal. The task is to find one solution to this problem (if it exists).

## How the Algorithm Works

- **Backtracking Algorithm**: This solution uses recursion and backtracking to place queens on the board row by row. It checks if placing a queen in a particular column is safe by ensuring no other queen exists in the same column, or diagonal.
- **Dynamic Board Representation**: The chessboard is dynamically represented using a 2D vector.

## Files in This Repository
- **`nqueens.cpp`**: The main C++ file that implements the N-Queens solver.
- **`launch.json`**: The configuration file for running the VSCode debugger with GDB.
- **`tasks.json`**: The build task configuration for compiling the C++ code using g++.

## Setup

### 1. Compiling and Running

To compile the program using VSCode:

1. Open this project folder in VSCode.
2. Ensure that `g++` is installed on your system.
3. Press `Ctrl+Shift+B` to build the project, which will compile `nqueens.cpp`.
4. Run the program by using the Run and Debug panel (`Ctrl+Shift+D`), and select the `(gdb) Launch` configuration to run with the debugger.

Alternatively, compile and run manually:
```bash
g++ -g -o nqueens nqueens.cpp
./nqueens
```
### 2. Debugging with VSCode
To debug the program:

1. Set breakpoints in nqueens.cpp by clicking to the left of the line numbers in the editor.
2. Press F5 to start the debugger, which will build and run the program.
3. Use the debugger controls (F10, F11, F5) to step through the code.


## Debugging Information

### Locals and Memory Inspection

- **Local Variables**:

You will see variables like `col`, `row`, and `this` in the **Locals** section. These variables represent the current row and column being processed, and `this` points to the current instance of the `ChessBoard` class.

Expanding `this` will show the `size` of the chessboard and the current state of the `board`, which is a 2D vector.


- **Inspecting the Chess Board**:

The board is represented as a 2D vector `board` where `1` denotes a queen and `0` denotes an empty space. You can expand `this` in the debugger to view the entire chessboard structure during the recursive placement of queens.


### Registers and CPU Information

When the program hits a breakpoint, you will see CPU registers in the Registers section of the debugger. These include:
- **General Purpose Registers**: `rax`, `rbx`, `rcx`, etc., which store intermediate results of operations.
- **Segment Registers**: `cs`, `ds`, etc., which reference specific segments of memory (though rarely needed in modern programs).
- **Floating Point (FPU) Registers**: Used for decimal arithmetic.
- **SSE and AVX Registers**: Used for vectorized operations (relevant for multimedia or large-scale data processing).


### Useful Debugging Tips

- **Step Into (F11):** Use this to step into recursive function calls such as `solveNQueens`.
- **Step Over (F10):** Use this to move over lines without stepping into function calls.
- **Watch Expressions**: Add variables like `board`, `row`, or `col` to the **Watch** panel to track how they change as the recursion progresses.
- **Conditional Breakpoints**: Right-click on a breakpoint and set a condition (e.g., `row == 3`) to stop only when specific conditions are met.

### Example Use Case

You can set breakpoint in lines `46`, `68` and `89` inside the `solveNQueens` function and inspect how the queens are being placed on the board. By examining the `board` variable through the `this` pointer, you can observe how backtracking occurs when an invalid position is detected.


## GDB and VSCode Debugger Configuration

### `launch.json` Configuration

The `launch.json` file contains the necessary settings to run the GDB debugger in VSCode.


### `tasks.json` Configuration

The `tasks.json` file automates the build process, compiling the program using g++.

 ### These 2 files need to be stored inside `.vscode/` for the debugger to work.