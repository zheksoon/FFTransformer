
obj/release/FFTransformerVec.o:     file format pe-i386


Disassembly of section .text:

00000000 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3>:
   0:	55                   	push   ebp
   1:	31 c0                	xor    eax,eax
   3:	57                   	push   edi
   4:	89 cf                	mov    edi,ecx
   6:	56                   	push   esi
   7:	be ff ff ff ff       	mov    esi,0xffffffff
   c:	53                   	push   ebx
   d:	83 ec 3c             	sub    esp,0x3c
  10:	8b 5c 24 54          	mov    ebx,DWORD PTR [esp+0x54]
  14:	8b 54 24 50          	mov    edx,DWORD PTR [esp+0x50]
  18:	89 4c 24 24          	mov    DWORD PTR [esp+0x24],ecx
  1c:	85 db                	test   ebx,ebx
  1e:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
  21:	0f 9f c0             	setg   al
  24:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  27:	89 d0                	mov    eax,edx
  29:	83 c0 02             	add    eax,0x2
  2c:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
  33:	3d 00 00 e0 0f       	cmp    eax,0xfe00000
  38:	89 d0                	mov    eax,edx
  3a:	0f 47 c6             	cmova  eax,esi
  3d:	89 04 24             	mov    DWORD PTR [esp],eax
  40:	e8 00 00 00 00       	call   45 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x45>
  45:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  48:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  4c:	83 c0 04             	add    eax,0x4
  4f:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
  56:	3d 00 00 c0 1f       	cmp    eax,0x1fc00000
  5b:	0f 46 f2             	cmovbe esi,edx
  5e:	89 34 24             	mov    DWORD PTR [esp],esi
  61:	e8 00 00 00 00       	call   66 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x66>
  66:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  69:	89 47 14             	mov    DWORD PTR [edi+0x14],eax
  6c:	83 e0 f0             	and    eax,0xfffffff0
  6f:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  73:	89 47 18             	mov    DWORD PTR [edi+0x18],eax
  76:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  7a:	83 64 24 1c f0       	and    DWORD PTR [esp+0x1c],0xfffffff0
  7f:	83 7c 24 50 04       	cmp    DWORD PTR [esp+0x50],0x4
  84:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  88:	89 57 10             	mov    DWORD PTR [edi+0x10],edx
  8b:	0f 8e 6f 02 00 00    	jle    300 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x300>
  91:	89 5c 24 28          	mov    DWORD PTR [esp+0x28],ebx
  95:	bf 04 00 00 00       	mov    edi,0x4
  9a:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  9e:	dc 0d 00 00 00 00    	fmul   QWORD PTR ds:0x0
  a4:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  a8:	89 7c 24 28          	mov    DWORD PTR [esp+0x28],edi
  ac:	31 db                	xor    ebx,ebx
  ae:	83 ff 08             	cmp    edi,0x8
  b1:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  b5:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
  b9:	0f 8e ed 01 00 00    	jle    2ac <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x2ac>
  bf:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  c3:	31 db                	xor    ebx,ebx
  c5:	8d 34 f8             	lea    esi,[eax+edi*8]
  c8:	8d 47 f7             	lea    eax,[edi-0x9]
  cb:	c1 e8 03             	shr    eax,0x3
  ce:	8d 2c c5 08 00 00 00 	lea    ebp,[eax*8+0x8]
  d5:	89 5c 24 28          	mov    DWORD PTR [esp+0x28],ebx
  d9:	0f 0d 4e 0c          	prefetchw BYTE PTR [esi+0xc]
  dd:	83 c6 40             	add    esi,0x40
  e0:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
  e4:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
  e8:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
  ec:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
  f0:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
  f4:	dd 14 24             	fst    QWORD PTR [esp]
  f7:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
  fb:	e8 00 00 00 00       	call   100 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x100>
 100:	d9 5e a0             	fstp   DWORD PTR [esi-0x60]
 103:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 107:	dd 1c 24             	fstp   QWORD PTR [esp]
 10a:	e8 00 00 00 00       	call   10f <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x10f>
 10f:	8d 43 01             	lea    eax,[ebx+0x1]
 112:	d9 5e a4             	fstp   DWORD PTR [esi-0x5c]
 115:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 119:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 11d:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 121:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 125:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 129:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 12d:	dd 14 24             	fst    QWORD PTR [esp]
 130:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 134:	e8 00 00 00 00       	call   139 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x139>
 139:	d9 5e a8             	fstp   DWORD PTR [esi-0x58]
 13c:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 140:	dd 1c 24             	fstp   QWORD PTR [esp]
 143:	e8 00 00 00 00       	call   148 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x148>
 148:	8d 43 02             	lea    eax,[ebx+0x2]
 14b:	d9 5e ac             	fstp   DWORD PTR [esi-0x54]
 14e:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 152:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 156:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 15a:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 15e:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 162:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 166:	dd 14 24             	fst    QWORD PTR [esp]
 169:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 16d:	e8 00 00 00 00       	call   172 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x172>
 172:	d9 5e b0             	fstp   DWORD PTR [esi-0x50]
 175:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 179:	dd 1c 24             	fstp   QWORD PTR [esp]
 17c:	e8 00 00 00 00       	call   181 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x181>
 181:	8d 43 03             	lea    eax,[ebx+0x3]
 184:	d9 5e b4             	fstp   DWORD PTR [esi-0x4c]
 187:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 18b:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 18f:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 193:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 197:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 19b:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 19f:	dd 14 24             	fst    QWORD PTR [esp]
 1a2:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 1a6:	e8 00 00 00 00       	call   1ab <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x1ab>
 1ab:	d9 5e b8             	fstp   DWORD PTR [esi-0x48]
 1ae:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 1b2:	dd 1c 24             	fstp   QWORD PTR [esp]
 1b5:	e8 00 00 00 00       	call   1ba <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x1ba>
 1ba:	8d 43 04             	lea    eax,[ebx+0x4]
 1bd:	d9 5e bc             	fstp   DWORD PTR [esi-0x44]
 1c0:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 1c4:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 1c8:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 1cc:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 1d0:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 1d4:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 1d8:	dd 14 24             	fst    QWORD PTR [esp]
 1db:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 1df:	e8 00 00 00 00       	call   1e4 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x1e4>
 1e4:	d9 5e c0             	fstp   DWORD PTR [esi-0x40]
 1e7:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 1eb:	dd 1c 24             	fstp   QWORD PTR [esp]
 1ee:	e8 00 00 00 00       	call   1f3 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x1f3>
 1f3:	8d 43 05             	lea    eax,[ebx+0x5]
 1f6:	d9 5e c4             	fstp   DWORD PTR [esi-0x3c]
 1f9:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 1fd:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 201:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 205:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 209:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 20d:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 211:	dd 14 24             	fst    QWORD PTR [esp]
 214:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 218:	e8 00 00 00 00       	call   21d <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x21d>
 21d:	d9 5e c8             	fstp   DWORD PTR [esi-0x38]
 220:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 224:	dd 1c 24             	fstp   QWORD PTR [esp]
 227:	e8 00 00 00 00       	call   22c <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x22c>
 22c:	8d 43 06             	lea    eax,[ebx+0x6]
 22f:	d9 5e cc             	fstp   DWORD PTR [esi-0x34]
 232:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 236:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 23a:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 23e:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 242:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 246:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 24a:	dd 14 24             	fst    QWORD PTR [esp]
 24d:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 251:	e8 00 00 00 00       	call   256 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x256>
 256:	d9 5e d0             	fstp   DWORD PTR [esi-0x30]
 259:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 25d:	dd 1c 24             	fstp   QWORD PTR [esp]
 260:	e8 00 00 00 00       	call   265 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x265>
 265:	8d 43 07             	lea    eax,[ebx+0x7]
 268:	d9 5e d4             	fstp   DWORD PTR [esi-0x2c]
 26b:	83 c3 08             	add    ebx,0x8
 26e:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 272:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 276:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 27a:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 27e:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 282:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 286:	dd 14 24             	fst    QWORD PTR [esp]
 289:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 28d:	e8 00 00 00 00       	call   292 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x292>
 292:	d9 5e d8             	fstp   DWORD PTR [esi-0x28]
 295:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 299:	dd 1c 24             	fstp   QWORD PTR [esp]
 29c:	e8 00 00 00 00       	call   2a1 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x2a1>
 2a1:	d9 5e dc             	fstp   DWORD PTR [esi-0x24]
 2a4:	39 eb                	cmp    ebx,ebp
 2a6:	0f 85 29 fe ff ff    	jne    d5 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0xd5>
 2ac:	8b 4c 24 1c          	mov    ecx,DWORD PTR [esp+0x1c]
 2b0:	8d 04 1f             	lea    eax,[edi+ebx*1]
 2b3:	8d 34 c1             	lea    esi,[ecx+eax*8]
 2b6:	89 5c 24 28          	mov    DWORD PTR [esp+0x28],ebx
 2ba:	43                   	inc    ebx
 2bb:	83 c6 08             	add    esi,0x8
 2be:	db 44 24 28          	fild   DWORD PTR [esp+0x28]
 2c2:	dc 4c 24 10          	fmul   QWORD PTR [esp+0x10]
 2c6:	dc 74 24 08          	fdiv   QWORD PTR [esp+0x8]
 2ca:	d9 5c 24 2c          	fstp   DWORD PTR [esp+0x2c]
 2ce:	d9 44 24 2c          	fld    DWORD PTR [esp+0x2c]
 2d2:	dd 14 24             	fst    QWORD PTR [esp]
 2d5:	d9 5c 24 18          	fstp   DWORD PTR [esp+0x18]
 2d9:	e8 00 00 00 00       	call   2de <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x2de>
 2de:	d9 5e d8             	fstp   DWORD PTR [esi-0x28]
 2e1:	d9 44 24 18          	fld    DWORD PTR [esp+0x18]
 2e5:	dd 1c 24             	fstp   QWORD PTR [esp]
 2e8:	e8 00 00 00 00       	call   2ed <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x2ed>
 2ed:	d9 5e dc             	fstp   DWORD PTR [esi-0x24]
 2f0:	39 df                	cmp    edi,ebx
 2f2:	7f c2                	jg     2b6 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x2b6>
 2f4:	01 ff                	add    edi,edi
 2f6:	39 7c 24 50          	cmp    DWORD PTR [esp+0x50],edi
 2fa:	0f 8f a8 fd ff ff    	jg     a8 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0xa8>
 300:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 304:	31 d2                	xor    edx,edx
 306:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
 309:	0f bd c8             	bsr    ecx,eax
 30c:	83 f1 1f             	xor    ecx,0x1f
 30f:	41                   	inc    ecx
 310:	85 c0                	test   eax,eax
 312:	7e 5d                	jle    371 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x371>
 314:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
 318:	0f b6 c2             	movzx  eax,dl
 31b:	89 c7                	mov    edi,eax
 31d:	0f b6 80 00 00 00 00 	movzx  eax,BYTE PTR [eax+0x0]
 324:	31 d7                	xor    edi,edx
 326:	09 f8                	or     eax,edi
 328:	c1 c8 08             	ror    eax,0x8
 32b:	0f b6 f8             	movzx  edi,al
 32e:	31 f8                	xor    eax,edi
 330:	89 c5                	mov    ebp,eax
 332:	0f b6 87 00 00 00 00 	movzx  eax,BYTE PTR [edi+0x0]
 339:	09 e8                	or     eax,ebp
 33b:	c1 c8 08             	ror    eax,0x8
 33e:	0f b6 f8             	movzx  edi,al
 341:	31 f8                	xor    eax,edi
 343:	89 c5                	mov    ebp,eax
 345:	0f b6 87 00 00 00 00 	movzx  eax,BYTE PTR [edi+0x0]
 34c:	09 e8                	or     eax,ebp
 34e:	c1 c8 08             	ror    eax,0x8
 351:	0f b6 f8             	movzx  edi,al
 354:	31 f8                	xor    eax,edi
 356:	89 c5                	mov    ebp,eax
 358:	0f b6 87 00 00 00 00 	movzx  eax,BYTE PTR [edi+0x0]
 35f:	09 e8                	or     eax,ebp
 361:	c1 c8 08             	ror    eax,0x8
 364:	0f c8                	bswap  eax
 366:	d3 e8                	shr    eax,cl
 368:	89 04 93             	mov    DWORD PTR [ebx+edx*4],eax
 36b:	42                   	inc    edx
 36c:	3b 56 04             	cmp    edx,DWORD PTR [esi+0x4]
 36f:	7c a7                	jl     318 <__ZN16FFTransformerVecIfE7FFTInitEii.part.3+0x318>
 371:	83 c4 3c             	add    esp,0x3c
 374:	b8 01 00 00 00       	mov    eax,0x1
 379:	5b                   	pop    ebx
 37a:	5e                   	pop    esi
 37b:	5f                   	pop    edi
 37c:	5d                   	pop    ebp
 37d:	c2 08 00             	ret    0x8

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
   6:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
   9:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   f:	85 c0                	test   eax,eax
  11:	74 08                	je     1b <__ZN16FFTransformerVecIfED0Ev+0x1b>
  13:	89 04 24             	mov    DWORD PTR [esp],eax
  16:	e8 00 00 00 00       	call   1b <__ZN16FFTransformerVecIfED0Ev+0x1b>
  1b:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
  1e:	85 c0                	test   eax,eax
  20:	74 08                	je     2a <__ZN16FFTransformerVecIfED0Ev+0x2a>
  22:	89 04 24             	mov    DWORD PTR [esp],eax
  25:	e8 00 00 00 00       	call   2a <__ZN16FFTransformerVecIfED0Ev+0x2a>
  2a:	89 1c 24             	mov    DWORD PTR [esp],ebx
  2d:	e8 00 00 00 00       	call   32 <__ZN16FFTransformerVecIfED0Ev+0x32>
  32:	83 c4 18             	add    esp,0x18
  35:	5b                   	pop    ebx
  36:	c3                   	ret    
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

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
   0:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
   4:	0f b6 c2             	movzx  eax,dl
   7:	31 c2                	xor    edx,eax
   9:	0f b6 80 00 00 00 00 	movzx  eax,BYTE PTR [eax+0x0]
  10:	09 d0                	or     eax,edx
  12:	c1 c8 08             	ror    eax,0x8
  15:	0f b6 d0             	movzx  edx,al
  18:	31 d0                	xor    eax,edx
  1a:	89 c1                	mov    ecx,eax
  1c:	0f b6 82 00 00 00 00 	movzx  eax,BYTE PTR [edx+0x0]
  23:	09 c8                	or     eax,ecx
  25:	c1 c8 08             	ror    eax,0x8
  28:	0f b6 d0             	movzx  edx,al
  2b:	31 d0                	xor    eax,edx
  2d:	89 c1                	mov    ecx,eax
  2f:	0f b6 82 00 00 00 00 	movzx  eax,BYTE PTR [edx+0x0]
  36:	09 c8                	or     eax,ecx
  38:	c1 c8 08             	ror    eax,0x8
  3b:	0f b6 d0             	movzx  edx,al
  3e:	31 d0                	xor    eax,edx
  40:	89 c1                	mov    ecx,eax
  42:	0f b6 82 00 00 00 00 	movzx  eax,BYTE PTR [edx+0x0]
  49:	09 c8                	or     eax,ecx
  4b:	c1 c8 08             	ror    eax,0x8
  4e:	0f c8                	bswap  eax
  50:	c2 04 00             	ret    0x4
  53:	90                   	nop
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

