#include <iostream>
#include <vector>
using namespace std;

// Chessboard class that holds the state of the board and manages the queen placements
class ChessBoard {
private:
    int size;
    vector<vector<int>> board;

    // Helper function to check if a queen can be placed at board[row][col]
    bool isSafe(int row, int col) {
        // Check this column on upper rows
        for (int i = 0; i < row; i++) {
            if (board[i][col] == 1) {
                return false;
            }
        }

        // Check upper left diagonal
        for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
            if (board[i][j] == 1) {
                return false;
            }
        }

        // Check upper right diagonal
        for (int i = row, j = col; i >= 0 && j < size; i--, j++) {
            if (board[i][j] == 1) {
                return false;
            }
        }

        return true;
    }

    // Recursive function to solve the N-Queens problem
    bool solveNQueens(int row) {
        // Base case: If all queens are placed
        if (row >= size) {
            return true;
        }

        // Consider this row and try placing the queen in all columns one by one
        for (int col = 0; col < size; col++) {
            if (isSafe(row, col)) {
                // Place the queen
                board[row][col] = 1;

                // Recur to place the rest of the queens
                if (solveNQueens(row + 1)) {
                    return true;
                }

                // Backtrack if placing queen doesn't lead to a solution
                board[row][col] = 0;
            }
        }

        return false; // No place is safe in this row
    }

public:
    // Constructor
    ChessBoard(int n) : size(n), board(n, vector<int>(n, 0)) {}

    // Function to initiate the solving process
    bool solve() {
        if (!solveNQueens(0)) {
            cout << "Solution does not exist" << endl;
            return false;
        }

        printSolution();
        return true;
    }

    // Function to print the solution
    void printSolution() {
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                cout << (board[i][j] == 1 ? "Q " : ". ");
            }
            cout << endl;
        }
    }
};

int main() {
    int n;
    cout << "Enter the size of the chessboard: ";
    cin >> n;

    ChessBoard board(n);

    if (!board.solve()) {
        cout << "No solution found for " << n << "-Queens." << endl;
    }

    return 0;
}
