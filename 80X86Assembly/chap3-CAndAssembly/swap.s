	.file	"swap.c"
	.section	.text.unlikely,"x"
LCOLDB0:
	.text
LHOTB0:
	.p2align 4,,15
	.globl	_swap
	.def	_swap;	.scl	2;	.type	32;	.endef
_swap:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx

	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%edx), %ecx		#ecx = *xp	(t0)
	movl	(%eax), %ebx		#ebx = *yp	(t1)
	movl	%ebx, (%edx) 
	movl	%ecx, (%eax)
	
	popl	%ebx
	popl	%ebp
	ret
	.section	.text.unlikely,"x"
LCOLDE0:
	.text
LHOTE0:
	.ident	"GCC: (tdm64-1) 4.9.2"
