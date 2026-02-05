
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
  20:	fd010113          	addi	sp,sp,-48 # ffd0 <framebuffer+0xf8bc>
  24:	3ec78793          	addi	a5,a5,1004 # 3ec <display_putchar>
  28:	00000737          	lui	a4,0x0
  2c:	70f72823          	sw	a5,1808(a4) # 710 <f_putchar>
  30:	02112623          	sw	ra,44(sp)
  34:	02812423          	sw	s0,40(sp)
  38:	01512a23          	sw	s5,20(sp)
  3c:	01612823          	sw	s6,16(sp)
  40:	01712623          	sw	s7,12(sp)
  44:	01912223          	sw	s9,4(sp)
  48:	02912223          	sw	s1,36(sp)
  4c:	03212023          	sw	s2,32(sp)
  50:	01312e23          	sw	s3,28(sp)
  54:	01412c23          	sw	s4,24(sp)
  58:	01812423          	sw	s8,8(sp)
  5c:	00000097          	auipc	ra,0x0
  60:	264080e7          	jalr	612(ra) # 2c0 <oled_init>
  64:	00000097          	auipc	ra,0x0
  68:	268080e7          	jalr	616(ra) # 2cc <oled_fullscreen>
  6c:	00000513          	li	a0,0
  70:	00000097          	auipc	ra,0x0
  74:	2f4080e7          	jalr	756(ra) # 364 <oled_clear>
  78:	000007b7          	lui	a5,0x0
  7c:	5187ac83          	lw	s9,1304(a5) # 518 <RGBSEL>
  80:	00000413          	li	s0,0
  84:	00004b37          	lui	s6,0x4
  88:	08000b93          	li	s7,128
  8c:	00300a93          	li	s5,3
  90:	00000493          	li	s1,0
  94:	409409b3          	sub	s3,s0,s1
  98:	0019b993          	seqz	s3,s3
  9c:	009ca023          	sw	s1,0(s9)
  a0:	413009b3          	neg	s3,s3
  a4:	00000913          	li	s2,0
  a8:	00090a13          	mv	s4,s2
  ac:	01690c33          	add	s8,s2,s6
  b0:	00000097          	auipc	ra,0x0
  b4:	330080e7          	jalr	816(ra) # 3e0 <display_framebuffer>
  b8:	01450533          	add	a0,a0,s4
  bc:	01350023          	sb	s3,0(a0)
  c0:	080a0a13          	addi	s4,s4,128
  c4:	ff8a16e3          	bne	s4,s8,b0 <main+0x94>
  c8:	00190913          	addi	s2,s2,1
  cc:	fd791ee3          	bne	s2,s7,a8 <main+0x8c>
  d0:	00148493          	addi	s1,s1,1
  d4:	fd5490e3          	bne	s1,s5,94 <main+0x78>
  d8:	00140513          	addi	a0,s0,1
  dc:	000a8593          	mv	a1,s5
  e0:	00000097          	auipc	ra,0x0
  e4:	094080e7          	jalr	148(ra) # 174 <__modsi3>
  e8:	00050413          	mv	s0,a0
  ec:	fa5ff06f          	j	90 <main+0x74>

000000f0 <__divsi3>:
  f0:	06054063          	bltz	a0,150 <__umodsi3+0x10>
  f4:	0605c663          	bltz	a1,160 <__umodsi3+0x20>

000000f8 <__udivsi3>:
  f8:	00058613          	mv	a2,a1
  fc:	00050593          	mv	a1,a0
 100:	fff00513          	li	a0,-1
 104:	02060c63          	beqz	a2,13c <__udivsi3+0x44>
 108:	00100693          	li	a3,1
 10c:	00b67a63          	bgeu	a2,a1,120 <__udivsi3+0x28>
 110:	00c05863          	blez	a2,120 <__udivsi3+0x28>
 114:	00161613          	slli	a2,a2,0x1
 118:	00169693          	slli	a3,a3,0x1
 11c:	feb66ae3          	bltu	a2,a1,110 <__udivsi3+0x18>
 120:	00000513          	li	a0,0
 124:	00c5e663          	bltu	a1,a2,130 <__udivsi3+0x38>
 128:	40c585b3          	sub	a1,a1,a2
 12c:	00d56533          	or	a0,a0,a3
 130:	0016d693          	srli	a3,a3,0x1
 134:	00165613          	srli	a2,a2,0x1
 138:	fe0696e3          	bnez	a3,124 <__udivsi3+0x2c>
 13c:	00008067          	ret

00000140 <__umodsi3>:
 140:	00008293          	mv	t0,ra
 144:	fb5ff0ef          	jal	f8 <__udivsi3>
 148:	00058513          	mv	a0,a1
 14c:	00028067          	jr	t0
 150:	40a00533          	neg	a0,a0
 154:	0005d863          	bgez	a1,164 <__umodsi3+0x24>
 158:	40b005b3          	neg	a1,a1
 15c:	f95ff06f          	j	f0 <__divsi3>
 160:	40b005b3          	neg	a1,a1
 164:	00008293          	mv	t0,ra
 168:	f89ff0ef          	jal	f0 <__divsi3>
 16c:	40a00533          	neg	a0,a0
 170:	00028067          	jr	t0

00000174 <__modsi3>:
 174:	00008293          	mv	t0,ra
 178:	0005ca63          	bltz	a1,18c <__modsi3+0x18>
 17c:	00054c63          	bltz	a0,194 <__modsi3+0x20>
 180:	f79ff0ef          	jal	f8 <__udivsi3>
 184:	00058513          	mv	a0,a1
 188:	00028067          	jr	t0
 18c:	40b005b3          	neg	a1,a1
 190:	fe0558e3          	bgez	a0,180 <__modsi3+0xc>
 194:	40a00533          	neg	a0,a0
 198:	f61ff0ef          	jal	f8 <__udivsi3>
 19c:	40b00533          	neg	a0,a1
 1a0:	00028067          	jr	t0

000001a4 <oled_wait>:
 1a4:	00000013          	nop
 1a8:	00000013          	nop
 1ac:	00000013          	nop
 1b0:	00000013          	nop
 1b4:	00000013          	nop
 1b8:	00000013          	nop
 1bc:	00000013          	nop
 1c0:	00008067          	ret

000001c4 <oled_init_mode>:
 1c4:	000007b7          	lui	a5,0x0
 1c8:	51c7a703          	lw	a4,1308(a5) # 51c <OLED_RST>
 1cc:	fe010113          	addi	sp,sp,-32
 1d0:	00112e23          	sw	ra,28(sp)
 1d4:	00812c23          	sw	s0,24(sp)
 1d8:	00072023          	sw	zero,0(a4)
 1dc:	00040737          	lui	a4,0x40
 1e0:	00000013          	nop
 1e4:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
 1e8:	fe071ce3          	bnez	a4,1e0 <oled_init_mode+0x1c>
 1ec:	51c7a703          	lw	a4,1308(a5)
 1f0:	00100693          	li	a3,1
 1f4:	00d72023          	sw	a3,0(a4)
 1f8:	00040737          	lui	a4,0x40
 1fc:	00000013          	nop
 200:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
 204:	fe071ce3          	bnez	a4,1fc <oled_init_mode+0x38>
 208:	51c7a783          	lw	a5,1308(a5)
 20c:	0007a023          	sw	zero,0(a5)
 210:	000407b7          	lui	a5,0x40
 214:	00000013          	nop
 218:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
 21c:	fe079ce3          	bnez	a5,214 <oled_init_mode+0x50>
 220:	00000737          	lui	a4,0x0
 224:	52072783          	lw	a5,1312(a4) # 520 <OLED>
 228:	2af00693          	li	a3,687
 22c:	00d7a023          	sw	a3,0(a5)
 230:	000407b7          	lui	a5,0x40
 234:	00000013          	nop
 238:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
 23c:	fe079ce3          	bnez	a5,234 <oled_init_mode+0x70>
 240:	52072403          	lw	s0,1312(a4)
 244:	2a000793          	li	a5,672
 248:	00a12623          	sw	a0,12(sp)
 24c:	00f42023          	sw	a5,0(s0)
 250:	00000097          	auipc	ra,0x0
 254:	f54080e7          	jalr	-172(ra) # 1a4 <oled_wait>
 258:	00c12503          	lw	a0,12(sp)
 25c:	4a000793          	li	a5,1184
 260:	00050463          	beqz	a0,268 <oled_init_mode+0xa4>
 264:	42000793          	li	a5,1056
 268:	00f42023          	sw	a5,0(s0)
 26c:	00000097          	auipc	ra,0x0
 270:	f38080e7          	jalr	-200(ra) # 1a4 <oled_wait>
 274:	2fd00793          	li	a5,765
 278:	00f42023          	sw	a5,0(s0)
 27c:	00000097          	auipc	ra,0x0
 280:	f28080e7          	jalr	-216(ra) # 1a4 <oled_wait>
 284:	4b100793          	li	a5,1201
 288:	00f42023          	sw	a5,0(s0)
 28c:	00000097          	auipc	ra,0x0
 290:	f18080e7          	jalr	-232(ra) # 1a4 <oled_wait>
 294:	2a200793          	li	a5,674
 298:	00f42023          	sw	a5,0(s0)
 29c:	00000097          	auipc	ra,0x0
 2a0:	f08080e7          	jalr	-248(ra) # 1a4 <oled_wait>
 2a4:	40000793          	li	a5,1024
 2a8:	00f42023          	sw	a5,0(s0)
 2ac:	01812403          	lw	s0,24(sp)
 2b0:	01c12083          	lw	ra,28(sp)
 2b4:	02010113          	addi	sp,sp,32
 2b8:	00000317          	auipc	t1,0x0
 2bc:	eec30067          	jr	-276(t1) # 1a4 <oled_wait>

000002c0 <oled_init>:
 2c0:	00000513          	li	a0,0
 2c4:	00000317          	auipc	t1,0x0
 2c8:	f0030067          	jr	-256(t1) # 1c4 <oled_init_mode>

000002cc <oled_fullscreen>:
 2cc:	ff010113          	addi	sp,sp,-16
 2d0:	000007b7          	lui	a5,0x0
 2d4:	00812423          	sw	s0,8(sp)
 2d8:	5207a403          	lw	s0,1312(a5) # 520 <OLED>
 2dc:	00112623          	sw	ra,12(sp)
 2e0:	00912223          	sw	s1,4(sp)
 2e4:	01212023          	sw	s2,0(sp)
 2e8:	21500793          	li	a5,533
 2ec:	00f42023          	sw	a5,0(s0)
 2f0:	40000913          	li	s2,1024
 2f4:	00000097          	auipc	ra,0x0
 2f8:	eb0080e7          	jalr	-336(ra) # 1a4 <oled_wait>
 2fc:	47f00493          	li	s1,1151
 300:	01242023          	sw	s2,0(s0)
 304:	00000097          	auipc	ra,0x0
 308:	ea0080e7          	jalr	-352(ra) # 1a4 <oled_wait>
 30c:	00942023          	sw	s1,0(s0)
 310:	00000097          	auipc	ra,0x0
 314:	e94080e7          	jalr	-364(ra) # 1a4 <oled_wait>
 318:	27500793          	li	a5,629
 31c:	00f42023          	sw	a5,0(s0)
 320:	00000097          	auipc	ra,0x0
 324:	e84080e7          	jalr	-380(ra) # 1a4 <oled_wait>
 328:	01242023          	sw	s2,0(s0)
 32c:	00000097          	auipc	ra,0x0
 330:	e78080e7          	jalr	-392(ra) # 1a4 <oled_wait>
 334:	00942023          	sw	s1,0(s0)
 338:	00000097          	auipc	ra,0x0
 33c:	e6c080e7          	jalr	-404(ra) # 1a4 <oled_wait>
 340:	25c00793          	li	a5,604
 344:	00f42023          	sw	a5,0(s0)
 348:	00812403          	lw	s0,8(sp)
 34c:	00c12083          	lw	ra,12(sp)
 350:	00412483          	lw	s1,4(sp)
 354:	00012903          	lw	s2,0(sp)
 358:	01010113          	addi	sp,sp,16
 35c:	00000317          	auipc	t1,0x0
 360:	e4830067          	jr	-440(t1) # 1a4 <oled_wait>

