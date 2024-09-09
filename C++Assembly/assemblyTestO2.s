	.file	"assemblyTest.cpp"								; Name of original source file.
	.text													; Start of actual code.
	.p2align 4												; Align data on an 16-byte boundary for performance reasons.
	.globl	_Z4fivev										; Make function available globally.
	.type	_Z4fivev, @function								; Mark _Z4fivev as a function.
_Z4fivev:													; Label where the function starts.
.LFB0:														; Mark function beginning.
	.cfi_startproc											; Mark start of function's stack frame.
	endbr64													; Ensure valid branch to the function.
	movl	$5, %eax								; Move value 5 directly into return register and immediately return.
	ret														; Return control to the calling function.
	.cfi_endproc											; Terminate the function.
.LFE0:														; Mark the end of the function.
	.size	_Z4fivev, .-_Z4fivev							; Tell the assembler the size of the function by substracting the address of its start from its end.
	.section	.text.startup,"ax",@progbits				; Manage the order in which code gets executed and loaded into memory.
	.p2align 4												; Same as before
	.globl	main											; Same as before
	.type	main, @function									; Same as before
main:														; Same as before
.LFB1:														; Same as before
	.cfi_startproc											; Same as before
	endbr64													; Same as before
	xorl	%eax, %eax								; Zero-out the return register by performing bitwise XOR operation with itself which always gives 0, and is more efficient than movl $0, %eax.
	ret														; Same as before
	.cfi_endproc											; Same as before
.LFE1:														; Same as before
	.size	main, .-main									; Same as before
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"	; Metadata for OS and linker.
	.section	.note.GNU-stack,"",@progbits				; Metadata for OS and linker.
	.section	.note.gnu.property,"a"						; Metadata for OS and linker.
	.align 8												; Metadata for OS and linker.
	.long	1f - 0f											; Metadata for OS and linker.
	.long	4f - 1f											; Metadata for OS and linker.
	.long	5												; Metadata for OS and linker.
0:															; Metadata for OS and linker.
	.string	"GNU"											; Metadata for OS and linker.
1:															; Metadata for OS and linker.
	.align 8												; Metadata for OS and linker.
	.long	0xc0000002										; Metadata for OS and linker.
	.long	3f - 2f											; Metadata for OS and linker.
2:															; Metadata for OS and linker.
	.long	0x3												; Metadata for OS and linker.
3:															; Metadata for OS and linker.
	.align 8												; Metadata for OS and linker.
4:
