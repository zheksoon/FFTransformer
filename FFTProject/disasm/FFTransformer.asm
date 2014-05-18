
obj/release/FFTransformerVec.o:     file format pe-i386


Disassembly of section .text$_ZN16FFTransformerVecIfED1Ev:

00000000 <__ZN16FFTransformerVecIfED1Ev>:
   0:	53                   	push   ebx
   1:	89 cb                	mov    ebx,ecx
   3:	83 ec 18             	sub    esp,0x18
   6:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
   9:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   f:	85 c0                	test   eax,eax
  11:	74 08                	je     1b <__ZN16FFTransformerVecIfED1Ev+0x1b>
  13:	89 04 24             	mov    DWORD PTR [esp],eax
  16:	e8 00 00 00 00       	call   1b <__ZN16FFTransformerVecIfED1Ev+0x1b>
  1b:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN16FFTransformerVecIfED1Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN16FFTransformerVecIfED1Ev+0x2a>
  2a:	83 c4 18             	add    esp,0x18
  2d:	5b                   	pop    ebx
  2e:	c3                   	ret    
  2f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfED0Ev:

00000000 <__ZN16FFTransformerVecIfED0Ev>:
   0:	53                   	push   ebx
   1:	89 cb                	mov    ebx,ecx
   3:	83 ec 18             	sub    esp,0x18
   6:	e8 00 00 00 00       	call   b <__ZN16FFTransformerVecIfED0Ev+0xb>
   b:	89 1c 24             	mov    DWORD PTR [esp],ebx
   e:	e8 00 00 00 00       	call   13 <__ZN16FFTransformerVecIfED0Ev+0x13>
  13:	83 c4 18             	add    esp,0x18
  16:	5b                   	pop    ebx
  17:	c3                   	ret    
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE12isPowerOfTwoEj:

00000000 <__ZN16FFTransformerVecIfE12isPowerOfTwoEj>:
   0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
   4:	8d 50 ff             	lea    edx,[eax-0x1]
   7:	85 c2                	test   edx,eax
   9:	0f 94 c0             	sete   al
   c:	c2 04 00             	ret    0x4
   f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE13getPowerOfTwoEj:

00000000 <__ZN16FFTransformerVecIfE13getPowerOfTwoEj>:
   0:	0f bd 54 24 04       	bsr    edx,DWORD PTR [esp+0x4]
   5:	b8 1f 00 00 00       	mov    eax,0x1f
   a:	83 f2 1f             	xor    edx,0x1f
   d:	29 d0                	sub    eax,edx
   f:	c2 04 00             	ret    0x4
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE15bitReverseInt32Ej:

00000000 <__ZN16FFTransformerVecIfE15bitReverseInt32Ej>:
   0:	53                   	push   ebx
   1:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
   5:	ba 04 00 00 00       	mov    edx,0x4
   a:	0f b6 c8             	movzx  ecx,al
   d:	31 c8                	xor    eax,ecx
   f:	89 c3                	mov    ebx,eax
  11:	0f b6 81 00 00 00 00 	movzx  eax,BYTE PTR [ecx+0x0]
  18:	09 d8                	or     eax,ebx
  1a:	c1 c8 08             	ror    eax,0x8
  1d:	83 ea 01             	sub    edx,0x1
  20:	75 e8                	jne    a <__ZN16FFTransformerVecIfE15bitReverseInt32Ej+0xa>
  22:	0f c8                	bswap  eax
  24:	5b                   	pop    ebx
  25:	c2 04 00             	ret    0x4
  28:	90                   	nop
  29:	90                   	nop
  2a:	90                   	nop
  2b:	90                   	nop
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi:

00000000 <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi>:
   0:	55                   	push   ebp
   1:	57                   	push   edi
   2:	56                   	push   esi
   3:	53                   	push   ebx
   4:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
   8:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
   c:	85 db                	test   ebx,ebx
   e:	7e 3f                	jle    4f <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi+0x4f>
  10:	8b 71 18             	mov    esi,DWORD PTR [ecx+0x18]
  13:	89 fa                	mov    edx,edi
  15:	31 c0                	xor    eax,eax
  17:	89 f5                	mov    ebp,esi
  19:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  20:	8b 4c 85 00          	mov    ecx,DWORD PTR [ebp+eax*4+0x0]
  24:	39 c1                	cmp    ecx,eax
  26:	7e 1d                	jle    45 <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi+0x45>
  28:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
  2c:	d9 02                	fld    DWORD PTR [edx]
  2e:	d9 42 04             	fld    DWORD PTR [edx+0x4]
  31:	d9 c9                	fxch   st(1)
  33:	8d 0c cf             	lea    ecx,[edi+ecx*8]
  36:	8b 31                	mov    esi,DWORD PTR [ecx]
  38:	8b 79 04             	mov    edi,DWORD PTR [ecx+0x4]
  3b:	89 32                	mov    DWORD PTR [edx],esi
  3d:	89 7a 04             	mov    DWORD PTR [edx+0x4],edi
  40:	d9 19                	fstp   DWORD PTR [ecx]
  42:	d9 59 04             	fstp   DWORD PTR [ecx+0x4]
  45:	83 c0 01             	add    eax,0x1
  48:	83 c2 08             	add    edx,0x8
  4b:	39 d8                	cmp    eax,ebx
  4d:	75 d1                	jne    20 <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi+0x20>
  4f:	5b                   	pop    ebx
  50:	5e                   	pop    esi
  51:	5f                   	pop    edi
  52:	5d                   	pop    ebp
  53:	c2 08 00             	ret    0x8
  56:	90                   	nop
  57:	90                   	nop
  58:	90                   	nop
  59:	90                   	nop
  5a:	90                   	nop
  5b:	90                   	nop
  5c:	90                   	nop
  5d:	90                   	nop
  5e:	90                   	nop
  5f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfEC2Ev:

00000000 <__ZN16FFTransformerVecIfEC2Ev>:
   0:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   6:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
   d:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
  14:	c3                   	ret    
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfEC1Ev:

00000000 <__ZN16FFTransformerVecIfEC1Ev>:
   0:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   6:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
   d:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
  14:	c3                   	ret    
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfED2Ev:

00000000 <__ZN16FFTransformerVecIfED2Ev>:
   0:	53                   	push   ebx
   1:	89 cb                	mov    ebx,ecx
   3:	83 ec 18             	sub    esp,0x18
   6:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
   9:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   f:	85 c0                	test   eax,eax
  11:	74 08                	je     1b <__ZN16FFTransformerVecIfED2Ev+0x1b>
  13:	89 04 24             	mov    DWORD PTR [esp],eax
  16:	e8 00 00 00 00       	call   1b <__ZN16FFTransformerVecIfED2Ev+0x1b>
  1b:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN16FFTransformerVecIfED2Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN16FFTransformerVecIfED2Ev+0x2a>
  2a:	83 c4 18             	add    esp,0x18
  2d:	5b                   	pop    ebx
  2e:	c3                   	ret    
  2f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE7FFTInitEii:

00000000 <__ZN16FFTransformerVecIfE7FFTInitEii>:
   0:	55                   	push   ebp
   1:	31 c0                	xor    eax,eax
   3:	57                   	push   edi
   4:	56                   	push   esi
   5:	53                   	push   ebx
   6:	83 ec 3c             	sub    esp,0x3c
   9:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
   d:	85 db                	test   ebx,ebx
   f:	0f 8e 54 01 00 00    	jle    169 <__ZN16FFTransformerVecIfE7FFTInitEii+0x169>
  15:	8b 54 24 50          	mov    edx,DWORD PTR [esp+0x50]
  19:	83 ea 01             	sub    edx,0x1
  1c:	85 54 24 50          	test   DWORD PTR [esp+0x50],edx
  20:	0f 85 43 01 00 00    	jne    169 <__ZN16FFTransformerVecIfE7FFTInitEii+0x169>
  26:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  2a:	89 cf                	mov    edi,ecx
  2c:	8b 54 24 54          	mov    edx,DWORD PTR [esp+0x54]
  30:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  33:	31 c0                	xor    eax,eax
  35:	85 d2                	test   edx,edx
  37:	0f 9f c0             	setg   al
  3a:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  3d:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  41:	8d 50 02             	lea    edx,[eax+0x2]
  44:	b8 ff ff ff ff       	mov    eax,0xffffffff
  49:	81 fa 01 00 e0 0f    	cmp    edx,0xfe00001
  4f:	8d 0c d5 00 00 00 00 	lea    ecx,[edx*8+0x0]
  56:	0f 42 c1             	cmovb  eax,ecx
  59:	89 04 24             	mov    DWORD PTR [esp],eax
  5c:	e8 00 00 00 00       	call   61 <__ZN16FFTransformerVecIfE7FFTInitEii+0x61>
  61:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  64:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  68:	83 c0 04             	add    eax,0x4
  6b:	3d 00 00 c0 1f       	cmp    eax,0x1fc00000
  70:	0f 86 fd 00 00 00    	jbe    173 <__ZN16FFTransformerVecIfE7FFTInitEii+0x173>
  76:	c7 04 24 ff ff ff ff 	mov    DWORD PTR [esp],0xffffffff
  7d:	e8 00 00 00 00       	call   82 <__ZN16FFTransformerVecIfE7FFTInitEii+0x82>
  82:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  85:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  89:	83 64 24 20 f0       	and    DWORD PTR [esp+0x20],0xfffffff0
  8e:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  92:	89 47 14             	mov    DWORD PTR [edi+0x14],eax
  95:	83 e0 f0             	and    eax,0xfffffff0
  98:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  9c:	89 47 18             	mov    DWORD PTR [edi+0x18],eax
  9f:	89 57 10             	mov    DWORD PTR [edi+0x10],edx
  a2:	db 44 24 54          	fild   DWORD PTR [esp+0x54]
  a6:	be 04 00 00 00       	mov    esi,0x4
  ab:	dc 0d 00 00 00 00    	fmul   QWORD PTR ds:0x0
  b1:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
  b5:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  b9:	31 ed                	xor    ebp,ebp
  bb:	89 74 24 28          	mov    DWORD PTR [esp+0x28],esi
  bf:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  c3:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  c7:	8d 1c f0             	lea    ebx,[eax+esi*8]
  ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  d0:	89 6c 24 28          	mov    DWORD PTR [esp+0x28],ebp
  d4:	83 c5 01             	add    ebp,0x1
  d7:	83 c3 08             	add    ebx,0x8
  da:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  de:	dc 4c 24 18          	fmul   QWORD PTR [esp+0x18]
  e2:	dc 74 24 10          	fdiv   QWORD PTR [esp+0x10]
  e6:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
  ea:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
  ee:	dd 14 24             	fst    QWORD PTR [esp]
  f1:	d9 5c 24 0c          	fstp   DWORD PTR [esp+0xc]
  f5:	e8 00 00 00 00       	call   fa <__ZN16FFTransformerVecIfE7FFTInitEii+0xfa>
  fa:	d9 5b d8             	fstp   DWORD PTR [ebx-0x28]
  fd:	d9 44 24 0c          	fld    DWORD PTR [esp+0xc]
 101:	dd 1c 24             	fstp   QWORD PTR [esp]
 104:	e8 00 00 00 00       	call   109 <__ZN16FFTransformerVecIfE7FFTInitEii+0x109>
 109:	d9 5b dc             	fstp   DWORD PTR [ebx-0x24]
 10c:	39 f5                	cmp    ebp,esi
 10e:	75 c0                	jne    d0 <__ZN16FFTransformerVecIfE7FFTInitEii+0xd0>
 110:	01 f6                	add    esi,esi
 112:	39 74 24 50          	cmp    DWORD PTR [esp+0x50],esi
 116:	7f 9d                	jg     b5 <__ZN16FFTransformerVecIfE7FFTInitEii+0xb5>
 118:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
 11b:	31 db                	xor    ebx,ebx
 11d:	0f bd e8             	bsr    ebp,eax
 120:	83 f5 1f             	xor    ebp,0x1f
 123:	83 c5 01             	add    ebp,0x1
 126:	85 c0                	test   eax,eax
 128:	7e 3a                	jle    164 <__ZN16FFTransformerVecIfE7FFTInitEii+0x164>
 12a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 130:	89 d8                	mov    eax,ebx
 132:	ba 04 00 00 00       	mov    edx,0x4
 137:	0f b6 c8             	movzx  ecx,al
 13a:	31 c8                	xor    eax,ecx
 13c:	89 c6                	mov    esi,eax
 13e:	0f b6 81 00 00 00 00 	movzx  eax,BYTE PTR [ecx+0x0]
 145:	09 f0                	or     eax,esi
 147:	c1 c8 08             	ror    eax,0x8
 14a:	83 ea 01             	sub    edx,0x1
 14d:	75 e8                	jne    137 <__ZN16FFTransformerVecIfE7FFTInitEii+0x137>
 14f:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
 153:	89 e9                	mov    ecx,ebp
 155:	0f c8                	bswap  eax
 157:	d3 e8                	shr    eax,cl
 159:	89 04 9a             	mov    DWORD PTR [edx+ebx*4],eax
 15c:	83 c3 01             	add    ebx,0x1
 15f:	3b 5f 04             	cmp    ebx,DWORD PTR [edi+0x4]
 162:	7c cc                	jl     130 <__ZN16FFTransformerVecIfE7FFTInitEii+0x130>
 164:	b8 01 00 00 00       	mov    eax,0x1
 169:	83 c4 3c             	add    esp,0x3c
 16c:	5b                   	pop    ebx
 16d:	5e                   	pop    esi
 16e:	5f                   	pop    edi
 16f:	5d                   	pop    ebp
 170:	c2 08 00             	ret    0x8
 173:	c1 e0 02             	shl    eax,0x2
 176:	89 04 24             	mov    DWORD PTR [esp],eax
 179:	e8 00 00 00 00       	call   17e <__ZN16FFTransformerVecIfE7FFTInitEii+0x17e>
 17e:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
 181:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
 185:	83 64 24 20 f0       	and    DWORD PTR [esp+0x20],0xfffffff0
 18a:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
 18e:	89 47 14             	mov    DWORD PTR [edi+0x14],eax
 191:	83 e0 f0             	and    eax,0xfffffff0
 194:	83 7c 24 50 04       	cmp    DWORD PTR [esp+0x50],0x4
 199:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
 19d:	89 57 10             	mov    DWORD PTR [edi+0x10],edx
 1a0:	89 47 18             	mov    DWORD PTR [edi+0x18],eax
 1a3:	0f 8f f9 fe ff ff    	jg     a2 <__ZN16FFTransformerVecIfE7FFTInitEii+0xa2>
 1a9:	e9 6a ff ff ff       	jmp    118 <__ZN16FFTransformerVecIfE7FFTInitEii+0x118>
 1ae:	90                   	nop
 1af:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfEC2Eii:

00000000 <__ZN16FFTransformerVecIfEC2Eii>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   9:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
  10:	c9                   	leave  
  11:	e9 00 00 00 00       	jmp    16 <__ZN16FFTransformerVecIfEC2Eii+0x16>
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfEC1Eii:

00000000 <__ZN16FFTransformerVecIfEC1Eii>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   9:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
  10:	c9                   	leave  
  11:	e9 00 00 00 00       	jmp    16 <__ZN16FFTransformerVecIfEC1Eii+0x16>
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE:

00000000 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE>:
   0:	55                   	push   ebp
   1:	31 c0                	xor    eax,eax
   3:	89 e5                	mov    ebp,esp
   5:	57                   	push   edi
   6:	56                   	push   esi
   7:	89 ce                	mov    esi,ecx
   9:	53                   	push   ebx
   a:	83 ec 28             	sub    esp,0x28
   d:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  10:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  13:	85 d2                	test   edx,edx
  15:	0f 8e 53 01 00 00    	jle    16e <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x16e>
  1b:	8d 4a ff             	lea    ecx,[edx-0x1]
  1e:	85 d1                	test   ecx,edx
  20:	0f 85 48 01 00 00    	jne    16e <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x16e>
  26:	83 fa 01             	cmp    edx,0x1
  29:	0f 84 3a 01 00 00    	je     169 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x169>
  2f:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  33:	89 f1                	mov    ecx,esi
  35:	89 1c 24             	mov    DWORD PTR [esp],ebx
  38:	e8 00 00 00 00       	call   3d <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x3d>
  3d:	8b 7e 04             	mov    edi,DWORD PTR [esi+0x4]
  40:	c7 45 d8 1f 00 00 00 	mov    DWORD PTR [ebp-0x28],0x1f
  47:	0f bd c7             	bsr    eax,edi
  4a:	83 f0 1f             	xor    eax,0x1f
  4d:	83 ec 08             	sub    esp,0x8
  50:	29 45 d8             	sub    DWORD PTR [ebp-0x28],eax
  53:	85 ff                	test   edi,edi
  55:	7e 67                	jle    be <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0xbe>
  57:	8d 14 fd f8 ff ff ff 	lea    edx,[edi*8-0x8]
  5e:	89 d8                	mov    eax,ebx
  60:	83 e2 e0             	and    edx,0xffffffe0
  63:	0f 28 15 10 00 00 00 	movaps xmm2,XMMWORD PTR ds:0x10
  6a:	8d 54 13 20          	lea    edx,[ebx+edx*1+0x20]
  6e:	0f 28 25 20 00 00 00 	movaps xmm4,XMMWORD PTR ds:0x20
  75:	0f 28 08             	movaps xmm1,XMMWORD PTR [eax]
  78:	83 c0 20             	add    eax,0x20
  7b:	0f 28 d9             	movaps xmm3,xmm1
  7e:	0f 28 40 f0          	movaps xmm0,XMMWORD PTR [eax-0x10]
  82:	0f c6 d9 4e          	shufps xmm3,xmm1,0x4e
  86:	0f 57 ca             	xorps  xmm1,xmm2
  89:	0f 58 cb             	addps  xmm1,xmm3
  8c:	0f 28 d8             	movaps xmm3,xmm0
  8f:	0f c6 d8 4e          	shufps xmm3,xmm0,0x4e
  93:	0f 57 c2             	xorps  xmm0,xmm2
  96:	0f 58 c3             	addps  xmm0,xmm3
  99:	0f 28 d9             	movaps xmm3,xmm1
  9c:	0f c6 c0 b4          	shufps xmm0,xmm0,0xb4
  a0:	0f 57 c4             	xorps  xmm0,xmm4
  a3:	0f 58 d8             	addps  xmm3,xmm0
  a6:	0f 5c c8             	subps  xmm1,xmm0
  a9:	0f 29 58 e0          	movaps XMMWORD PTR [eax-0x20],xmm3
  ad:	0f 29 48 f0          	movaps XMMWORD PTR [eax-0x10],xmm1
  b1:	39 d0                	cmp    eax,edx
  b3:	75 c0                	jne    75 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x75>
  b5:	83 ff 02             	cmp    edi,0x2
  b8:	0f 84 ab 00 00 00    	je     169 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x169>
  be:	83 7d d8 02          	cmp    DWORD PTR [ebp-0x28],0x2
  c2:	0f 8e a1 00 00 00    	jle    169 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x169>
  c8:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
  cb:	0f 28 25 30 00 00 00 	movaps xmm4,XMMWORD PTR ds:0x30
  d2:	c7 45 dc 02 00 00 00 	mov    DWORD PTR [ebp-0x24],0x2
  d9:	c7 45 e4 04 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x4
  e0:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  e3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  e6:	31 f6                	xor    esi,esi
  e8:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
  ef:	8d 0c 00             	lea    ecx,[eax+eax*1]
  f2:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  f5:	01 d0                	add    eax,edx
  f7:	01 da                	add    edx,ebx
  f9:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 100:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 103:	39 f7                	cmp    edi,esi
 105:	0f 28 5c f0 e0       	movaps xmm3,XMMWORD PTR [eax+esi*8-0x20]
 10a:	89 f0                	mov    eax,esi
 10c:	0f 28 d3             	movaps xmm2,xmm3
 10f:	0f c6 d3 f5          	shufps xmm2,xmm3,0xf5
 113:	0f c6 db a0          	shufps xmm3,xmm3,0xa0
 117:	0f 57 d4             	xorps  xmm2,xmm4
 11a:	7e 31                	jle    14d <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x14d>
 11c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 120:	0f 28 04 c2          	movaps xmm0,XMMWORD PTR [edx+eax*8]
 124:	0f 28 c8             	movaps xmm1,xmm0
 127:	0f c6 c8 b1          	shufps xmm1,xmm0,0xb1
 12b:	0f 59 c3             	mulps  xmm0,xmm3
 12e:	0f 59 ca             	mulps  xmm1,xmm2
 131:	0f 58 c1             	addps  xmm0,xmm1
 134:	0f 28 0c c3          	movaps xmm1,XMMWORD PTR [ebx+eax*8]
 138:	0f 5c c8             	subps  xmm1,xmm0
 13b:	0f 58 04 c3          	addps  xmm0,XMMWORD PTR [ebx+eax*8]
 13f:	0f 29 04 c3          	movaps XMMWORD PTR [ebx+eax*8],xmm0
 143:	0f 29 0c c2          	movaps XMMWORD PTR [edx+eax*8],xmm1
 147:	01 c8                	add    eax,ecx
 149:	39 c7                	cmp    edi,eax
 14b:	7f d3                	jg     120 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x120>
 14d:	83 c6 02             	add    esi,0x2
 150:	3b 75 e4             	cmp    esi,DWORD PTR [ebp-0x1c]
 153:	7c ab                	jl     100 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x100>
 155:	83 45 dc 01          	add    DWORD PTR [ebp-0x24],0x1
 159:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 15c:	39 45 dc             	cmp    DWORD PTR [ebp-0x24],eax
 15f:	74 08                	je     169 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x169>
 161:	89 4d e4             	mov    DWORD PTR [ebp-0x1c],ecx
 164:	e9 7a ff ff ff       	jmp    e3 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0xe3>
 169:	b8 01 00 00 00       	mov    eax,0x1
 16e:	8d 65 f4             	lea    esp,[ebp-0xc]
 171:	5b                   	pop    ebx
 172:	5e                   	pop    esi
 173:	5f                   	pop    edi
 174:	5d                   	pop    ebp
 175:	c2 04 00             	ret    0x4
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop
