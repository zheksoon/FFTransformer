
obj/release/FFTransformerRecursive.o:     file format pe-i386


Disassembly of section .text:

00000000 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	56                   	push   esi
   4:	53                   	push   ebx
   5:	83 ec 50             	sub    esp,0x50
   8:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
   b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
  12:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
  19:	8d 45 c4             	lea    eax,[ebp-0x3c]
  1c:	89 04 24             	mov    DWORD PTR [esp],eax
  1f:	e8 00 00 00 00       	call   24 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x24>
  24:	8b 33                	mov    esi,DWORD PTR [ebx]
  26:	e8 00 00 00 00       	call   2b <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x2b>
  2b:	83 f8 01             	cmp    eax,0x1
  2e:	74 36                	je     66 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x66>
  30:	83 f8 01             	cmp    eax,0x1
  33:	72 51                	jb     86 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x86>
  35:	83 f8 02             	cmp    eax,0x2
  38:	74 09                	je     43 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x43>
  3a:	0f 0b                	ud2    
  3c:	e8 00 00 00 00       	call   41 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x41>
  41:	eb e8                	jmp    2b <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x2b>
  43:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  46:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4a:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  4d:	8d 04 c2             	lea    eax,[edx+eax*8]
  50:	89 04 24             	mov    DWORD PTR [esp],eax
  53:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
  5a:	89 f1                	mov    ecx,esi
  5c:	e8 00 00 00 00       	call   61 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x61>
  61:	83 ec 08             	sub    esp,0x8
  64:	eb d6                	jmp    3c <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x3c>
  66:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  69:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  6d:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  70:	89 04 24             	mov    DWORD PTR [esp],eax
  73:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
  7a:	89 f1                	mov    ecx,esi
  7c:	e8 00 00 00 00       	call   81 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x81>
  81:	83 ec 08             	sub    esp,0x8
  84:	eb b6                	jmp    3c <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x3c>
  86:	e8 00 00 00 00       	call   8b <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x8b>
  8b:	8d 45 c4             	lea    eax,[ebp-0x3c]
  8e:	89 04 24             	mov    DWORD PTR [esp],eax
  91:	e8 00 00 00 00       	call   96 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi._omp_fn.0+0x96>
  96:	8d 65 f8             	lea    esp,[ebp-0x8]
  99:	5b                   	pop    ebx
  9a:	5e                   	pop    esi
  9b:	5d                   	pop    ebp
  9c:	c3                   	ret    
  9d:	90                   	nop
  9e:	90                   	nop
  9f:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfED1Ev:

00000000 <__ZN22FFTransformerRecursiveIfED1Ev>:
   0:	53                   	push   ebx
   1:	83 ec 18             	sub    esp,0x18
   4:	89 cb                	mov    ebx,ecx
   6:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   c:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
   f:	85 c0                	test   eax,eax
  11:	74 08                	je     1b <__ZN22FFTransformerRecursiveIfED1Ev+0x1b>
  13:	89 04 24             	mov    DWORD PTR [esp],eax
  16:	e8 00 00 00 00       	call   1b <__ZN22FFTransformerRecursiveIfED1Ev+0x1b>
  1b:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN22FFTransformerRecursiveIfED1Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN22FFTransformerRecursiveIfED1Ev+0x2a>
  2a:	83 c4 18             	add    esp,0x18
  2d:	5b                   	pop    ebx
  2e:	c3                   	ret    
  2f:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfED0Ev:

00000000 <__ZN22FFTransformerRecursiveIfED0Ev>:
   0:	53                   	push   ebx
   1:	83 ec 18             	sub    esp,0x18
   4:	89 cb                	mov    ebx,ecx
   6:	e8 00 00 00 00       	call   b <__ZN22FFTransformerRecursiveIfED0Ev+0xb>
   b:	89 1c 24             	mov    DWORD PTR [esp],ebx
   e:	e8 00 00 00 00       	call   13 <__ZN22FFTransformerRecursiveIfED0Ev+0x13>
  13:	83 c4 18             	add    esp,0x18
  16:	5b                   	pop    ebx
  17:	c3                   	ret    

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE12isPowerOfTwoEj:

00000000 <__ZN22FFTransformerRecursiveIfE12isPowerOfTwoEj>:
   0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
   4:	8d 50 ff             	lea    edx,[eax-0x1]
   7:	85 c2                	test   edx,eax
   9:	0f 94 c0             	sete   al
   c:	c2 04 00             	ret    0x4
   f:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE13getPowerOfTwoEj:

00000000 <__ZN22FFTransformerRecursiveIfE13getPowerOfTwoEj>:
   0:	0f bd 54 24 04       	bsr    edx,DWORD PTR [esp+0x4]
   5:	83 f2 1f             	xor    edx,0x1f
   8:	b8 1f 00 00 00       	mov    eax,0x1f
   d:	29 d0                	sub    eax,edx
   f:	c2 04 00             	ret    0x4
  12:	90                   	nop
  13:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE15bitReverseInt32Ej:

00000000 <__ZN22FFTransformerRecursiveIfE15bitReverseInt32Ej>:
   0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
   4:	ba 04 00 00 00       	mov    edx,0x4
   9:	0f b6 c8             	movzx  ecx,al
   c:	31 c8                	xor    eax,ecx
   e:	0f b6 89 00 00 00 00 	movzx  ecx,BYTE PTR [ecx+0x0]
  15:	09 c8                	or     eax,ecx
  17:	c1 c8 08             	ror    eax,0x8
  1a:	4a                   	dec    edx
  1b:	75 ec                	jne    9 <__ZN22FFTransformerRecursiveIfE15bitReverseInt32Ej+0x9>
  1d:	0f c8                	bswap  eax
  1f:	c2 04 00             	ret    0x4
  22:	90                   	nop
  23:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE12arrayShuffleEP7ComplexIfEi:

00000000 <__ZN22FFTransformerRecursiveIfE12arrayShuffleEP7ComplexIfEi>:
   0:	55                   	push   ebp
   1:	57                   	push   edi
   2:	56                   	push   esi
   3:	53                   	push   ebx
   4:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
   8:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
   c:	85 f6                	test   esi,esi
   e:	7e 38                	jle    48 <__ZN22FFTransformerRecursiveIfE12arrayShuffleEP7ComplexIfEi+0x48>
  10:	89 fa                	mov    edx,edi
  12:	b8 00 00 00 00       	mov    eax,0x0
  17:	89 f5                	mov    ebp,esi
  19:	8b 59 18             	mov    ebx,DWORD PTR [ecx+0x18]
  1c:	8b 1c 83             	mov    ebx,DWORD PTR [ebx+eax*4]
  1f:	39 c3                	cmp    ebx,eax
  21:	7e 1d                	jle    40 <__ZN22FFTransformerRecursiveIfE12arrayShuffleEP7ComplexIfEi+0x40>
  23:	d9 02                	fld    DWORD PTR [edx]
  25:	d9 42 04             	fld    DWORD PTR [edx+0x4]
  28:	d9 c9                	fxch   st(1)
  2a:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
  2e:	8d 1c df             	lea    ebx,[edi+ebx*8]
  31:	8b 33                	mov    esi,DWORD PTR [ebx]
  33:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
  36:	89 32                	mov    DWORD PTR [edx],esi
  38:	89 7a 04             	mov    DWORD PTR [edx+0x4],edi
  3b:	d9 1b                	fstp   DWORD PTR [ebx]
  3d:	d9 5b 04             	fstp   DWORD PTR [ebx+0x4]
  40:	40                   	inc    eax
  41:	83 c2 08             	add    edx,0x8
  44:	39 e8                	cmp    eax,ebp
  46:	75 d1                	jne    19 <__ZN22FFTransformerRecursiveIfE12arrayShuffleEP7ComplexIfEi+0x19>
  48:	5b                   	pop    ebx
  49:	5e                   	pop    esi
  4a:	5f                   	pop    edi
  4b:	5d                   	pop    ebp
  4c:	c2 08 00             	ret    0x8
  4f:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfEC2Ev:

00000000 <__ZN22FFTransformerRecursiveIfEC2Ev>:
   0:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   6:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
   d:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
  14:	c3                   	ret    
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfEC1Ev:

00000000 <__ZN22FFTransformerRecursiveIfEC1Ev>:
   0:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   6:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
   d:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
  14:	c3                   	ret    
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfED2Ev:

00000000 <__ZN22FFTransformerRecursiveIfED2Ev>:
   0:	53                   	push   ebx
   1:	83 ec 18             	sub    esp,0x18
   4:	89 cb                	mov    ebx,ecx
   6:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   c:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
   f:	85 c0                	test   eax,eax
  11:	74 08                	je     1b <__ZN22FFTransformerRecursiveIfED2Ev+0x1b>
  13:	89 04 24             	mov    DWORD PTR [esp],eax
  16:	e8 00 00 00 00       	call   1b <__ZN22FFTransformerRecursiveIfED2Ev+0x1b>
  1b:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN22FFTransformerRecursiveIfED2Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN22FFTransformerRecursiveIfED2Ev+0x2a>
  2a:	83 c4 18             	add    esp,0x18
  2d:	5b                   	pop    ebx
  2e:	c3                   	ret    
  2f:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE7FFTInitEii:

00000000 <__ZN22FFTransformerRecursiveIfE7FFTInitEii>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	57                   	push   edi
   4:	56                   	push   esi
   5:	53                   	push   ebx
   6:	83 ec 3c             	sub    esp,0x3c
   9:	b8 00 00 00 00       	mov    eax,0x0
   e:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
  12:	0f 8e 57 01 00 00    	jle    16f <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x16f>
  18:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1b:	48                   	dec    eax
  1c:	85 45 08             	test   DWORD PTR [ebp+0x8],eax
  1f:	0f 84 cd 00 00 00    	je     f2 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xf2>
  25:	b8 00 00 00 00       	mov    eax,0x0
  2a:	e9 40 01 00 00       	jmp    16f <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x16f>
  2f:	c7 45 d8 04 00 00 00 	mov    DWORD PTR [ebp-0x28],0x4
  36:	eb 49                	jmp    81 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x81>
  38:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  3b:	db 45 e0             	fild   DWORD PTR [ebp-0x20]
  3e:	dc 4d d0             	fmul   QWORD PTR [ebp-0x30]
  41:	dc 75 c8             	fdiv   QWORD PTR [ebp-0x38]
  44:	d9 5d e4             	fstp   DWORD PTR [ebp-0x1c]
  47:	d9 45 e4             	fld    DWORD PTR [ebp-0x1c]
  4a:	d9 55 dc             	fst    DWORD PTR [ebp-0x24]
  4d:	dd 1c 24             	fstp   QWORD PTR [esp]
  50:	e8 00 00 00 00       	call   55 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x55>
  55:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  58:	d9 1c 30             	fstp   DWORD PTR [eax+esi*1]
  5b:	d9 45 dc             	fld    DWORD PTR [ebp-0x24]
  5e:	dd 1c 24             	fstp   QWORD PTR [esp]
  61:	e8 00 00 00 00       	call   66 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x66>
  66:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  69:	d9 5c 30 04          	fstp   DWORD PTR [eax+esi*1+0x4]
  6d:	43                   	inc    ebx
  6e:	83 c6 08             	add    esi,0x8
  71:	3b 5d d8             	cmp    ebx,DWORD PTR [ebp-0x28]
  74:	75 c2                	jne    38 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x38>
  76:	d1 65 d8             	shl    DWORD PTR [ebp-0x28],1
  79:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  7c:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
  7f:	7e 27                	jle    a8 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xa8>
  81:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  84:	85 c0                	test   eax,eax
  86:	7e ee                	jle    76 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x76>
  88:	db 45 0c             	fild   DWORD PTR [ebp+0xc]
  8b:	dc 0d 00 00 00 00    	fmul   QWORD PTR ds:0x0
  91:	dd 5d d0             	fstp   QWORD PTR [ebp-0x30]
  94:	8d 34 c5 e0 ff ff ff 	lea    esi,[eax*8-0x20]
  9b:	bb 00 00 00 00       	mov    ebx,0x0
  a0:	db 45 d8             	fild   DWORD PTR [ebp-0x28]
  a3:	dd 5d c8             	fstp   QWORD PTR [ebp-0x38]
  a6:	eb 90                	jmp    38 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x38>
  a8:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  ab:	0f bd c2             	bsr    eax,edx
  ae:	83 f0 1f             	xor    eax,0x1f
  b1:	40                   	inc    eax
  b2:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  b5:	85 d2                	test   edx,edx
  b7:	7e 28                	jle    e1 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xe1>
  b9:	bb 00 00 00 00       	mov    ebx,0x0
  be:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
  c1:	8d 34 98             	lea    esi,[eax+ebx*4]
  c4:	89 1c 24             	mov    DWORD PTR [esp],ebx
  c7:	89 f9                	mov    ecx,edi
  c9:	e8 00 00 00 00       	call   ce <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xce>
  ce:	83 ec 04             	sub    esp,0x4
  d1:	0f b6 4d dc          	movzx  ecx,BYTE PTR [ebp-0x24]
  d5:	d3 e8                	shr    eax,cl
  d7:	89 06                	mov    DWORD PTR [esi],eax
  d9:	43                   	inc    ebx
  da:	39 5f 04             	cmp    DWORD PTR [edi+0x4],ebx
  dd:	7f df                	jg     be <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xbe>
  df:	eb 0a                	jmp    eb <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xeb>
  e1:	b8 01 00 00 00       	mov    eax,0x1
  e6:	e9 84 00 00 00       	jmp    16f <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x16f>
  eb:	b8 01 00 00 00       	mov    eax,0x1
  f0:	eb 7d                	jmp    16f <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x16f>
  f2:	89 cf                	mov    edi,ecx
  f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  f7:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  fa:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
  fe:	0f 9f c0             	setg   al
 101:	0f b6 c0             	movzx  eax,al
 104:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
 107:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10a:	83 c0 02             	add    eax,0x2
 10d:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 114:	3d 01 00 e0 0f       	cmp    eax,0xfe00001
 119:	b8 ff ff ff ff       	mov    eax,0xffffffff
 11e:	0f 42 c2             	cmovb  eax,edx
 121:	89 04 24             	mov    DWORD PTR [esp],eax
 124:	e8 00 00 00 00       	call   129 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x129>
 129:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
 12c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 12f:	83 c0 04             	add    eax,0x4
 132:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 139:	3d 00 00 c0 1f       	cmp    eax,0x1fc00000
 13e:	b8 ff ff ff ff       	mov    eax,0xffffffff
 143:	0f 46 c2             	cmovbe eax,edx
 146:	89 04 24             	mov    DWORD PTR [esp],eax
 149:	e8 00 00 00 00       	call   14e <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x14e>
 14e:	89 47 14             	mov    DWORD PTR [edi+0x14],eax
 151:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
 154:	83 e2 f0             	and    edx,0xfffffff0
 157:	89 57 10             	mov    DWORD PTR [edi+0x10],edx
 15a:	83 e0 f0             	and    eax,0xfffffff0
 15d:	89 47 18             	mov    DWORD PTR [edi+0x18],eax
 160:	83 7d 08 04          	cmp    DWORD PTR [ebp+0x8],0x4
 164:	0f 8f c5 fe ff ff    	jg     2f <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0x2f>
 16a:	e9 39 ff ff ff       	jmp    a8 <__ZN22FFTransformerRecursiveIfE7FFTInitEii+0xa8>
 16f:	8d 65 f4             	lea    esp,[ebp-0xc]
 172:	5b                   	pop    ebx
 173:	5e                   	pop    esi
 174:	5f                   	pop    edi
 175:	5d                   	pop    ebp
 176:	c2 08 00             	ret    0x8
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfEC2Eii:

00000000 <__ZN22FFTransformerRecursiveIfEC2Eii>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 18             	sub    esp,0x18
   6:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   c:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
  13:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  16:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  1a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1d:	89 04 24             	mov    DWORD PTR [esp],eax
  20:	e8 00 00 00 00       	call   25 <__ZN22FFTransformerRecursiveIfEC2Eii+0x25>
  25:	83 ec 08             	sub    esp,0x8
  28:	c9                   	leave  
  29:	c2 08 00             	ret    0x8

Disassembly of section .text$_ZN22FFTransformerRecursiveIfEC1Eii:

00000000 <__ZN22FFTransformerRecursiveIfEC1Eii>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 18             	sub    esp,0x18
   6:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   c:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
  13:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  16:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  1a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1d:	89 04 24             	mov    DWORD PTR [esp],eax
  20:	e8 00 00 00 00       	call   25 <__ZN22FFTransformerRecursiveIfEC1Eii+0x25>
  25:	83 ec 08             	sub    esp,0x8
  28:	c9                   	leave  
  29:	c2 08 00             	ret    0x8

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi:

00000000 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi>:
   0:	55                   	push   ebp
   1:	57                   	push   edi
   2:	56                   	push   esi
   3:	53                   	push   ebx
   4:	83 ec 24             	sub    esp,0x24
   7:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
   b:	8b 6c 24 3c          	mov    ebp,DWORD PTR [esp+0x3c]
   f:	b8 00 00 00 00       	mov    eax,0x0
  14:	85 ed                	test   ebp,ebp
  16:	0f 8e 30 02 00 00    	jle    24c <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x24c>
  1c:	8d 45 ff             	lea    eax,[ebp-0x1]
  1f:	85 e8                	test   eax,ebp
  21:	0f 85 04 02 00 00    	jne    22b <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x22b>
  27:	83 fd 01             	cmp    ebp,0x1
  2a:	0f 84 02 02 00 00    	je     232 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x232>
  30:	0f bd c5             	bsr    eax,ebp
  33:	83 f0 1f             	xor    eax,0x1f
  36:	ba 1f 00 00 00       	mov    edx,0x1f
  3b:	29 c2                	sub    edx,eax
  3d:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  41:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  45:	ba 00 00 00 00       	mov    edx,0x0
  4a:	0f 28 05 10 00 00 00 	movaps xmm0,XMMWORD PTR ds:0x10
  51:	0f 28 1d 20 00 00 00 	movaps xmm3,XMMWORD PTR ds:0x20
  58:	0f 28 35 30 00 00 00 	movaps xmm6,XMMWORD PTR ds:0x30
  5f:	0f 28 28             	movaps xmm5,XMMWORD PTR [eax]
  62:	0f 28 48 10          	movaps xmm1,XMMWORD PTR [eax+0x10]
  66:	0f 28 78 20          	movaps xmm7,XMMWORD PTR [eax+0x20]
  6a:	0f 28 50 30          	movaps xmm2,XMMWORD PTR [eax+0x30]
  6e:	0f 28 e5             	movaps xmm4,xmm5
  71:	0f c6 e5 4e          	shufps xmm4,xmm5,0x4e
  75:	0f 57 e8             	xorps  xmm5,xmm0
  78:	0f 58 e5             	addps  xmm4,xmm5
  7b:	0f 28 e9             	movaps xmm5,xmm1
  7e:	0f c6 e9 4e          	shufps xmm5,xmm1,0x4e
  82:	0f 57 c8             	xorps  xmm1,xmm0
  85:	0f 58 cd             	addps  xmm1,xmm5
  88:	0f c6 c9 b4          	shufps xmm1,xmm1,0xb4
  8c:	0f 57 cb             	xorps  xmm1,xmm3
  8f:	0f 28 ec             	movaps xmm5,xmm4
  92:	0f 58 e9             	addps  xmm5,xmm1
  95:	0f 5c e1             	subps  xmm4,xmm1
  98:	0f 28 cf             	movaps xmm1,xmm7
  9b:	0f c6 cf 4e          	shufps xmm1,xmm7,0x4e
  9f:	0f 57 f8             	xorps  xmm7,xmm0
  a2:	0f 58 cf             	addps  xmm1,xmm7
  a5:	0f 28 fa             	movaps xmm7,xmm2
  a8:	0f c6 fa 4e          	shufps xmm7,xmm2,0x4e
  ac:	0f 57 d0             	xorps  xmm2,xmm0
  af:	0f 58 d7             	addps  xmm2,xmm7
  b2:	0f c6 d2 b4          	shufps xmm2,xmm2,0xb4
  b6:	0f 57 d3             	xorps  xmm2,xmm3
  b9:	0f 28 fa             	movaps xmm7,xmm2
  bc:	0f 28 d1             	movaps xmm2,xmm1
  bf:	0f 58 d7             	addps  xmm2,xmm7
  c2:	0f 5c cf             	subps  xmm1,xmm7
  c5:	0f 28 fa             	movaps xmm7,xmm2
  c8:	0f c6 fa b4          	shufps xmm7,xmm2,0xb4
  cc:	0f 57 fb             	xorps  xmm7,xmm3
  cf:	0f 58 d7             	addps  xmm2,xmm7
  d2:	0f 59 d6             	mulps  xmm2,xmm6
  d5:	0f 28 f9             	movaps xmm7,xmm1
  d8:	0f c6 f9 b4          	shufps xmm7,xmm1,0xb4
  dc:	0f 57 3d 40 00 00 00 	xorps  xmm7,XMMWORD PTR ds:0x40
  e3:	0f 58 cf             	addps  xmm1,xmm7
  e6:	0f 59 0d 50 00 00 00 	mulps  xmm1,XMMWORD PTR ds:0x50
  ed:	0f c6 c9 e1          	shufps xmm1,xmm1,0xe1
  f1:	0f 28 fd             	movaps xmm7,xmm5
  f4:	0f 5c fa             	subps  xmm7,xmm2
  f7:	0f 58 ea             	addps  xmm5,xmm2
  fa:	0f 28 d4             	movaps xmm2,xmm4
  fd:	0f 5c d1             	subps  xmm2,xmm1
 100:	0f 58 e1             	addps  xmm4,xmm1
 103:	0f 29 28             	movaps XMMWORD PTR [eax],xmm5
 106:	0f 29 60 10          	movaps XMMWORD PTR [eax+0x10],xmm4
 10a:	0f 29 78 20          	movaps XMMWORD PTR [eax+0x20],xmm7
 10e:	0f 29 50 30          	movaps XMMWORD PTR [eax+0x30],xmm2
 112:	83 c2 08             	add    edx,0x8
 115:	83 c0 40             	add    eax,0x40
 118:	39 d5                	cmp    ebp,edx
 11a:	0f 8f 3f ff ff ff    	jg     5f <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x5f>
 120:	83 fd 02             	cmp    ebp,0x2
 123:	0f 84 10 01 00 00    	je     239 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x239>
 129:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
 12e:	0f 8e 0c 01 00 00    	jle    240 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x240>
 134:	c7 44 24 10 03 00 00 	mov    DWORD PTR [esp+0x10],0x3
 13b:	00 
 13c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [esp+0x8],0x8
 143:	00 
 144:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 148:	8d 1c 00             	lea    ebx,[eax+eax*1]
 14b:	85 c0                	test   eax,eax
 14d:	0f 8e c1 00 00 00    	jle    214 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x214>
 153:	89 c2                	mov    edx,eax
 155:	8d 04 c5 e0 ff ff ff 	lea    eax,[eax*8-0x20]
 15c:	89 04 24             	mov    DWORD PTR [esp],eax
 15f:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 163:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 167:	8d 34 dd 00 00 00 00 	lea    esi,[ebx*8+0x0]
 16e:	bf 00 00 00 00       	mov    edi,0x0
 173:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 177:	8b 04 24             	mov    eax,DWORD PTR [esp]
 17a:	03 41 10             	add    eax,DWORD PTR [ecx+0x10]
 17d:	f3 0f 16 10          	movshdup xmm2,XMMWORD PTR [eax]
 181:	0f 57 15 60 00 00 00 	xorps  xmm2,XMMWORD PTR ds:0x60
 188:	f3 0f 12 18          	movsldup xmm3,XMMWORD PTR [eax]
 18c:	0f 28 68 10          	movaps xmm5,XMMWORD PTR [eax+0x10]
 190:	f3 0f 16 e5          	movshdup xmm4,xmm5
 194:	0f 57 25 60 00 00 00 	xorps  xmm4,XMMWORD PTR ds:0x60
 19b:	f3 0f 12 ed          	movsldup xmm5,xmm5
 19f:	39 fd                	cmp    ebp,edi
 1a1:	7e 5b                	jle    1fe <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x1fe>
 1a3:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1a7:	89 f9                	mov    ecx,edi
 1a9:	0f 28 0c d0          	movaps xmm1,XMMWORD PTR [eax+edx*8]
 1ad:	0f 28 44 d0 10       	movaps xmm0,XMMWORD PTR [eax+edx*8+0x10]
 1b2:	0f 28 f1             	movaps xmm6,xmm1
 1b5:	0f c6 f1 b1          	shufps xmm6,xmm1,0xb1
 1b9:	0f 59 f2             	mulps  xmm6,xmm2
 1bc:	0f 59 cb             	mulps  xmm1,xmm3
 1bf:	0f 58 ce             	addps  xmm1,xmm6
 1c2:	0f 28 30             	movaps xmm6,XMMWORD PTR [eax]
 1c5:	0f 5c f1             	subps  xmm6,xmm1
 1c8:	0f 58 08             	addps  xmm1,XMMWORD PTR [eax]
 1cb:	0f 28 f8             	movaps xmm7,xmm0
 1ce:	0f c6 f8 b1          	shufps xmm7,xmm0,0xb1
 1d2:	0f 59 fc             	mulps  xmm7,xmm4
 1d5:	0f 59 c5             	mulps  xmm0,xmm5
 1d8:	0f 58 c7             	addps  xmm0,xmm7
 1db:	0f 28 78 10          	movaps xmm7,XMMWORD PTR [eax+0x10]
 1df:	0f 5c f8             	subps  xmm7,xmm0
 1e2:	0f 58 40 10          	addps  xmm0,XMMWORD PTR [eax+0x10]
 1e6:	0f 29 08             	movaps XMMWORD PTR [eax],xmm1
 1e9:	0f 29 34 d0          	movaps XMMWORD PTR [eax+edx*8],xmm6
 1ed:	0f 29 40 10          	movaps XMMWORD PTR [eax+0x10],xmm0
 1f1:	0f 29 7c d0 10       	movaps XMMWORD PTR [eax+edx*8+0x10],xmm7
 1f6:	01 d9                	add    ecx,ebx
 1f8:	01 f0                	add    eax,esi
 1fa:	39 cd                	cmp    ebp,ecx
 1fc:	7f ab                	jg     1a9 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x1a9>
 1fe:	83 c7 04             	add    edi,0x4
 201:	83 04 24 20          	add    DWORD PTR [esp],0x20
 205:	83 44 24 04 20       	add    DWORD PTR [esp+0x4],0x20
 20a:	3b 7c 24 08          	cmp    edi,DWORD PTR [esp+0x8]
 20e:	0f 8c 5f ff ff ff    	jl     173 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x173>
 214:	ff 44 24 10          	inc    DWORD PTR [esp+0x10]
 218:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 21c:	39 44 24 10          	cmp    DWORD PTR [esp+0x10],eax
 220:	74 25                	je     247 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x247>
 222:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
 226:	e9 19 ff ff ff       	jmp    144 <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x144>
 22b:	b8 00 00 00 00       	mov    eax,0x0
 230:	eb 1a                	jmp    24c <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x24c>
 232:	b8 01 00 00 00       	mov    eax,0x1
 237:	eb 13                	jmp    24c <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x24c>
 239:	b8 01 00 00 00       	mov    eax,0x1
 23e:	eb 0c                	jmp    24c <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x24c>
 240:	b8 01 00 00 00       	mov    eax,0x1
 245:	eb 05                	jmp    24c <__ZN22FFTransformerRecursiveIfE17FFTransformNormalEP7ComplexIfEi+0x24c>
 247:	b8 01 00 00 00       	mov    eax,0x1
 24c:	83 c4 24             	add    esp,0x24
 24f:	5b                   	pop    ebx
 250:	5e                   	pop    esi
 251:	5f                   	pop    edi
 252:	5d                   	pop    ebp
 253:	c2 08 00             	ret    0x8
 256:	90                   	nop
 257:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi:

00000000 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	57                   	push   edi
   4:	56                   	push   esi
   5:	53                   	push   ebx
   6:	83 ec 3c             	sub    esp,0x3c
   9:	89 cb                	mov    ebx,ecx
   b:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
   e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  11:	3d 00 10 00 00       	cmp    eax,0x1000
  16:	7f 14                	jg     2c <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x2c>
  18:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  1c:	89 3c 24             	mov    DWORD PTR [esp],edi
  1f:	e8 00 00 00 00       	call   24 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x24>
  24:	83 ec 08             	sub    esp,0x8
  27:	e9 24 01 00 00       	jmp    150 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x150>
  2c:	89 c6                	mov    esi,eax
  2e:	c1 ee 1f             	shr    esi,0x1f
  31:	01 c6                	add    esi,eax
  33:	d1 fe                	sar    esi,1
  35:	89 75 d4             	mov    DWORD PTR [ebp-0x2c],esi
  38:	3d ff ff 00 00       	cmp    eax,0xffff
  3d:	7e 44                	jle    83 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x83>
  3f:	89 4d dc             	mov    DWORD PTR [ebp-0x24],ecx
  42:	89 7d e0             	mov    DWORD PTR [ebp-0x20],edi
  45:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  48:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  4f:	00 
  50:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  57:	00 
  58:	8d 75 dc             	lea    esi,[ebp-0x24]
  5b:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  5f:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  66:	e8 00 00 00 00       	call   6b <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x6b>
  6b:	89 34 24             	mov    DWORD PTR [esp],esi
  6e:	e8 00 00 00 00       	call   73 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x73>
  73:	e8 00 00 00 00       	call   78 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x78>
  78:	8b 7d e0             	mov    edi,DWORD PTR [ebp-0x20]
  7b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  7e:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  81:	eb 23                	jmp    a6 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0xa6>
  83:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  87:	89 3c 24             	mov    DWORD PTR [esp],edi
  8a:	e8 71 ff ff ff       	call   0 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi>
  8f:	83 ec 08             	sub    esp,0x8
  92:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  96:	8d 04 f7             	lea    eax,[edi+esi*8]
  99:	89 04 24             	mov    DWORD PTR [esp],eax
  9c:	89 d9                	mov    ecx,ebx
  9e:	e8 5d ff ff ff       	call   0 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi>
  a3:	83 ec 08             	sub    esp,0x8
  a6:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  a9:	85 c0                	test   eax,eax
  ab:	0f 8e 93 00 00 00    	jle    144 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x144>
  b1:	8d 04 c7             	lea    eax,[edi+eax*8]
  b4:	89 fa                	mov    edx,edi
  b6:	b9 00 00 00 00       	mov    ecx,0x0
  bb:	be e0 ff ff ff       	mov    esi,0xffffffe0
  c0:	29 fe                	sub    esi,edi
  c2:	89 f7                	mov    edi,esi
  c4:	0f 28 1d 60 00 00 00 	movaps xmm3,XMMWORD PTR ds:0x60
  cb:	8d 34 07             	lea    esi,[edi+eax*1]
  ce:	03 73 10             	add    esi,DWORD PTR [ebx+0x10]
  d1:	f3 0f 16 2e          	movshdup xmm5,XMMWORD PTR [esi]
  d5:	0f 57 eb             	xorps  xmm5,xmm3
  d8:	f3 0f 12 36          	movsldup xmm6,XMMWORD PTR [esi]
  dc:	0f 28 46 10          	movaps xmm0,XMMWORD PTR [esi+0x10]
  e0:	f3 0f 16 e0          	movshdup xmm4,xmm0
  e4:	0f 57 e3             	xorps  xmm4,xmm3
  e7:	f3 0f 12 c0          	movsldup xmm0,xmm0
  eb:	0f 28 10             	movaps xmm2,XMMWORD PTR [eax]
  ee:	0f 28 48 10          	movaps xmm1,XMMWORD PTR [eax+0x10]
  f2:	0f 28 fa             	movaps xmm7,xmm2
  f5:	0f c6 fa b1          	shufps xmm7,xmm2,0xb1
  f9:	0f 59 ef             	mulps  xmm5,xmm7
  fc:	0f 59 d6             	mulps  xmm2,xmm6
  ff:	0f 58 d5             	addps  xmm2,xmm5
 102:	0f 28 2a             	movaps xmm5,XMMWORD PTR [edx]
 105:	0f 5c ea             	subps  xmm5,xmm2
 108:	0f 58 12             	addps  xmm2,XMMWORD PTR [edx]
 10b:	0f 28 f1             	movaps xmm6,xmm1
 10e:	0f c6 f1 b1          	shufps xmm6,xmm1,0xb1
 112:	0f 59 e6             	mulps  xmm4,xmm6
 115:	0f 59 c8             	mulps  xmm1,xmm0
 118:	0f 58 cc             	addps  xmm1,xmm4
 11b:	0f 28 62 10          	movaps xmm4,XMMWORD PTR [edx+0x10]
 11f:	0f 5c e1             	subps  xmm4,xmm1
 122:	0f 58 4a 10          	addps  xmm1,XMMWORD PTR [edx+0x10]
 126:	0f 29 12             	movaps XMMWORD PTR [edx],xmm2
 129:	0f 29 28             	movaps XMMWORD PTR [eax],xmm5
 12c:	0f 29 4a 10          	movaps XMMWORD PTR [edx+0x10],xmm1
 130:	0f 29 60 10          	movaps XMMWORD PTR [eax+0x10],xmm4
 134:	83 c1 04             	add    ecx,0x4
 137:	83 c2 20             	add    edx,0x20
 13a:	83 c0 20             	add    eax,0x20
 13d:	39 4d d4             	cmp    DWORD PTR [ebp-0x2c],ecx
 140:	7f 89                	jg     cb <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0xcb>
 142:	eb 07                	jmp    14b <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x14b>
 144:	b8 01 00 00 00       	mov    eax,0x1
 149:	eb 05                	jmp    150 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfEi+0x150>
 14b:	b8 01 00 00 00       	mov    eax,0x1
 150:	8d 65 f4             	lea    esp,[ebp-0xc]
 153:	5b                   	pop    ebx
 154:	5e                   	pop    esi
 155:	5f                   	pop    edi
 156:	5d                   	pop    ebp
 157:	c2 08 00             	ret    0x8
 15a:	90                   	nop
 15b:	90                   	nop

Disassembly of section .text$_ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfE:

00000000 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfE>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 18             	sub    esp,0x18
   6:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
   9:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
   c:	89 cb                	mov    ebx,ecx
   e:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  11:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
  14:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  18:	89 34 24             	mov    DWORD PTR [esp],esi
  1b:	e8 00 00 00 00       	call   20 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfE+0x20>
  20:	83 ec 08             	sub    esp,0x8
  23:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  26:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  2a:	89 34 24             	mov    DWORD PTR [esp],esi
  2d:	89 d9                	mov    ecx,ebx
  2f:	e8 00 00 00 00       	call   34 <__ZN22FFTransformerRecursiveIfE11FFTransformEP7ComplexIfE+0x34>
  34:	83 ec 08             	sub    esp,0x8
  37:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  3a:	8b 75 fc             	mov    esi,DWORD PTR [ebp-0x4]
  3d:	c9                   	leave  
  3e:	c2 04 00             	ret    0x4
  41:	90                   	nop
  42:	90                   	nop
  43:	90                   	nop