00000364 <oled_clear>:
 364:	fe010113          	addi	sp,sp,-32
 368:	000007b7          	lui	a5,0x0
 36c:	01312623          	sw	s3,12(sp)
 370:	5207a983          	lw	s3,1312(a5) # 520 <OLED>
 374:	00812c23          	sw	s0,24(sp)
 378:	01212823          	sw	s2,16(sp)
 37c:	00112e23          	sw	ra,28(sp)
 380:	00912a23          	sw	s1,20(sp)
 384:	08000913          	li	s2,128
 388:	40056413          	ori	s0,a0,1024
 38c:	08000493          	li	s1,128
 390:	0089a023          	sw	s0,0(s3)
 394:	00000097          	auipc	ra,0x0
 398:	e10080e7          	jalr	-496(ra) # 1a4 <oled_wait>
 39c:	0089a023          	sw	s0,0(s3)
 3a0:	00000097          	auipc	ra,0x0
 3a4:	e04080e7          	jalr	-508(ra) # 1a4 <oled_wait>
 3a8:	fff48493          	addi	s1,s1,-1
 3ac:	0089a023          	sw	s0,0(s3)
 3b0:	00000097          	auipc	ra,0x0
 3b4:	df4080e7          	jalr	-524(ra) # 1a4 <oled_wait>
 3b8:	fc049ce3          	bnez	s1,390 <oled_clear+0x2c>
 3bc:	fff90913          	addi	s2,s2,-1
 3c0:	fc0916e3          	bnez	s2,38c <oled_clear+0x28>
 3c4:	01c12083          	lw	ra,28(sp)
 3c8:	01812403          	lw	s0,24(sp)
 3cc:	01412483          	lw	s1,20(sp)
 3d0:	01012903          	lw	s2,16(sp)
 3d4:	00c12983          	lw	s3,12(sp)
 3d8:	02010113          	addi	sp,sp,32
 3dc:	00008067          	ret

000003e0 <display_framebuffer>:
 3e0:	00000537          	lui	a0,0x0
 3e4:	71450513          	addi	a0,a0,1812 # 714 <framebuffer>
 3e8:	00008067          	ret

000003ec <display_putchar>:
 3ec:	00a00793          	li	a5,10
 3f0:	00000737          	lui	a4,0x0
 3f4:	02f51663          	bne	a0,a5,420 <display_putchar+0x34>
 3f8:	70072623          	sw	zero,1804(a4) # 70c <cursor_x>
 3fc:	00000737          	lui	a4,0x0
 400:	70872783          	lw	a5,1800(a4) # 708 <cursor_y>
 404:	00878793          	addi	a5,a5,8
 408:	70f72423          	sw	a5,1800(a4)
 40c:	07f00713          	li	a4,127
 410:	10f75263          	bge	a4,a5,514 <display_putchar+0x128>
 414:	000007b7          	lui	a5,0x0
 418:	7007a423          	sw	zero,1800(a5) # 708 <cursor_y>
 41c:	00008067          	ret
 420:	01f00793          	li	a5,31
 424:	0ca7d063          	bge	a5,a0,4e4 <display_putchar+0xf8>
 428:	000007b7          	lui	a5,0x0
 42c:	7087a783          	lw	a5,1800(a5) # 708 <cursor_y>
 430:	07800693          	li	a3,120
 434:	00800593          	li	a1,8
 438:	00f6d663          	bge	a3,a5,444 <display_putchar+0x58>
 43c:	08000593          	li	a1,128
 440:	40f585b3          	sub	a1,a1,a5
 444:	70c72683          	lw	a3,1804(a4)
 448:	07b00613          	li	a2,123
 44c:	00500813          	li	a6,5
 450:	00d65663          	bge	a2,a3,45c <display_putchar+0x70>
 454:	08000813          	li	a6,128
 458:	40d80833          	sub	a6,a6,a3
 45c:	00000637          	lui	a2,0x0
 460:	70464283          	lbu	t0,1796(a2) # 704 <back_color>
 464:	00000637          	lui	a2,0x0
 468:	70564383          	lbu	t2,1797(a2) # 705 <front_color>
 46c:	00000637          	lui	a2,0x0
 470:	71460613          	addi	a2,a2,1812 # 714 <framebuffer>
 474:	00c787b3          	add	a5,a5,a2
 478:	00769693          	slli	a3,a3,0x7
 47c:	00d787b3          	add	a5,a5,a3
 480:	00000637          	lui	a2,0x0
 484:	00251693          	slli	a3,a0,0x2
 488:	52460613          	addi	a2,a2,1316 # 524 <font>
 48c:	00a686b3          	add	a3,a3,a0
 490:	00c686b3          	add	a3,a3,a2
 494:	00100f93          	li	t6,1
 498:	00000613          	li	a2,0
 49c:	04b65463          	bge	a2,a1,4e4 <display_putchar+0xf8>
 4a0:	00cf9f33          	sll	t5,t6,a2
 4a4:	00f60333          	add	t1,a2,a5
 4a8:	00068893          	mv	a7,a3
 4ac:	00000513          	li	a0,0
 4b0:	0280006f          	j	4d8 <display_putchar+0xec>
 4b4:	f608ce03          	lbu	t3,-160(a7)
 4b8:	00038e93          	mv	t4,t2
 4bc:	01ee7e33          	and	t3,t3,t5
 4c0:	000e1463          	bnez	t3,4c8 <display_putchar+0xdc>
 4c4:	00028e93          	mv	t4,t0
 4c8:	01d30023          	sb	t4,0(t1)
 4cc:	00150513          	addi	a0,a0,1
 4d0:	08030313          	addi	t1,t1,128
 4d4:	00188893          	addi	a7,a7,1
 4d8:	fd054ee3          	blt	a0,a6,4b4 <display_putchar+0xc8>
 4dc:	00160613          	addi	a2,a2,1
 4e0:	fbdff06f          	j	49c <display_putchar+0xb0>
 4e4:	70c72783          	lw	a5,1804(a4)
 4e8:	07f00693          	li	a3,127
 4ec:	00578793          	addi	a5,a5,5
 4f0:	00f6c663          	blt	a3,a5,4fc <display_putchar+0x110>
 4f4:	70f72623          	sw	a5,1804(a4)
 4f8:	00008067          	ret
 4fc:	70072623          	sw	zero,1804(a4)
 500:	00000737          	lui	a4,0x0
 504:	70872783          	lw	a5,1800(a4) # 708 <cursor_y>
 508:	00878793          	addi	a5,a5,8
 50c:	70f72423          	sw	a5,1800(a4)
 510:	f0f6c2e3          	blt	a3,a5,414 <display_putchar+0x28>
 514:	00008067          	ret

00000518 <RGBSEL>:
 518:	00012000                                . ..

0000051c <OLED_RST>:
 51c:	00010010                                ....

00000520 <OLED>:
 520:	00010008                                ....

00000524 <font>:
 524:	00000000 00002f00 00030000 14000003     ...../..........
 534:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
 544:	03003415 00000000 0000211e 001e2100     .4.......!...!..
 554:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
 564:	00080800 00200000 20000000 02040810     ...... .... ....
 574:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
 584:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
 594:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
 5a4:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
 5b4:	00141400 0a110000 01000004 0007052d     ............-...
 5c4:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
 5d4:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
 5e4:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
 5f4:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
 604:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
 614:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
 624:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
 634:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
 644:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
 654:	003f2102 01020000 20000201 00000020     .!?........  ...
 664:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
 674:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
 684:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
 694:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
 6a4:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
 6b4:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
 6c4:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
 6d4:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
 6e4:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
 6f4:	043f2100 02010000 00000102 00000000     .!?.............

00000704 <back_color>:
	...

00000705 <front_color>:
 705:	                                         ...

00000708 <cursor_y>:
 708:	00000000                                ....

0000070c <cursor_x>:
 70c:	00000000                                ....

00000710 <f_putchar>:
 710:	00000000                                ....
