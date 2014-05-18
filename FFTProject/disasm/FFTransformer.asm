
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
  1b:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN16FFTransformerVecIfED1Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN16FFTransformerVecIfED1Ev+0x2a>
  2a:	83 c4 18             	add    esp,0x18
  2d:	5b                   	pop    ebx
  2e:	c3                   	ret    
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

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
  10:	90                   	nop
  11:	90                   	nop
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

Disassembly of section .text$_ZN16FFTransformerVecIfE13getPowerOfTwoEj:

00000000 <__ZN16FFTransformerVecIfE13getPowerOfTwoEj>:
   0:	0f bd 44 24 04       	bsr    eax,DWORD PTR [esp+0x4]
   5:	c2 04 00             	ret    0x4
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
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
  1d:	4a                   	dec    edx
  1e:	75 ea                	jne    a <__ZN16FFTransformerVecIfE15bitReverseInt32Ej+0xa>
  20:	0f c8                	bswap  eax
  22:	5b                   	pop    ebx
  23:	c2 04 00             	ret    0x4
  26:	90                   	nop
  27:	90                   	nop
  28:	90                   	nop
  29:	90                   	nop
  2a:	90                   	nop
  2b:	90                   	nop
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi:

00000000 <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi>:
   0:	55                   	push   ebp
   1:	57                   	push   edi
   2:	56                   	push   esi
   3:	53                   	push   ebx
   4:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
   8:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
   c:	85 db                	test   ebx,ebx
   e:	7e 3d                	jle    4d <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi+0x4d>
  10:	8b 71 10             	mov    esi,DWORD PTR [ecx+0x10]
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
  45:	40                   	inc    eax
  46:	83 c2 08             	add    edx,0x8
  49:	39 d8                	cmp    eax,ebx
  4b:	75 d3                	jne    20 <__ZN16FFTransformerVecIfE12arrayShuffleEP7ComplexIfEi+0x20>
  4d:	5b                   	pop    ebx
  4e:	5e                   	pop    esi
  4f:	5f                   	pop    edi
  50:	5d                   	pop    ebp
  51:	c2 08 00             	ret    0x8
  54:	90                   	nop
  55:	90                   	nop
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
   6:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
   d:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
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
   6:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
   d:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
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
  1b:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN16FFTransformerVecIfED2Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN16FFTransformerVecIfED2Ev+0x2a>
  2a:	83 c4 18             	add    esp,0x18
  2d:	5b                   	pop    ebx
  2e:	c3                   	ret    
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE7FFTInitEii:

00000000 <__ZN16FFTransformerVecIfE7FFTInitEii>:
   0:	55                   	push   ebp
   1:	57                   	push   edi
   2:	56                   	push   esi
   3:	53                   	push   ebx
   4:	83 ec 3c             	sub    esp,0x3c
   7:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
   b:	85 db                	test   ebx,ebx
   d:	7e 0b                	jle    1a <__ZN16FFTransformerVecIfE7FFTInitEii+0x1a>
   f:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  13:	48                   	dec    eax
  14:	85 44 24 50          	test   DWORD PTR [esp+0x50],eax
  18:	74 0c                	je     26 <__ZN16FFTransformerVecIfE7FFTInitEii+0x26>
  1a:	83 c4 3c             	add    esp,0x3c
  1d:	31 c0                	xor    eax,eax
  1f:	5b                   	pop    ebx
  20:	5e                   	pop    esi
  21:	5f                   	pop    edi
  22:	5d                   	pop    ebp
  23:	c2 08 00             	ret    0x8
  26:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  2a:	8b 54 24 54          	mov    edx,DWORD PTR [esp+0x54]
  2e:	89 ce                	mov    esi,ecx
  30:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  33:	31 c0                	xor    eax,eax
  35:	85 d2                	test   edx,edx
  37:	0f 9f c0             	setg   al
  3a:	81 7c 24 50 00 00 e0 	cmp    DWORD PTR [esp+0x50],0xfe00000
  41:	0f 
  42:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  45:	0f 87 12 01 00 00    	ja     15d <__ZN16FFTransformerVecIfE7FFTInitEii+0x15d>
  4b:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  4f:	c1 e0 03             	shl    eax,0x3
  52:	89 04 24             	mov    DWORD PTR [esp],eax
  55:	e8 00 00 00 00       	call   5a <__ZN16FFTransformerVecIfE7FFTInitEii+0x5a>
  5a:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
  5d:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  61:	c1 e0 02             	shl    eax,0x2
  64:	89 04 24             	mov    DWORD PTR [esp],eax
  67:	e8 00 00 00 00       	call   6c <__ZN16FFTransformerVecIfE7FFTInitEii+0x6c>
  6c:	83 7c 24 50 01       	cmp    DWORD PTR [esp+0x50],0x1
  71:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  75:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
  78:	0f 84 88 00 00 00    	je     106 <__ZN16FFTransformerVecIfE7FFTInitEii+0x106>
  7e:	db 44 24 54          	fild   DWORD PTR [esp+0x54]
  82:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
  85:	bf 01 00 00 00       	mov    edi,0x1
  8a:	dc 0d 00 00 00 00    	fmul   QWORD PTR ds:0x0
  90:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  94:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
  98:	90                   	nop
  99:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  a0:	89 7c 24 28          	mov    DWORD PTR [esp+0x28],edi
  a4:	31 ed                	xor    ebp,ebp
  a6:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  aa:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  ae:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  b2:	8d 1c f8             	lea    ebx,[eax+edi*8]
  b5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  b9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  c0:	89 6c 24 28          	mov    DWORD PTR [esp+0x28],ebp
  c4:	45                   	inc    ebp
  c5:	83 c3 08             	add    ebx,0x8
  c8:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  cc:	dc 4c 24 18          	fmul   QWORD PTR [esp+0x18]
  d0:	dc 74 24 10          	fdiv   QWORD PTR [esp+0x10]
  d4:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
  d8:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
  dc:	dd 14 24             	fst    QWORD PTR [esp]
  df:	d9 5c 24 0c          	fstp   DWORD PTR [esp+0xc]
  e3:	e8 00 00 00 00       	call   e8 <__ZN16FFTransformerVecIfE7FFTInitEii+0xe8>
  e8:	d9 5b f0             	fstp   DWORD PTR [ebx-0x10]
  eb:	d9 44 24 0c          	fld    DWORD PTR [esp+0xc]
  ef:	dd 1c 24             	fstp   QWORD PTR [esp]
  f2:	e8 00 00 00 00       	call   f7 <__ZN16FFTransformerVecIfE7FFTInitEii+0xf7>
  f7:	d9 5b f4             	fstp   DWORD PTR [ebx-0xc]
  fa:	39 fd                	cmp    ebp,edi
  fc:	75 c2                	jne    c0 <__ZN16FFTransformerVecIfE7FFTInitEii+0xc0>
  fe:	01 ff                	add    edi,edi
 100:	39 7c 24 50          	cmp    DWORD PTR [esp+0x50],edi
 104:	7f 9a                	jg     a0 <__ZN16FFTransformerVecIfE7FFTInitEii+0xa0>
 106:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
 109:	31 ed                	xor    ebp,ebp
 10b:	f3 0f bd c8          	lzcnt  ecx,eax
 10f:	41                   	inc    ecx
 110:	85 c0                	test   eax,eax
 112:	7e 3a                	jle    14e <__ZN16FFTransformerVecIfE7FFTInitEii+0x14e>
 114:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 11a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
 120:	89 e8                	mov    eax,ebp
 122:	ba 04 00 00 00       	mov    edx,0x4
 127:	0f b6 d8             	movzx  ebx,al
 12a:	31 d8                	xor    eax,ebx
 12c:	89 c7                	mov    edi,eax
 12e:	0f b6 83 00 00 00 00 	movzx  eax,BYTE PTR [ebx+0x0]
 135:	09 f8                	or     eax,edi
 137:	c1 c8 08             	ror    eax,0x8
 13a:	4a                   	dec    edx
 13b:	75 ea                	jne    127 <__ZN16FFTransformerVecIfE7FFTInitEii+0x127>
 13d:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
 141:	0f c8                	bswap  eax
 143:	d3 e8                	shr    eax,cl
 145:	89 04 aa             	mov    DWORD PTR [edx+ebp*4],eax
 148:	45                   	inc    ebp
 149:	3b 6e 04             	cmp    ebp,DWORD PTR [esi+0x4]
 14c:	7c d2                	jl     120 <__ZN16FFTransformerVecIfE7FFTInitEii+0x120>
 14e:	83 c4 3c             	add    esp,0x3c
 151:	b8 01 00 00 00       	mov    eax,0x1
 156:	5b                   	pop    ebx
 157:	5e                   	pop    esi
 158:	5f                   	pop    edi
 159:	5d                   	pop    ebp
 15a:	c2 08 00             	ret    0x8
 15d:	c7 04 24 ff ff ff ff 	mov    DWORD PTR [esp],0xffffffff
 164:	e8 00 00 00 00       	call   169 <__ZN16FFTransformerVecIfE7FFTInitEii+0x169>
 169:	81 7c 24 50 00 00 c0 	cmp    DWORD PTR [esp+0x50],0x1fc00000
 170:	1f 
 171:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
 174:	0f 86 e3 fe ff ff    	jbe    5d <__ZN16FFTransformerVecIfE7FFTInitEii+0x5d>
 17a:	c7 04 24 ff ff ff ff 	mov    DWORD PTR [esp],0xffffffff
 181:	e8 00 00 00 00       	call   186 <__ZN16FFTransformerVecIfE7FFTInitEii+0x186>
 186:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
 18a:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
 18d:	e9 ec fe ff ff       	jmp    7e <__ZN16FFTransformerVecIfE7FFTInitEii+0x7e>
 192:	90                   	nop
 193:	90                   	nop
 194:	90                   	nop
 195:	90                   	nop
 196:	90                   	nop
 197:	90                   	nop
 198:	90                   	nop
 199:	90                   	nop
 19a:	90                   	nop
 19b:	90                   	nop
 19c:	90                   	nop
 19d:	90                   	nop
 19e:	90                   	nop
 19f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfEC2Eii:

00000000 <__ZN16FFTransformerVecIfEC2Eii>:
   0:	55                   	push   ebp
   1:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   7:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
   e:	89 e5                	mov    ebp,esp
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
   1:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   7:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
   e:	89 e5                	mov    ebp,esp
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
   1:	89 e5                	mov    ebp,esp
   3:	57                   	push   edi
   4:	56                   	push   esi
   5:	53                   	push   ebx
   6:	89 cb                	mov    ebx,ecx
   8:	83 ec 2c             	sub    esp,0x2c
   b:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
   e:	85 d2                	test   edx,edx
  10:	0f 8e 9f 01 00 00    	jle    1b5 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1b5>
  16:	8d 4a ff             	lea    ecx,[edx-0x1]
  19:	31 c0                	xor    eax,eax
  1b:	85 d1                	test   ecx,edx
  1d:	0f 85 88 01 00 00    	jne    1ab <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1ab>
  23:	83 fa 01             	cmp    edx,0x1
  26:	0f 84 7a 01 00 00    	je     1a6 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1a6>
  2c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  2f:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  33:	89 d9                	mov    ecx,ebx
  35:	89 04 24             	mov    DWORD PTR [esp],eax
  38:	e8 00 00 00 00       	call   3d <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x3d>
  3d:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
  40:	83 ec 08             	sub    esp,0x8
  43:	0f bd c7             	bsr    eax,edi
  46:	85 ff                	test   edi,edi
  48:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4b:	7e 7d                	jle    ca <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0xca>
  4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50:	8d 14 fd f8 ff ff ff 	lea    edx,[edi*8-0x8]
  57:	0f 28 15 10 00 00 00 	movaps xmm2,XMMWORD PTR ds:0x10
  5e:	83 e2 e0             	and    edx,0xffffffe0
  61:	0f 28 25 20 00 00 00 	movaps xmm4,XMMWORD PTR ds:0x20
  68:	8d 54 10 20          	lea    edx,[eax+edx*1+0x20]
  6c:	eb 12                	jmp    80 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x80>
  6e:	90                   	nop
  6f:	90                   	nop
  70:	90                   	nop
  71:	90                   	nop
  72:	90                   	nop
  73:	90                   	nop
  74:	90                   	nop
  75:	90                   	nop
  76:	90                   	nop
  77:	90                   	nop
  78:	90                   	nop
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop
  7c:	90                   	nop
  7d:	90                   	nop
  7e:	90                   	nop
  7f:	90                   	nop
  80:	0f 28 00             	movaps xmm0,XMMWORD PTR [eax]
  83:	0f 28 08             	movaps xmm1,XMMWORD PTR [eax]
  86:	83 c0 20             	add    eax,0x20
  89:	0f 28 58 f0          	movaps xmm3,XMMWORD PTR [eax-0x10]
  8d:	0f c6 c0 4e          	shufps xmm0,xmm0,0x4e
  91:	0f 57 ca             	xorps  xmm1,xmm2
  94:	0f c6 db 4e          	shufps xmm3,xmm3,0x4e
  98:	0f 58 c8             	addps  xmm1,xmm0
  9b:	0f 28 40 f0          	movaps xmm0,XMMWORD PTR [eax-0x10]
  9f:	0f 57 c2             	xorps  xmm0,xmm2
  a2:	0f 58 c3             	addps  xmm0,xmm3
  a5:	0f 28 d9             	movaps xmm3,xmm1
  a8:	0f c6 c0 b4          	shufps xmm0,xmm0,0xb4
  ac:	0f 57 c4             	xorps  xmm0,xmm4
  af:	0f 58 d8             	addps  xmm3,xmm0
  b2:	0f 5c c8             	subps  xmm1,xmm0
  b5:	0f 29 58 e0          	movaps XMMWORD PTR [eax-0x20],xmm3
  b9:	0f 29 48 f0          	movaps XMMWORD PTR [eax-0x10],xmm1
  bd:	39 d0                	cmp    eax,edx
  bf:	75 bf                	jne    80 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x80>
  c1:	83 ff 02             	cmp    edi,0x2
  c4:	0f 84 dc 00 00 00    	je     1a6 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1a6>
  ca:	83 7d d4 02          	cmp    DWORD PTR [ebp-0x2c],0x2
  ce:	0f 8e d2 00 00 00    	jle    1a6 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1a6>
  d4:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  d7:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [ebp-0x28],0x2
  de:	be 04 00 00 00       	mov    esi,0x4
  e3:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  e6:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  e9:	89 f3                	mov    ebx,esi
  eb:	8d 0c 36             	lea    ecx,[esi+esi*1]
  ee:	c1 e3 04             	shl    ebx,0x4
  f1:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  f8:	8d 04 f0             	lea    eax,[eax+esi*8]
  fb:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 101:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 104:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 107:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10a:	d9 40 f8             	fld    DWORD PTR [eax-0x8]
 10d:	39 d7                	cmp    edi,edx
 10f:	d9 40 fc             	fld    DWORD PTR [eax-0x4]
 112:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 115:	7e 4e                	jle    165 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x165>
 117:	89 f6                	mov    esi,esi
 119:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 120:	d9 04 f0             	fld    DWORD PTR [eax+esi*8]
 123:	01 ca                	add    edx,ecx
 125:	d9 44 f0 04          	fld    DWORD PTR [eax+esi*8+0x4]
 129:	d9 c1                	fld    st(1)
 12b:	d8 cc                	fmul   st,st(4)
 12d:	d9 c1                	fld    st(1)
 12f:	d8 cc                	fmul   st,st(4)
 131:	de e9                	fsubrp st(1),st
 133:	d9 ca                	fxch   st(2)
 135:	d8 cb                	fmul   st,st(3)
 137:	d9 c9                	fxch   st(1)
 139:	d8 cc                	fmul   st,st(4)
 13b:	de c1                	faddp  st(1),st
 13d:	d9 c1                	fld    st(1)
 13f:	d8 28                	fsubr  DWORD PTR [eax]
 141:	d9 1c f0             	fstp   DWORD PTR [eax+esi*8]
 144:	d9 c0                	fld    st(0)
 146:	d8 68 04             	fsubr  DWORD PTR [eax+0x4]
 149:	d9 5c f0 04          	fstp   DWORD PTR [eax+esi*8+0x4]
 14d:	d9 c9                	fxch   st(1)
 14f:	d8 00                	fadd   DWORD PTR [eax]
 151:	d9 18                	fstp   DWORD PTR [eax]
 153:	d8 40 04             	fadd   DWORD PTR [eax+0x4]
 156:	d9 58 04             	fstp   DWORD PTR [eax+0x4]
 159:	01 d8                	add    eax,ebx
 15b:	39 d7                	cmp    edi,edx
 15d:	7f c1                	jg     120 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x120>
 15f:	df c0                	ffreep st(0)
 161:	df c0                	ffreep st(0)
 163:	eb 1b                	jmp    180 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x180>
 165:	df c0                	ffreep st(0)
 167:	df c0                	ffreep st(0)
 169:	eb 15                	jmp    180 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x180>
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop
 170:	90                   	nop
 171:	90                   	nop
 172:	90                   	nop
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop
 180:	ff 45 e4             	inc    DWORD PTR [ebp-0x1c]
 183:	83 45 dc 08          	add    DWORD PTR [ebp-0x24],0x8
 187:	83 45 e0 08          	add    DWORD PTR [ebp-0x20],0x8
 18b:	39 75 e4             	cmp    DWORD PTR [ebp-0x1c],esi
 18e:	0f 8c 70 ff ff ff    	jl     104 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x104>
 194:	ff 45 d8             	inc    DWORD PTR [ebp-0x28]
 197:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 19a:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 19d:	74 07                	je     1a6 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1a6>
 19f:	89 ce                	mov    esi,ecx
 1a1:	e9 40 ff ff ff       	jmp    e6 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0xe6>
 1a6:	b8 01 00 00 00       	mov    eax,0x1
 1ab:	8d 65 f4             	lea    esp,[ebp-0xc]
 1ae:	5b                   	pop    ebx
 1af:	5e                   	pop    esi
 1b0:	5f                   	pop    edi
 1b1:	5d                   	pop    ebp
 1b2:	c2 04 00             	ret    0x4
 1b5:	8d 65 f4             	lea    esp,[ebp-0xc]
 1b8:	31 c0                	xor    eax,eax
 1ba:	5b                   	pop    ebx
 1bb:	5e                   	pop    esi
 1bc:	5f                   	pop    edi
 1bd:	5d                   	pop    ebp
 1be:	c2 04 00             	ret    0x4
 1c1:	90                   	nop
 1c2:	90                   	nop
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop
 1d0:	90                   	nop
 1d1:	90                   	nop
 1d2:	90                   	nop
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop
