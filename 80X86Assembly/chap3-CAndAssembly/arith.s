	.file	"arith.c"
	.section	.text.unlikely,"x"
LCOLDB0:
	.text
LHOTB0:
	.p2align 4,,15
	.globl	_arith
	.def	_arith;	.scl	2;	.type	32;	.endef
_arith:
	pushl	%ebp
	movl	%esp, %ebp


	movl	8(%ebp), %ecx						#ecx = x
	movl	12(%ebp), %edx					#edx = y
	leal	(%ecx,%edx), %eax				#eax = x + y		(t1)

	leal	(%edx,%edx,2), %edx			#edx = y + 2*y------------cmd1
	addl	16(%ebp), %eax					#eax = z + t1 (t2)
	popl	%ebp
	sall	$4, %edx								#edx = 48*y = 3y << 4 --------------cmd1  (compiler O + cmd_adjust) (t4)
	leal	4(%ecx,%edx), %edx			#edx = x + t4 + 4 (t5)
	imull	%edx, %eax							#eax = t5*t2		(rval)

																#not t3 because of O2
	ret
	.section	.text.unlikely,"x"
LCOLDE0:
	.text
LHOTE0:
	.ident	"GCC: (tdm64-1) 4.9.2"
