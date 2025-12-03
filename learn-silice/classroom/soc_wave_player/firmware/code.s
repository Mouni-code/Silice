
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00000097          	auipc	ra,0x0
       8:	2c4080e7          	jalr	708(ra) # 2c8 <main>
       c:	00000317          	auipc	t1,0x0
      10:	00830067          	jr	8(t1) # 14 <exit>

00000014 <exit>:
      14:	00000000          	.word	0x00000000
      18:	00008067          	ret

0000001c <scan_files>:
      1c:	000037b7          	lui	a5,0x3
      20:	ec010113          	addi	sp,sp,-320 # fec0 <_files+0x84d4>
      24:	c8478793          	addi	a5,a5,-892 # 2c84 <files>
      28:	12912a23          	sw	s1,308(sp)
      2c:	7ff78713          	addi	a4,a5,2047
      30:	000034b7          	lui	s1,0x3
      34:	12812c23          	sw	s0,312(sp)
      38:	12112e23          	sw	ra,316(sp)
      3c:	13212823          	sw	s2,304(sp)
      40:	13312623          	sw	s3,300(sp)
      44:	c404aa23          	sw	zero,-940(s1) # 2c54 <n_items>
      48:	10170713          	addi	a4,a4,257
      4c:	00078413          	mv	s0,a5
      50:	00078023          	sb	zero,0(a5)
      54:	0407a023          	sw	zero,64(a5)
      58:	04078223          	sb	zero,68(a5)
      5c:	04878793          	addi	a5,a5,72
      60:	fee798e3          	bne	a5,a4,50 <scan_files+0x34>
      64:	00003537          	lui	a0,0x3
      68:	00410593          	addi	a1,sp,4
      6c:	b5450513          	addi	a0,a0,-1196 # 2b54 <current_path>
      70:	00002097          	auipc	ra,0x2
      74:	450080e7          	jalr	1104(ra) # 24c0 <fl_opendir>
      78:	08050e63          	beqz	a0,114 <scan_files+0xf8>
      7c:	01010593          	addi	a1,sp,16
      80:	01f00913          	li	s2,31
      84:	03f00993          	li	s3,63
      88:	00410513          	addi	a0,sp,4
      8c:	00002097          	auipc	ra,0x2
      90:	740080e7          	jalr	1856(ra) # 27cc <fl_readdir>
      94:	06051a63          	bnez	a0,108 <scan_files+0xec>
      98:	c544a703          	lw	a4,-940(s1)
      9c:	06e94663          	blt	s2,a4,108 <scan_files+0xec>
      a0:	00371793          	slli	a5,a4,0x3
      a4:	00e786b3          	add	a3,a5,a4
      a8:	00369693          	slli	a3,a3,0x3
      ac:	01010593          	addi	a1,sp,16
      b0:	0140006f          	j	c4 <scan_files+0xa8>
      b4:	00d50633          	add	a2,a0,a3
      b8:	00c40633          	add	a2,s0,a2
      bc:	01060023          	sb	a6,0(a2)
      c0:	00150513          	addi	a0,a0,1
      c4:	00a58633          	add	a2,a1,a0
      c8:	00064803          	lbu	a6,0(a2)
      cc:	00080463          	beqz	a6,d4 <scan_files+0xb8>
      d0:	ff3512e3          	bne	a0,s3,b4 <scan_files+0x98>
      d4:	11c12683          	lw	a3,284(sp)
      d8:	00e787b3          	add	a5,a5,a4
      dc:	00379793          	slli	a5,a5,0x3
      e0:	00f407b3          	add	a5,s0,a5
      e4:	04d7a023          	sw	a3,64(a5)
      e8:	11414683          	lbu	a3,276(sp)
      ec:	00a78533          	add	a0,a5,a0
      f0:	00170713          	addi	a4,a4,1
      f4:	00d036b3          	snez	a3,a3
      f8:	00050023          	sb	zero,0(a0)
      fc:	04d78223          	sb	a3,68(a5)
     100:	c4e4aa23          	sw	a4,-940(s1)
     104:	f85ff06f          	j	88 <scan_files+0x6c>
     108:	00410513          	addi	a0,sp,4
     10c:	00001097          	auipc	ra,0x1
     110:	644080e7          	jalr	1604(ra) # 1750 <fl_closedir>
     114:	13c12083          	lw	ra,316(sp)
     118:	13812403          	lw	s0,312(sp)
     11c:	13412483          	lw	s1,308(sp)
     120:	13012903          	lw	s2,304(sp)
     124:	12c12983          	lw	s3,300(sp)
     128:	14010113          	addi	sp,sp,320
     12c:	00008067          	ret

00000130 <go_back>:
     130:	ff010113          	addi	sp,sp,-16
     134:	00812423          	sw	s0,8(sp)
     138:	00003437          	lui	s0,0x3
     13c:	b5440513          	addi	a0,s0,-1196 # 2b54 <current_path>
     140:	00112623          	sw	ra,12(sp)
     144:	00001097          	auipc	ra,0x1
     148:	b20080e7          	jalr	-1248(ra) # c64 <strlen>
     14c:	00100793          	li	a5,1
     150:	02a7d263          	bge	a5,a0,174 <go_back+0x44>
     154:	fff50713          	addi	a4,a0,-1
     158:	b5440793          	addi	a5,s0,-1196
     15c:	00e787b3          	add	a5,a5,a4
     160:	0007c603          	lbu	a2,0(a5)
     164:	02f00693          	li	a3,47
     168:	00d61663          	bne	a2,a3,174 <go_back+0x44>
     16c:	00078023          	sb	zero,0(a5)
     170:	00070513          	mv	a0,a4
     174:	fff50513          	addi	a0,a0,-1
     178:	b5440713          	addi	a4,s0,-1196
     17c:	02f00693          	li	a3,47
     180:	00054a63          	bltz	a0,194 <go_back+0x64>
     184:	00e507b3          	add	a5,a0,a4
     188:	0007c603          	lbu	a2,0(a5)
     18c:	02d61863          	bne	a2,a3,1bc <go_back+0x8c>
     190:	000780a3          	sb	zero,1(a5)
     194:	b5440513          	addi	a0,s0,-1196
     198:	00001097          	auipc	ra,0x1
     19c:	acc080e7          	jalr	-1332(ra) # c64 <strlen>
     1a0:	00051663          	bnez	a0,1ac <go_back+0x7c>
     1a4:	02f00793          	li	a5,47
     1a8:	b4f41a23          	sh	a5,-1196(s0)
     1ac:	00c12083          	lw	ra,12(sp)
     1b0:	00812403          	lw	s0,8(sp)
     1b4:	01010113          	addi	sp,sp,16
     1b8:	00008067          	ret
     1bc:	fff50513          	addi	a0,a0,-1
     1c0:	fc1ff06f          	j	180 <go_back+0x50>

000001c4 <navigate_to>:
     1c4:	ff010113          	addi	sp,sp,-16
     1c8:	00912223          	sw	s1,4(sp)
     1cc:	01212023          	sw	s2,0(sp)
     1d0:	00112623          	sw	ra,12(sp)
     1d4:	00812423          	sw	s0,8(sp)
     1d8:	00050913          	mv	s2,a0
     1dc:	00001097          	auipc	ra,0x1
     1e0:	a88080e7          	jalr	-1400(ra) # c64 <strlen>
     1e4:	00200793          	li	a5,2
     1e8:	00050493          	mv	s1,a0
     1ec:	0af51863          	bne	a0,a5,29c <navigate_to+0xd8>
     1f0:	000035b7          	lui	a1,0x3
     1f4:	00050613          	mv	a2,a0
     1f8:	89c58593          	addi	a1,a1,-1892 # 289c <LEDS+0x4>
     1fc:	00090513          	mv	a0,s2
     200:	00001097          	auipc	ra,0x1
     204:	a84080e7          	jalr	-1404(ra) # c84 <strncmp>
     208:	06050c63          	beqz	a0,280 <navigate_to+0xbc>
     20c:	00003437          	lui	s0,0x3
     210:	b5440513          	addi	a0,s0,-1196 # 2b54 <current_path>
     214:	00001097          	auipc	ra,0x1
     218:	a50080e7          	jalr	-1456(ra) # c64 <strlen>
     21c:	00950533          	add	a0,a0,s1
     220:	0fd00793          	li	a5,253
     224:	08a7c663          	blt	a5,a0,2b0 <navigate_to+0xec>
     228:	00090593          	mv	a1,s2
     22c:	b5440513          	addi	a0,s0,-1196
     230:	00001097          	auipc	ra,0x1
     234:	ab8080e7          	jalr	-1352(ra) # ce8 <strcat>
     238:	b5440513          	addi	a0,s0,-1196
     23c:	00001097          	auipc	ra,0x1
     240:	a28080e7          	jalr	-1496(ra) # c64 <strlen>
     244:	b5440413          	addi	s0,s0,-1196
     248:	00a40533          	add	a0,s0,a0
     24c:	fff54703          	lbu	a4,-1(a0)
     250:	02f00793          	li	a5,47
     254:	04f70e63          	beq	a4,a5,2b0 <navigate_to+0xec>
     258:	00040513          	mv	a0,s0
     25c:	00812403          	lw	s0,8(sp)
     260:	00c12083          	lw	ra,12(sp)
     264:	00412483          	lw	s1,4(sp)
     268:	00012903          	lw	s2,0(sp)
     26c:	000035b7          	lui	a1,0x3
     270:	8a058593          	addi	a1,a1,-1888 # 28a0 <LEDS+0x8>
     274:	01010113          	addi	sp,sp,16
     278:	00001317          	auipc	t1,0x1
     27c:	a7030067          	jr	-1424(t1) # ce8 <strcat>
     280:	00812403          	lw	s0,8(sp)
     284:	00c12083          	lw	ra,12(sp)
     288:	00412483          	lw	s1,4(sp)
     28c:	00012903          	lw	s2,0(sp)
     290:	01010113          	addi	sp,sp,16
     294:	00000317          	auipc	t1,0x0
     298:	e9c30067          	jr	-356(t1) # 130 <go_back>
     29c:	00100793          	li	a5,1
     2a0:	f6f516e3          	bne	a0,a5,20c <navigate_to+0x48>
     2a4:	00094703          	lbu	a4,0(s2)
     2a8:	02e00793          	li	a5,46
     2ac:	f6f710e3          	bne	a4,a5,20c <navigate_to+0x48>
     2b0:	00c12083          	lw	ra,12(sp)
     2b4:	00812403          	lw	s0,8(sp)
     2b8:	00412483          	lw	s1,4(sp)
     2bc:	00012903          	lw	s2,0(sp)
     2c0:	01010113          	addi	sp,sp,16
     2c4:	00008067          	ret

000002c8 <main>:
     2c8:	000037b7          	lui	a5,0x3
     2cc:	8987a783          	lw	a5,-1896(a5) # 2898 <LEDS>
     2d0:	fb010113          	addi	sp,sp,-80
     2d4:	04112623          	sw	ra,76(sp)
     2d8:	04812423          	sw	s0,72(sp)
     2dc:	04912223          	sw	s1,68(sp)
     2e0:	05212023          	sw	s2,64(sp)
     2e4:	03312e23          	sw	s3,60(sp)
     2e8:	03412c23          	sw	s4,56(sp)
     2ec:	03512a23          	sw	s5,52(sp)
     2f0:	03612823          	sw	s6,48(sp)
     2f4:	03712623          	sw	s7,44(sp)
     2f8:	03812423          	sw	s8,40(sp)
     2fc:	03912223          	sw	s9,36(sp)
     300:	03a12023          	sw	s10,32(sp)
     304:	01b12e23          	sw	s11,28(sp)
     308:	0007a023          	sw	zero,0(a5)
     30c:	000017b7          	lui	a5,0x1
     310:	00003737          	lui	a4,0x3
     314:	f9878793          	addi	a5,a5,-104 # f98 <display_putchar>
     318:	c6f72423          	sw	a5,-920(a4) # 2c68 <f_putchar>
     31c:	00001097          	auipc	ra,0x1
     320:	b14080e7          	jalr	-1260(ra) # e30 <oled_init>
     324:	00001097          	auipc	ra,0x1
     328:	b18080e7          	jalr	-1256(ra) # e3c <oled_fullscreen>
     32c:	00000513          	li	a0,0
     330:	00001097          	auipc	ra,0x1
     334:	ba4080e7          	jalr	-1116(ra) # ed4 <oled_clear>
     338:	00000097          	auipc	ra,0x0
     33c:	68c080e7          	jalr	1676(ra) # 9c4 <sdcard_init>
     340:	00001097          	auipc	ra,0x1
     344:	3a8080e7          	jalr	936(ra) # 16e8 <fl_init>
     348:	00000593          	li	a1,0
     34c:	00000513          	li	a0,0
     350:	00001097          	auipc	ra,0x1
     354:	c20080e7          	jalr	-992(ra) # f70 <display_set_cursor>
     358:	00000593          	li	a1,0
     35c:	0ff00513          	li	a0,255
     360:	00001097          	auipc	ra,0x1
     364:	c24080e7          	jalr	-988(ra) # f84 <display_set_front_back_color>
     368:	00003537          	lui	a0,0x3
     36c:	8a450513          	addi	a0,a0,-1884 # 28a4 <LEDS+0xc>
     370:	00001097          	auipc	ra,0x1
     374:	f4c080e7          	jalr	-180(ra) # 12bc <printf>
     378:	000014b7          	lui	s1,0x1
     37c:	00001437          	lui	s0,0x1
     380:	00001097          	auipc	ra,0x1
     384:	d44080e7          	jalr	-700(ra) # 10c4 <display_refresh>
     388:	b6848493          	addi	s1,s1,-1176 # b68 <sdcard_writesector>
     38c:	b1440413          	addi	s0,s0,-1260 # b14 <sdcard_readsector>
     390:	00048593          	mv	a1,s1
     394:	00040513          	mv	a0,s0
     398:	00002097          	auipc	ra,0x2
     39c:	b68080e7          	jalr	-1176(ra) # 1f00 <fl_attach_media>
     3a0:	fe0518e3          	bnez	a0,390 <main+0xc8>
     3a4:	00000097          	auipc	ra,0x0
     3a8:	c78080e7          	jalr	-904(ra) # 1c <scan_files>
     3ac:	000037b7          	lui	a5,0x3
     3b0:	8c078d13          	addi	s10,a5,-1856 # 28c0 <LEDS+0x28>
     3b4:	000037b7          	lui	a5,0x3
     3b8:	b5478d93          	addi	s11,a5,-1196 # 2b54 <current_path>
     3bc:	000037b7          	lui	a5,0x3
     3c0:	8dc78793          	addi	a5,a5,-1828 # 28dc <LEDS+0x44>
     3c4:	00f12423          	sw	a5,8(sp)
     3c8:	000037b7          	lui	a5,0x3
     3cc:	8e878793          	addi	a5,a5,-1816 # 28e8 <LEDS+0x50>
     3d0:	00f12623          	sw	a5,12(sp)
     3d4:	000037b7          	lui	a5,0x3
     3d8:	8887ab03          	lw	s6,-1912(a5) # 2888 <BUTTONS>
     3dc:	00000a13          	li	s4,0
     3e0:	00000993          	li	s3,0
     3e4:	00000a93          	li	s5,0
     3e8:	00000593          	li	a1,0
     3ec:	00000513          	li	a0,0
     3f0:	00001097          	auipc	ra,0x1
     3f4:	b80080e7          	jalr	-1152(ra) # f70 <display_set_cursor>
     3f8:	0ff9f593          	zext.b	a1,s3
     3fc:	07f58513          	addi	a0,a1,127
     400:	0ff57513          	zext.b	a0,a0
     404:	00001097          	auipc	ra,0x1
     408:	b80080e7          	jalr	-1152(ra) # f84 <display_set_front_back_color>
     40c:	000d0513          	mv	a0,s10
     410:	00001097          	auipc	ra,0x1
     414:	eac080e7          	jalr	-340(ra) # 12bc <printf>
     418:	00000593          	li	a1,0
     41c:	0c800513          	li	a0,200
     420:	00001097          	auipc	ra,0x1
     424:	b64080e7          	jalr	-1180(ra) # f84 <display_set_front_back_color>
     428:	00812503          	lw	a0,8(sp)
     42c:	000d8593          	mv	a1,s11
     430:	00003937          	lui	s2,0x3
     434:	00001097          	auipc	ra,0x1
     438:	e88080e7          	jalr	-376(ra) # 12bc <printf>
     43c:	00000593          	li	a1,0
     440:	0ff00513          	li	a0,255
     444:	00001097          	auipc	ra,0x1
     448:	b40080e7          	jalr	-1216(ra) # f84 <display_set_front_back_color>
     44c:	c5492783          	lw	a5,-940(s2) # 2c54 <n_items>
     450:	06078e63          	beqz	a5,4cc <main+0x204>
     454:	000037b7          	lui	a5,0x3
     458:	90c78b93          	addi	s7,a5,-1780 # 290c <LEDS+0x74>
     45c:	000037b7          	lui	a5,0x3
     460:	00003437          	lui	s0,0x3
     464:	91c78c13          	addi	s8,a5,-1764 # 291c <LEDS+0x84>
     468:	000037b7          	lui	a5,0x3
     46c:	c8440413          	addi	s0,s0,-892 # 2c84 <files>
     470:	00000493          	li	s1,0
     474:	8fc78c93          	addi	s9,a5,-1796 # 28fc <LEDS+0x64>
     478:	c5492783          	lw	a5,-940(s2)
     47c:	04f4de63          	bge	s1,a5,4d8 <main+0x210>
     480:	0e9a9063          	bne	s5,s1,560 <main+0x298>
     484:	0ff00593          	li	a1,255
     488:	00000513          	li	a0,0
     48c:	00001097          	auipc	ra,0x1
     490:	af8080e7          	jalr	-1288(ra) # f84 <display_set_front_back_color>
     494:	04444783          	lbu	a5,68(s0)
     498:	00040613          	mv	a2,s0
     49c:	00048593          	mv	a1,s1
     4a0:	0c078663          	beqz	a5,56c <main+0x2a4>
     4a4:	000c8513          	mv	a0,s9
     4a8:	00001097          	auipc	ra,0x1
     4ac:	e14080e7          	jalr	-492(ra) # 12bc <printf>
     4b0:	00148493          	addi	s1,s1,1
     4b4:	04840413          	addi	s0,s0,72
     4b8:	fc1ff06f          	j	478 <main+0x1b0>
     4bc:	000a0413          	mv	s0,s4
     4c0:	00798993          	addi	s3,s3,7
     4c4:	00040a13          	mv	s4,s0
     4c8:	f21ff06f          	j	3e8 <main+0x120>
     4cc:	00c12503          	lw	a0,12(sp)
     4d0:	00001097          	auipc	ra,0x1
     4d4:	dec080e7          	jalr	-532(ra) # 12bc <printf>
     4d8:	00001097          	auipc	ra,0x1
     4dc:	bec080e7          	jalr	-1044(ra) # 10c4 <display_refresh>
     4e0:	000b2403          	lw	s0,0(s6)
     4e4:	fffa4793          	not	a5,s4
     4e8:	0087f7b3          	and	a5,a5,s0
     4ec:	0087f713          	andi	a4,a5,8
     4f0:	00e03733          	snez	a4,a4
     4f4:	00ea8ab3          	add	s5,s5,a4
     4f8:	0107f713          	andi	a4,a5,16
     4fc:	00e03733          	snez	a4,a4
     500:	0047f793          	andi	a5,a5,4
     504:	40ea8ab3          	sub	s5,s5,a4
     508:	c5492703          	lw	a4,-940(s2)
     50c:	08078063          	beqz	a5,58c <main+0x2c4>
     510:	080ac063          	bltz	s5,590 <main+0x2c8>
     514:	02eadc63          	bge	s5,a4,54c <main+0x284>
     518:	003a9793          	slli	a5,s5,0x3
     51c:	00003537          	lui	a0,0x3
     520:	015787b3          	add	a5,a5,s5
     524:	00379793          	slli	a5,a5,0x3
     528:	c8450513          	addi	a0,a0,-892 # 2c84 <files>
     52c:	00f50533          	add	a0,a0,a5
     530:	04454783          	lbu	a5,68(a0)
     534:	f80784e3          	beqz	a5,4bc <main+0x1f4>
     538:	00000097          	auipc	ra,0x0
     53c:	c8c080e7          	jalr	-884(ra) # 1c4 <navigate_to>
     540:	00000a93          	li	s5,0
     544:	00000097          	auipc	ra,0x0
     548:	ad8080e7          	jalr	-1320(ra) # 1c <scan_files>
     54c:	c5492783          	lw	a5,-940(s2)
     550:	00faa7b3          	slt	a5,s5,a5
     554:	40f007b3          	neg	a5,a5
     558:	00fafab3          	and	s5,s5,a5
     55c:	f65ff06f          	j	4c0 <main+0x1f8>
     560:	00000593          	li	a1,0
     564:	0ff00513          	li	a0,255
     568:	f25ff06f          	j	48c <main+0x1c4>
     56c:	000b8513          	mv	a0,s7
     570:	00001097          	auipc	ra,0x1
     574:	d4c080e7          	jalr	-692(ra) # 12bc <printf>
     578:	04042583          	lw	a1,64(s0)
     57c:	000c0513          	mv	a0,s8
     580:	00001097          	auipc	ra,0x1
     584:	d3c080e7          	jalr	-708(ra) # 12bc <printf>
     588:	f29ff06f          	j	4b0 <main+0x1e8>
     58c:	fc0ad0e3          	bgez	s5,54c <main+0x284>
     590:	fff70a93          	addi	s5,a4,-1
     594:	fb9ff06f          	j	54c <main+0x284>

