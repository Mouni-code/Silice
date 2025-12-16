
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00010137          	lui	sp,0x10
   4:	00000097          	auipc	ra,0x0
   8:	018080e7          	jalr	24(ra) # 1c <main>
   c:	00000317          	auipc	t1,0x0
  10:	00830067          	jr	8(t1) # 14 <exit>

00000014 <exit>:
  14:	00000000          	.word	0x00000000
  18:	00008067          	ret

0000001c <main>:
  1c:	000007b7          	lui	a5,0x0
  20:	000f4637          	lui	a2,0xf4
  24:	0747a503          	lw	a0,116(a5) # 74 <LEDS>
  28:	00000693          	li	a3,0
  2c:	00100793          	li	a5,1
  30:	23f60613          	addi	a2,a2,575 # f423f <__stacktop+0xe423f>
  34:	c00025f3          	rdcycle	a1
  38:	c0002773          	rdcycle	a4
  3c:	40b70733          	sub	a4,a4,a1
  40:	fee67ce3          	bgeu	a2,a4,38 <main+0x1c>
  44:	f8078713          	addi	a4,a5,-128
  48:	fff78593          	addi	a1,a5,-1
  4c:	00173713          	seqz	a4,a4
  50:	0015b593          	seqz	a1,a1
  54:	00b76733          	or	a4,a4,a1
  58:	00e68a63          	beq	a3,a4,6c <main+0x50>
  5c:	00179793          	slli	a5,a5,0x1
  60:	00e6c6b3          	xor	a3,a3,a4
  64:	00f52023          	sw	a5,0(a0)
  68:	fcdff06f          	j	34 <main+0x18>
  6c:	4017d793          	srai	a5,a5,0x1
  70:	ff1ff06f          	j	60 <main+0x44>

00000074 <LEDS>:
  74:	00010004                                ....
