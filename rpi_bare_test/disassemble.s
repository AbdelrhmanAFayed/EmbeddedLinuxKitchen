
blink.elf:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000008000 <_start>:
    8000:	14000003 	b	800c <main>

0000000000008004 <loop>:
    8004:	d503207f 	wfi
    8008:	17ffffff 	b	8004 <loop>

000000000000800c <main>:
    800c:	d10043ff 	sub	sp, sp, #0x10
    8010:	d2800100 	mov	x0, #0x8                   	// #8
    8014:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8018:	b9400001 	ldr	w1, [x0]
    801c:	d2800100 	mov	x0, #0x8                   	// #8
    8020:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8024:	321d0021 	orr	w1, w1, #0x8
    8028:	b9000001 	str	w1, [x0]
    802c:	b9000fff 	str	wzr, [sp, #12]
    8030:	d2800380 	mov	x0, #0x1c                  	// #28
    8034:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8038:	52a00401 	mov	w1, #0x200000              	// #2097152
    803c:	b9000001 	str	w1, [x0]
    8040:	b9000fff 	str	wzr, [sp, #12]
    8044:	14000004 	b	8054 <main+0x48>
    8048:	b9400fe0 	ldr	w0, [sp, #12]
    804c:	11000400 	add	w0, w0, #0x1
    8050:	b9000fe0 	str	w0, [sp, #12]
    8054:	b9400fe1 	ldr	w1, [sp, #12]
    8058:	528847e0 	mov	w0, #0x423f                	// #16959
    805c:	72a001e0 	movk	w0, #0xf, lsl #16
    8060:	6b00003f 	cmp	w1, w0
    8064:	54ffff2d 	b.le	8048 <main+0x3c>
    8068:	d2800500 	mov	x0, #0x28                  	// #40
    806c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8070:	52a00401 	mov	w1, #0x200000              	// #2097152
    8074:	b9000001 	str	w1, [x0]
    8078:	b9000fff 	str	wzr, [sp, #12]
    807c:	14000004 	b	808c <main+0x80>
    8080:	b9400fe0 	ldr	w0, [sp, #12]
    8084:	11000400 	add	w0, w0, #0x1
    8088:	b9000fe0 	str	w0, [sp, #12]
    808c:	b9400fe1 	ldr	w1, [sp, #12]
    8090:	528847e0 	mov	w0, #0x423f                	// #16959
    8094:	72a001e0 	movk	w0, #0xf, lsl #16
    8098:	6b00003f 	cmp	w1, w0
    809c:	54ffff2d 	b.le	8080 <main+0x74>
    80a0:	17ffffe4 	b	8030 <main+0x24>

Disassembly of section .eh_frame:

00000000000080a8 <_end-0x28>:
    80a8:	00000010 	udf	#16
    80ac:	00000000 	udf	#0
    80b0:	00527a01 	.inst	0x00527a01 ; undefined
    80b4:	011e7804 	.inst	0x011e7804 ; undefined
    80b8:	001f0c1b 	.inst	0x001f0c1b ; undefined
    80bc:	00000010 	udf	#16
    80c0:	00000018 	udf	#24
    80c4:	ffffff48 	.inst	0xffffff48 ; undefined
    80c8:	00000098 	udf	#152
    80cc:	100e4100 	adr	x0, 248ec <_end+0x1c81c>

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi  // mi = first
   4:	62552820 	.inst	0x62552820 ; undefined
   8:	75746e75 	.inst	0x75746e75 ; undefined
   c:	2e313120 	usubw	v0.8h, v9.8h, v17.8b
  10:	2d302e34 	stp	s20, s11, [x17, #-128]
  14:	75627531 	.inst	0x75627531 ; undefined
  18:	3175746e 	adds	w14, w3, #0xd5d, lsl #12
  1c:	2e32327e 	usubw	v30.8h, v19.8h, v18.8b
  20:	20293430 	.inst	0x20293430 ; undefined
  24:	342e3131 	cbz	w17, 5c648 <_end+0x54578>
  28:	Address 0x0000000000000028 is out of bounds.