Disassembly of section .text$_ZN16FFTransformerVecIfEC2Eii:

00000000 <__ZN16FFTransformerVecIfEC2Eii>:
   0:	55                   	push   ebp
   1:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   7:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
   e:	89 e5                	mov    ebp,esp
  10:	53                   	push   ebx
  11:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  14:	85 c0                	test   eax,eax
  16:	7e 10                	jle    28 <__ZN16FFTransformerVecIfEC2Eii+0x28>
  18:	8d 50 ff             	lea    edx,[eax-0x1]
  1b:	85 c2                	test   edx,eax
  1d:	75 09                	jne    28 <__ZN16FFTransformerVecIfEC2Eii+0x28>
  1f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  22:	c9                   	leave  
  23:	e9 00 00 00 00       	jmp    28 <__ZN16FFTransformerVecIfEC2Eii+0x28>
  28:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  2b:	c9                   	leave  
  2c:	c2 08 00             	ret    0x8
  2f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfEC1Eii:

00000000 <__ZN16FFTransformerVecIfEC1Eii>:
   0:	55                   	push   ebp
   1:	c7 01 08 00 00 00    	mov    DWORD PTR [ecx],0x8
   7:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
   e:	89 e5                	mov    ebp,esp
  10:	53                   	push   ebx
  11:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  14:	85 c0                	test   eax,eax
  16:	7e 10                	jle    28 <__ZN16FFTransformerVecIfEC1Eii+0x28>
  18:	8d 50 ff             	lea    edx,[eax-0x1]
  1b:	85 c2                	test   edx,eax
  1d:	75 09                	jne    28 <__ZN16FFTransformerVecIfEC1Eii+0x28>
  1f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  22:	c9                   	leave  
  23:	e9 00 00 00 00       	jmp    28 <__ZN16FFTransformerVecIfEC1Eii+0x28>
  28:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  2b:	c9                   	leave  
  2c:	c2 08 00             	ret    0x8
  2f:	90                   	nop

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
   1:	89 e5                	mov    ebp,esp
   3:	53                   	push   ebx
   4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
   7:	85 c0                	test   eax,eax
   9:	7e 15                	jle    20 <__ZN16FFTransformerVecIfE7FFTInitEii+0x20>
   b:	8d 50 ff             	lea    edx,[eax-0x1]
   e:	85 c2                	test   edx,eax
  10:	75 0e                	jne    20 <__ZN16FFTransformerVecIfE7FFTInitEii+0x20>
  12:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  15:	c9                   	leave  
  16:	e9 00 00 00 00       	jmp    1b <__ZN16FFTransformerVecIfE7FFTInitEii+0x1b>
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  20:	31 c0                	xor    eax,eax
  22:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  25:	c9                   	leave  
  26:	c2 08 00             	ret    0x8
  29:	90                   	nop
  2a:	90                   	nop
  2b:	90                   	nop
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop

Disassembly of section .text$_ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE:

00000000 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE>:
   0:	55                   	push   ebp
   1:	31 c0                	xor    eax,eax
   3:	57                   	push   edi
   4:	56                   	push   esi
   5:	53                   	push   ebx
   6:	83 ec 20             	sub    esp,0x20
   9:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
   c:	85 ed                	test   ebp,ebp
   e:	0f 8e 5b 02 00 00    	jle    26f <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x26f>
  14:	8d 55 ff             	lea    edx,[ebp-0x1]
  17:	85 ea                	test   edx,ebp
  19:	0f 85 50 02 00 00    	jne    26f <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x26f>
  1f:	83 fd 01             	cmp    ebp,0x1
  22:	0f 84 42 02 00 00    	je     26a <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x26a>
  28:	8b 71 18             	mov    esi,DWORD PTR [ecx+0x18]
  2b:	8b 54 24 34          	mov    edx,DWORD PTR [esp+0x34]
  2f:	31 c0                	xor    eax,eax
  31:	89 34 24             	mov    DWORD PTR [esp],esi
  34:	8b 34 24             	mov    esi,DWORD PTR [esp]
  37:	8b 1c 86             	mov    ebx,DWORD PTR [esi+eax*4]
  3a:	39 c3                	cmp    ebx,eax
  3c:	7e 1d                	jle    5b <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x5b>
  3e:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  42:	d9 02                	fld    DWORD PTR [edx]
  44:	d9 42 04             	fld    DWORD PTR [edx+0x4]
  47:	d9 c9                	fxch   st(1)
  49:	8d 1c de             	lea    ebx,[esi+ebx*8]
  4c:	8b 33                	mov    esi,DWORD PTR [ebx]
  4e:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
  51:	89 32                	mov    DWORD PTR [edx],esi
  53:	89 7a 04             	mov    DWORD PTR [edx+0x4],edi
  56:	d9 1b                	fstp   DWORD PTR [ebx]
  58:	d9 5b 04             	fstp   DWORD PTR [ebx+0x4]
  5b:	40                   	inc    eax
  5c:	83 c2 08             	add    edx,0x8
  5f:	39 e8                	cmp    eax,ebp
  61:	75 d1                	jne    34 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x34>
  63:	0f bd c5             	bsr    eax,ebp
  66:	c7 44 24 0c 1f 00 00 	mov    DWORD PTR [esp+0xc],0x1f
  6d:	00 
  6e:	31 d2                	xor    edx,edx
  70:	83 f0 1f             	xor    eax,0x1f
  73:	29 44 24 0c          	sub    DWORD PTR [esp+0xc],eax
  77:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  7b:	0f 28 15 10 00 00 00 	movaps xmm2,XMMWORD PTR ds:0x10
  82:	05 30 01 00 00       	add    eax,0x130
  87:	0f 28 25 20 00 00 00 	movaps xmm4,XMMWORD PTR ds:0x20
  8e:	0f 28 3d 30 00 00 00 	movaps xmm7,XMMWORD PTR ds:0x30
  95:	0f 28 a8 d0 fe ff ff 	movaps xmm5,XMMWORD PTR [eax-0x130]
  9c:	83 c2 08             	add    edx,0x8
  9f:	0f 18 08             	prefetcht0 BYTE PTR [eax]
  a2:	83 c0 40             	add    eax,0x40
  a5:	0f 28 f5             	movaps xmm6,xmm5
  a8:	0f 28 80 a0 fe ff ff 	movaps xmm0,XMMWORD PTR [eax-0x160]
  af:	0f c6 f5 4e          	shufps xmm6,xmm5,0x4e
  b3:	0f 57 ea             	xorps  xmm5,xmm2
  b6:	0f 28 98 b0 fe ff ff 	movaps xmm3,XMMWORD PTR [eax-0x150]
  bd:	0f 28 88 c0 fe ff ff 	movaps xmm1,XMMWORD PTR [eax-0x140]
  c4:	0f 58 ee             	addps  xmm5,xmm6
  c7:	0f 28 f0             	movaps xmm6,xmm0
  ca:	0f c6 f0 4e          	shufps xmm6,xmm0,0x4e
  ce:	0f 57 c2             	xorps  xmm0,xmm2
  d1:	0f 58 c6             	addps  xmm0,xmm6
  d4:	0f 28 f5             	movaps xmm6,xmm5
  d7:	0f c6 c0 b4          	shufps xmm0,xmm0,0xb4
  db:	0f 57 c4             	xorps  xmm0,xmm4
  de:	0f 58 f0             	addps  xmm6,xmm0
  e1:	0f 5c e8             	subps  xmm5,xmm0
  e4:	0f 28 c3             	movaps xmm0,xmm3
  e7:	0f c6 c3 4e          	shufps xmm0,xmm3,0x4e
  eb:	0f 57 da             	xorps  xmm3,xmm2
  ee:	0f 58 d8             	addps  xmm3,xmm0
  f1:	0f 28 c1             	movaps xmm0,xmm1
  f4:	0f c6 c1 4e          	shufps xmm0,xmm1,0x4e
  f8:	0f 57 ca             	xorps  xmm1,xmm2
  fb:	0f 58 c8             	addps  xmm1,xmm0
  fe:	0f 28 c3             	movaps xmm0,xmm3
 101:	0f c6 c9 b4          	shufps xmm1,xmm1,0xb4
 105:	0f 57 cc             	xorps  xmm1,xmm4
 108:	0f 58 c1             	addps  xmm0,xmm1
 10b:	0f 5c d9             	subps  xmm3,xmm1
 10e:	0f 28 c8             	movaps xmm1,xmm0
 111:	0f c6 c8 b4          	shufps xmm1,xmm0,0xb4
 115:	0f 57 cc             	xorps  xmm1,xmm4
 118:	0f 58 c8             	addps  xmm1,xmm0
 11b:	0f 28 c3             	movaps xmm0,xmm3
 11e:	0f c6 c3 b4          	shufps xmm0,xmm3,0xb4
 122:	0f 59 cf             	mulps  xmm1,xmm7
 125:	0f 57 05 40 00 00 00 	xorps  xmm0,XMMWORD PTR ds:0x40
 12c:	0f 58 c3             	addps  xmm0,xmm3
 12f:	0f 28 de             	movaps xmm3,xmm6
 132:	0f 5c d9             	subps  xmm3,xmm1
 135:	0f 59 05 50 00 00 00 	mulps  xmm0,XMMWORD PTR ds:0x50
 13c:	0f 58 ce             	addps  xmm1,xmm6
 13f:	0f 28 f5             	movaps xmm6,xmm5
 142:	0f 29 98 b0 fe ff ff 	movaps XMMWORD PTR [eax-0x150],xmm3
 149:	0f 29 88 90 fe ff ff 	movaps XMMWORD PTR [eax-0x170],xmm1
 150:	0f c6 c0 e1          	shufps xmm0,xmm0,0xe1
 154:	0f 5c f0             	subps  xmm6,xmm0
 157:	0f 58 c5             	addps  xmm0,xmm5
 15a:	0f 29 b0 c0 fe ff ff 	movaps XMMWORD PTR [eax-0x140],xmm6
 161:	0f 29 80 a0 fe ff ff 	movaps XMMWORD PTR [eax-0x160],xmm0
 168:	39 d5                	cmp    ebp,edx
 16a:	0f 8f 25 ff ff ff    	jg     95 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x95>
 170:	83 fd 02             	cmp    ebp,0x2
 173:	0f 84 f1 00 00 00    	je     26a <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x26a>
 179:	83 7c 24 0c 03       	cmp    DWORD PTR [esp+0xc],0x3
 17e:	0f 8e e6 00 00 00    	jle    26a <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x26a>
 184:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
 187:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
 18e:	00 
 18f:	bf 08 00 00 00       	mov    edi,0x8
 194:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
 198:	8d 74 f8 60          	lea    esi,[eax+edi*8+0x60]
 19c:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 1a0:	89 fb                	mov    ebx,edi
 1a2:	8d 0c 3f             	lea    ecx,[edi+edi*1]
 1a5:	c1 e3 04             	shl    ebx,0x4
 1a8:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 1af:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 1b3:	8b 14 24             	mov    edx,DWORD PTR [esp]
 1b6:	f3 0f 16 6e 80       	movshdup xmm5,XMMWORD PTR [esi-0x80]
 1bb:	f3 0f 16 66 90       	movshdup xmm4,XMMWORD PTR [esi-0x70]
 1c0:	0f 18 0e             	prefetcht0 BYTE PTR [esi]
 1c3:	0f 57 2d 60 00 00 00 	xorps  xmm5,XMMWORD PTR ds:0x60
 1ca:	f3 0f 12 7e 80       	movsldup xmm7,XMMWORD PTR [esi-0x80]
 1cf:	0f 18 4e 10          	prefetcht0 BYTE PTR [esi+0x10]
 1d3:	f3 0f 12 76 90       	movsldup xmm6,XMMWORD PTR [esi-0x70]
 1d8:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1dc:	39 d5                	cmp    ebp,edx
 1de:	0f 57 25 60 00 00 00 	xorps  xmm4,XMMWORD PTR ds:0x60
 1e5:	7e 55                	jle    23c <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x23c>
 1e7:	0f 28 1c f8          	movaps xmm3,XMMWORD PTR [eax+edi*8]
 1eb:	01 ca                	add    edx,ecx
 1ed:	0f 28 cb             	movaps xmm1,xmm3
 1f0:	0f 28 44 f8 10       	movaps xmm0,XMMWORD PTR [eax+edi*8+0x10]
 1f5:	0f c6 cb b1          	shufps xmm1,xmm3,0xb1
 1f9:	0f 59 df             	mulps  xmm3,xmm7
 1fc:	0f 28 10             	movaps xmm2,XMMWORD PTR [eax]
 1ff:	0f 59 cd             	mulps  xmm1,xmm5
 202:	0f 58 d9             	addps  xmm3,xmm1
 205:	0f 28 c8             	movaps xmm1,xmm0
 208:	0f c6 c8 b1          	shufps xmm1,xmm0,0xb1
 20c:	0f 59 c6             	mulps  xmm0,xmm6
 20f:	0f 5c d3             	subps  xmm2,xmm3
 212:	0f 59 cc             	mulps  xmm1,xmm4
 215:	0f 58 18             	addps  xmm3,XMMWORD PTR [eax]
 218:	0f 58 c1             	addps  xmm0,xmm1
 21b:	0f 28 48 10          	movaps xmm1,XMMWORD PTR [eax+0x10]
 21f:	0f 29 18             	movaps XMMWORD PTR [eax],xmm3
 222:	0f 5c c8             	subps  xmm1,xmm0
 225:	0f 58 40 10          	addps  xmm0,XMMWORD PTR [eax+0x10]
 229:	0f 29 14 f8          	movaps XMMWORD PTR [eax+edi*8],xmm2
 22d:	0f 29 40 10          	movaps XMMWORD PTR [eax+0x10],xmm0
 231:	0f 29 4c f8 10       	movaps XMMWORD PTR [eax+edi*8+0x10],xmm1
 236:	01 d8                	add    eax,ebx
 238:	39 d5                	cmp    ebp,edx
 23a:	7f ab                	jg     1e7 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1e7>
 23c:	83 04 24 04          	add    DWORD PTR [esp],0x4
 240:	83 c6 20             	add    esi,0x20
 243:	83 44 24 04 20       	add    DWORD PTR [esp+0x4],0x20
 248:	39 3c 24             	cmp    DWORD PTR [esp],edi
 24b:	0f 8c 62 ff ff ff    	jl     1b3 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x1b3>
 251:	ff 44 24 08          	inc    DWORD PTR [esp+0x8]
 255:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 259:	39 44 24 08          	cmp    DWORD PTR [esp+0x8],eax
 25d:	74 0b                	je     26a <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x26a>
 25f:	89 cf                	mov    edi,ecx
 261:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 265:	e9 2e ff ff ff       	jmp    198 <__ZN16FFTransformerVecIfE11FFTransformEP7ComplexIfE+0x198>
 26a:	b8 01 00 00 00       	mov    eax,0x1
 26f:	83 c4 20             	add    esp,0x20
 272:	5b                   	pop    ebx
 273:	5e                   	pop    esi
 274:	5f                   	pop    edi
 275:	5d                   	pop    ebp
 276:	c2 04 00             	ret    0x4
 279:	90                   	nop
 27a:	90                   	nop
 27b:	90                   	nop
 27c:	90                   	nop
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop
