	.file	"assemblyTest.cpp"								; Name of original source file.
	.text													; Start of actual code.
	.globl	_Z4fivev										; Make function available globally.
	.type	_Z4fivev, @function								; Mark _Z4fivev as a function.
_Z4fivev:													; Label where the function starts.
.LFB0:														; Mark function beginning.
	.cfi_startproc											; Mark start of function's stack frame.
	endbr64													; Ensure valid branch to the function.
	pushq	%rbp											; Push current value of base pointer onto the stack.
	.cfi_def_cfa_offset 16									; Tell the debugger that the new stack frame is 16 bytes larger.
	.cfi_offset 6, -16										; Tell the debugger that the %rbp register (ID=6) was pushed onto the stack and is now located at an offset -16 from the current stack pointer (%rsp).
	movq	%rsp, %rbp										; Move %rsp to base pointer register, establishing a new frame.
	.cfi_def_cfa_register 6									; Tell the debugger that %rbp is now the register holding the base of the current function's stack frame.
	movl	$5, -4(%rbp)									; Move the value 5 into the memory location -4(%rbp), which means an offset of 4 from base pointer.
	movl	-4(%rbp), %eax									; Move the value stored in -4(%rbp) into the %eax, which is the register used to hold the return value of a function.
	popq	%rbp											; Restore %rbp by popping it off the stack, cleaning the stack frame.
	.cfi_def_cfa 7, 8										; Tell the debugger that the %rsp register (ID=7) has been restored, and the current offset is 8 bytes.
	ret														; Return control to the calling function.
	.cfi_endproc											; Terminate the function.
.LFE0:														; Mark the end of the function.
	.size	_Z4fivev, .-_Z4fivev							; Tell the assembler the size of the function by substracting the address of its start from its end.
	.globl	main											; Declare new function, same as before.
	.type	main, @function									; Same as before
main:														; Same as before
.LFB1:														; Same as before
	.cfi_startproc											; Same as before
	endbr64													; Same as before
	pushq	%rbp											; Same as before
	.cfi_def_cfa_offset 16									; Same as before
	.cfi_offset 6, -16										; Same as before
	movq	%rsp, %rbp										; Same as before
	.cfi_def_cfa_register 6									; Same as before
	call	_Z4fivev										; Call the function by jumping to the address labeled _Z4fivev.
	movl	$0, %eax										; Move the value 0 (return value of main) into the %eax register.
	popq	%rbp											; Same as before
	.cfi_def_cfa 7, 8										; Same as before
	ret														; Same as before
	.cfi_endproc											; Same as before
.LFE1:														; Same as before
	.size	main, .-main									; Same as before
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"	; Show version of compiler.
	.section	.note.GNU-stack,"",@progbits				; Tell the assembler to create a stack-related section which is non-executable.
	.section	.note.gnu.property,"a"						; Tell the assembler to create a section holding GNU properties, used by the linker and OS to store info about hardware capabilities.
	.align 8												; Align data on an 8-byte boundary for performance reasons.
	.long	1f - 0f											; Declaration of a 4-byte value to be stored in memory.
	.long	4f - 1f											; Same as before, with a different offset.
	.long	5												; Store value 5.
0:															; Label for relative addressing.
	.string	"GNU"											; Store the string "GNU" in memory.
1:															; Label for relative addressing.
	.align 8												; Align data on an 8-byte boundary for performance reasons.
	.long	0xc0000002										; 4-byte number in hexadecimal. 
	.long	3f - 2f
2:															; Label for relative addressing.
	.long	0x3
3:															; Label for relative addressing.
	.align 8												; Align data on an 8-byte boundary for performance reasons.
4:															; Label for relative addressing.