00000598 <pause>:
     598:	c0002773          	rdcycle	a4
     59c:	c00027f3          	rdcycle	a5
     5a0:	40e787b3          	sub	a5,a5,a4
     5a4:	fea7ece3          	bltu	a5,a0,59c <pause+0x4>
     5a8:	00008067          	ret

000005ac <sdcard_idle>:
     5ac:	00008067          	ret

000005b0 <sdcard_select>:
     5b0:	000037b7          	lui	a5,0x3
     5b4:	88c7a783          	lw	a5,-1908(a5) # 288c <SDCARD>
     5b8:	00200713          	li	a4,2
     5bc:	00e7a023          	sw	a4,0(a5)
     5c0:	00008067          	ret

000005c4 <sdcard_ponder>:
     5c4:	000036b7          	lui	a3,0x3
     5c8:	88c6a683          	lw	a3,-1908(a3) # 288c <SDCARD>
     5cc:	01000793          	li	a5,16
     5d0:	00000713          	li	a4,0
     5d4:	00676613          	ori	a2,a4,6
     5d8:	00c6a023          	sw	a2,0(a3)
     5dc:	00174713          	xori	a4,a4,1
     5e0:	00000013          	nop
     5e4:	fff78793          	addi	a5,a5,-1
     5e8:	fe0796e3          	bnez	a5,5d4 <sdcard_ponder+0x10>
     5ec:	00008067          	ret

000005f0 <sdcard_unselect>:
     5f0:	000037b7          	lui	a5,0x3
     5f4:	88c7a783          	lw	a5,-1908(a5) # 288c <SDCARD>
     5f8:	00600713          	li	a4,6
     5fc:	00e7a023          	sw	a4,0(a5)
     600:	00008067          	ret

00000604 <sdcard_send>:
     604:	000037b7          	lui	a5,0x3
     608:	88c7a783          	lw	a5,-1908(a5) # 288c <SDCARD>
     60c:	00655713          	srli	a4,a0,0x6
     610:	00277713          	andi	a4,a4,2
     614:	00e7a023          	sw	a4,0(a5)
     618:	00176713          	ori	a4,a4,1
     61c:	00e7a023          	sw	a4,0(a5)
     620:	00555713          	srli	a4,a0,0x5
     624:	00277713          	andi	a4,a4,2
     628:	00e7a023          	sw	a4,0(a5)
     62c:	00176713          	ori	a4,a4,1
     630:	00e7a023          	sw	a4,0(a5)
     634:	00455713          	srli	a4,a0,0x4
     638:	00277713          	andi	a4,a4,2
     63c:	00e7a023          	sw	a4,0(a5)
     640:	00176713          	ori	a4,a4,1
     644:	00e7a023          	sw	a4,0(a5)
     648:	00355713          	srli	a4,a0,0x3
     64c:	00277713          	andi	a4,a4,2
     650:	00e7a023          	sw	a4,0(a5)
     654:	00176713          	ori	a4,a4,1
     658:	00e7a023          	sw	a4,0(a5)
     65c:	00255713          	srli	a4,a0,0x2
     660:	00277713          	andi	a4,a4,2
     664:	00e7a023          	sw	a4,0(a5)
     668:	00176713          	ori	a4,a4,1
     66c:	00e7a023          	sw	a4,0(a5)
     670:	00155713          	srli	a4,a0,0x1
     674:	00277713          	andi	a4,a4,2
     678:	00e7a023          	sw	a4,0(a5)
     67c:	00176713          	ori	a4,a4,1
     680:	00e7a023          	sw	a4,0(a5)
     684:	00257713          	andi	a4,a0,2
     688:	00e7a023          	sw	a4,0(a5)
     68c:	00151513          	slli	a0,a0,0x1
     690:	00176713          	ori	a4,a4,1
     694:	00e7a023          	sw	a4,0(a5)
     698:	00257513          	andi	a0,a0,2
     69c:	00a7a023          	sw	a0,0(a5)
     6a0:	00156513          	ori	a0,a0,1
     6a4:	00a7a023          	sw	a0,0(a5)
     6a8:	00200713          	li	a4,2
     6ac:	00e7a023          	sw	a4,0(a5)
     6b0:	000037b7          	lui	a5,0x3
     6b4:	c587a783          	lw	a5,-936(a5) # 2c58 <sdcard_while_loading_callback>
     6b8:	00078067          	jr	a5

000006bc <sdcard_read>:
     6bc:	fd010113          	addi	sp,sp,-48
     6c0:	fff50793          	addi	a5,a0,-1
     6c4:	03212023          	sw	s2,32(sp)
     6c8:	00100913          	li	s2,1
     6cc:	00f91933          	sll	s2,s2,a5
     6d0:	000037b7          	lui	a5,0x3
     6d4:	01312e23          	sw	s3,28(sp)
     6d8:	88c7a983          	lw	s3,-1908(a5) # 288c <SDCARD>
     6dc:	02812423          	sw	s0,40(sp)
     6e0:	02912223          	sw	s1,36(sp)
     6e4:	01412c23          	sw	s4,24(sp)
     6e8:	01512a23          	sw	s5,20(sp)
     6ec:	01612823          	sw	s6,16(sp)
     6f0:	02112623          	sw	ra,44(sp)
     6f4:	0ff00413          	li	s0,255
     6f8:	00000493          	li	s1,0
     6fc:	00300a13          	li	s4,3
     700:	00200a93          	li	s5,2
     704:	00003b37          	lui	s6,0x3
     708:	02058c63          	beqz	a1,740 <sdcard_read+0x84>
     70c:	012477b3          	and	a5,s0,s2
     710:	02079a63          	bnez	a5,744 <sdcard_read+0x88>
     714:	02c12083          	lw	ra,44(sp)
     718:	0ff47513          	zext.b	a0,s0
     71c:	02812403          	lw	s0,40(sp)
     720:	02412483          	lw	s1,36(sp)
     724:	02012903          	lw	s2,32(sp)
     728:	01c12983          	lw	s3,28(sp)
     72c:	01812a03          	lw	s4,24(sp)
     730:	01412a83          	lw	s5,20(sp)
     734:	01012b03          	lw	s6,16(sp)
     738:	03010113          	addi	sp,sp,48
     73c:	00008067          	ret
     740:	fca4dae3          	bge	s1,a0,714 <sdcard_read+0x58>
     744:	0149a023          	sw	s4,0(s3)
     748:	0159a023          	sw	s5,0(s3)
     74c:	0009a783          	lw	a5,0(s3)
     750:	00141413          	slli	s0,s0,0x1
     754:	00b12623          	sw	a1,12(sp)
     758:	00f46433          	or	s0,s0,a5
     75c:	c58b2783          	lw	a5,-936(s6) # 2c58 <sdcard_while_loading_callback>
     760:	00a12423          	sw	a0,8(sp)
     764:	00148493          	addi	s1,s1,1
     768:	000780e7          	jalr	a5
     76c:	00c12583          	lw	a1,12(sp)
     770:	00812503          	lw	a0,8(sp)
     774:	f95ff06f          	j	708 <sdcard_read+0x4c>

00000778 <sdcard_get>:
     778:	fe010113          	addi	sp,sp,-32
     77c:	00112e23          	sw	ra,28(sp)
     780:	00812c23          	sw	s0,24(sp)
     784:	00912a23          	sw	s1,20(sp)
     788:	00050413          	mv	s0,a0
     78c:	00b12623          	sw	a1,12(sp)
     790:	00000097          	auipc	ra,0x0
     794:	e20080e7          	jalr	-480(ra) # 5b0 <sdcard_select>
     798:	00c12583          	lw	a1,12(sp)
     79c:	00040513          	mv	a0,s0
     7a0:	00100493          	li	s1,1
     7a4:	00000097          	auipc	ra,0x0
     7a8:	f18080e7          	jalr	-232(ra) # 6bc <sdcard_read>
     7ac:	00345413          	srli	s0,s0,0x3
     7b0:	0284c463          	blt	s1,s0,7d8 <sdcard_get+0x60>
     7b4:	00a12623          	sw	a0,12(sp)
     7b8:	00000097          	auipc	ra,0x0
     7bc:	e38080e7          	jalr	-456(ra) # 5f0 <sdcard_unselect>
     7c0:	01c12083          	lw	ra,28(sp)
     7c4:	01812403          	lw	s0,24(sp)
     7c8:	00c12503          	lw	a0,12(sp)
     7cc:	01412483          	lw	s1,20(sp)
     7d0:	02010113          	addi	sp,sp,32
     7d4:	00008067          	ret
     7d8:	00000593          	li	a1,0
     7dc:	00800513          	li	a0,8
     7e0:	00000097          	auipc	ra,0x0
     7e4:	edc080e7          	jalr	-292(ra) # 6bc <sdcard_read>
     7e8:	00148493          	addi	s1,s1,1
     7ec:	fc5ff06f          	j	7b0 <sdcard_get+0x38>

000007f0 <sdcard_cmd>:
     7f0:	ff010113          	addi	sp,sp,-16
     7f4:	00812423          	sw	s0,8(sp)
     7f8:	00912223          	sw	s1,4(sp)
     7fc:	01212023          	sw	s2,0(sp)
     800:	00112623          	sw	ra,12(sp)
     804:	00050913          	mv	s2,a0
     808:	00000413          	li	s0,0
     80c:	00000097          	auipc	ra,0x0
     810:	da4080e7          	jalr	-604(ra) # 5b0 <sdcard_select>
     814:	00600493          	li	s1,6
     818:	008907b3          	add	a5,s2,s0
     81c:	0007c503          	lbu	a0,0(a5)
     820:	00140413          	addi	s0,s0,1
     824:	00000097          	auipc	ra,0x0
     828:	de0080e7          	jalr	-544(ra) # 604 <sdcard_send>
     82c:	fe9416e3          	bne	s0,s1,818 <sdcard_cmd+0x28>
     830:	00812403          	lw	s0,8(sp)
     834:	00c12083          	lw	ra,12(sp)
     838:	00412483          	lw	s1,4(sp)
     83c:	00012903          	lw	s2,0(sp)
     840:	01010113          	addi	sp,sp,16
     844:	00000317          	auipc	t1,0x0
     848:	dac30067          	jr	-596(t1) # 5f0 <sdcard_unselect>

0000084c <sdcard_start_sector>:
     84c:	ff010113          	addi	sp,sp,-16
     850:	00112623          	sw	ra,12(sp)
     854:	00812423          	sw	s0,8(sp)
     858:	00050413          	mv	s0,a0
     85c:	00000097          	auipc	ra,0x0
     860:	d54080e7          	jalr	-684(ra) # 5b0 <sdcard_select>
     864:	05100513          	li	a0,81
     868:	00000097          	auipc	ra,0x0
     86c:	d9c080e7          	jalr	-612(ra) # 604 <sdcard_send>
     870:	01845513          	srli	a0,s0,0x18
     874:	00000097          	auipc	ra,0x0
     878:	d90080e7          	jalr	-624(ra) # 604 <sdcard_send>
     87c:	41045513          	srai	a0,s0,0x10
     880:	0ff57513          	zext.b	a0,a0
     884:	00000097          	auipc	ra,0x0
     888:	d80080e7          	jalr	-640(ra) # 604 <sdcard_send>
     88c:	40845513          	srai	a0,s0,0x8
     890:	0ff57513          	zext.b	a0,a0
     894:	00000097          	auipc	ra,0x0
     898:	d70080e7          	jalr	-656(ra) # 604 <sdcard_send>
     89c:	0ff47513          	zext.b	a0,s0
     8a0:	00000097          	auipc	ra,0x0
     8a4:	d64080e7          	jalr	-668(ra) # 604 <sdcard_send>
     8a8:	05500513          	li	a0,85
     8ac:	00000097          	auipc	ra,0x0
     8b0:	d58080e7          	jalr	-680(ra) # 604 <sdcard_send>
     8b4:	00000097          	auipc	ra,0x0
     8b8:	d3c080e7          	jalr	-708(ra) # 5f0 <sdcard_unselect>
     8bc:	00812403          	lw	s0,8(sp)
     8c0:	00c12083          	lw	ra,12(sp)
     8c4:	00100593          	li	a1,1
     8c8:	00800513          	li	a0,8
     8cc:	01010113          	addi	sp,sp,16
     8d0:	00000317          	auipc	t1,0x0
     8d4:	ea830067          	jr	-344(t1) # 778 <sdcard_get>

000008d8 <sdcard_read_sector>:
     8d8:	ff010113          	addi	sp,sp,-16
     8dc:	00812423          	sw	s0,8(sp)
     8e0:	00112623          	sw	ra,12(sp)
     8e4:	00912223          	sw	s1,4(sp)
     8e8:	01212023          	sw	s2,0(sp)
     8ec:	00058413          	mv	s0,a1
     8f0:	00000097          	auipc	ra,0x0
     8f4:	f5c080e7          	jalr	-164(ra) # 84c <sdcard_start_sector>
     8f8:	04051863          	bnez	a0,948 <sdcard_read_sector+0x70>
     8fc:	00100593          	li	a1,1
     900:	00058513          	mv	a0,a1
     904:	00000097          	auipc	ra,0x0
     908:	e74080e7          	jalr	-396(ra) # 778 <sdcard_get>
     90c:	00000493          	li	s1,0
     910:	20000913          	li	s2,512
     914:	00000593          	li	a1,0
     918:	00800513          	li	a0,8
     91c:	00000097          	auipc	ra,0x0
     920:	e5c080e7          	jalr	-420(ra) # 778 <sdcard_get>
     924:	009407b3          	add	a5,s0,s1
     928:	00a78023          	sb	a0,0(a5)
     92c:	00148493          	addi	s1,s1,1
     930:	ff2492e3          	bne	s1,s2,914 <sdcard_read_sector+0x3c>
     934:	00100593          	li	a1,1
     938:	01000513          	li	a0,16
     93c:	20040413          	addi	s0,s0,512
     940:	00000097          	auipc	ra,0x0
     944:	e38080e7          	jalr	-456(ra) # 778 <sdcard_get>
     948:	00c12083          	lw	ra,12(sp)
     94c:	00040513          	mv	a0,s0
     950:	00812403          	lw	s0,8(sp)
     954:	00412483          	lw	s1,4(sp)
     958:	00012903          	lw	s2,0(sp)
     95c:	01010113          	addi	sp,sp,16
     960:	00008067          	ret

00000964 <sdcard_preinit>:
     964:	ff010113          	addi	sp,sp,-16
     968:	000037b7          	lui	a5,0x3
     96c:	00812423          	sw	s0,8(sp)
     970:	88c7a403          	lw	s0,-1908(a5) # 288c <SDCARD>
     974:	00112623          	sw	ra,12(sp)
     978:	00600793          	li	a5,6
     97c:	01313537          	lui	a0,0x1313
     980:	00f42023          	sw	a5,0(s0)
     984:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     988:	00000097          	auipc	ra,0x0
     98c:	c10080e7          	jalr	-1008(ra) # 598 <pause>
     990:	0a000793          	li	a5,160
     994:	00000713          	li	a4,0
     998:	00676693          	ori	a3,a4,6
     99c:	00d42023          	sw	a3,0(s0)
     9a0:	fff78793          	addi	a5,a5,-1
     9a4:	00174713          	xori	a4,a4,1
     9a8:	fe0798e3          	bnez	a5,998 <sdcard_preinit+0x34>
     9ac:	00600793          	li	a5,6
     9b0:	00c12083          	lw	ra,12(sp)
     9b4:	00f42023          	sw	a5,0(s0)
     9b8:	00812403          	lw	s0,8(sp)
     9bc:	01010113          	addi	sp,sp,16
     9c0:	00008067          	ret

000009c4 <sdcard_init>:
     9c4:	000007b7          	lui	a5,0x0
     9c8:	5ac78793          	addi	a5,a5,1452 # 5ac <sdcard_idle>
     9cc:	00003737          	lui	a4,0x3
     9d0:	fe010113          	addi	sp,sp,-32
     9d4:	c4f72c23          	sw	a5,-936(a4) # 2c58 <sdcard_while_loading_callback>
     9d8:	000037b7          	lui	a5,0x3
     9dc:	00812c23          	sw	s0,24(sp)
     9e0:	00912a23          	sw	s1,20(sp)
     9e4:	00112e23          	sw	ra,28(sp)
     9e8:	88078493          	addi	s1,a5,-1920 # 2880 <cmd0>
     9ec:	0ff00413          	li	s0,255
     9f0:	00000097          	auipc	ra,0x0
     9f4:	f74080e7          	jalr	-140(ra) # 964 <sdcard_preinit>
     9f8:	00048513          	mv	a0,s1
     9fc:	00000097          	auipc	ra,0x0
     a00:	df4080e7          	jalr	-524(ra) # 7f0 <sdcard_cmd>
     a04:	00100593          	li	a1,1
     a08:	00800513          	li	a0,8
     a0c:	00000097          	auipc	ra,0x0
     a10:	d6c080e7          	jalr	-660(ra) # 778 <sdcard_get>
     a14:	00a12623          	sw	a0,12(sp)
     a18:	00000097          	auipc	ra,0x0
     a1c:	bac080e7          	jalr	-1108(ra) # 5c4 <sdcard_ponder>
     a20:	00c12503          	lw	a0,12(sp)
     a24:	00851c63          	bne	a0,s0,a3c <sdcard_init+0x78>
     a28:	01313537          	lui	a0,0x1313
     a2c:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     a30:	00000097          	auipc	ra,0x0
     a34:	b68080e7          	jalr	-1176(ra) # 598 <pause>
     a38:	fb9ff06f          	j	9f0 <sdcard_init+0x2c>
     a3c:	00003537          	lui	a0,0x3
     a40:	87850513          	addi	a0,a0,-1928 # 2878 <cmd8>
     a44:	00000097          	auipc	ra,0x0
     a48:	dac080e7          	jalr	-596(ra) # 7f0 <sdcard_cmd>
     a4c:	00100593          	li	a1,1
     a50:	02800513          	li	a0,40
     a54:	00000097          	auipc	ra,0x0
     a58:	d24080e7          	jalr	-732(ra) # 778 <sdcard_get>
     a5c:	00000097          	auipc	ra,0x0
     a60:	b68080e7          	jalr	-1176(ra) # 5c4 <sdcard_ponder>
     a64:	000037b7          	lui	a5,0x3
     a68:	87078413          	addi	s0,a5,-1936 # 2870 <cmd55>
     a6c:	000037b7          	lui	a5,0x3
     a70:	86878493          	addi	s1,a5,-1944 # 2868 <acmd41>
     a74:	00040513          	mv	a0,s0
     a78:	00000097          	auipc	ra,0x0
     a7c:	d78080e7          	jalr	-648(ra) # 7f0 <sdcard_cmd>
     a80:	00100593          	li	a1,1
     a84:	00800513          	li	a0,8
     a88:	00000097          	auipc	ra,0x0
     a8c:	cf0080e7          	jalr	-784(ra) # 778 <sdcard_get>
     a90:	00000097          	auipc	ra,0x0
     a94:	b34080e7          	jalr	-1228(ra) # 5c4 <sdcard_ponder>
     a98:	00048513          	mv	a0,s1
     a9c:	00000097          	auipc	ra,0x0
     aa0:	d54080e7          	jalr	-684(ra) # 7f0 <sdcard_cmd>
     aa4:	00100593          	li	a1,1
     aa8:	00800513          	li	a0,8
     aac:	00000097          	auipc	ra,0x0
     ab0:	ccc080e7          	jalr	-820(ra) # 778 <sdcard_get>
     ab4:	00a12623          	sw	a0,12(sp)
     ab8:	00000097          	auipc	ra,0x0
     abc:	b0c080e7          	jalr	-1268(ra) # 5c4 <sdcard_ponder>
     ac0:	00c12503          	lw	a0,12(sp)
     ac4:	00050c63          	beqz	a0,adc <sdcard_init+0x118>
     ac8:	001e8537          	lui	a0,0x1e8
     acc:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
     ad0:	00000097          	auipc	ra,0x0
     ad4:	ac8080e7          	jalr	-1336(ra) # 598 <pause>
     ad8:	f9dff06f          	j	a74 <sdcard_init+0xb0>
     adc:	00003537          	lui	a0,0x3
     ae0:	86050513          	addi	a0,a0,-1952 # 2860 <cmd16>
     ae4:	00000097          	auipc	ra,0x0
     ae8:	d0c080e7          	jalr	-756(ra) # 7f0 <sdcard_cmd>
     aec:	00100593          	li	a1,1
     af0:	00800513          	li	a0,8
     af4:	00000097          	auipc	ra,0x0
     af8:	c84080e7          	jalr	-892(ra) # 778 <sdcard_get>
     afc:	01812403          	lw	s0,24(sp)
     b00:	01c12083          	lw	ra,28(sp)
     b04:	01412483          	lw	s1,20(sp)
     b08:	02010113          	addi	sp,sp,32
     b0c:	00000317          	auipc	t1,0x0
     b10:	ab830067          	jr	-1352(t1) # 5c4 <sdcard_ponder>

00000b14 <sdcard_readsector>:
     b14:	04060663          	beqz	a2,b60 <sdcard_readsector+0x4c>
     b18:	ff010113          	addi	sp,sp,-16
     b1c:	00812423          	sw	s0,8(sp)
     b20:	00912223          	sw	s1,4(sp)
     b24:	00112623          	sw	ra,12(sp)
     b28:	00050413          	mv	s0,a0
     b2c:	00a604b3          	add	s1,a2,a0
     b30:	00040513          	mv	a0,s0
     b34:	00000097          	auipc	ra,0x0
     b38:	da4080e7          	jalr	-604(ra) # 8d8 <sdcard_read_sector>
     b3c:	00140413          	addi	s0,s0,1
     b40:	00050593          	mv	a1,a0
     b44:	fe9416e3          	bne	s0,s1,b30 <sdcard_readsector+0x1c>
     b48:	00c12083          	lw	ra,12(sp)
     b4c:	00812403          	lw	s0,8(sp)
     b50:	00412483          	lw	s1,4(sp)
     b54:	00100513          	li	a0,1
     b58:	01010113          	addi	sp,sp,16
     b5c:	00008067          	ret
     b60:	00000513          	li	a0,0
     b64:	00008067          	ret

00000b68 <sdcard_writesector>:
     b68:	00000513          	li	a0,0
     b6c:	00008067          	ret

00000b70 <__divsi3>:
     b70:	06054063          	bltz	a0,bd0 <__umodsi3+0x10>
     b74:	0605c663          	bltz	a1,be0 <__umodsi3+0x20>

00000b78 <__udivsi3>:
     b78:	00058613          	mv	a2,a1
     b7c:	00050593          	mv	a1,a0
     b80:	fff00513          	li	a0,-1
     b84:	02060c63          	beqz	a2,bbc <__udivsi3+0x44>
     b88:	00100693          	li	a3,1
     b8c:	00b67a63          	bgeu	a2,a1,ba0 <__udivsi3+0x28>
     b90:	00c05863          	blez	a2,ba0 <__udivsi3+0x28>
     b94:	00161613          	slli	a2,a2,0x1
     b98:	00169693          	slli	a3,a3,0x1
     b9c:	feb66ae3          	bltu	a2,a1,b90 <__udivsi3+0x18>
     ba0:	00000513          	li	a0,0
     ba4:	00c5e663          	bltu	a1,a2,bb0 <__udivsi3+0x38>
     ba8:	40c585b3          	sub	a1,a1,a2
     bac:	00d56533          	or	a0,a0,a3
     bb0:	0016d693          	srli	a3,a3,0x1
     bb4:	00165613          	srli	a2,a2,0x1
     bb8:	fe0696e3          	bnez	a3,ba4 <__udivsi3+0x2c>
     bbc:	00008067          	ret

00000bc0 <__umodsi3>:
     bc0:	00008293          	mv	t0,ra
     bc4:	fb5ff0ef          	jal	b78 <__udivsi3>
     bc8:	00058513          	mv	a0,a1
     bcc:	00028067          	jr	t0
     bd0:	40a00533          	neg	a0,a0
     bd4:	0005d863          	bgez	a1,be4 <__umodsi3+0x24>
     bd8:	40b005b3          	neg	a1,a1
     bdc:	f95ff06f          	j	b70 <__divsi3>
     be0:	40b005b3          	neg	a1,a1
     be4:	00008293          	mv	t0,ra
     be8:	f89ff0ef          	jal	b70 <__divsi3>
     bec:	40a00533          	neg	a0,a0
     bf0:	00028067          	jr	t0

00000bf4 <__modsi3>:
     bf4:	00008293          	mv	t0,ra
     bf8:	0005ca63          	bltz	a1,c0c <__modsi3+0x18>
     bfc:	00054c63          	bltz	a0,c14 <__modsi3+0x20>
     c00:	f79ff0ef          	jal	b78 <__udivsi3>
     c04:	00058513          	mv	a0,a1
     c08:	00028067          	jr	t0
     c0c:	40b005b3          	neg	a1,a1
     c10:	fe0558e3          	bgez	a0,c00 <__modsi3+0xc>
     c14:	40a00533          	neg	a0,a0
     c18:	f61ff0ef          	jal	b78 <__udivsi3>
     c1c:	40b00533          	neg	a0,a1
     c20:	00028067          	jr	t0

00000c24 <memset>:
     c24:	00c50633          	add	a2,a0,a2
     c28:	00050793          	mv	a5,a0
     c2c:	00c79463          	bne	a5,a2,c34 <memset+0x10>
     c30:	00008067          	ret
     c34:	00178793          	addi	a5,a5,1
     c38:	feb78fa3          	sb	a1,-1(a5)
     c3c:	ff1ff06f          	j	c2c <memset+0x8>

00000c40 <memcpy>:
     c40:	00000793          	li	a5,0
     c44:	00c79463          	bne	a5,a2,c4c <memcpy+0xc>
     c48:	00008067          	ret
     c4c:	00f58733          	add	a4,a1,a5
     c50:	00074683          	lbu	a3,0(a4)
     c54:	00f50733          	add	a4,a0,a5
     c58:	00178793          	addi	a5,a5,1
     c5c:	00d70023          	sb	a3,0(a4)
     c60:	fe5ff06f          	j	c44 <memcpy+0x4>

00000c64 <strlen>:
     c64:	00000793          	li	a5,0
     c68:	00f50733          	add	a4,a0,a5
     c6c:	00074703          	lbu	a4,0(a4)
     c70:	00071663          	bnez	a4,c7c <strlen+0x18>
     c74:	00078513          	mv	a0,a5
     c78:	00008067          	ret
     c7c:	00178793          	addi	a5,a5,1
     c80:	fe9ff06f          	j	c68 <strlen+0x4>

00000c84 <strncmp>:
     c84:	00000793          	li	a5,0
     c88:	00c79663          	bne	a5,a2,c94 <strncmp+0x10>
     c8c:	00000513          	li	a0,0
     c90:	00008067          	ret
     c94:	00f50733          	add	a4,a0,a5
     c98:	00074683          	lbu	a3,0(a4)
     c9c:	00f58733          	add	a4,a1,a5
     ca0:	00074703          	lbu	a4,0(a4)
     ca4:	00e6e863          	bltu	a3,a4,cb4 <strncmp+0x30>
     ca8:	00d76a63          	bltu	a4,a3,cbc <strncmp+0x38>
     cac:	00178793          	addi	a5,a5,1
     cb0:	fd9ff06f          	j	c88 <strncmp+0x4>
     cb4:	fff00513          	li	a0,-1
     cb8:	00008067          	ret
     cbc:	00100513          	li	a0,1
     cc0:	00008067          	ret

00000cc4 <strncpy>:
     cc4:	00000793          	li	a5,0
     cc8:	00c79463          	bne	a5,a2,cd0 <strncpy+0xc>
     ccc:	00008067          	ret
     cd0:	00f58733          	add	a4,a1,a5
     cd4:	00074683          	lbu	a3,0(a4)
     cd8:	00f50733          	add	a4,a0,a5
     cdc:	00178793          	addi	a5,a5,1
     ce0:	00d70023          	sb	a3,0(a4)
     ce4:	fe5ff06f          	j	cc8 <strncpy+0x4>

00000ce8 <strcat>:
     ce8:	00050793          	mv	a5,a0
     cec:	0007c683          	lbu	a3,0(a5)
     cf0:	00078713          	mv	a4,a5
     cf4:	00178793          	addi	a5,a5,1
     cf8:	fe069ae3          	bnez	a3,cec <strcat+0x4>
     cfc:	0005c783          	lbu	a5,0(a1)
     d00:	00158593          	addi	a1,a1,1
     d04:	00170713          	addi	a4,a4,1
     d08:	fef70fa3          	sb	a5,-1(a4)
     d0c:	fe0798e3          	bnez	a5,cfc <strcat+0x14>
     d10:	00008067          	ret

00000d14 <oled_wait>:
     d14:	00000013          	nop
     d18:	00000013          	nop
     d1c:	00000013          	nop
     d20:	00000013          	nop
     d24:	00000013          	nop
     d28:	00000013          	nop
     d2c:	00000013          	nop
     d30:	00008067          	ret

00000d34 <oled_init_mode>:
     d34:	000037b7          	lui	a5,0x3
     d38:	8907a703          	lw	a4,-1904(a5) # 2890 <OLED_RST>
     d3c:	fe010113          	addi	sp,sp,-32
     d40:	00112e23          	sw	ra,28(sp)
     d44:	00812c23          	sw	s0,24(sp)
     d48:	00072023          	sw	zero,0(a4)
     d4c:	00040737          	lui	a4,0x40
     d50:	00000013          	nop
     d54:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
     d58:	fe071ce3          	bnez	a4,d50 <oled_init_mode+0x1c>
     d5c:	8907a703          	lw	a4,-1904(a5)
     d60:	00100693          	li	a3,1
     d64:	00d72023          	sw	a3,0(a4)
     d68:	00040737          	lui	a4,0x40
     d6c:	00000013          	nop
     d70:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
     d74:	fe071ce3          	bnez	a4,d6c <oled_init_mode+0x38>
     d78:	8907a783          	lw	a5,-1904(a5)
     d7c:	0007a023          	sw	zero,0(a5)
     d80:	000407b7          	lui	a5,0x40
     d84:	00000013          	nop
     d88:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
     d8c:	fe079ce3          	bnez	a5,d84 <oled_init_mode+0x50>
     d90:	00003737          	lui	a4,0x3
     d94:	89472783          	lw	a5,-1900(a4) # 2894 <OLED>
     d98:	2af00693          	li	a3,687
     d9c:	00d7a023          	sw	a3,0(a5)
     da0:	000407b7          	lui	a5,0x40
     da4:	00000013          	nop
     da8:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
     dac:	fe079ce3          	bnez	a5,da4 <oled_init_mode+0x70>
     db0:	89472403          	lw	s0,-1900(a4)
     db4:	2a000793          	li	a5,672
     db8:	00a12623          	sw	a0,12(sp)
     dbc:	00f42023          	sw	a5,0(s0)
     dc0:	00000097          	auipc	ra,0x0
     dc4:	f54080e7          	jalr	-172(ra) # d14 <oled_wait>
     dc8:	00c12503          	lw	a0,12(sp)
     dcc:	4a000793          	li	a5,1184
     dd0:	00050463          	beqz	a0,dd8 <oled_init_mode+0xa4>
     dd4:	42000793          	li	a5,1056
     dd8:	00f42023          	sw	a5,0(s0)
     ddc:	00000097          	auipc	ra,0x0
     de0:	f38080e7          	jalr	-200(ra) # d14 <oled_wait>
     de4:	2fd00793          	li	a5,765
     de8:	00f42023          	sw	a5,0(s0)
     dec:	00000097          	auipc	ra,0x0
     df0:	f28080e7          	jalr	-216(ra) # d14 <oled_wait>
     df4:	4b100793          	li	a5,1201
     df8:	00f42023          	sw	a5,0(s0)
     dfc:	00000097          	auipc	ra,0x0
     e00:	f18080e7          	jalr	-232(ra) # d14 <oled_wait>
     e04:	2a200793          	li	a5,674
     e08:	00f42023          	sw	a5,0(s0)
     e0c:	00000097          	auipc	ra,0x0
     e10:	f08080e7          	jalr	-248(ra) # d14 <oled_wait>
     e14:	40000793          	li	a5,1024
     e18:	00f42023          	sw	a5,0(s0)
     e1c:	01812403          	lw	s0,24(sp)
     e20:	01c12083          	lw	ra,28(sp)
     e24:	02010113          	addi	sp,sp,32
     e28:	00000317          	auipc	t1,0x0
     e2c:	eec30067          	jr	-276(t1) # d14 <oled_wait>

00000e30 <oled_init>:
     e30:	00000513          	li	a0,0
     e34:	00000317          	auipc	t1,0x0
     e38:	f0030067          	jr	-256(t1) # d34 <oled_init_mode>

00000e3c <oled_fullscreen>:
     e3c:	ff010113          	addi	sp,sp,-16
     e40:	000037b7          	lui	a5,0x3
     e44:	00812423          	sw	s0,8(sp)
     e48:	8947a403          	lw	s0,-1900(a5) # 2894 <OLED>
     e4c:	00112623          	sw	ra,12(sp)
     e50:	00912223          	sw	s1,4(sp)
     e54:	01212023          	sw	s2,0(sp)
     e58:	21500793          	li	a5,533
     e5c:	00f42023          	sw	a5,0(s0)
     e60:	40000913          	li	s2,1024
     e64:	00000097          	auipc	ra,0x0
     e68:	eb0080e7          	jalr	-336(ra) # d14 <oled_wait>
     e6c:	47f00493          	li	s1,1151
     e70:	01242023          	sw	s2,0(s0)
     e74:	00000097          	auipc	ra,0x0
     e78:	ea0080e7          	jalr	-352(ra) # d14 <oled_wait>
     e7c:	00942023          	sw	s1,0(s0)
     e80:	00000097          	auipc	ra,0x0
     e84:	e94080e7          	jalr	-364(ra) # d14 <oled_wait>
     e88:	27500793          	li	a5,629
     e8c:	00f42023          	sw	a5,0(s0)
     e90:	00000097          	auipc	ra,0x0
     e94:	e84080e7          	jalr	-380(ra) # d14 <oled_wait>
     e98:	01242023          	sw	s2,0(s0)
     e9c:	00000097          	auipc	ra,0x0
     ea0:	e78080e7          	jalr	-392(ra) # d14 <oled_wait>
     ea4:	00942023          	sw	s1,0(s0)
     ea8:	00000097          	auipc	ra,0x0
     eac:	e6c080e7          	jalr	-404(ra) # d14 <oled_wait>
     eb0:	25c00793          	li	a5,604
     eb4:	00f42023          	sw	a5,0(s0)
     eb8:	00812403          	lw	s0,8(sp)
     ebc:	00c12083          	lw	ra,12(sp)
     ec0:	00412483          	lw	s1,4(sp)
     ec4:	00012903          	lw	s2,0(sp)
     ec8:	01010113          	addi	sp,sp,16
     ecc:	00000317          	auipc	t1,0x0
     ed0:	e4830067          	jr	-440(t1) # d14 <oled_wait>

00000ed4 <oled_clear>:
     ed4:	fe010113          	addi	sp,sp,-32
     ed8:	000037b7          	lui	a5,0x3
     edc:	01312623          	sw	s3,12(sp)
     ee0:	8947a983          	lw	s3,-1900(a5) # 2894 <OLED>
     ee4:	00812c23          	sw	s0,24(sp)
     ee8:	01212823          	sw	s2,16(sp)
     eec:	00112e23          	sw	ra,28(sp)
     ef0:	00912a23          	sw	s1,20(sp)
     ef4:	08000913          	li	s2,128
     ef8:	40056413          	ori	s0,a0,1024
     efc:	08000493          	li	s1,128
     f00:	0089a023          	sw	s0,0(s3)
     f04:	00000097          	auipc	ra,0x0
     f08:	e10080e7          	jalr	-496(ra) # d14 <oled_wait>
     f0c:	0089a023          	sw	s0,0(s3)
     f10:	00000097          	auipc	ra,0x0
     f14:	e04080e7          	jalr	-508(ra) # d14 <oled_wait>
     f18:	fff48493          	addi	s1,s1,-1
     f1c:	0089a023          	sw	s0,0(s3)
     f20:	00000097          	auipc	ra,0x0
     f24:	df4080e7          	jalr	-524(ra) # d14 <oled_wait>
     f28:	fc049ce3          	bnez	s1,f00 <oled_clear+0x2c>
     f2c:	fff90913          	addi	s2,s2,-1
     f30:	fc0916e3          	bnez	s2,efc <oled_clear+0x28>
     f34:	01c12083          	lw	ra,28(sp)
     f38:	01812403          	lw	s0,24(sp)
     f3c:	01412483          	lw	s1,20(sp)
     f40:	01012903          	lw	s2,16(sp)
     f44:	00c12983          	lw	s3,12(sp)
     f48:	02010113          	addi	sp,sp,32
     f4c:	00008067          	ret

00000f50 <oled_wait>:
     f50:	00000013          	nop
     f54:	00000013          	nop
     f58:	00000013          	nop
     f5c:	00000013          	nop
     f60:	00000013          	nop
     f64:	00000013          	nop
     f68:	00000013          	nop
     f6c:	00008067          	ret

00000f70 <display_set_cursor>:
     f70:	000037b7          	lui	a5,0x3
     f74:	c6a7a223          	sw	a0,-924(a5) # 2c64 <cursor_x>
     f78:	000037b7          	lui	a5,0x3
     f7c:	c6b7a023          	sw	a1,-928(a5) # 2c60 <cursor_y>
     f80:	00008067          	ret

00000f84 <display_set_front_back_color>:
     f84:	000037b7          	lui	a5,0x3
     f88:	c4a78ea3          	sb	a0,-931(a5) # 2c5d <front_color>
     f8c:	000037b7          	lui	a5,0x3
     f90:	c4b78e23          	sb	a1,-932(a5) # 2c5c <back_color>
     f94:	00008067          	ret

00000f98 <display_putchar>:
     f98:	00a00793          	li	a5,10
     f9c:	00003737          	lui	a4,0x3
     fa0:	02f51663          	bne	a0,a5,fcc <display_putchar+0x34>
     fa4:	c6072223          	sw	zero,-924(a4) # 2c64 <cursor_x>
     fa8:	00003737          	lui	a4,0x3
     fac:	c6072783          	lw	a5,-928(a4) # 2c60 <cursor_y>
     fb0:	00878793          	addi	a5,a5,8
     fb4:	c6f72023          	sw	a5,-928(a4)
     fb8:	07f00713          	li	a4,127
     fbc:	10f75263          	bge	a4,a5,10c0 <display_putchar+0x128>
     fc0:	000037b7          	lui	a5,0x3
     fc4:	c607a023          	sw	zero,-928(a5) # 2c60 <cursor_y>
     fc8:	00008067          	ret
     fcc:	01f00793          	li	a5,31
     fd0:	0ca7d063          	bge	a5,a0,1090 <display_putchar+0xf8>
     fd4:	000037b7          	lui	a5,0x3
     fd8:	c607a783          	lw	a5,-928(a5) # 2c60 <cursor_y>
     fdc:	07800693          	li	a3,120
     fe0:	00800593          	li	a1,8
     fe4:	00f6d663          	bge	a3,a5,ff0 <display_putchar+0x58>
     fe8:	08000593          	li	a1,128
     fec:	40f585b3          	sub	a1,a1,a5
     ff0:	c6472683          	lw	a3,-924(a4)
     ff4:	07b00613          	li	a2,123
     ff8:	00500813          	li	a6,5
     ffc:	00d65663          	bge	a2,a3,1008 <display_putchar+0x70>
    1000:	08000813          	li	a6,128
    1004:	40d80833          	sub	a6,a6,a3
    1008:	00003637          	lui	a2,0x3
    100c:	c5c64283          	lbu	t0,-932(a2) # 2c5c <back_color>
    1010:	00003637          	lui	a2,0x3
    1014:	c5d64383          	lbu	t2,-931(a2) # 2c5d <front_color>
    1018:	00003637          	lui	a2,0x3
    101c:	58460613          	addi	a2,a2,1412 # 3584 <framebuffer>
    1020:	00c787b3          	add	a5,a5,a2
    1024:	00769693          	slli	a3,a3,0x7
    1028:	00d787b3          	add	a5,a5,a3
    102c:	00003637          	lui	a2,0x3
    1030:	00251693          	slli	a3,a0,0x2
    1034:	97460613          	addi	a2,a2,-1676 # 2974 <font>
    1038:	00a686b3          	add	a3,a3,a0
    103c:	00c686b3          	add	a3,a3,a2
    1040:	00100f93          	li	t6,1
    1044:	00000613          	li	a2,0
    1048:	04b65463          	bge	a2,a1,1090 <display_putchar+0xf8>
    104c:	00cf9f33          	sll	t5,t6,a2
    1050:	00f60333          	add	t1,a2,a5
    1054:	00068893          	mv	a7,a3
    1058:	00000513          	li	a0,0
    105c:	0280006f          	j	1084 <display_putchar+0xec>
    1060:	f608ce03          	lbu	t3,-160(a7)
    1064:	00038e93          	mv	t4,t2
    1068:	01ee7e33          	and	t3,t3,t5
    106c:	000e1463          	bnez	t3,1074 <display_putchar+0xdc>
    1070:	00028e93          	mv	t4,t0
    1074:	01d30023          	sb	t4,0(t1)
    1078:	00150513          	addi	a0,a0,1
    107c:	08030313          	addi	t1,t1,128
    1080:	00188893          	addi	a7,a7,1
    1084:	fd054ee3          	blt	a0,a6,1060 <display_putchar+0xc8>
    1088:	00160613          	addi	a2,a2,1
    108c:	fbdff06f          	j	1048 <display_putchar+0xb0>
    1090:	c6472783          	lw	a5,-924(a4)
    1094:	07f00693          	li	a3,127
    1098:	00578793          	addi	a5,a5,5
    109c:	00f6c663          	blt	a3,a5,10a8 <display_putchar+0x110>
    10a0:	c6f72223          	sw	a5,-924(a4)
    10a4:	00008067          	ret
    10a8:	c6072223          	sw	zero,-924(a4)
    10ac:	00003737          	lui	a4,0x3
    10b0:	c6072783          	lw	a5,-928(a4) # 2c60 <cursor_y>
    10b4:	00878793          	addi	a5,a5,8
    10b8:	c6f72023          	sw	a5,-928(a4)
    10bc:	f0f6c2e3          	blt	a3,a5,fc0 <display_putchar+0x28>
    10c0:	00008067          	ret

000010c4 <display_refresh>:
    10c4:	fe010113          	addi	sp,sp,-32
    10c8:	000037b7          	lui	a5,0x3
    10cc:	01212823          	sw	s2,16(sp)
    10d0:	8947a903          	lw	s2,-1900(a5) # 2894 <OLED>
    10d4:	01312623          	sw	s3,12(sp)
    10d8:	000039b7          	lui	s3,0x3
    10dc:	00912a23          	sw	s1,20(sp)
    10e0:	01412423          	sw	s4,8(sp)
    10e4:	00112e23          	sw	ra,28(sp)
    10e8:	00812c23          	sw	s0,24(sp)
    10ec:	00000493          	li	s1,0
    10f0:	58498993          	addi	s3,s3,1412 # 3584 <framebuffer>
    10f4:	00004a37          	lui	s4,0x4
    10f8:	013487b3          	add	a5,s1,s3
    10fc:	0007c403          	lbu	s0,0(a5)
    1100:	00148493          	addi	s1,s1,1
    1104:	00245413          	srli	s0,s0,0x2
    1108:	40046413          	ori	s0,s0,1024
    110c:	00892023          	sw	s0,0(s2)
    1110:	00000097          	auipc	ra,0x0
    1114:	e40080e7          	jalr	-448(ra) # f50 <oled_wait>
    1118:	00892023          	sw	s0,0(s2)
    111c:	00000097          	auipc	ra,0x0
    1120:	e34080e7          	jalr	-460(ra) # f50 <oled_wait>
    1124:	00892023          	sw	s0,0(s2)
    1128:	00000097          	auipc	ra,0x0
    112c:	e28080e7          	jalr	-472(ra) # f50 <oled_wait>
    1130:	fd4494e3          	bne	s1,s4,10f8 <display_refresh+0x34>
    1134:	01c12083          	lw	ra,28(sp)
    1138:	01812403          	lw	s0,24(sp)
    113c:	01412483          	lw	s1,20(sp)
    1140:	01012903          	lw	s2,16(sp)
    1144:	00c12983          	lw	s3,12(sp)
    1148:	00812a03          	lw	s4,8(sp)
    114c:	02010113          	addi	sp,sp,32
    1150:	00008067          	ret

00001154 <print_string>:
    1154:	ff010113          	addi	sp,sp,-16
    1158:	00812423          	sw	s0,8(sp)
    115c:	00912223          	sw	s1,4(sp)
    1160:	00112623          	sw	ra,12(sp)
    1164:	00050413          	mv	s0,a0
    1168:	000034b7          	lui	s1,0x3
    116c:	00044503          	lbu	a0,0(s0)
    1170:	00051c63          	bnez	a0,1188 <print_string+0x34>
    1174:	00c12083          	lw	ra,12(sp)
    1178:	00812403          	lw	s0,8(sp)
    117c:	00412483          	lw	s1,4(sp)
    1180:	01010113          	addi	sp,sp,16
    1184:	00008067          	ret
    1188:	c684a783          	lw	a5,-920(s1) # 2c68 <f_putchar>
    118c:	00140413          	addi	s0,s0,1
    1190:	000780e7          	jalr	a5
    1194:	fd9ff06f          	j	116c <print_string+0x18>

00001198 <print_dec>:
    1198:	ef010113          	addi	sp,sp,-272
    119c:	10812423          	sw	s0,264(sp)
    11a0:	10912223          	sw	s1,260(sp)
    11a4:	10112623          	sw	ra,268(sp)
    11a8:	11212023          	sw	s2,256(sp)
    11ac:	00050413          	mv	s0,a0
    11b0:	000034b7          	lui	s1,0x3
    11b4:	08045063          	bgez	s0,1234 <print_dec+0x9c>
    11b8:	c684a783          	lw	a5,-920(s1) # 2c68 <f_putchar>
    11bc:	02d00513          	li	a0,45
    11c0:	40800433          	neg	s0,s0
    11c4:	000780e7          	jalr	a5
    11c8:	fedff06f          	j	11b4 <print_dec+0x1c>
    11cc:	00040513          	mv	a0,s0
    11d0:	00a00593          	li	a1,10
    11d4:	00000097          	auipc	ra,0x0
    11d8:	99c080e7          	jalr	-1636(ra) # b70 <__divsi3>
    11dc:	00251793          	slli	a5,a0,0x2
    11e0:	00f507b3          	add	a5,a0,a5
    11e4:	00179793          	slli	a5,a5,0x1
    11e8:	40f40433          	sub	s0,s0,a5
    11ec:	00148493          	addi	s1,s1,1
    11f0:	fe848fa3          	sb	s0,-1(s1)
    11f4:	00050413          	mv	s0,a0
    11f8:	fc041ae3          	bnez	s0,11cc <print_dec+0x34>
    11fc:	fd2488e3          	beq	s1,s2,11cc <print_dec+0x34>
    1200:	00003437          	lui	s0,0x3
    1204:	fff4c503          	lbu	a0,-1(s1)
    1208:	c6842783          	lw	a5,-920(s0) # 2c68 <f_putchar>
    120c:	fff48493          	addi	s1,s1,-1
    1210:	03050513          	addi	a0,a0,48
    1214:	000780e7          	jalr	a5
    1218:	ff2496e3          	bne	s1,s2,1204 <print_dec+0x6c>
    121c:	10c12083          	lw	ra,268(sp)
    1220:	10812403          	lw	s0,264(sp)
    1224:	10412483          	lw	s1,260(sp)
    1228:	10012903          	lw	s2,256(sp)
    122c:	11010113          	addi	sp,sp,272
    1230:	00008067          	ret
    1234:	00010493          	mv	s1,sp
    1238:	00010913          	mv	s2,sp
    123c:	fbdff06f          	j	11f8 <print_dec+0x60>

00001240 <print_hex_digits>:
    1240:	fe010113          	addi	sp,sp,-32
    1244:	00812c23          	sw	s0,24(sp)
    1248:	00912a23          	sw	s1,20(sp)
    124c:	fff58413          	addi	s0,a1,-1
    1250:	000034b7          	lui	s1,0x3
    1254:	01212823          	sw	s2,16(sp)
    1258:	01312623          	sw	s3,12(sp)
    125c:	00112e23          	sw	ra,28(sp)
    1260:	00050993          	mv	s3,a0
    1264:	00241413          	slli	s0,s0,0x2
    1268:	92c48493          	addi	s1,s1,-1748 # 292c <LEDS+0x94>
    126c:	00003937          	lui	s2,0x3
    1270:	02045063          	bgez	s0,1290 <print_hex_digits+0x50>
    1274:	01c12083          	lw	ra,28(sp)
    1278:	01812403          	lw	s0,24(sp)
    127c:	01412483          	lw	s1,20(sp)
    1280:	01012903          	lw	s2,16(sp)
    1284:	00c12983          	lw	s3,12(sp)
    1288:	02010113          	addi	sp,sp,32
    128c:	00008067          	ret
    1290:	0089d7b3          	srl	a5,s3,s0
    1294:	00f7f793          	andi	a5,a5,15
    1298:	00f487b3          	add	a5,s1,a5
    129c:	c6892703          	lw	a4,-920(s2) # 2c68 <f_putchar>
    12a0:	0007c503          	lbu	a0,0(a5)
    12a4:	ffc40413          	addi	s0,s0,-4
    12a8:	000700e7          	jalr	a4
    12ac:	fc5ff06f          	j	1270 <print_hex_digits+0x30>

000012b0 <print_hex>:
    12b0:	00800593          	li	a1,8
    12b4:	00000317          	auipc	t1,0x0
    12b8:	f8c30067          	jr	-116(t1) # 1240 <print_hex_digits>

000012bc <printf>:
    12bc:	fa010113          	addi	sp,sp,-96
    12c0:	04f12a23          	sw	a5,84(sp)
    12c4:	04410793          	addi	a5,sp,68
    12c8:	02812c23          	sw	s0,56(sp)
    12cc:	02912a23          	sw	s1,52(sp)
    12d0:	03212823          	sw	s2,48(sp)
    12d4:	03312623          	sw	s3,44(sp)
    12d8:	03412423          	sw	s4,40(sp)
    12dc:	03512223          	sw	s5,36(sp)
    12e0:	03612023          	sw	s6,32(sp)
    12e4:	02112e23          	sw	ra,60(sp)
    12e8:	01712e23          	sw	s7,28(sp)
    12ec:	00050413          	mv	s0,a0
    12f0:	04b12223          	sw	a1,68(sp)
    12f4:	04c12423          	sw	a2,72(sp)
    12f8:	04d12623          	sw	a3,76(sp)
    12fc:	04e12823          	sw	a4,80(sp)
    1300:	05012c23          	sw	a6,88(sp)
    1304:	05112e23          	sw	a7,92(sp)
    1308:	00f12623          	sw	a5,12(sp)
    130c:	02500913          	li	s2,37
    1310:	000034b7          	lui	s1,0x3
    1314:	07300993          	li	s3,115
    1318:	07800a13          	li	s4,120
    131c:	06400a93          	li	s5,100
    1320:	06300b13          	li	s6,99
    1324:	00044503          	lbu	a0,0(s0)
    1328:	02051863          	bnez	a0,1358 <printf+0x9c>
    132c:	03c12083          	lw	ra,60(sp)
    1330:	03812403          	lw	s0,56(sp)
    1334:	03412483          	lw	s1,52(sp)
    1338:	03012903          	lw	s2,48(sp)
    133c:	02c12983          	lw	s3,44(sp)
    1340:	02812a03          	lw	s4,40(sp)
    1344:	02412a83          	lw	s5,36(sp)
    1348:	02012b03          	lw	s6,32(sp)
    134c:	01c12b83          	lw	s7,28(sp)
    1350:	06010113          	addi	sp,sp,96
    1354:	00008067          	ret
    1358:	09251a63          	bne	a0,s2,13ec <printf+0x130>
    135c:	00144503          	lbu	a0,1(s0)
    1360:	00140b93          	addi	s7,s0,1
    1364:	03351463          	bne	a0,s3,138c <printf+0xd0>
    1368:	00c12783          	lw	a5,12(sp)
    136c:	0007a503          	lw	a0,0(a5)
    1370:	00478713          	addi	a4,a5,4
    1374:	00e12623          	sw	a4,12(sp)
    1378:	00000097          	auipc	ra,0x0
    137c:	ddc080e7          	jalr	-548(ra) # 1154 <print_string>
    1380:	000b8413          	mv	s0,s7
    1384:	00140413          	addi	s0,s0,1
    1388:	f9dff06f          	j	1324 <printf+0x68>
    138c:	03451063          	bne	a0,s4,13ac <printf+0xf0>
    1390:	00c12783          	lw	a5,12(sp)
    1394:	0007a503          	lw	a0,0(a5)
    1398:	00478713          	addi	a4,a5,4
    139c:	00e12623          	sw	a4,12(sp)
    13a0:	00000097          	auipc	ra,0x0
    13a4:	f10080e7          	jalr	-240(ra) # 12b0 <print_hex>
    13a8:	fd9ff06f          	j	1380 <printf+0xc4>
    13ac:	03551063          	bne	a0,s5,13cc <printf+0x110>
    13b0:	00c12783          	lw	a5,12(sp)
    13b4:	0007a503          	lw	a0,0(a5)
    13b8:	00478713          	addi	a4,a5,4
    13bc:	00e12623          	sw	a4,12(sp)
    13c0:	00000097          	auipc	ra,0x0
    13c4:	dd8080e7          	jalr	-552(ra) # 1198 <print_dec>
    13c8:	fb9ff06f          	j	1380 <printf+0xc4>
    13cc:	c684a783          	lw	a5,-920(s1) # 2c68 <f_putchar>
    13d0:	01651a63          	bne	a0,s6,13e4 <printf+0x128>
    13d4:	00c12703          	lw	a4,12(sp)
    13d8:	00072503          	lw	a0,0(a4)
    13dc:	00470693          	addi	a3,a4,4
    13e0:	00d12623          	sw	a3,12(sp)
    13e4:	000780e7          	jalr	a5
    13e8:	f99ff06f          	j	1380 <printf+0xc4>
    13ec:	c684a783          	lw	a5,-920(s1)
    13f0:	000780e7          	jalr	a5
    13f4:	f91ff06f          	j	1384 <printf+0xc8>

000013f8 <__mulsi3>:
    13f8:	00050793          	mv	a5,a0
    13fc:	00000513          	li	a0,0
    1400:	00079463          	bnez	a5,1408 <__mulsi3+0x10>
    1404:	00008067          	ret
    1408:	01f79693          	slli	a3,a5,0x1f
    140c:	41f6d713          	srai	a4,a3,0x1f
    1410:	00b77733          	and	a4,a4,a1
    1414:	00e50533          	add	a0,a0,a4
    1418:	0017d793          	srli	a5,a5,0x1
    141c:	00159593          	slli	a1,a1,0x1
    1420:	fe1ff06f          	j	1400 <__mulsi3+0x8>

00001424 <fat_list_insert_last>:
    1424:	00452783          	lw	a5,4(a0)
    1428:	04079263          	bnez	a5,146c <fat_list_insert_last+0x48>
    142c:	00052783          	lw	a5,0(a0)
    1430:	00079c63          	bnez	a5,1448 <fat_list_insert_last+0x24>
    1434:	00b52023          	sw	a1,0(a0)
    1438:	00b52223          	sw	a1,4(a0)
    143c:	0005a023          	sw	zero,0(a1)
    1440:	0005a223          	sw	zero,4(a1)
    1444:	00008067          	ret
    1448:	0007a703          	lw	a4,0(a5)
    144c:	00f5a223          	sw	a5,4(a1)
    1450:	00e5a023          	sw	a4,0(a1)
    1454:	00071863          	bnez	a4,1464 <fat_list_insert_last+0x40>
    1458:	00b52023          	sw	a1,0(a0)
    145c:	00b7a023          	sw	a1,0(a5)
    1460:	00008067          	ret
    1464:	00b72223          	sw	a1,4(a4)
    1468:	ff5ff06f          	j	145c <fat_list_insert_last+0x38>
    146c:	0047a703          	lw	a4,4(a5)
    1470:	00f5a023          	sw	a5,0(a1)
    1474:	00e5a223          	sw	a4,4(a1)
    1478:	00071863          	bnez	a4,1488 <fat_list_insert_last+0x64>
    147c:	00b52223          	sw	a1,4(a0)
    1480:	00b7a223          	sw	a1,4(a5)
    1484:	00008067          	ret
    1488:	00b72023          	sw	a1,0(a4)
    148c:	ff5ff06f          	j	1480 <fat_list_insert_last+0x5c>

00001490 <FileString_StrCmpNoCase>:
    1490:	00050e93          	mv	t4,a0
    1494:	00000793          	li	a5,0
    1498:	01900e13          	li	t3,25
    149c:	00c79663          	bne	a5,a2,14a8 <FileString_StrCmpNoCase+0x18>
    14a0:	00000513          	li	a0,0
    14a4:	00008067          	ret
    14a8:	00fe8733          	add	a4,t4,a5
    14ac:	00074803          	lbu	a6,0(a4)
    14b0:	00f58733          	add	a4,a1,a5
    14b4:	00074883          	lbu	a7,0(a4)
    14b8:	fbf80713          	addi	a4,a6,-65
    14bc:	0ff77713          	zext.b	a4,a4
    14c0:	00080693          	mv	a3,a6
    14c4:	00ee6663          	bltu	t3,a4,14d0 <FileString_StrCmpNoCase+0x40>
    14c8:	02080693          	addi	a3,a6,32
    14cc:	0ff6f693          	zext.b	a3,a3
    14d0:	fbf88313          	addi	t1,a7,-65
    14d4:	0ff37313          	zext.b	t1,t1
    14d8:	00088713          	mv	a4,a7
    14dc:	006e6663          	bltu	t3,t1,14e8 <FileString_StrCmpNoCase+0x58>
    14e0:	02088713          	addi	a4,a7,32
    14e4:	0ff77713          	zext.b	a4,a4
    14e8:	40e68533          	sub	a0,a3,a4
    14ec:	00e69863          	bne	a3,a4,14fc <FileString_StrCmpNoCase+0x6c>
    14f0:	00178793          	addi	a5,a5,1
    14f4:	00088463          	beqz	a7,14fc <FileString_StrCmpNoCase+0x6c>
    14f8:	fa0812e3          	bnez	a6,149c <FileString_StrCmpNoCase+0xc>
    14fc:	00008067          	ret

00001500 <FileString_GetExtension>:
    1500:	00050793          	mv	a5,a0
    1504:	fff00713          	li	a4,-1
    1508:	02e00613          	li	a2,46
    150c:	0007c683          	lbu	a3,0(a5)
    1510:	00069663          	bnez	a3,151c <FileString_GetExtension+0x1c>
    1514:	00070513          	mv	a0,a4
    1518:	00008067          	ret
    151c:	00c69463          	bne	a3,a2,1524 <FileString_GetExtension+0x24>
    1520:	40a78733          	sub	a4,a5,a0
    1524:	00178793          	addi	a5,a5,1
    1528:	fe5ff06f          	j	150c <FileString_GetExtension+0xc>

0000152c <fatfs_fat_writeback>:
    152c:	00059e63          	bnez	a1,1548 <fatfs_fat_writeback+0x1c>
    1530:	00000513          	li	a0,0
    1534:	00008067          	ret
    1538:	00000513          	li	a0,0
    153c:	01c12083          	lw	ra,28(sp)
    1540:	02010113          	addi	sp,sp,32
    1544:	00008067          	ret
    1548:	2045a783          	lw	a5,516(a1)
    154c:	04078e63          	beqz	a5,15a8 <fatfs_fat_writeback+0x7c>
    1550:	03852683          	lw	a3,56(a0)
    1554:	00050793          	mv	a5,a0
    1558:	04068663          	beqz	a3,15a4 <fatfs_fat_writeback+0x78>
    155c:	0147a703          	lw	a4,20(a5)
    1560:	2005a503          	lw	a0,512(a1)
    1564:	0207a803          	lw	a6,32(a5)
    1568:	00100613          	li	a2,1
    156c:	fe010113          	addi	sp,sp,-32
    1570:	40e607b3          	sub	a5,a2,a4
    1574:	00112e23          	sw	ra,28(sp)
    1578:	00a787b3          	add	a5,a5,a0
    157c:	00f87663          	bgeu	a6,a5,1588 <fatfs_fat_writeback+0x5c>
    1580:	01070733          	add	a4,a4,a6
    1584:	40a70633          	sub	a2,a4,a0
    1588:	00b12623          	sw	a1,12(sp)
    158c:	000680e7          	jalr	a3
    1590:	fa0504e3          	beqz	a0,1538 <fatfs_fat_writeback+0xc>
    1594:	00c12583          	lw	a1,12(sp)
    1598:	00100513          	li	a0,1
    159c:	2005a223          	sw	zero,516(a1)
    15a0:	f9dff06f          	j	153c <fatfs_fat_writeback+0x10>
    15a4:	2005a223          	sw	zero,516(a1)
    15a8:	00100513          	li	a0,1
    15ac:	00008067          	ret

000015b0 <fatfs_fat_read_sector>:
    15b0:	fe010113          	addi	sp,sp,-32
    15b4:	01212823          	sw	s2,16(sp)
    15b8:	25452903          	lw	s2,596(a0)
    15bc:	00812c23          	sw	s0,24(sp)
    15c0:	00112e23          	sw	ra,28(sp)
    15c4:	00912a23          	sw	s1,20(sp)
    15c8:	01312623          	sw	s3,12(sp)
    15cc:	00000413          	li	s0,0
    15d0:	04091463          	bnez	s2,1618 <fatfs_fat_read_sector+0x68>
    15d4:	25452783          	lw	a5,596(a0)
    15d8:	00058493          	mv	s1,a1
    15dc:	00050993          	mv	s3,a0
    15e0:	20f42623          	sw	a5,524(s0)
    15e4:	20442783          	lw	a5,516(s0)
    15e8:	24852a23          	sw	s0,596(a0)
    15ec:	08079863          	bnez	a5,167c <fatfs_fat_read_sector+0xcc>
    15f0:	0349a783          	lw	a5,52(s3)
    15f4:	20942023          	sw	s1,512(s0)
    15f8:	00100613          	li	a2,1
    15fc:	00040593          	mv	a1,s0
    1600:	00048513          	mv	a0,s1
    1604:	000780e7          	jalr	a5
    1608:	08051463          	bnez	a0,1690 <fatfs_fat_read_sector+0xe0>
    160c:	fff00793          	li	a5,-1
    1610:	20f42023          	sw	a5,512(s0)
    1614:	0480006f          	j	165c <fatfs_fat_read_sector+0xac>
    1618:	20092783          	lw	a5,512(s2)
    161c:	00f5e663          	bltu	a1,a5,1628 <fatfs_fat_read_sector+0x78>
    1620:	00178713          	addi	a4,a5,1
    1624:	02e5e463          	bltu	a1,a4,164c <fatfs_fat_read_sector+0x9c>
    1628:	20c92783          	lw	a5,524(s2)
    162c:	00079663          	bnez	a5,1638 <fatfs_fat_read_sector+0x88>
    1630:	00040a63          	beqz	s0,1644 <fatfs_fat_read_sector+0x94>
    1634:	20042623          	sw	zero,524(s0)
    1638:	00090413          	mv	s0,s2
    163c:	20c92903          	lw	s2,524(s2)
    1640:	f91ff06f          	j	15d0 <fatfs_fat_read_sector+0x20>
    1644:	24052a23          	sw	zero,596(a0)
    1648:	ff1ff06f          	j	1638 <fatfs_fat_read_sector+0x88>
    164c:	40f585b3          	sub	a1,a1,a5
    1650:	00959593          	slli	a1,a1,0x9
    1654:	00b905b3          	add	a1,s2,a1
    1658:	20b92423          	sw	a1,520(s2)
    165c:	01c12083          	lw	ra,28(sp)
    1660:	01812403          	lw	s0,24(sp)
    1664:	01412483          	lw	s1,20(sp)
    1668:	00c12983          	lw	s3,12(sp)
    166c:	00090513          	mv	a0,s2
    1670:	01012903          	lw	s2,16(sp)
    1674:	02010113          	addi	sp,sp,32
    1678:	00008067          	ret
    167c:	00040593          	mv	a1,s0
    1680:	00000097          	auipc	ra,0x0
    1684:	eac080e7          	jalr	-340(ra) # 152c <fatfs_fat_writeback>
    1688:	f60514e3          	bnez	a0,15f0 <fatfs_fat_read_sector+0x40>
    168c:	fd1ff06f          	j	165c <fatfs_fat_read_sector+0xac>
    1690:	20842423          	sw	s0,520(s0)
    1694:	00040913          	mv	s2,s0
    1698:	fc5ff06f          	j	165c <fatfs_fat_read_sector+0xac>

0000169c <fatfs_lba_of_cluster>:
    169c:	ff010113          	addi	sp,sp,-16
    16a0:	00812423          	sw	s0,8(sp)
    16a4:	00112623          	sw	ra,12(sp)
    16a8:	00050413          	mv	s0,a0
    16ac:	ffe58513          	addi	a0,a1,-2
    16b0:	00044583          	lbu	a1,0(s0)
    16b4:	00000097          	auipc	ra,0x0
    16b8:	d44080e7          	jalr	-700(ra) # 13f8 <__mulsi3>
    16bc:	00442783          	lw	a5,4(s0)
    16c0:	00f50533          	add	a0,a0,a5
    16c4:	03042783          	lw	a5,48(s0)
    16c8:	00079863          	bnez	a5,16d8 <fatfs_lba_of_cluster+0x3c>
    16cc:	02845783          	lhu	a5,40(s0)
    16d0:	4047d793          	srai	a5,a5,0x4
    16d4:	00f50533          	add	a0,a0,a5
    16d8:	00c12083          	lw	ra,12(sp)
    16dc:	00812403          	lw	s0,8(sp)
    16e0:	01010113          	addi	sp,sp,16
    16e4:	00008067          	ret

000016e8 <fl_init>:
    16e8:	ff010113          	addi	sp,sp,-16
    16ec:	00003537          	lui	a0,0x3
    16f0:	000037b7          	lui	a5,0x3
    16f4:	000085b7          	lui	a1,0x8
    16f8:	00112623          	sw	ra,12(sp)
    16fc:	c6c50513          	addi	a0,a0,-916 # 2c6c <_free_file_list>
    1700:	c7478793          	addi	a5,a5,-908 # 2c74 <_open_file_list>
    1704:	e2858593          	addi	a1,a1,-472 # 7e28 <_files+0x43c>
    1708:	00052223          	sw	zero,4(a0)
    170c:	00052023          	sw	zero,0(a0)
    1710:	0007a223          	sw	zero,4(a5)
    1714:	0007a023          	sw	zero,0(a5)
    1718:	00000097          	auipc	ra,0x0
    171c:	d0c080e7          	jalr	-756(ra) # 1424 <fat_list_insert_last>
    1720:	000037b7          	lui	a5,0x3
    1724:	000085b7          	lui	a1,0x8
    1728:	c6c78513          	addi	a0,a5,-916 # 2c6c <_free_file_list>
    172c:	26c58593          	addi	a1,a1,620 # 826c <_files+0x880>
    1730:	00000097          	auipc	ra,0x0
    1734:	cf4080e7          	jalr	-780(ra) # 1424 <fat_list_insert_last>
    1738:	00c12083          	lw	ra,12(sp)
    173c:	000037b7          	lui	a5,0x3
    1740:	00100713          	li	a4,1
    1744:	c8e7a023          	sw	a4,-896(a5) # 2c80 <_filelib_init>
    1748:	01010113          	addi	sp,sp,16
    174c:	00008067          	ret

00001750 <fl_closedir>:
    1750:	00000513          	li	a0,0
    1754:	00008067          	ret

00001758 <fatfs_lfn_cache_entry>:
    1758:	0005c783          	lbu	a5,0(a1)
    175c:	01300693          	li	a3,19
    1760:	01f7f793          	andi	a5,a5,31
    1764:	fff78713          	addi	a4,a5,-1
    1768:	0ff77613          	zext.b	a2,a4
    176c:	0ac6ea63          	bltu	a3,a2,1820 <fatfs_lfn_cache_entry+0xc8>
    1770:	10554683          	lbu	a3,261(a0)
    1774:	00069463          	bnez	a3,177c <fatfs_lfn_cache_entry+0x24>
    1778:	10f502a3          	sb	a5,261(a0)
    177c:	00171793          	slli	a5,a4,0x1
    1780:	00e787b3          	add	a5,a5,a4
    1784:	0015c683          	lbu	a3,1(a1)
    1788:	00279793          	slli	a5,a5,0x2
    178c:	00e787b3          	add	a5,a5,a4
    1790:	00f50533          	add	a0,a0,a5
    1794:	00d50023          	sb	a3,0(a0)
    1798:	0035c783          	lbu	a5,3(a1)
    179c:	0ff00713          	li	a4,255
    17a0:	02000693          	li	a3,32
    17a4:	00f500a3          	sb	a5,1(a0)
    17a8:	0055c783          	lbu	a5,5(a1)
    17ac:	00f50123          	sb	a5,2(a0)
    17b0:	0075c783          	lbu	a5,7(a1)
    17b4:	00f501a3          	sb	a5,3(a0)
    17b8:	0095c783          	lbu	a5,9(a1)
    17bc:	00f50223          	sb	a5,4(a0)
    17c0:	00e5c783          	lbu	a5,14(a1)
    17c4:	00f502a3          	sb	a5,5(a0)
    17c8:	0105c783          	lbu	a5,16(a1)
    17cc:	00f50323          	sb	a5,6(a0)
    17d0:	0125c783          	lbu	a5,18(a1)
    17d4:	00f503a3          	sb	a5,7(a0)
    17d8:	0145c783          	lbu	a5,20(a1)
    17dc:	00f50423          	sb	a5,8(a0)
    17e0:	0165c783          	lbu	a5,22(a1)
    17e4:	00f504a3          	sb	a5,9(a0)
    17e8:	0185c783          	lbu	a5,24(a1)
    17ec:	00f50523          	sb	a5,10(a0)
    17f0:	01c5c783          	lbu	a5,28(a1)
    17f4:	00f505a3          	sb	a5,11(a0)
    17f8:	01e5c783          	lbu	a5,30(a1)
    17fc:	00f50623          	sb	a5,12(a0)
    1800:	00d00793          	li	a5,13
    1804:	00054603          	lbu	a2,0(a0)
    1808:	00e61463          	bne	a2,a4,1810 <fatfs_lfn_cache_entry+0xb8>
    180c:	00d50023          	sb	a3,0(a0)
    1810:	fff78793          	addi	a5,a5,-1
    1814:	0ff7f793          	zext.b	a5,a5
    1818:	00150513          	addi	a0,a0,1
    181c:	fe0794e3          	bnez	a5,1804 <fatfs_lfn_cache_entry+0xac>
    1820:	00008067          	ret

00001824 <fatfs_lfn_cache_get>:
    1824:	10554703          	lbu	a4,261(a0)
    1828:	01400793          	li	a5,20
    182c:	00f71663          	bne	a4,a5,1838 <fatfs_lfn_cache_get+0x14>
    1830:	10050223          	sb	zero,260(a0)
    1834:	00008067          	ret
    1838:	02070063          	beqz	a4,1858 <fatfs_lfn_cache_get+0x34>
    183c:	00171793          	slli	a5,a4,0x1
    1840:	00e787b3          	add	a5,a5,a4
    1844:	00279793          	slli	a5,a5,0x2
    1848:	00e787b3          	add	a5,a5,a4
    184c:	00f507b3          	add	a5,a0,a5
    1850:	00078023          	sb	zero,0(a5)
    1854:	00008067          	ret
    1858:	00050023          	sb	zero,0(a0)
    185c:	00008067          	ret

00001860 <fatfs_entry_lfn_text>:
    1860:	00b54503          	lbu	a0,11(a0)
    1864:	00f57513          	andi	a0,a0,15
    1868:	ff150513          	addi	a0,a0,-15
    186c:	00153513          	seqz	a0,a0
    1870:	00008067          	ret

00001874 <fatfs_entry_lfn_invalid>:
    1874:	00054783          	lbu	a5,0(a0)
    1878:	f1b78713          	addi	a4,a5,-229
    187c:	02070263          	beqz	a4,18a0 <fatfs_entry_lfn_invalid+0x2c>
    1880:	02078063          	beqz	a5,18a0 <fatfs_entry_lfn_invalid+0x2c>
    1884:	00b54783          	lbu	a5,11(a0)
    1888:	00800713          	li	a4,8
    188c:	00100513          	li	a0,1
    1890:	00e78a63          	beq	a5,a4,18a4 <fatfs_entry_lfn_invalid+0x30>
    1894:	0067f793          	andi	a5,a5,6
    1898:	00f03533          	snez	a0,a5
    189c:	00008067          	ret
    18a0:	00100513          	li	a0,1
    18a4:	00008067          	ret

000018a8 <fatfs_entry_lfn_exists>:
    18a8:	00b5c783          	lbu	a5,11(a1)
    18ac:	00f00713          	li	a4,15
    18b0:	04e78063          	beq	a5,a4,18f0 <fatfs_entry_lfn_exists+0x48>
    18b4:	0005c683          	lbu	a3,0(a1)
    18b8:	f1b68713          	addi	a4,a3,-229
    18bc:	00e03733          	snez	a4,a4
    18c0:	00d036b3          	snez	a3,a3
    18c4:	00d77733          	and	a4,a4,a3
    18c8:	02070463          	beqz	a4,18f0 <fatfs_entry_lfn_exists+0x48>
    18cc:	ff878713          	addi	a4,a5,-8
    18d0:	02070063          	beqz	a4,18f0 <fatfs_entry_lfn_exists+0x48>
    18d4:	0067f713          	andi	a4,a5,6
    18d8:	00000793          	li	a5,0
    18dc:	00071663          	bnez	a4,18e8 <fatfs_entry_lfn_exists+0x40>
    18e0:	10554783          	lbu	a5,261(a0)
    18e4:	00f037b3          	snez	a5,a5
    18e8:	00078513          	mv	a0,a5
    18ec:	00008067          	ret
    18f0:	00000793          	li	a5,0
    18f4:	ff5ff06f          	j	18e8 <fatfs_entry_lfn_exists+0x40>

000018f8 <fatfs_entry_sfn_only>:
    18f8:	00b54783          	lbu	a5,11(a0)
    18fc:	00f00713          	li	a4,15
    1900:	02e78863          	beq	a5,a4,1930 <fatfs_entry_sfn_only+0x38>
    1904:	00054683          	lbu	a3,0(a0)
    1908:	f1b68713          	addi	a4,a3,-229
    190c:	00e03733          	snez	a4,a4
    1910:	00d036b3          	snez	a3,a3
    1914:	00d77733          	and	a4,a4,a3
    1918:	00070c63          	beqz	a4,1930 <fatfs_entry_sfn_only+0x38>
    191c:	ff878713          	addi	a4,a5,-8
    1920:	00070863          	beqz	a4,1930 <fatfs_entry_sfn_only+0x38>
    1924:	0067f513          	andi	a0,a5,6
    1928:	00153513          	seqz	a0,a0
    192c:	00008067          	ret
    1930:	00000513          	li	a0,0
    1934:	00008067          	ret

00001938 <fatfs_entry_is_dir>:
    1938:	00b54503          	lbu	a0,11(a0)
    193c:	00455513          	srli	a0,a0,0x4
    1940:	00157513          	andi	a0,a0,1
    1944:	00008067          	ret

00001948 <fatfs_total_path_levels>:
    1948:	fff00793          	li	a5,-1
    194c:	06050263          	beqz	a0,19b0 <fatfs_total_path_levels+0x68>
    1950:	00054703          	lbu	a4,0(a0)
    1954:	02f00793          	li	a5,47
    1958:	00f71863          	bne	a4,a5,1968 <fatfs_total_path_levels+0x20>
    195c:	00150513          	addi	a0,a0,1
    1960:	00000793          	li	a5,0
    1964:	0400006f          	j	19a4 <fatfs_total_path_levels+0x5c>
    1968:	00154703          	lbu	a4,1(a0)
    196c:	03a00793          	li	a5,58
    1970:	00f70a63          	beq	a4,a5,1984 <fatfs_total_path_levels+0x3c>
    1974:	00254683          	lbu	a3,2(a0)
    1978:	05c00713          	li	a4,92
    197c:	fff00793          	li	a5,-1
    1980:	02e69863          	bne	a3,a4,19b0 <fatfs_total_path_levels+0x68>
    1984:	00350513          	addi	a0,a0,3
    1988:	05c00713          	li	a4,92
    198c:	fd5ff06f          	j	1960 <fatfs_total_path_levels+0x18>
    1990:	00150513          	addi	a0,a0,1
    1994:	00e68663          	beq	a3,a4,19a0 <fatfs_total_path_levels+0x58>
    1998:	00054683          	lbu	a3,0(a0)
    199c:	fe069ae3          	bnez	a3,1990 <fatfs_total_path_levels+0x48>
    19a0:	00178793          	addi	a5,a5,1
    19a4:	00054683          	lbu	a3,0(a0)
    19a8:	fe0698e3          	bnez	a3,1998 <fatfs_total_path_levels+0x50>
    19ac:	fff78793          	addi	a5,a5,-1
    19b0:	00078513          	mv	a0,a5
    19b4:	00008067          	ret

000019b8 <fatfs_get_substring>:
    19b8:	0cd05e63          	blez	a3,1a94 <fatfs_get_substring+0xdc>
    19bc:	0c050c63          	beqz	a0,1a94 <fatfs_get_substring+0xdc>
    19c0:	fe010113          	addi	sp,sp,-32
    19c4:	00812c23          	sw	s0,24(sp)
    19c8:	00112e23          	sw	ra,28(sp)
    19cc:	00912a23          	sw	s1,20(sp)
    19d0:	00054483          	lbu	s1,0(a0)
    19d4:	02f00793          	li	a5,47
    19d8:	00150413          	addi	s0,a0,1
    19dc:	02f48463          	beq	s1,a5,1a04 <fatfs_get_substring+0x4c>
    19e0:	00154703          	lbu	a4,1(a0)
    19e4:	03a00793          	li	a5,58
    19e8:	00f70a63          	beq	a4,a5,19fc <fatfs_get_substring+0x44>
    19ec:	00254803          	lbu	a6,2(a0)
    19f0:	05c00713          	li	a4,92
    19f4:	fff00793          	li	a5,-1
    19f8:	04e81c63          	bne	a6,a4,1a50 <fatfs_get_substring+0x98>
    19fc:	00350413          	addi	s0,a0,3
    1a00:	05c00493          	li	s1,92
    1a04:	00040513          	mv	a0,s0
    1a08:	00d12623          	sw	a3,12(sp)
    1a0c:	00c12423          	sw	a2,8(sp)
    1a10:	00b12223          	sw	a1,4(sp)
    1a14:	fffff097          	auipc	ra,0xfffff
    1a18:	250080e7          	jalr	592(ra) # c64 <strlen>
    1a1c:	00c12683          	lw	a3,12(sp)
    1a20:	00412583          	lw	a1,4(sp)
    1a24:	00812603          	lw	a2,8(sp)
    1a28:	00000713          	li	a4,0
    1a2c:	00000813          	li	a6,0
    1a30:	00000793          	li	a5,0
    1a34:	fff68693          	addi	a3,a3,-1
    1a38:	00e608b3          	add	a7,a2,a4
    1a3c:	02a7c663          	blt	a5,a0,1a68 <fatfs_get_substring+0xb0>
    1a40:	00088023          	sb	zero,0(a7)
    1a44:	00064783          	lbu	a5,0(a2)
    1a48:	0017b793          	seqz	a5,a5
    1a4c:	40f007b3          	neg	a5,a5
    1a50:	01c12083          	lw	ra,28(sp)
    1a54:	01812403          	lw	s0,24(sp)
    1a58:	01412483          	lw	s1,20(sp)
    1a5c:	00078513          	mv	a0,a5
    1a60:	02010113          	addi	sp,sp,32
    1a64:	00008067          	ret
    1a68:	00f40333          	add	t1,s0,a5
    1a6c:	00034303          	lbu	t1,0(t1)
    1a70:	00931863          	bne	t1,s1,1a80 <fatfs_get_substring+0xc8>
    1a74:	00180813          	addi	a6,a6,1
    1a78:	00178793          	addi	a5,a5,1
    1a7c:	fbdff06f          	j	1a38 <fatfs_get_substring+0x80>
    1a80:	feb81ce3          	bne	a6,a1,1a78 <fatfs_get_substring+0xc0>
    1a84:	fed75ae3          	bge	a4,a3,1a78 <fatfs_get_substring+0xc0>
    1a88:	00170713          	addi	a4,a4,1
    1a8c:	00688023          	sb	t1,0(a7)
    1a90:	fe9ff06f          	j	1a78 <fatfs_get_substring+0xc0>
    1a94:	fff00793          	li	a5,-1
    1a98:	00078513          	mv	a0,a5
    1a9c:	00008067          	ret

00001aa0 <fatfs_compare_names>:
    1aa0:	fd010113          	addi	sp,sp,-48
    1aa4:	02112623          	sw	ra,44(sp)
    1aa8:	03212023          	sw	s2,32(sp)
    1aac:	01312e23          	sw	s3,28(sp)
    1ab0:	01412c23          	sw	s4,24(sp)
    1ab4:	01512a23          	sw	s5,20(sp)
    1ab8:	00058a13          	mv	s4,a1
    1abc:	02812423          	sw	s0,40(sp)
    1ac0:	02912223          	sw	s1,36(sp)
    1ac4:	01612823          	sw	s6,16(sp)
    1ac8:	01712623          	sw	s7,12(sp)
    1acc:	01812423          	sw	s8,8(sp)
    1ad0:	00050a93          	mv	s5,a0
    1ad4:	00000097          	auipc	ra,0x0
    1ad8:	a2c080e7          	jalr	-1492(ra) # 1500 <FileString_GetExtension>
    1adc:	00050993          	mv	s3,a0
    1ae0:	000a0513          	mv	a0,s4
    1ae4:	00000097          	auipc	ra,0x0
    1ae8:	a1c080e7          	jalr	-1508(ra) # 1500 <FileString_GetExtension>
    1aec:	fff00793          	li	a5,-1
    1af0:	00050913          	mv	s2,a0
    1af4:	02f99e63          	bne	s3,a5,1b30 <fatfs_compare_names+0x90>
    1af8:	0f350063          	beq	a0,s3,1bd8 <fatfs_compare_names+0x138>
    1afc:	00000513          	li	a0,0
    1b00:	02c12083          	lw	ra,44(sp)
    1b04:	02812403          	lw	s0,40(sp)
    1b08:	02412483          	lw	s1,36(sp)
    1b0c:	02012903          	lw	s2,32(sp)
    1b10:	01c12983          	lw	s3,28(sp)
    1b14:	01812a03          	lw	s4,24(sp)
    1b18:	01412a83          	lw	s5,20(sp)
    1b1c:	01012b03          	lw	s6,16(sp)
    1b20:	00c12b83          	lw	s7,12(sp)
    1b24:	00812c03          	lw	s8,8(sp)
    1b28:	03010113          	addi	sp,sp,48
    1b2c:	00008067          	ret
    1b30:	fcf506e3          	beq	a0,a5,1afc <fatfs_compare_names+0x5c>
    1b34:	00198793          	addi	a5,s3,1
    1b38:	00fa8b33          	add	s6,s5,a5
    1b3c:	00050413          	mv	s0,a0
    1b40:	00150793          	addi	a5,a0,1
    1b44:	000b0513          	mv	a0,s6
    1b48:	00fa0bb3          	add	s7,s4,a5
    1b4c:	fffff097          	auipc	ra,0xfffff
    1b50:	118080e7          	jalr	280(ra) # c64 <strlen>
    1b54:	00050c13          	mv	s8,a0
    1b58:	000b8513          	mv	a0,s7
    1b5c:	00098493          	mv	s1,s3
    1b60:	fffff097          	auipc	ra,0xfffff
    1b64:	104080e7          	jalr	260(ra) # c64 <strlen>
    1b68:	f8ac1ae3          	bne	s8,a0,1afc <fatfs_compare_names+0x5c>
    1b6c:	000b0513          	mv	a0,s6
    1b70:	fffff097          	auipc	ra,0xfffff
    1b74:	0f4080e7          	jalr	244(ra) # c64 <strlen>
    1b78:	00050613          	mv	a2,a0
    1b7c:	000b8593          	mv	a1,s7
    1b80:	000b0513          	mv	a0,s6
    1b84:	00000097          	auipc	ra,0x0
    1b88:	90c080e7          	jalr	-1780(ra) # 1490 <FileString_StrCmpNoCase>
    1b8c:	f60518e3          	bnez	a0,1afc <fatfs_compare_names+0x5c>
    1b90:	fff48793          	addi	a5,s1,-1
    1b94:	00fa87b3          	add	a5,s5,a5
    1b98:	41378733          	sub	a4,a5,s3
    1b9c:	02000693          	li	a3,32
    1ba0:	06e79263          	bne	a5,a4,1c04 <fatfs_compare_names+0x164>
    1ba4:	fff40793          	addi	a5,s0,-1
    1ba8:	00fa07b3          	add	a5,s4,a5
    1bac:	41278733          	sub	a4,a5,s2
    1bb0:	02000693          	li	a3,32
    1bb4:	06e79263          	bne	a5,a4,1c18 <fatfs_compare_names+0x178>
    1bb8:	f53912e3          	bne	s2,s3,1afc <fatfs_compare_names+0x5c>
    1bbc:	00090613          	mv	a2,s2
    1bc0:	000a0593          	mv	a1,s4
    1bc4:	000a8513          	mv	a0,s5
    1bc8:	00000097          	auipc	ra,0x0
    1bcc:	8c8080e7          	jalr	-1848(ra) # 1490 <FileString_StrCmpNoCase>
    1bd0:	00153513          	seqz	a0,a0
    1bd4:	f2dff06f          	j	1b00 <fatfs_compare_names+0x60>
    1bd8:	000a8513          	mv	a0,s5
    1bdc:	fffff097          	auipc	ra,0xfffff
    1be0:	088080e7          	jalr	136(ra) # c64 <strlen>
    1be4:	00050493          	mv	s1,a0
    1be8:	00050993          	mv	s3,a0
    1bec:	000a0513          	mv	a0,s4
    1bf0:	fffff097          	auipc	ra,0xfffff
    1bf4:	074080e7          	jalr	116(ra) # c64 <strlen>
    1bf8:	00050413          	mv	s0,a0
    1bfc:	00050913          	mv	s2,a0
    1c00:	f91ff06f          	j	1b90 <fatfs_compare_names+0xf0>
    1c04:	0007c603          	lbu	a2,0(a5)
    1c08:	f8d61ee3          	bne	a2,a3,1ba4 <fatfs_compare_names+0x104>
    1c0c:	415789b3          	sub	s3,a5,s5
    1c10:	fff78793          	addi	a5,a5,-1
    1c14:	f8dff06f          	j	1ba0 <fatfs_compare_names+0x100>
    1c18:	0007c603          	lbu	a2,0(a5)
    1c1c:	f8d61ee3          	bne	a2,a3,1bb8 <fatfs_compare_names+0x118>
    1c20:	41478933          	sub	s2,a5,s4
    1c24:	fff78793          	addi	a5,a5,-1
    1c28:	f8dff06f          	j	1bb4 <fatfs_compare_names+0x114>

00001c2c <fatfs_get_sfn_display_name>:
    1c2c:	00000713          	li	a4,0
    1c30:	02000613          	li	a2,32
    1c34:	01900813          	li	a6,25
    1c38:	0005c783          	lbu	a5,0(a1)
    1c3c:	00078663          	beqz	a5,1c48 <fatfs_get_sfn_display_name+0x1c>
    1c40:	ff470693          	addi	a3,a4,-12
    1c44:	00069863          	bnez	a3,1c54 <fatfs_get_sfn_display_name+0x28>
    1c48:	00050023          	sb	zero,0(a0)
    1c4c:	00100513          	li	a0,1
    1c50:	00008067          	ret
    1c54:	00158593          	addi	a1,a1,1
    1c58:	fec780e3          	beq	a5,a2,1c38 <fatfs_get_sfn_display_name+0xc>
    1c5c:	fbf78693          	addi	a3,a5,-65
    1c60:	0ff6f693          	zext.b	a3,a3
    1c64:	00d86663          	bltu	a6,a3,1c70 <fatfs_get_sfn_display_name+0x44>
    1c68:	02078793          	addi	a5,a5,32
    1c6c:	0ff7f793          	zext.b	a5,a5
    1c70:	00f50023          	sb	a5,0(a0)
    1c74:	00170713          	addi	a4,a4,1
    1c78:	00150513          	addi	a0,a0,1
    1c7c:	fbdff06f          	j	1c38 <fatfs_get_sfn_display_name+0xc>

00001c80 <fatfs_fat_init>:
    1c80:	ff010113          	addi	sp,sp,-16
    1c84:	00812423          	sw	s0,8(sp)
    1c88:	00912223          	sw	s1,4(sp)
    1c8c:	00112623          	sw	ra,12(sp)
    1c90:	fff00793          	li	a5,-1
    1c94:	25850493          	addi	s1,a0,600
    1c98:	00050413          	mv	s0,a0
    1c9c:	44f52c23          	sw	a5,1112(a0)
    1ca0:	24052a23          	sw	zero,596(a0)
    1ca4:	44052e23          	sw	zero,1116(a0)
    1ca8:	20000613          	li	a2,512
    1cac:	00048513          	mv	a0,s1
    1cb0:	00000593          	li	a1,0
    1cb4:	fffff097          	auipc	ra,0xfffff
    1cb8:	f70080e7          	jalr	-144(ra) # c24 <memset>
    1cbc:	25442783          	lw	a5,596(s0)
    1cc0:	00c12083          	lw	ra,12(sp)
    1cc4:	24942a23          	sw	s1,596(s0)
    1cc8:	46042023          	sw	zero,1120(s0)
    1ccc:	46f42223          	sw	a5,1124(s0)
    1cd0:	00812403          	lw	s0,8(sp)
    1cd4:	00412483          	lw	s1,4(sp)
    1cd8:	01010113          	addi	sp,sp,16
    1cdc:	00008067          	ret

00001ce0 <fatfs_init>:
    1ce0:	fd010113          	addi	sp,sp,-48
    1ce4:	02812423          	sw	s0,40(sp)
    1ce8:	02112623          	sw	ra,44(sp)
    1cec:	02912223          	sw	s1,36(sp)
    1cf0:	03212023          	sw	s2,32(sp)
    1cf4:	01312e23          	sw	s3,28(sp)
    1cf8:	fff00793          	li	a5,-1
    1cfc:	24f52223          	sw	a5,580(a0)
    1d00:	24052423          	sw	zero,584(a0)
    1d04:	02052223          	sw	zero,36(a0)
    1d08:	00050413          	mv	s0,a0
    1d0c:	00000097          	auipc	ra,0x0
    1d10:	f74080e7          	jalr	-140(ra) # 1c80 <fatfs_fat_init>
    1d14:	03442783          	lw	a5,52(s0)
    1d18:	02079463          	bnez	a5,1d40 <fatfs_init+0x60>
    1d1c:	fff00713          	li	a4,-1
    1d20:	02c12083          	lw	ra,44(sp)
    1d24:	02812403          	lw	s0,40(sp)
    1d28:	02412483          	lw	s1,36(sp)
    1d2c:	02012903          	lw	s2,32(sp)
    1d30:	01c12983          	lw	s3,28(sp)
    1d34:	00070513          	mv	a0,a4
    1d38:	03010113          	addi	sp,sp,48
    1d3c:	00008067          	ret
    1d40:	04440593          	addi	a1,s0,68
    1d44:	00100613          	li	a2,1
    1d48:	00000513          	li	a0,0
    1d4c:	00b12623          	sw	a1,12(sp)
    1d50:	000780e7          	jalr	a5
    1d54:	fc0504e3          	beqz	a0,1d1c <fatfs_init+0x3c>
    1d58:	24244703          	lbu	a4,578(s0)
    1d5c:	05500793          	li	a5,85
    1d60:	00c12583          	lw	a1,12(sp)
    1d64:	00f70663          	beq	a4,a5,1d70 <fatfs_init+0x90>
    1d68:	ffd00713          	li	a4,-3
    1d6c:	fb5ff06f          	j	1d20 <fatfs_init+0x40>
    1d70:	24344703          	lbu	a4,579(s0)
    1d74:	0aa00793          	li	a5,170
    1d78:	fef718e3          	bne	a4,a5,1d68 <fatfs_init+0x88>
    1d7c:	20644783          	lbu	a5,518(s0)
    1d80:	00600713          	li	a4,6
    1d84:	02f76463          	bltu	a4,a5,1dac <fatfs_init+0xcc>
    1d88:	00400713          	li	a4,4
    1d8c:	00f76663          	bltu	a4,a5,1d98 <fatfs_init+0xb8>
    1d90:	00000513          	li	a0,0
    1d94:	02078663          	beqz	a5,1dc0 <fatfs_init+0xe0>
    1d98:	20c45503          	lhu	a0,524(s0)
    1d9c:	20a45783          	lhu	a5,522(s0)
    1da0:	01051513          	slli	a0,a0,0x10
    1da4:	00f56533          	or	a0,a0,a5
    1da8:	0180006f          	j	1dc0 <fatfs_init+0xe0>
    1dac:	00c00713          	li	a4,12
    1db0:	12f76663          	bltu	a4,a5,1edc <fatfs_init+0x1fc>
    1db4:	00a00713          	li	a4,10
    1db8:	00000513          	li	a0,0
    1dbc:	fcf76ee3          	bltu	a4,a5,1d98 <fatfs_init+0xb8>
    1dc0:	03442783          	lw	a5,52(s0)
    1dc4:	00a42e23          	sw	a0,28(s0)
    1dc8:	00100613          	li	a2,1
    1dcc:	000780e7          	jalr	a5
    1dd0:	f40506e3          	beqz	a0,1d1c <fatfs_init+0x3c>
    1dd4:	05044783          	lbu	a5,80(s0)
    1dd8:	04f44703          	lbu	a4,79(s0)
    1ddc:	20000693          	li	a3,512
    1de0:	00879793          	slli	a5,a5,0x8
    1de4:	00e7e7b3          	or	a5,a5,a4
    1de8:	ffe00713          	li	a4,-2
    1dec:	f2d79ae3          	bne	a5,a3,1d20 <fatfs_init+0x40>
    1df0:	05644483          	lbu	s1,86(s0)
    1df4:	05544783          	lbu	a5,85(s0)
    1df8:	05144983          	lbu	s3,81(s0)
    1dfc:	00849493          	slli	s1,s1,0x8
    1e00:	05a45583          	lhu	a1,90(s0)
    1e04:	00f4e4b3          	or	s1,s1,a5
    1e08:	01340023          	sb	s3,0(s0)
    1e0c:	02941423          	sh	s1,40(s0)
    1e10:	05245903          	lhu	s2,82(s0)
    1e14:	05444503          	lbu	a0,84(s0)
    1e18:	00059463          	bnez	a1,1e20 <fatfs_init+0x140>
    1e1c:	06842583          	lw	a1,104(s0)
    1e20:	07042783          	lw	a5,112(s0)
    1e24:	02b42023          	sw	a1,32(s0)
    1e28:	00549493          	slli	s1,s1,0x5
    1e2c:	00f42423          	sw	a5,8(s0)
    1e30:	07445783          	lhu	a5,116(s0)
    1e34:	1ff48493          	addi	s1,s1,511
    1e38:	4094d493          	srai	s1,s1,0x9
    1e3c:	00f41c23          	sh	a5,24(s0)
    1e40:	fffff097          	auipc	ra,0xfffff
    1e44:	5b8080e7          	jalr	1464(ra) # 13f8 <__mulsi3>
    1e48:	00a907b3          	add	a5,s2,a0
    1e4c:	00f42623          	sw	a5,12(s0)
    1e50:	01c42783          	lw	a5,28(s0)
    1e54:	24245703          	lhu	a4,578(s0)
    1e58:	00942823          	sw	s1,16(s0)
    1e5c:	00f907b3          	add	a5,s2,a5
    1e60:	00f42a23          	sw	a5,20(s0)
    1e64:	00f507b3          	add	a5,a0,a5
    1e68:	00f42223          	sw	a5,4(s0)
    1e6c:	0000b7b7          	lui	a5,0xb
    1e70:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x3069>
    1e74:	eef71ae3          	bne	a4,a5,1d68 <fatfs_init+0x88>
    1e78:	05844783          	lbu	a5,88(s0)
    1e7c:	05744703          	lbu	a4,87(s0)
    1e80:	00879793          	slli	a5,a5,0x8
    1e84:	00e7e7b3          	or	a5,a5,a4
    1e88:	00079463          	bnez	a5,1e90 <fatfs_init+0x1b0>
    1e8c:	06442783          	lw	a5,100(s0)
    1e90:	ffb00713          	li	a4,-5
    1e94:	e80986e3          	beqz	s3,1d20 <fatfs_init+0x40>
    1e98:	00990933          	add	s2,s2,s1
    1e9c:	00a90533          	add	a0,s2,a0
    1ea0:	40a78533          	sub	a0,a5,a0
    1ea4:	00098593          	mv	a1,s3
    1ea8:	fffff097          	auipc	ra,0xfffff
    1eac:	cd0080e7          	jalr	-816(ra) # b78 <__udivsi3>
    1eb0:	000017b7          	lui	a5,0x1
    1eb4:	ff478793          	addi	a5,a5,-12 # ff4 <display_putchar+0x5c>
    1eb8:	ffb00713          	li	a4,-5
    1ebc:	e6a7f2e3          	bgeu	a5,a0,1d20 <fatfs_init+0x40>
    1ec0:	000107b7          	lui	a5,0x10
    1ec4:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x8608>
    1ec8:	02a7e663          	bltu	a5,a0,1ef4 <fatfs_init+0x214>
    1ecc:	00042423          	sw	zero,8(s0)
    1ed0:	02042823          	sw	zero,48(s0)
    1ed4:	00000713          	li	a4,0
    1ed8:	e49ff06f          	j	1d20 <fatfs_init+0x40>
    1edc:	ff278793          	addi	a5,a5,-14
    1ee0:	0ff7f793          	zext.b	a5,a5
    1ee4:	00100713          	li	a4,1
    1ee8:	00000513          	li	a0,0
    1eec:	eaf776e3          	bgeu	a4,a5,1d98 <fatfs_init+0xb8>
    1ef0:	ed1ff06f          	j	1dc0 <fatfs_init+0xe0>
    1ef4:	00100793          	li	a5,1
    1ef8:	02f42823          	sw	a5,48(s0)
    1efc:	fd9ff06f          	j	1ed4 <fatfs_init+0x1f4>

00001f00 <fl_attach_media>:
    1f00:	000037b7          	lui	a5,0x3
    1f04:	c807a783          	lw	a5,-896(a5) # 2c80 <_filelib_init>
    1f08:	fe010113          	addi	sp,sp,-32
    1f0c:	00812c23          	sw	s0,24(sp)
    1f10:	00112e23          	sw	ra,28(sp)
    1f14:	00050413          	mv	s0,a0
    1f18:	00079a63          	bnez	a5,1f2c <fl_attach_media+0x2c>
    1f1c:	00b12623          	sw	a1,12(sp)
    1f20:	fffff097          	auipc	ra,0xfffff
    1f24:	7c8080e7          	jalr	1992(ra) # 16e8 <fl_init>
    1f28:	00c12583          	lw	a1,12(sp)
    1f2c:	000077b7          	lui	a5,0x7
    1f30:	58478513          	addi	a0,a5,1412 # 7584 <_fs>
    1f34:	02b52c23          	sw	a1,56(a0)
    1f38:	02852a23          	sw	s0,52(a0)
    1f3c:	00000097          	auipc	ra,0x0
    1f40:	da4080e7          	jalr	-604(ra) # 1ce0 <fatfs_init>
    1f44:	00050593          	mv	a1,a0
    1f48:	02050863          	beqz	a0,1f78 <fl_attach_media+0x78>
    1f4c:	00a12623          	sw	a0,12(sp)
    1f50:	00003537          	lui	a0,0x3
    1f54:	94050513          	addi	a0,a0,-1728 # 2940 <LEDS+0xa8>
    1f58:	fffff097          	auipc	ra,0xfffff
    1f5c:	364080e7          	jalr	868(ra) # 12bc <printf>
    1f60:	00c12583          	lw	a1,12(sp)
    1f64:	01c12083          	lw	ra,28(sp)
    1f68:	01812403          	lw	s0,24(sp)
    1f6c:	00058513          	mv	a0,a1
    1f70:	02010113          	addi	sp,sp,32
    1f74:	00008067          	ret
    1f78:	000037b7          	lui	a5,0x3
    1f7c:	00100713          	li	a4,1
    1f80:	c6e7ae23          	sw	a4,-900(a5) # 2c7c <_filelib_valid>
    1f84:	fe1ff06f          	j	1f64 <fl_attach_media+0x64>

00001f88 <fatfs_find_next_cluster>:
    1f88:	ff010113          	addi	sp,sp,-16
    1f8c:	00812423          	sw	s0,8(sp)
    1f90:	01212023          	sw	s2,0(sp)
    1f94:	00112623          	sw	ra,12(sp)
    1f98:	00912223          	sw	s1,4(sp)
    1f9c:	00050913          	mv	s2,a0
    1fa0:	00200413          	li	s0,2
    1fa4:	00058463          	beqz	a1,1fac <fatfs_find_next_cluster+0x24>
    1fa8:	00058413          	mv	s0,a1
    1fac:	03092783          	lw	a5,48(s2)
    1fb0:	00745493          	srli	s1,s0,0x7
    1fb4:	00079463          	bnez	a5,1fbc <fatfs_find_next_cluster+0x34>
    1fb8:	00845493          	srli	s1,s0,0x8
    1fbc:	01492583          	lw	a1,20(s2)
    1fc0:	00090513          	mv	a0,s2
    1fc4:	00b485b3          	add	a1,s1,a1
    1fc8:	fffff097          	auipc	ra,0xfffff
    1fcc:	5e8080e7          	jalr	1512(ra) # 15b0 <fatfs_fat_read_sector>
    1fd0:	00050793          	mv	a5,a0
    1fd4:	fff00513          	li	a0,-1
    1fd8:	04078863          	beqz	a5,2028 <fatfs_find_next_cluster+0xa0>
    1fdc:	03092703          	lw	a4,48(s2)
    1fe0:	2087a783          	lw	a5,520(a5)
    1fe4:	04071e63          	bnez	a4,2040 <fatfs_find_next_cluster+0xb8>
    1fe8:	00849493          	slli	s1,s1,0x8
    1fec:	40940433          	sub	s0,s0,s1
    1ff0:	00141413          	slli	s0,s0,0x1
    1ff4:	01041413          	slli	s0,s0,0x10
    1ff8:	01045413          	srli	s0,s0,0x10
    1ffc:	008787b3          	add	a5,a5,s0
    2000:	0017c503          	lbu	a0,1(a5)
    2004:	0007c783          	lbu	a5,0(a5)
    2008:	00851513          	slli	a0,a0,0x8
    200c:	00f50533          	add	a0,a0,a5
    2010:	ffff07b7          	lui	a5,0xffff0
    2014:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    2018:	00f507b3          	add	a5,a0,a5
    201c:	00700713          	li	a4,7
    2020:	00f76463          	bltu	a4,a5,2028 <fatfs_find_next_cluster+0xa0>
    2024:	fff00513          	li	a0,-1
    2028:	00c12083          	lw	ra,12(sp)
    202c:	00812403          	lw	s0,8(sp)
    2030:	00412483          	lw	s1,4(sp)
    2034:	00012903          	lw	s2,0(sp)
    2038:	01010113          	addi	sp,sp,16
    203c:	00008067          	ret
    2040:	00749493          	slli	s1,s1,0x7
    2044:	40940433          	sub	s0,s0,s1
    2048:	00241413          	slli	s0,s0,0x2
    204c:	01041413          	slli	s0,s0,0x10
    2050:	01045413          	srli	s0,s0,0x10
    2054:	008787b3          	add	a5,a5,s0
    2058:	0037c503          	lbu	a0,3(a5)
    205c:	0027c703          	lbu	a4,2(a5)
    2060:	01851513          	slli	a0,a0,0x18
    2064:	01071713          	slli	a4,a4,0x10
    2068:	00e50533          	add	a0,a0,a4
    206c:	0007c703          	lbu	a4,0(a5)
    2070:	0017c783          	lbu	a5,1(a5)
    2074:	00e50533          	add	a0,a0,a4
    2078:	00879793          	slli	a5,a5,0x8
    207c:	00f50533          	add	a0,a0,a5
    2080:	00451513          	slli	a0,a0,0x4
    2084:	00455513          	srli	a0,a0,0x4
    2088:	f00007b7          	lui	a5,0xf0000
    208c:	f89ff06f          	j	2014 <fatfs_find_next_cluster+0x8c>

00002090 <fatfs_sector_reader>:
    2090:	03052783          	lw	a5,48(a0)
    2094:	fe010113          	addi	sp,sp,-32
    2098:	00812c23          	sw	s0,24(sp)
    209c:	01212823          	sw	s2,16(sp)
    20a0:	01512223          	sw	s5,4(sp)
    20a4:	00112e23          	sw	ra,28(sp)
    20a8:	00912a23          	sw	s1,20(sp)
    20ac:	01312623          	sw	s3,12(sp)
    20b0:	01412423          	sw	s4,8(sp)
    20b4:	01612023          	sw	s6,0(sp)
    20b8:	00f5e7b3          	or	a5,a1,a5
    20bc:	00050413          	mv	s0,a0
    20c0:	00060913          	mv	s2,a2
    20c4:	00068a93          	mv	s5,a3
    20c8:	08079063          	bnez	a5,2148 <fatfs_sector_reader+0xb8>
    20cc:	01052783          	lw	a5,16(a0)
    20d0:	02f66863          	bltu	a2,a5,2100 <fatfs_sector_reader+0x70>
    20d4:	00000513          	li	a0,0
    20d8:	01c12083          	lw	ra,28(sp)
    20dc:	01812403          	lw	s0,24(sp)
    20e0:	01412483          	lw	s1,20(sp)
    20e4:	01012903          	lw	s2,16(sp)
    20e8:	00c12983          	lw	s3,12(sp)
    20ec:	00812a03          	lw	s4,8(sp)
    20f0:	00412a83          	lw	s5,4(sp)
    20f4:	00012b03          	lw	s6,0(sp)
    20f8:	02010113          	addi	sp,sp,32
    20fc:	00008067          	ret
    2100:	01c52503          	lw	a0,28(a0)
    2104:	00c42783          	lw	a5,12(s0)
    2108:	00f50533          	add	a0,a0,a5
    210c:	01250533          	add	a0,a0,s2
    2110:	0a0a8663          	beqz	s5,21bc <fatfs_sector_reader+0x12c>
    2114:	03442783          	lw	a5,52(s0)
    2118:	00100613          	li	a2,1
    211c:	000a8593          	mv	a1,s5
    2120:	01812403          	lw	s0,24(sp)
    2124:	01c12083          	lw	ra,28(sp)
    2128:	01412483          	lw	s1,20(sp)
    212c:	01012903          	lw	s2,16(sp)
    2130:	00c12983          	lw	s3,12(sp)
    2134:	00812a03          	lw	s4,8(sp)
    2138:	00412a83          	lw	s5,4(sp)
    213c:	00012b03          	lw	s6,0(sp)
    2140:	02010113          	addi	sp,sp,32
    2144:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    2148:	00054783          	lbu	a5,0(a0)
    214c:	00058493          	mv	s1,a1
    2150:	00060513          	mv	a0,a2
    2154:	00078593          	mv	a1,a5
    2158:	00078a13          	mv	s4,a5
    215c:	fffff097          	auipc	ra,0xfffff
    2160:	a1c080e7          	jalr	-1508(ra) # b78 <__udivsi3>
    2164:	00050b13          	mv	s6,a0
    2168:	00000993          	li	s3,0
    216c:	03699a63          	bne	s3,s6,21a0 <fatfs_sector_reader+0x110>
    2170:	fff00793          	li	a5,-1
    2174:	f6f480e3          	beq	s1,a5,20d4 <fatfs_sector_reader+0x44>
    2178:	000a0593          	mv	a1,s4
    217c:	00090513          	mv	a0,s2
    2180:	fffff097          	auipc	ra,0xfffff
    2184:	a40080e7          	jalr	-1472(ra) # bc0 <__umodsi3>
    2188:	00050913          	mv	s2,a0
    218c:	00048593          	mv	a1,s1
    2190:	00040513          	mv	a0,s0
    2194:	fffff097          	auipc	ra,0xfffff
    2198:	508080e7          	jalr	1288(ra) # 169c <fatfs_lba_of_cluster>
    219c:	f71ff06f          	j	210c <fatfs_sector_reader+0x7c>
    21a0:	00048593          	mv	a1,s1
    21a4:	00040513          	mv	a0,s0
    21a8:	00000097          	auipc	ra,0x0
    21ac:	de0080e7          	jalr	-544(ra) # 1f88 <fatfs_find_next_cluster>
    21b0:	00050493          	mv	s1,a0
    21b4:	00198993          	addi	s3,s3,1
    21b8:	fb5ff06f          	j	216c <fatfs_sector_reader+0xdc>
    21bc:	24442783          	lw	a5,580(s0)
    21c0:	00a78c63          	beq	a5,a0,21d8 <fatfs_sector_reader+0x148>
    21c4:	03442783          	lw	a5,52(s0)
    21c8:	24a42223          	sw	a0,580(s0)
    21cc:	00100613          	li	a2,1
    21d0:	04440593          	addi	a1,s0,68
    21d4:	f4dff06f          	j	2120 <fatfs_sector_reader+0x90>
    21d8:	00100513          	li	a0,1
    21dc:	efdff06f          	j	20d8 <fatfs_sector_reader+0x48>

000021e0 <fatfs_get_file_entry>:
    21e0:	eb010113          	addi	sp,sp,-336
    21e4:	14812423          	sw	s0,328(sp)
    21e8:	14912223          	sw	s1,324(sp)
    21ec:	13312e23          	sw	s3,316(sp)
    21f0:	13712623          	sw	s7,300(sp)
    21f4:	13812423          	sw	s8,296(sp)
    21f8:	13912223          	sw	s9,292(sp)
    21fc:	14112623          	sw	ra,332(sp)
    2200:	15212023          	sw	s2,320(sp)
    2204:	13412c23          	sw	s4,312(sp)
    2208:	13512a23          	sw	s5,308(sp)
    220c:	13612823          	sw	s6,304(sp)
    2210:	00050993          	mv	s3,a0
    2214:	00058c93          	mv	s9,a1
    2218:	00060b93          	mv	s7,a2
    221c:	00068c13          	mv	s8,a3
    2220:	10010ea3          	sb	zero,285(sp)
    2224:	01810413          	addi	s0,sp,24
    2228:	11c10493          	addi	s1,sp,284
    222c:	00040513          	mv	a0,s0
    2230:	00d00613          	li	a2,13
    2234:	00000593          	li	a1,0
    2238:	00d40413          	addi	s0,s0,13
    223c:	fffff097          	auipc	ra,0xfffff
    2240:	9e8080e7          	jalr	-1560(ra) # c24 <memset>
    2244:	fe9414e3          	bne	s0,s1,222c <fatfs_get_file_entry+0x4c>
    2248:	00000493          	li	s1,0
    224c:	24498a13          	addi	s4,s3,580
    2250:	00810913          	addi	s2,sp,8
    2254:	00800a93          	li	s5,8
    2258:	02e00b13          	li	s6,46
    225c:	00000693          	li	a3,0
    2260:	00048613          	mv	a2,s1
    2264:	000c8593          	mv	a1,s9
    2268:	00098513          	mv	a0,s3
    226c:	00000097          	auipc	ra,0x0
    2270:	e24080e7          	jalr	-476(ra) # 2090 <fatfs_sector_reader>
    2274:	08050c63          	beqz	a0,230c <fatfs_get_file_entry+0x12c>
    2278:	00148493          	addi	s1,s1,1
    227c:	04498413          	addi	s0,s3,68
    2280:	00040513          	mv	a0,s0
    2284:	fffff097          	auipc	ra,0xfffff
    2288:	5dc080e7          	jalr	1500(ra) # 1860 <fatfs_entry_lfn_text>
    228c:	02050063          	beqz	a0,22ac <fatfs_get_file_entry+0xcc>
    2290:	00040593          	mv	a1,s0
    2294:	01810513          	addi	a0,sp,24
    2298:	fffff097          	auipc	ra,0xfffff
    229c:	4c0080e7          	jalr	1216(ra) # 1758 <fatfs_lfn_cache_entry>
    22a0:	02040413          	addi	s0,s0,32
    22a4:	fd441ee3          	bne	s0,s4,2280 <fatfs_get_file_entry+0xa0>
    22a8:	fb5ff06f          	j	225c <fatfs_get_file_entry+0x7c>
    22ac:	00040513          	mv	a0,s0
    22b0:	fffff097          	auipc	ra,0xfffff
    22b4:	5c4080e7          	jalr	1476(ra) # 1874 <fatfs_entry_lfn_invalid>
    22b8:	00050663          	beqz	a0,22c4 <fatfs_get_file_entry+0xe4>
    22bc:	10010ea3          	sb	zero,285(sp)
    22c0:	fe1ff06f          	j	22a0 <fatfs_get_file_entry+0xc0>
    22c4:	00040593          	mv	a1,s0
    22c8:	01810513          	addi	a0,sp,24
    22cc:	fffff097          	auipc	ra,0xfffff
    22d0:	5dc080e7          	jalr	1500(ra) # 18a8 <fatfs_entry_lfn_exists>
    22d4:	06050663          	beqz	a0,2340 <fatfs_get_file_entry+0x160>
    22d8:	01810513          	addi	a0,sp,24
    22dc:	fffff097          	auipc	ra,0xfffff
    22e0:	548080e7          	jalr	1352(ra) # 1824 <fatfs_lfn_cache_get>
    22e4:	000b8593          	mv	a1,s7
    22e8:	fffff097          	auipc	ra,0xfffff
    22ec:	7b8080e7          	jalr	1976(ra) # 1aa0 <fatfs_compare_names>
    22f0:	fc0506e3          	beqz	a0,22bc <fatfs_get_file_entry+0xdc>
    22f4:	02000613          	li	a2,32
    22f8:	00040593          	mv	a1,s0
    22fc:	000c0513          	mv	a0,s8
    2300:	fffff097          	auipc	ra,0xfffff
    2304:	940080e7          	jalr	-1728(ra) # c40 <memcpy>
    2308:	00100513          	li	a0,1
    230c:	14c12083          	lw	ra,332(sp)
    2310:	14812403          	lw	s0,328(sp)
    2314:	14412483          	lw	s1,324(sp)
    2318:	14012903          	lw	s2,320(sp)
    231c:	13c12983          	lw	s3,316(sp)
    2320:	13812a03          	lw	s4,312(sp)
    2324:	13412a83          	lw	s5,308(sp)
    2328:	13012b03          	lw	s6,304(sp)
    232c:	12c12b83          	lw	s7,300(sp)
    2330:	12812c03          	lw	s8,296(sp)
    2334:	12412c83          	lw	s9,292(sp)
    2338:	15010113          	addi	sp,sp,336
    233c:	00008067          	ret
    2340:	00040513          	mv	a0,s0
    2344:	fffff097          	auipc	ra,0xfffff
    2348:	5b4080e7          	jalr	1460(ra) # 18f8 <fatfs_entry_sfn_only>
    234c:	f4050ae3          	beqz	a0,22a0 <fatfs_get_file_entry+0xc0>
    2350:	00d00613          	li	a2,13
    2354:	00000593          	li	a1,0
    2358:	00090513          	mv	a0,s2
    235c:	fffff097          	auipc	ra,0xfffff
    2360:	8c8080e7          	jalr	-1848(ra) # c24 <memset>
    2364:	00000793          	li	a5,0
    2368:	00f406b3          	add	a3,s0,a5
    236c:	0006c683          	lbu	a3,0(a3)
    2370:	00f90733          	add	a4,s2,a5
    2374:	00178793          	addi	a5,a5,1
    2378:	00d70023          	sb	a3,0(a4)
    237c:	ff5796e3          	bne	a5,s5,2368 <fatfs_get_file_entry+0x188>
    2380:	00844703          	lbu	a4,8(s0)
    2384:	00944783          	lbu	a5,9(s0)
    2388:	00a44683          	lbu	a3,10(s0)
    238c:	00e108a3          	sb	a4,17(sp)
    2390:	00f10923          	sb	a5,18(sp)
    2394:	fe070713          	addi	a4,a4,-32
    2398:	fe078793          	addi	a5,a5,-32
    239c:	00f037b3          	snez	a5,a5
    23a0:	00e03733          	snez	a4,a4
    23a4:	00d109a3          	sb	a3,19(sp)
    23a8:	00e7e7b3          	or	a5,a5,a4
    23ac:	00079863          	bnez	a5,23bc <fatfs_get_file_entry+0x1dc>
    23b0:	fe068693          	addi	a3,a3,-32
    23b4:	02000793          	li	a5,32
    23b8:	00068a63          	beqz	a3,23cc <fatfs_get_file_entry+0x1ec>
    23bc:	00814703          	lbu	a4,8(sp)
    23c0:	02e00793          	li	a5,46
    23c4:	01671463          	bne	a4,s6,23cc <fatfs_get_file_entry+0x1ec>
    23c8:	02000793          	li	a5,32
    23cc:	00f10823          	sb	a5,16(sp)
    23d0:	000b8593          	mv	a1,s7
    23d4:	00090513          	mv	a0,s2
    23d8:	f11ff06f          	j	22e8 <fatfs_get_file_entry+0x108>

000023dc <_open_directory>:
    23dc:	eb010113          	addi	sp,sp,-336
    23e0:	15212023          	sw	s2,320(sp)
    23e4:	00007937          	lui	s2,0x7
    23e8:	58490913          	addi	s2,s2,1412 # 7584 <_fs>
    23ec:	14812423          	sw	s0,328(sp)
    23f0:	00892403          	lw	s0,8(s2)
    23f4:	14912223          	sw	s1,324(sp)
    23f8:	13312e23          	sw	s3,316(sp)
    23fc:	13412c23          	sw	s4,312(sp)
    2400:	13512a23          	sw	s5,308(sp)
    2404:	13612823          	sw	s6,304(sp)
    2408:	14112623          	sw	ra,332(sp)
    240c:	00050a13          	mv	s4,a0
    2410:	00058a93          	mv	s5,a1
    2414:	fffff097          	auipc	ra,0xfffff
    2418:	534080e7          	jalr	1332(ra) # 1948 <fatfs_total_path_levels>
    241c:	00050b13          	mv	s6,a0
    2420:	00000493          	li	s1,0
    2424:	fff00993          	li	s3,-1
    2428:	009b5863          	bge	s6,s1,2438 <_open_directory+0x5c>
    242c:	008aa023          	sw	s0,0(s5)
    2430:	00100513          	li	a0,1
    2434:	0240006f          	j	2458 <_open_directory+0x7c>
    2438:	10400693          	li	a3,260
    243c:	02c10613          	addi	a2,sp,44
    2440:	00048593          	mv	a1,s1
    2444:	000a0513          	mv	a0,s4
    2448:	fffff097          	auipc	ra,0xfffff
    244c:	570080e7          	jalr	1392(ra) # 19b8 <fatfs_get_substring>
    2450:	03351863          	bne	a0,s3,2480 <_open_directory+0xa4>
    2454:	00000513          	li	a0,0
    2458:	14c12083          	lw	ra,332(sp)
    245c:	14812403          	lw	s0,328(sp)
    2460:	14412483          	lw	s1,324(sp)
    2464:	14012903          	lw	s2,320(sp)
    2468:	13c12983          	lw	s3,316(sp)
    246c:	13812a03          	lw	s4,312(sp)
    2470:	13412a83          	lw	s5,308(sp)
    2474:	13012b03          	lw	s6,304(sp)
    2478:	15010113          	addi	sp,sp,336
    247c:	00008067          	ret
    2480:	00c10693          	addi	a3,sp,12
    2484:	02c10613          	addi	a2,sp,44
    2488:	00040593          	mv	a1,s0
    248c:	00090513          	mv	a0,s2
    2490:	00000097          	auipc	ra,0x0
    2494:	d50080e7          	jalr	-688(ra) # 21e0 <fatfs_get_file_entry>
    2498:	fa050ee3          	beqz	a0,2454 <_open_directory+0x78>
    249c:	01714783          	lbu	a5,23(sp)
    24a0:	0107f793          	andi	a5,a5,16
    24a4:	fa0788e3          	beqz	a5,2454 <_open_directory+0x78>
    24a8:	02015403          	lhu	s0,32(sp)
    24ac:	02615783          	lhu	a5,38(sp)
    24b0:	00148493          	addi	s1,s1,1
    24b4:	01041413          	slli	s0,s0,0x10
    24b8:	00f40433          	add	s0,s0,a5
    24bc:	f6dff06f          	j	2428 <_open_directory+0x4c>

000024c0 <fl_opendir>:
    24c0:	fe010113          	addi	sp,sp,-32
    24c4:	fff00793          	li	a5,-1
    24c8:	00f12623          	sw	a5,12(sp)
    24cc:	000037b7          	lui	a5,0x3
    24d0:	c807a783          	lw	a5,-896(a5) # 2c80 <_filelib_init>
    24d4:	00812c23          	sw	s0,24(sp)
    24d8:	01212823          	sw	s2,16(sp)
    24dc:	00112e23          	sw	ra,28(sp)
    24e0:	00912a23          	sw	s1,20(sp)
    24e4:	00050913          	mv	s2,a0
    24e8:	00058413          	mv	s0,a1
    24ec:	00079663          	bnez	a5,24f8 <fl_opendir+0x38>
    24f0:	fffff097          	auipc	ra,0xfffff
    24f4:	1f8080e7          	jalr	504(ra) # 16e8 <fl_init>
    24f8:	000074b7          	lui	s1,0x7
    24fc:	58448493          	addi	s1,s1,1412 # 7584 <_fs>
    2500:	03c4a783          	lw	a5,60(s1)
    2504:	00078463          	beqz	a5,250c <fl_opendir+0x4c>
    2508:	000780e7          	jalr	a5
    250c:	00090513          	mv	a0,s2
    2510:	fffff097          	auipc	ra,0xfffff
    2514:	438080e7          	jalr	1080(ra) # 1948 <fatfs_total_path_levels>
    2518:	fff00793          	li	a5,-1
    251c:	02f51063          	bne	a0,a5,253c <fl_opendir+0x7c>
    2520:	0084a783          	lw	a5,8(s1)
    2524:	00f12623          	sw	a5,12(sp)
    2528:	00c12783          	lw	a5,12(sp)
    252c:	00042023          	sw	zero,0(s0)
    2530:	00040423          	sb	zero,8(s0)
    2534:	00f42223          	sw	a5,4(s0)
    2538:	0180006f          	j	2550 <fl_opendir+0x90>
    253c:	00c10593          	addi	a1,sp,12
    2540:	00090513          	mv	a0,s2
    2544:	00000097          	auipc	ra,0x0
    2548:	e98080e7          	jalr	-360(ra) # 23dc <_open_directory>
    254c:	fc051ee3          	bnez	a0,2528 <fl_opendir+0x68>
    2550:	0404a783          	lw	a5,64(s1)
    2554:	00078463          	beqz	a5,255c <fl_opendir+0x9c>
    2558:	000780e7          	jalr	a5
    255c:	00c12703          	lw	a4,12(sp)
    2560:	fff00793          	li	a5,-1
    2564:	00f71463          	bne	a4,a5,256c <fl_opendir+0xac>
    2568:	00000413          	li	s0,0
    256c:	01c12083          	lw	ra,28(sp)
    2570:	00040513          	mv	a0,s0
    2574:	01812403          	lw	s0,24(sp)
    2578:	01412483          	lw	s1,20(sp)
    257c:	01012903          	lw	s2,16(sp)
    2580:	02010113          	addi	sp,sp,32
    2584:	00008067          	ret

00002588 <fatfs_list_directory_next>:
    2588:	ec010113          	addi	sp,sp,-320
    258c:	13212823          	sw	s2,304(sp)
    2590:	13312623          	sw	s3,300(sp)
    2594:	13412423          	sw	s4,296(sp)
    2598:	13512223          	sw	s5,292(sp)
    259c:	13612023          	sw	s6,288(sp)
    25a0:	12112e23          	sw	ra,316(sp)
    25a4:	12812c23          	sw	s0,312(sp)
    25a8:	12912a23          	sw	s1,308(sp)
    25ac:	00050a13          	mv	s4,a0
    25b0:	00058913          	mv	s2,a1
    25b4:	00060993          	mv	s3,a2
    25b8:	10010ea3          	sb	zero,285(sp)
    25bc:	04450a93          	addi	s5,a0,68
    25c0:	00f00b13          	li	s6,15
    25c4:	00092603          	lw	a2,0(s2)
    25c8:	00492583          	lw	a1,4(s2)
    25cc:	00000693          	li	a3,0
    25d0:	000a0513          	mv	a0,s4
    25d4:	00000097          	auipc	ra,0x0
    25d8:	abc080e7          	jalr	-1348(ra) # 2090 <fatfs_sector_reader>
    25dc:	10050c63          	beqz	a0,26f4 <fatfs_list_directory_next+0x16c>
    25e0:	00894483          	lbu	s1,8(s2)
    25e4:	00549413          	slli	s0,s1,0x5
    25e8:	008a8433          	add	s0,s5,s0
    25ec:	009b7c63          	bgeu	s6,s1,2604 <fatfs_list_directory_next+0x7c>
    25f0:	00092783          	lw	a5,0(s2)
    25f4:	00090423          	sb	zero,8(s2)
    25f8:	00178793          	addi	a5,a5,1
    25fc:	00f92023          	sw	a5,0(s2)
    2600:	fc5ff06f          	j	25c4 <fatfs_list_directory_next+0x3c>
    2604:	00040513          	mv	a0,s0
    2608:	fffff097          	auipc	ra,0xfffff
    260c:	258080e7          	jalr	600(ra) # 1860 <fatfs_entry_lfn_text>
    2610:	02050263          	beqz	a0,2634 <fatfs_list_directory_next+0xac>
    2614:	00040593          	mv	a1,s0
    2618:	01810513          	addi	a0,sp,24
    261c:	fffff097          	auipc	ra,0xfffff
    2620:	13c080e7          	jalr	316(ra) # 1758 <fatfs_lfn_cache_entry>
    2624:	00148493          	addi	s1,s1,1
    2628:	0ff4f493          	zext.b	s1,s1
    262c:	02040413          	addi	s0,s0,32
    2630:	fbdff06f          	j	25ec <fatfs_list_directory_next+0x64>
    2634:	00040513          	mv	a0,s0
    2638:	fffff097          	auipc	ra,0xfffff
    263c:	23c080e7          	jalr	572(ra) # 1874 <fatfs_entry_lfn_invalid>
    2640:	00050663          	beqz	a0,264c <fatfs_list_directory_next+0xc4>
    2644:	10010ea3          	sb	zero,285(sp)
    2648:	fddff06f          	j	2624 <fatfs_list_directory_next+0x9c>
    264c:	00040593          	mv	a1,s0
    2650:	01810513          	addi	a0,sp,24
    2654:	fffff097          	auipc	ra,0xfffff
    2658:	254080e7          	jalr	596(ra) # 18a8 <fatfs_entry_lfn_exists>
    265c:	0c050063          	beqz	a0,271c <fatfs_list_directory_next+0x194>
    2660:	01810513          	addi	a0,sp,24
    2664:	fffff097          	auipc	ra,0xfffff
    2668:	1c0080e7          	jalr	448(ra) # 1824 <fatfs_lfn_cache_get>
    266c:	00050593          	mv	a1,a0
    2670:	10300613          	li	a2,259
    2674:	00098513          	mv	a0,s3
    2678:	ffffe097          	auipc	ra,0xffffe
    267c:	64c080e7          	jalr	1612(ra) # cc4 <strncpy>
    2680:	00040513          	mv	a0,s0
    2684:	fffff097          	auipc	ra,0xfffff
    2688:	2b4080e7          	jalr	692(ra) # 1938 <fatfs_entry_is_dir>
    268c:	10a98223          	sb	a0,260(s3)
    2690:	01d44783          	lbu	a5,29(s0)
    2694:	01c44703          	lbu	a4,28(s0)
    2698:	00148493          	addi	s1,s1,1
    269c:	00879793          	slli	a5,a5,0x8
    26a0:	00e7e7b3          	or	a5,a5,a4
    26a4:	01e44703          	lbu	a4,30(s0)
    26a8:	00100513          	li	a0,1
    26ac:	01071713          	slli	a4,a4,0x10
    26b0:	00f76733          	or	a4,a4,a5
    26b4:	01f44783          	lbu	a5,31(s0)
    26b8:	01879793          	slli	a5,a5,0x18
    26bc:	00e7e7b3          	or	a5,a5,a4
    26c0:	10f9a623          	sw	a5,268(s3)
    26c4:	01544783          	lbu	a5,21(s0)
    26c8:	01444703          	lbu	a4,20(s0)
    26cc:	01a44683          	lbu	a3,26(s0)
    26d0:	00879793          	slli	a5,a5,0x8
    26d4:	00e7e7b3          	or	a5,a5,a4
    26d8:	01b44703          	lbu	a4,27(s0)
    26dc:	01079793          	slli	a5,a5,0x10
    26e0:	00871713          	slli	a4,a4,0x8
    26e4:	00d76733          	or	a4,a4,a3
    26e8:	00e7e7b3          	or	a5,a5,a4
    26ec:	10f9a423          	sw	a5,264(s3)
    26f0:	00990423          	sb	s1,8(s2)
    26f4:	13c12083          	lw	ra,316(sp)
    26f8:	13812403          	lw	s0,312(sp)
    26fc:	13412483          	lw	s1,308(sp)
    2700:	13012903          	lw	s2,304(sp)
    2704:	12c12983          	lw	s3,300(sp)
    2708:	12812a03          	lw	s4,296(sp)
    270c:	12412a83          	lw	s5,292(sp)
    2710:	12012b03          	lw	s6,288(sp)
    2714:	14010113          	addi	sp,sp,320
    2718:	00008067          	ret
    271c:	00040513          	mv	a0,s0
    2720:	fffff097          	auipc	ra,0xfffff
    2724:	1d8080e7          	jalr	472(ra) # 18f8 <fatfs_entry_sfn_only>
    2728:	ee050ee3          	beqz	a0,2624 <fatfs_list_directory_next+0x9c>
    272c:	00810a13          	addi	s4,sp,8
    2730:	00d00613          	li	a2,13
    2734:	00000593          	li	a1,0
    2738:	000a0513          	mv	a0,s4
    273c:	10010ea3          	sb	zero,285(sp)
    2740:	ffffe097          	auipc	ra,0xffffe
    2744:	4e4080e7          	jalr	1252(ra) # c24 <memset>
    2748:	00000793          	li	a5,0
    274c:	00800713          	li	a4,8
    2750:	00f40633          	add	a2,s0,a5
    2754:	00064603          	lbu	a2,0(a2)
    2758:	00fa06b3          	add	a3,s4,a5
    275c:	00178793          	addi	a5,a5,1
    2760:	00c68023          	sb	a2,0(a3)
    2764:	fee796e3          	bne	a5,a4,2750 <fatfs_list_directory_next+0x1c8>
    2768:	00844783          	lbu	a5,8(s0)
    276c:	00944703          	lbu	a4,9(s0)
    2770:	00a44683          	lbu	a3,10(s0)
    2774:	00f108a3          	sb	a5,17(sp)
    2778:	00e10923          	sb	a4,18(sp)
    277c:	fe078793          	addi	a5,a5,-32
    2780:	fe070713          	addi	a4,a4,-32
    2784:	00f037b3          	snez	a5,a5
    2788:	00e03733          	snez	a4,a4
    278c:	00d109a3          	sb	a3,19(sp)
    2790:	00e7e7b3          	or	a5,a5,a4
    2794:	00079863          	bnez	a5,27a4 <fatfs_list_directory_next+0x21c>
    2798:	fe068693          	addi	a3,a3,-32
    279c:	02000793          	li	a5,32
    27a0:	00068a63          	beqz	a3,27b4 <fatfs_list_directory_next+0x22c>
    27a4:	00814703          	lbu	a4,8(sp)
    27a8:	02e00793          	li	a5,46
    27ac:	00f71463          	bne	a4,a5,27b4 <fatfs_list_directory_next+0x22c>
    27b0:	02000793          	li	a5,32
    27b4:	000a0593          	mv	a1,s4
    27b8:	00098513          	mv	a0,s3
    27bc:	00f10823          	sb	a5,16(sp)
    27c0:	fffff097          	auipc	ra,0xfffff
    27c4:	46c080e7          	jalr	1132(ra) # 1c2c <fatfs_get_sfn_display_name>
    27c8:	eb9ff06f          	j	2680 <fatfs_list_directory_next+0xf8>

000027cc <fl_readdir>:
    27cc:	000037b7          	lui	a5,0x3
    27d0:	c807a783          	lw	a5,-896(a5) # 2c80 <_filelib_init>
    27d4:	fd010113          	addi	sp,sp,-48
    27d8:	03212023          	sw	s2,32(sp)
    27dc:	01312e23          	sw	s3,28(sp)
    27e0:	02112623          	sw	ra,44(sp)
    27e4:	02812423          	sw	s0,40(sp)
    27e8:	02912223          	sw	s1,36(sp)
    27ec:	00050913          	mv	s2,a0
    27f0:	00058993          	mv	s3,a1
    27f4:	00079663          	bnez	a5,2800 <fl_readdir+0x34>
    27f8:	fffff097          	auipc	ra,0xfffff
    27fc:	ef0080e7          	jalr	-272(ra) # 16e8 <fl_init>
    2800:	000074b7          	lui	s1,0x7
    2804:	58448413          	addi	s0,s1,1412 # 7584 <_fs>
    2808:	03c42783          	lw	a5,60(s0)
    280c:	00078463          	beqz	a5,2814 <fl_readdir+0x48>
    2810:	000780e7          	jalr	a5
    2814:	00098613          	mv	a2,s3
    2818:	00090593          	mv	a1,s2
    281c:	58448513          	addi	a0,s1,1412
    2820:	00000097          	auipc	ra,0x0
    2824:	d68080e7          	jalr	-664(ra) # 2588 <fatfs_list_directory_next>
    2828:	04042783          	lw	a5,64(s0)
    282c:	00078863          	beqz	a5,283c <fl_readdir+0x70>
    2830:	00a12623          	sw	a0,12(sp)
    2834:	000780e7          	jalr	a5
    2838:	00c12503          	lw	a0,12(sp)
    283c:	02c12083          	lw	ra,44(sp)
    2840:	02812403          	lw	s0,40(sp)
    2844:	00154513          	xori	a0,a0,1
    2848:	02412483          	lw	s1,36(sp)
    284c:	02012903          	lw	s2,32(sp)
    2850:	01c12983          	lw	s3,28(sp)
    2854:	40a00533          	neg	a0,a0
    2858:	03010113          	addi	sp,sp,48
    285c:	00008067          	ret

00002860 <cmd16>:
    2860:	02000050 00001500                       P.......

00002868 <acmd41>:
    2868:	00004069 00000100                       i@......

00002870 <cmd55>:
    2870:	00000077 00000100                       w.......

00002878 <cmd8>:
    2878:	01000048 000087aa                       H.......

00002880 <cmd0>:
    2880:	00000040 00009500                       @.......

00002888 <BUTTONS>:
    2888:	00010100                                ....

0000288c <SDCARD>:
    288c:	00010080                                ....

00002890 <OLED_RST>:
    2890:	00010010                                ....

00002894 <OLED>:
    2894:	00010008                                ....

00002898 <LEDS>:
    2898:	00010004 00002e2e 0000002f 74696e49     ......../...Init
    28a8:	696c6169 676e697a 20445320 64726163     ializing SD card
    28b8:	0a2e2e2e 00000000 20202020 3d3d3d3d     ........    ====
    28c8:	504d203d 3d3d2033 203d3d3d 0a202020     = MP3 =====    .
    28d8:	00000000 68746150 7325203a 00000a0a     ....Path: %s....
    28e8:	66206f4e 73656c69 756f6620 0a21646e     No files found!.
    28f8:	00000000 203e6425 5249445b 2520205d     ....%d> [DIR]  %
    2908:	00000a73 203e6425 4c49465b 25205d45     s...%d> [FILE] %
    2918:	00000a73 5b202020 62206425 73657479     s...   [%d bytes
    2928:	00000a5d 33323130 37363534 42413938     ]...0123456789AB
    2938:	46454443 00000000 5f544146 203a5346     CDEF....FAT_FS: 
    2948:	6f727245 6f632072 20646c75 20746f6e     Error could not 
    2958:	64616f6c 54414620 74656420 736c6961     load FAT details
    2968:	64252820 0a0d2129 00000000               (%d)!......

00002974 <font>:
    2974:	00000000 00002f00 00030000 14000003     ...../..........
    2984:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    2994:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    29a4:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    29b4:	00080800 00200000 20000000 02040810     ...... .... ....
    29c4:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    29d4:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    29e4:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    29f4:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    2a04:	00141400 0a110000 01000004 0007052d     ............-...
    2a14:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    2a24:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    2a34:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    2a44:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    2a54:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    2a64:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    2a74:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    2a84:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    2a94:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    2aa4:	003f2102 01020000 20000201 00000020     .!?........  ...
    2ab4:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    2ac4:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    2ad4:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    2ae4:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    2af4:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    2b04:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    2b14:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    2b24:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    2b34:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    2b44:	043f2100 02010000 00000102 00000000     .!?.............

00002b54 <current_path>:
    2b54:	33706d2f 0000002f 00000000 00000000     /mp3/...........
	...

00002c54 <n_items>:
    2c54:	00000000                                ....

00002c58 <sdcard_while_loading_callback>:
    2c58:	00000000                                ....

00002c5c <back_color>:
	...

00002c5d <front_color>:
    2c5d:	                                         ...

00002c60 <cursor_y>:
    2c60:	00000000                                ....

00002c64 <cursor_x>:
    2c64:	00000000                                ....

00002c68 <f_putchar>:
    2c68:	00000000                                ....

00002c6c <_free_file_list>:
	...

00002c74 <_open_file_list>:
	...

00002c7c <_filelib_valid>:
    2c7c:	00000000                                ....

00002c80 <_filelib_init>:
    2c80:	00000000                                ....
