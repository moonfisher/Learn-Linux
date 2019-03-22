
hx_kernel：     文件格式 elf32-i386


Disassembly of section .init.text:

00100000 <kern_init_text_start>:
  100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fb                   	sti    
  100009:	4f                   	dec    %edi
  10000a:	52                   	push   %edx
  10000b:	e4                   	.byte 0xe4

0010000c <start>:
  10000c:	89 1d 00 14 10 00    	mov    %ebx,0x101400
  100012:	bc ff 03 00 00       	mov    $0x3ff,%esp
  100017:	83 e4 f0             	and    $0xfffffff0,%esp
  10001a:	bd 00 00 00 00       	mov    $0x0,%ebp
  10001f:	e8 03 00 00 00       	call   100027 <kern_entry>

00100024 <noreturn>:
  100024:	f4                   	hlt    
  100025:	eb fd                	jmp    100024 <noreturn>

00100027 <kern_entry>:
  100027:	55                   	push   %ebp
  100028:	89 e5                	mov    %esp,%ebp
  10002a:	83 ec 08             	sub    $0x8,%esp
  10002d:	e8 24 00 00 00       	call   100056 <mmap_tmp_page>
  100032:	e8 e1 00 00 00       	call   100118 <enable_paging>
  100037:	a1 a4 96 10 c0       	mov    0xc01096a4,%eax
  10003c:	89 c4                	mov    %eax,%esp
  10003e:	31 ed                	xor    %ebp,%ebp
  100040:	a1 00 14 10 00       	mov    0x101400,%eax
  100045:	2d 00 00 00 40       	sub    $0x40000000,%eax
  10004a:	a3 00 90 11 c0       	mov    %eax,0xc0119000
  10004f:	e8 20 64 00 c0       	call   c0106474 <kern_init>
  100054:	c9                   	leave  
  100055:	c3                   	ret    

00100056 <mmap_tmp_page>:
  100056:	55                   	push   %ebp
  100057:	89 e5                	mov    %esp,%ebp
  100059:	83 ec 10             	sub    $0x10,%esp
  10005c:	a1 04 14 10 00       	mov    0x101404,%eax
  100061:	8b 15 08 14 10 00    	mov    0x101408,%edx
  100067:	83 ca 03             	or     $0x3,%edx
  10006a:	89 10                	mov    %edx,(%eax)
  10006c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100073:	eb 37                	jmp    1000ac <mmap_tmp_page+0x56>
  100075:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100078:	c1 e0 16             	shl    $0x16,%eax
  10007b:	2d 00 00 00 40       	sub    $0x40000000,%eax
  100080:	c1 e8 16             	shr    $0x16,%eax
  100083:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100086:	a1 04 14 10 00       	mov    0x101404,%eax
  10008b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10008e:	c1 e2 02             	shl    $0x2,%edx
  100091:	01 d0                	add    %edx,%eax
  100093:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100096:	c1 e2 0c             	shl    $0xc,%edx
  100099:	89 d1                	mov    %edx,%ecx
  10009b:	8b 15 0c 14 10 00    	mov    0x10140c,%edx
  1000a1:	01 ca                	add    %ecx,%edx
  1000a3:	83 ca 03             	or     $0x3,%edx
  1000a6:	89 10                	mov    %edx,(%eax)
  1000a8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1000ac:	83 7d fc 03          	cmpl   $0x3,-0x4(%ebp)
  1000b0:	7e c3                	jle    100075 <mmap_tmp_page+0x1f>
  1000b2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1000b9:	eb 1c                	jmp    1000d7 <mmap_tmp_page+0x81>
  1000bb:	a1 08 14 10 00       	mov    0x101408,%eax
  1000c0:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1000c3:	c1 e2 02             	shl    $0x2,%edx
  1000c6:	01 c2                	add    %eax,%edx
  1000c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1000cb:	c1 e0 0c             	shl    $0xc,%eax
  1000ce:	83 c8 03             	or     $0x3,%eax
  1000d1:	89 02                	mov    %eax,(%edx)
  1000d3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1000d7:	81 7d f8 ff 03 00 00 	cmpl   $0x3ff,-0x8(%ebp)
  1000de:	7e db                	jle    1000bb <mmap_tmp_page+0x65>
  1000e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1000e7:	eb 1c                	jmp    100105 <mmap_tmp_page+0xaf>
  1000e9:	a1 0c 14 10 00       	mov    0x10140c,%eax
  1000ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1000f1:	c1 e2 02             	shl    $0x2,%edx
  1000f4:	01 c2                	add    %eax,%edx
  1000f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000f9:	c1 e0 0c             	shl    $0xc,%eax
  1000fc:	83 c8 03             	or     $0x3,%eax
  1000ff:	89 02                	mov    %eax,(%edx)
  100101:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100105:	81 7d f4 ff 0f 00 00 	cmpl   $0xfff,-0xc(%ebp)
  10010c:	7e db                	jle    1000e9 <mmap_tmp_page+0x93>
  10010e:	a1 04 14 10 00       	mov    0x101404,%eax
  100113:	0f 22 d8             	mov    %eax,%cr3
  100116:	c9                   	leave  
  100117:	c3                   	ret    

00100118 <enable_paging>:
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 10             	sub    $0x10,%esp
  10011e:	0f 20 c0             	mov    %cr0,%eax
  100121:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100124:	81 4d fc 00 00 00 80 	orl    $0x80000000,-0x4(%ebp)
  10012b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10012e:	0f 22 c0             	mov    %eax,%cr0
  100131:	c9                   	leave  
  100132:	c3                   	ret    
  100133:	66 90                	xchg   %ax,%ax
  100135:	66 90                	xchg   %ax,%ax
  100137:	66 90                	xchg   %ax,%ax
  100139:	66 90                	xchg   %ax,%ax
  10013b:	66 90                	xchg   %ax,%ax
  10013d:	66 90                	xchg   %ax,%ax
  10013f:	66 90                	xchg   %ax,%ax
  100141:	66 90                	xchg   %ax,%ax
  100143:	66 90                	xchg   %ax,%ax
  100145:	66 90                	xchg   %ax,%ax
  100147:	66 90                	xchg   %ax,%ax
  100149:	66 90                	xchg   %ax,%ax
  10014b:	66 90                	xchg   %ax,%ax
  10014d:	66 90                	xchg   %ax,%ax
  10014f:	66 90                	xchg   %ax,%ax
  100151:	66 90                	xchg   %ax,%ax
  100153:	66 90                	xchg   %ax,%ax
  100155:	66 90                	xchg   %ax,%ax
  100157:	66 90                	xchg   %ax,%ax
  100159:	66 90                	xchg   %ax,%ax
  10015b:	66 90                	xchg   %ax,%ax
  10015d:	66 90                	xchg   %ax,%ax
  10015f:	66 90                	xchg   %ax,%ax
  100161:	66 90                	xchg   %ax,%ax
  100163:	66 90                	xchg   %ax,%ax
  100165:	66 90                	xchg   %ax,%ax
  100167:	66 90                	xchg   %ax,%ax
  100169:	66 90                	xchg   %ax,%ax
  10016b:	66 90                	xchg   %ax,%ax
  10016d:	66 90                	xchg   %ax,%ax
  10016f:	66 90                	xchg   %ax,%ax
  100171:	66 90                	xchg   %ax,%ax
  100173:	66 90                	xchg   %ax,%ax
  100175:	66 90                	xchg   %ax,%ax
  100177:	66 90                	xchg   %ax,%ax
  100179:	66 90                	xchg   %ax,%ax
  10017b:	66 90                	xchg   %ax,%ax
  10017d:	66 90                	xchg   %ax,%ax
  10017f:	66 90                	xchg   %ax,%ax
  100181:	66 90                	xchg   %ax,%ax
  100183:	66 90                	xchg   %ax,%ax
  100185:	66 90                	xchg   %ax,%ax
  100187:	66 90                	xchg   %ax,%ax
  100189:	66 90                	xchg   %ax,%ax
  10018b:	66 90                	xchg   %ax,%ax
  10018d:	66 90                	xchg   %ax,%ax
  10018f:	66 90                	xchg   %ax,%ax
  100191:	66 90                	xchg   %ax,%ax
  100193:	66 90                	xchg   %ax,%ax
  100195:	66 90                	xchg   %ax,%ax
  100197:	66 90                	xchg   %ax,%ax
  100199:	66 90                	xchg   %ax,%ax
  10019b:	66 90                	xchg   %ax,%ax
  10019d:	66 90                	xchg   %ax,%ax
  10019f:	66 90                	xchg   %ax,%ax
  1001a1:	66 90                	xchg   %ax,%ax
  1001a3:	66 90                	xchg   %ax,%ax
  1001a5:	66 90                	xchg   %ax,%ax
  1001a7:	66 90                	xchg   %ax,%ax
  1001a9:	66 90                	xchg   %ax,%ax
  1001ab:	66 90                	xchg   %ax,%ax
  1001ad:	66 90                	xchg   %ax,%ax
  1001af:	66 90                	xchg   %ax,%ax
  1001b1:	66 90                	xchg   %ax,%ax
  1001b3:	66 90                	xchg   %ax,%ax
  1001b5:	66 90                	xchg   %ax,%ax
  1001b7:	66 90                	xchg   %ax,%ax
  1001b9:	66 90                	xchg   %ax,%ax
  1001bb:	66 90                	xchg   %ax,%ax
  1001bd:	66 90                	xchg   %ax,%ax
  1001bf:	66 90                	xchg   %ax,%ax
  1001c1:	66 90                	xchg   %ax,%ax
  1001c3:	66 90                	xchg   %ax,%ax
  1001c5:	66 90                	xchg   %ax,%ax
  1001c7:	66 90                	xchg   %ax,%ax
  1001c9:	66 90                	xchg   %ax,%ax
  1001cb:	66 90                	xchg   %ax,%ax
  1001cd:	66 90                	xchg   %ax,%ax
  1001cf:	66 90                	xchg   %ax,%ax
  1001d1:	66 90                	xchg   %ax,%ax
  1001d3:	66 90                	xchg   %ax,%ax
  1001d5:	66 90                	xchg   %ax,%ax
  1001d7:	66 90                	xchg   %ax,%ax
  1001d9:	66 90                	xchg   %ax,%ax
  1001db:	66 90                	xchg   %ax,%ax
  1001dd:	66 90                	xchg   %ax,%ax
  1001df:	66 90                	xchg   %ax,%ax
  1001e1:	66 90                	xchg   %ax,%ax
  1001e3:	66 90                	xchg   %ax,%ax
  1001e5:	66 90                	xchg   %ax,%ax
  1001e7:	66 90                	xchg   %ax,%ax
  1001e9:	66 90                	xchg   %ax,%ax
  1001eb:	66 90                	xchg   %ax,%ax
  1001ed:	66 90                	xchg   %ax,%ax
  1001ef:	66 90                	xchg   %ax,%ax
  1001f1:	66 90                	xchg   %ax,%ax
  1001f3:	66 90                	xchg   %ax,%ax
  1001f5:	66 90                	xchg   %ax,%ax
  1001f7:	66 90                	xchg   %ax,%ax
  1001f9:	66 90                	xchg   %ax,%ax
  1001fb:	66 90                	xchg   %ax,%ax
  1001fd:	66 90                	xchg   %ax,%ax
  1001ff:	66 90                	xchg   %ax,%ax
  100201:	66 90                	xchg   %ax,%ax
  100203:	66 90                	xchg   %ax,%ax
  100205:	66 90                	xchg   %ax,%ax
  100207:	66 90                	xchg   %ax,%ax
  100209:	66 90                	xchg   %ax,%ax
  10020b:	66 90                	xchg   %ax,%ax
  10020d:	66 90                	xchg   %ax,%ax
  10020f:	66 90                	xchg   %ax,%ax
  100211:	66 90                	xchg   %ax,%ax
  100213:	66 90                	xchg   %ax,%ax
  100215:	66 90                	xchg   %ax,%ax
  100217:	66 90                	xchg   %ax,%ax
  100219:	66 90                	xchg   %ax,%ax
  10021b:	66 90                	xchg   %ax,%ax
  10021d:	66 90                	xchg   %ax,%ax
  10021f:	66 90                	xchg   %ax,%ax
  100221:	66 90                	xchg   %ax,%ax
  100223:	66 90                	xchg   %ax,%ax
  100225:	66 90                	xchg   %ax,%ax
  100227:	66 90                	xchg   %ax,%ax
  100229:	66 90                	xchg   %ax,%ax
  10022b:	66 90                	xchg   %ax,%ax
  10022d:	66 90                	xchg   %ax,%ax
  10022f:	66 90                	xchg   %ax,%ax
  100231:	66 90                	xchg   %ax,%ax
  100233:	66 90                	xchg   %ax,%ax
  100235:	66 90                	xchg   %ax,%ax
  100237:	66 90                	xchg   %ax,%ax
  100239:	66 90                	xchg   %ax,%ax
  10023b:	66 90                	xchg   %ax,%ax
  10023d:	66 90                	xchg   %ax,%ax
  10023f:	66 90                	xchg   %ax,%ax
  100241:	66 90                	xchg   %ax,%ax
  100243:	66 90                	xchg   %ax,%ax
  100245:	66 90                	xchg   %ax,%ax
  100247:	66 90                	xchg   %ax,%ax
  100249:	66 90                	xchg   %ax,%ax
  10024b:	66 90                	xchg   %ax,%ax
  10024d:	66 90                	xchg   %ax,%ax
  10024f:	66 90                	xchg   %ax,%ax
  100251:	66 90                	xchg   %ax,%ax
  100253:	66 90                	xchg   %ax,%ax
  100255:	66 90                	xchg   %ax,%ax
  100257:	66 90                	xchg   %ax,%ax
  100259:	66 90                	xchg   %ax,%ax
  10025b:	66 90                	xchg   %ax,%ax
  10025d:	66 90                	xchg   %ax,%ax
  10025f:	66 90                	xchg   %ax,%ax
  100261:	66 90                	xchg   %ax,%ax
  100263:	66 90                	xchg   %ax,%ax
  100265:	66 90                	xchg   %ax,%ax
  100267:	66 90                	xchg   %ax,%ax
  100269:	66 90                	xchg   %ax,%ax
  10026b:	66 90                	xchg   %ax,%ax
  10026d:	66 90                	xchg   %ax,%ax
  10026f:	66 90                	xchg   %ax,%ax
  100271:	66 90                	xchg   %ax,%ax
  100273:	66 90                	xchg   %ax,%ax
  100275:	66 90                	xchg   %ax,%ax
  100277:	66 90                	xchg   %ax,%ax
  100279:	66 90                	xchg   %ax,%ax
  10027b:	66 90                	xchg   %ax,%ax
  10027d:	66 90                	xchg   %ax,%ax
  10027f:	66 90                	xchg   %ax,%ax
  100281:	66 90                	xchg   %ax,%ax
  100283:	66 90                	xchg   %ax,%ax
  100285:	66 90                	xchg   %ax,%ax
  100287:	66 90                	xchg   %ax,%ax
  100289:	66 90                	xchg   %ax,%ax
  10028b:	66 90                	xchg   %ax,%ax
  10028d:	66 90                	xchg   %ax,%ax
  10028f:	66 90                	xchg   %ax,%ax
  100291:	66 90                	xchg   %ax,%ax
  100293:	66 90                	xchg   %ax,%ax
  100295:	66 90                	xchg   %ax,%ax
  100297:	66 90                	xchg   %ax,%ax
  100299:	66 90                	xchg   %ax,%ax
  10029b:	66 90                	xchg   %ax,%ax
  10029d:	66 90                	xchg   %ax,%ax
  10029f:	66 90                	xchg   %ax,%ax
  1002a1:	66 90                	xchg   %ax,%ax
  1002a3:	66 90                	xchg   %ax,%ax
  1002a5:	66 90                	xchg   %ax,%ax
  1002a7:	66 90                	xchg   %ax,%ax
  1002a9:	66 90                	xchg   %ax,%ax
  1002ab:	66 90                	xchg   %ax,%ax
  1002ad:	66 90                	xchg   %ax,%ax
  1002af:	66 90                	xchg   %ax,%ax
  1002b1:	66 90                	xchg   %ax,%ax
  1002b3:	66 90                	xchg   %ax,%ax
  1002b5:	66 90                	xchg   %ax,%ax
  1002b7:	66 90                	xchg   %ax,%ax
  1002b9:	66 90                	xchg   %ax,%ax
  1002bb:	66 90                	xchg   %ax,%ax
  1002bd:	66 90                	xchg   %ax,%ax
  1002bf:	66 90                	xchg   %ax,%ax
  1002c1:	66 90                	xchg   %ax,%ax
  1002c3:	66 90                	xchg   %ax,%ax
  1002c5:	66 90                	xchg   %ax,%ax
  1002c7:	66 90                	xchg   %ax,%ax
  1002c9:	66 90                	xchg   %ax,%ax
  1002cb:	66 90                	xchg   %ax,%ax
  1002cd:	66 90                	xchg   %ax,%ax
  1002cf:	66 90                	xchg   %ax,%ax
  1002d1:	66 90                	xchg   %ax,%ax
  1002d3:	66 90                	xchg   %ax,%ax
  1002d5:	66 90                	xchg   %ax,%ax
  1002d7:	66 90                	xchg   %ax,%ax
  1002d9:	66 90                	xchg   %ax,%ax
  1002db:	66 90                	xchg   %ax,%ax
  1002dd:	66 90                	xchg   %ax,%ax
  1002df:	66 90                	xchg   %ax,%ax
  1002e1:	66 90                	xchg   %ax,%ax
  1002e3:	66 90                	xchg   %ax,%ax
  1002e5:	66 90                	xchg   %ax,%ax
  1002e7:	66 90                	xchg   %ax,%ax
  1002e9:	66 90                	xchg   %ax,%ax
  1002eb:	66 90                	xchg   %ax,%ax
  1002ed:	66 90                	xchg   %ax,%ax
  1002ef:	66 90                	xchg   %ax,%ax
  1002f1:	66 90                	xchg   %ax,%ax
  1002f3:	66 90                	xchg   %ax,%ax
  1002f5:	66 90                	xchg   %ax,%ax
  1002f7:	66 90                	xchg   %ax,%ax
  1002f9:	66 90                	xchg   %ax,%ax
  1002fb:	66 90                	xchg   %ax,%ax
  1002fd:	66 90                	xchg   %ax,%ax
  1002ff:	66 90                	xchg   %ax,%ax
  100301:	66 90                	xchg   %ax,%ax
  100303:	66 90                	xchg   %ax,%ax
  100305:	66 90                	xchg   %ax,%ax
  100307:	66 90                	xchg   %ax,%ax
  100309:	66 90                	xchg   %ax,%ax
  10030b:	66 90                	xchg   %ax,%ax
  10030d:	66 90                	xchg   %ax,%ax
  10030f:	66 90                	xchg   %ax,%ax
  100311:	66 90                	xchg   %ax,%ax
  100313:	66 90                	xchg   %ax,%ax
  100315:	66 90                	xchg   %ax,%ax
  100317:	66 90                	xchg   %ax,%ax
  100319:	66 90                	xchg   %ax,%ax
  10031b:	66 90                	xchg   %ax,%ax
  10031d:	66 90                	xchg   %ax,%ax
  10031f:	66 90                	xchg   %ax,%ax
  100321:	66 90                	xchg   %ax,%ax
  100323:	66 90                	xchg   %ax,%ax
  100325:	66 90                	xchg   %ax,%ax
  100327:	66 90                	xchg   %ax,%ax
  100329:	66 90                	xchg   %ax,%ax
  10032b:	66 90                	xchg   %ax,%ax
  10032d:	66 90                	xchg   %ax,%ax
  10032f:	66 90                	xchg   %ax,%ax
  100331:	66 90                	xchg   %ax,%ax
  100333:	66 90                	xchg   %ax,%ax
  100335:	66 90                	xchg   %ax,%ax
  100337:	66 90                	xchg   %ax,%ax
  100339:	66 90                	xchg   %ax,%ax
  10033b:	66 90                	xchg   %ax,%ax
  10033d:	66 90                	xchg   %ax,%ax
  10033f:	66 90                	xchg   %ax,%ax
  100341:	66 90                	xchg   %ax,%ax
  100343:	66 90                	xchg   %ax,%ax
  100345:	66 90                	xchg   %ax,%ax
  100347:	66 90                	xchg   %ax,%ax
  100349:	66 90                	xchg   %ax,%ax
  10034b:	66 90                	xchg   %ax,%ax
  10034d:	66 90                	xchg   %ax,%ax
  10034f:	66 90                	xchg   %ax,%ax
  100351:	66 90                	xchg   %ax,%ax
  100353:	66 90                	xchg   %ax,%ax
  100355:	66 90                	xchg   %ax,%ax
  100357:	66 90                	xchg   %ax,%ax
  100359:	66 90                	xchg   %ax,%ax
  10035b:	66 90                	xchg   %ax,%ax
  10035d:	66 90                	xchg   %ax,%ax
  10035f:	66 90                	xchg   %ax,%ax
  100361:	66 90                	xchg   %ax,%ax
  100363:	66 90                	xchg   %ax,%ax
  100365:	66 90                	xchg   %ax,%ax
  100367:	66 90                	xchg   %ax,%ax
  100369:	66 90                	xchg   %ax,%ax
  10036b:	66 90                	xchg   %ax,%ax
  10036d:	66 90                	xchg   %ax,%ax
  10036f:	66 90                	xchg   %ax,%ax
  100371:	66 90                	xchg   %ax,%ax
  100373:	66 90                	xchg   %ax,%ax
  100375:	66 90                	xchg   %ax,%ax
  100377:	66 90                	xchg   %ax,%ax
  100379:	66 90                	xchg   %ax,%ax
  10037b:	66 90                	xchg   %ax,%ax
  10037d:	66 90                	xchg   %ax,%ax
  10037f:	66 90                	xchg   %ax,%ax
  100381:	66 90                	xchg   %ax,%ax
  100383:	66 90                	xchg   %ax,%ax
  100385:	66 90                	xchg   %ax,%ax
  100387:	66 90                	xchg   %ax,%ax
  100389:	66 90                	xchg   %ax,%ax
  10038b:	66 90                	xchg   %ax,%ax
  10038d:	66 90                	xchg   %ax,%ax
  10038f:	66 90                	xchg   %ax,%ax
  100391:	66 90                	xchg   %ax,%ax
  100393:	66 90                	xchg   %ax,%ax
  100395:	66 90                	xchg   %ax,%ax
  100397:	66 90                	xchg   %ax,%ax
  100399:	66 90                	xchg   %ax,%ax
  10039b:	66 90                	xchg   %ax,%ax
  10039d:	66 90                	xchg   %ax,%ax
  10039f:	66 90                	xchg   %ax,%ax
  1003a1:	66 90                	xchg   %ax,%ax
  1003a3:	66 90                	xchg   %ax,%ax
  1003a5:	66 90                	xchg   %ax,%ax
  1003a7:	66 90                	xchg   %ax,%ax
  1003a9:	66 90                	xchg   %ax,%ax
  1003ab:	66 90                	xchg   %ax,%ax
  1003ad:	66 90                	xchg   %ax,%ax
  1003af:	66 90                	xchg   %ax,%ax
  1003b1:	66 90                	xchg   %ax,%ax
  1003b3:	66 90                	xchg   %ax,%ax
  1003b5:	66 90                	xchg   %ax,%ax
  1003b7:	66 90                	xchg   %ax,%ax
  1003b9:	66 90                	xchg   %ax,%ax
  1003bb:	66 90                	xchg   %ax,%ax
  1003bd:	66 90                	xchg   %ax,%ax
  1003bf:	66 90                	xchg   %ax,%ax
  1003c1:	66 90                	xchg   %ax,%ax
  1003c3:	66 90                	xchg   %ax,%ax
  1003c5:	66 90                	xchg   %ax,%ax
  1003c7:	66 90                	xchg   %ax,%ax
  1003c9:	66 90                	xchg   %ax,%ax
  1003cb:	66 90                	xchg   %ax,%ax
  1003cd:	66 90                	xchg   %ax,%ax
  1003cf:	66 90                	xchg   %ax,%ax
  1003d1:	66 90                	xchg   %ax,%ax
  1003d3:	66 90                	xchg   %ax,%ax
  1003d5:	66 90                	xchg   %ax,%ax
  1003d7:	66 90                	xchg   %ax,%ax
  1003d9:	66 90                	xchg   %ax,%ax
  1003db:	66 90                	xchg   %ax,%ax
  1003dd:	66 90                	xchg   %ax,%ax
  1003df:	66 90                	xchg   %ax,%ax
  1003e1:	66 90                	xchg   %ax,%ax
  1003e3:	66 90                	xchg   %ax,%ax
  1003e5:	66 90                	xchg   %ax,%ax
  1003e7:	66 90                	xchg   %ax,%ax
  1003e9:	66 90                	xchg   %ax,%ax
  1003eb:	66 90                	xchg   %ax,%ax
  1003ed:	66 90                	xchg   %ax,%ax
  1003ef:	66 90                	xchg   %ax,%ax
  1003f1:	66 90                	xchg   %ax,%ax
  1003f3:	66 90                	xchg   %ax,%ax
  1003f5:	66 90                	xchg   %ax,%ax
  1003f7:	66 90                	xchg   %ax,%ax
  1003f9:	66 90                	xchg   %ax,%ax
  1003fb:	66 90                	xchg   %ax,%ax
  1003fd:	66 90                	xchg   %ax,%ax
  1003ff:	66 90                	xchg   %ax,%ax
  100401:	66 90                	xchg   %ax,%ax
  100403:	66 90                	xchg   %ax,%ax
  100405:	66 90                	xchg   %ax,%ax
  100407:	66 90                	xchg   %ax,%ax
  100409:	66 90                	xchg   %ax,%ax
  10040b:	66 90                	xchg   %ax,%ax
  10040d:	66 90                	xchg   %ax,%ax
  10040f:	66 90                	xchg   %ax,%ax
  100411:	66 90                	xchg   %ax,%ax
  100413:	66 90                	xchg   %ax,%ax
  100415:	66 90                	xchg   %ax,%ax
  100417:	66 90                	xchg   %ax,%ax
  100419:	66 90                	xchg   %ax,%ax
  10041b:	66 90                	xchg   %ax,%ax
  10041d:	66 90                	xchg   %ax,%ax
  10041f:	66 90                	xchg   %ax,%ax
  100421:	66 90                	xchg   %ax,%ax
  100423:	66 90                	xchg   %ax,%ax
  100425:	66 90                	xchg   %ax,%ax
  100427:	66 90                	xchg   %ax,%ax
  100429:	66 90                	xchg   %ax,%ax
  10042b:	66 90                	xchg   %ax,%ax
  10042d:	66 90                	xchg   %ax,%ax
  10042f:	66 90                	xchg   %ax,%ax
  100431:	66 90                	xchg   %ax,%ax
  100433:	66 90                	xchg   %ax,%ax
  100435:	66 90                	xchg   %ax,%ax
  100437:	66 90                	xchg   %ax,%ax
  100439:	66 90                	xchg   %ax,%ax
  10043b:	66 90                	xchg   %ax,%ax
  10043d:	66 90                	xchg   %ax,%ax
  10043f:	66 90                	xchg   %ax,%ax
  100441:	66 90                	xchg   %ax,%ax
  100443:	66 90                	xchg   %ax,%ax
  100445:	66 90                	xchg   %ax,%ax
  100447:	66 90                	xchg   %ax,%ax
  100449:	66 90                	xchg   %ax,%ax
  10044b:	66 90                	xchg   %ax,%ax
  10044d:	66 90                	xchg   %ax,%ax
  10044f:	66 90                	xchg   %ax,%ax
  100451:	66 90                	xchg   %ax,%ax
  100453:	66 90                	xchg   %ax,%ax
  100455:	66 90                	xchg   %ax,%ax
  100457:	66 90                	xchg   %ax,%ax
  100459:	66 90                	xchg   %ax,%ax
  10045b:	66 90                	xchg   %ax,%ax
  10045d:	66 90                	xchg   %ax,%ax
  10045f:	66 90                	xchg   %ax,%ax
  100461:	66 90                	xchg   %ax,%ax
  100463:	66 90                	xchg   %ax,%ax
  100465:	66 90                	xchg   %ax,%ax
  100467:	66 90                	xchg   %ax,%ax
  100469:	66 90                	xchg   %ax,%ax
  10046b:	66 90                	xchg   %ax,%ax
  10046d:	66 90                	xchg   %ax,%ax
  10046f:	66 90                	xchg   %ax,%ax
  100471:	66 90                	xchg   %ax,%ax
  100473:	66 90                	xchg   %ax,%ax
  100475:	66 90                	xchg   %ax,%ax
  100477:	66 90                	xchg   %ax,%ax
  100479:	66 90                	xchg   %ax,%ax
  10047b:	66 90                	xchg   %ax,%ax
  10047d:	66 90                	xchg   %ax,%ax
  10047f:	66 90                	xchg   %ax,%ax
  100481:	66 90                	xchg   %ax,%ax
  100483:	66 90                	xchg   %ax,%ax
  100485:	66 90                	xchg   %ax,%ax
  100487:	66 90                	xchg   %ax,%ax
  100489:	66 90                	xchg   %ax,%ax
  10048b:	66 90                	xchg   %ax,%ax
  10048d:	66 90                	xchg   %ax,%ax
  10048f:	66 90                	xchg   %ax,%ax
  100491:	66 90                	xchg   %ax,%ax
  100493:	66 90                	xchg   %ax,%ax
  100495:	66 90                	xchg   %ax,%ax
  100497:	66 90                	xchg   %ax,%ax
  100499:	66 90                	xchg   %ax,%ax
  10049b:	66 90                	xchg   %ax,%ax
  10049d:	66 90                	xchg   %ax,%ax
  10049f:	66 90                	xchg   %ax,%ax
  1004a1:	66 90                	xchg   %ax,%ax
  1004a3:	66 90                	xchg   %ax,%ax
  1004a5:	66 90                	xchg   %ax,%ax
  1004a7:	66 90                	xchg   %ax,%ax
  1004a9:	66 90                	xchg   %ax,%ax
  1004ab:	66 90                	xchg   %ax,%ax
  1004ad:	66 90                	xchg   %ax,%ax
  1004af:	66 90                	xchg   %ax,%ax
  1004b1:	66 90                	xchg   %ax,%ax
  1004b3:	66 90                	xchg   %ax,%ax
  1004b5:	66 90                	xchg   %ax,%ax
  1004b7:	66 90                	xchg   %ax,%ax
  1004b9:	66 90                	xchg   %ax,%ax
  1004bb:	66 90                	xchg   %ax,%ax
  1004bd:	66 90                	xchg   %ax,%ax
  1004bf:	66 90                	xchg   %ax,%ax
  1004c1:	66 90                	xchg   %ax,%ax
  1004c3:	66 90                	xchg   %ax,%ax
  1004c5:	66 90                	xchg   %ax,%ax
  1004c7:	66 90                	xchg   %ax,%ax
  1004c9:	66 90                	xchg   %ax,%ax
  1004cb:	66 90                	xchg   %ax,%ax
  1004cd:	66 90                	xchg   %ax,%ax
  1004cf:	66 90                	xchg   %ax,%ax
  1004d1:	66 90                	xchg   %ax,%ax
  1004d3:	66 90                	xchg   %ax,%ax
  1004d5:	66 90                	xchg   %ax,%ax
  1004d7:	66 90                	xchg   %ax,%ax
  1004d9:	66 90                	xchg   %ax,%ax
  1004db:	66 90                	xchg   %ax,%ax
  1004dd:	66 90                	xchg   %ax,%ax
  1004df:	66 90                	xchg   %ax,%ax
  1004e1:	66 90                	xchg   %ax,%ax
  1004e3:	66 90                	xchg   %ax,%ax
  1004e5:	66 90                	xchg   %ax,%ax
  1004e7:	66 90                	xchg   %ax,%ax
  1004e9:	66 90                	xchg   %ax,%ax
  1004eb:	66 90                	xchg   %ax,%ax
  1004ed:	66 90                	xchg   %ax,%ax
  1004ef:	66 90                	xchg   %ax,%ax
  1004f1:	66 90                	xchg   %ax,%ax
  1004f3:	66 90                	xchg   %ax,%ax
  1004f5:	66 90                	xchg   %ax,%ax
  1004f7:	66 90                	xchg   %ax,%ax
  1004f9:	66 90                	xchg   %ax,%ax
  1004fb:	66 90                	xchg   %ax,%ax
  1004fd:	66 90                	xchg   %ax,%ax
  1004ff:	66 90                	xchg   %ax,%ax
  100501:	66 90                	xchg   %ax,%ax
  100503:	66 90                	xchg   %ax,%ax
  100505:	66 90                	xchg   %ax,%ax
  100507:	66 90                	xchg   %ax,%ax
  100509:	66 90                	xchg   %ax,%ax
  10050b:	66 90                	xchg   %ax,%ax
  10050d:	66 90                	xchg   %ax,%ax
  10050f:	66 90                	xchg   %ax,%ax
  100511:	66 90                	xchg   %ax,%ax
  100513:	66 90                	xchg   %ax,%ax
  100515:	66 90                	xchg   %ax,%ax
  100517:	66 90                	xchg   %ax,%ax
  100519:	66 90                	xchg   %ax,%ax
  10051b:	66 90                	xchg   %ax,%ax
  10051d:	66 90                	xchg   %ax,%ax
  10051f:	66 90                	xchg   %ax,%ax
  100521:	66 90                	xchg   %ax,%ax
  100523:	66 90                	xchg   %ax,%ax
  100525:	66 90                	xchg   %ax,%ax
  100527:	66 90                	xchg   %ax,%ax
  100529:	66 90                	xchg   %ax,%ax
  10052b:	66 90                	xchg   %ax,%ax
  10052d:	66 90                	xchg   %ax,%ax
  10052f:	66 90                	xchg   %ax,%ax
  100531:	66 90                	xchg   %ax,%ax
  100533:	66 90                	xchg   %ax,%ax
  100535:	66 90                	xchg   %ax,%ax
  100537:	66 90                	xchg   %ax,%ax
  100539:	66 90                	xchg   %ax,%ax
  10053b:	66 90                	xchg   %ax,%ax
  10053d:	66 90                	xchg   %ax,%ax
  10053f:	66 90                	xchg   %ax,%ax
  100541:	66 90                	xchg   %ax,%ax
  100543:	66 90                	xchg   %ax,%ax
  100545:	66 90                	xchg   %ax,%ax
  100547:	66 90                	xchg   %ax,%ax
  100549:	66 90                	xchg   %ax,%ax
  10054b:	66 90                	xchg   %ax,%ax
  10054d:	66 90                	xchg   %ax,%ax
  10054f:	66 90                	xchg   %ax,%ax
  100551:	66 90                	xchg   %ax,%ax
  100553:	66 90                	xchg   %ax,%ax
  100555:	66 90                	xchg   %ax,%ax
  100557:	66 90                	xchg   %ax,%ax
  100559:	66 90                	xchg   %ax,%ax
  10055b:	66 90                	xchg   %ax,%ax
  10055d:	66 90                	xchg   %ax,%ax
  10055f:	66 90                	xchg   %ax,%ax
  100561:	66 90                	xchg   %ax,%ax
  100563:	66 90                	xchg   %ax,%ax
  100565:	66 90                	xchg   %ax,%ax
  100567:	66 90                	xchg   %ax,%ax
  100569:	66 90                	xchg   %ax,%ax
  10056b:	66 90                	xchg   %ax,%ax
  10056d:	66 90                	xchg   %ax,%ax
  10056f:	66 90                	xchg   %ax,%ax
  100571:	66 90                	xchg   %ax,%ax
  100573:	66 90                	xchg   %ax,%ax
  100575:	66 90                	xchg   %ax,%ax
  100577:	66 90                	xchg   %ax,%ax
  100579:	66 90                	xchg   %ax,%ax
  10057b:	66 90                	xchg   %ax,%ax
  10057d:	66 90                	xchg   %ax,%ax
  10057f:	66 90                	xchg   %ax,%ax
  100581:	66 90                	xchg   %ax,%ax
  100583:	66 90                	xchg   %ax,%ax
  100585:	66 90                	xchg   %ax,%ax
  100587:	66 90                	xchg   %ax,%ax
  100589:	66 90                	xchg   %ax,%ax
  10058b:	66 90                	xchg   %ax,%ax
  10058d:	66 90                	xchg   %ax,%ax
  10058f:	66 90                	xchg   %ax,%ax
  100591:	66 90                	xchg   %ax,%ax
  100593:	66 90                	xchg   %ax,%ax
  100595:	66 90                	xchg   %ax,%ax
  100597:	66 90                	xchg   %ax,%ax
  100599:	66 90                	xchg   %ax,%ax
  10059b:	66 90                	xchg   %ax,%ax
  10059d:	66 90                	xchg   %ax,%ax
  10059f:	66 90                	xchg   %ax,%ax
  1005a1:	66 90                	xchg   %ax,%ax
  1005a3:	66 90                	xchg   %ax,%ax
  1005a5:	66 90                	xchg   %ax,%ax
  1005a7:	66 90                	xchg   %ax,%ax
  1005a9:	66 90                	xchg   %ax,%ax
  1005ab:	66 90                	xchg   %ax,%ax
  1005ad:	66 90                	xchg   %ax,%ax
  1005af:	66 90                	xchg   %ax,%ax
  1005b1:	66 90                	xchg   %ax,%ax
  1005b3:	66 90                	xchg   %ax,%ax
  1005b5:	66 90                	xchg   %ax,%ax
  1005b7:	66 90                	xchg   %ax,%ax
  1005b9:	66 90                	xchg   %ax,%ax
  1005bb:	66 90                	xchg   %ax,%ax
  1005bd:	66 90                	xchg   %ax,%ax
  1005bf:	66 90                	xchg   %ax,%ax
  1005c1:	66 90                	xchg   %ax,%ax
  1005c3:	66 90                	xchg   %ax,%ax
  1005c5:	66 90                	xchg   %ax,%ax
  1005c7:	66 90                	xchg   %ax,%ax
  1005c9:	66 90                	xchg   %ax,%ax
  1005cb:	66 90                	xchg   %ax,%ax
  1005cd:	66 90                	xchg   %ax,%ax
  1005cf:	66 90                	xchg   %ax,%ax
  1005d1:	66 90                	xchg   %ax,%ax
  1005d3:	66 90                	xchg   %ax,%ax
  1005d5:	66 90                	xchg   %ax,%ax
  1005d7:	66 90                	xchg   %ax,%ax
  1005d9:	66 90                	xchg   %ax,%ax
  1005db:	66 90                	xchg   %ax,%ax
  1005dd:	66 90                	xchg   %ax,%ax
  1005df:	66 90                	xchg   %ax,%ax
  1005e1:	66 90                	xchg   %ax,%ax
  1005e3:	66 90                	xchg   %ax,%ax
  1005e5:	66 90                	xchg   %ax,%ax
  1005e7:	66 90                	xchg   %ax,%ax
  1005e9:	66 90                	xchg   %ax,%ax
  1005eb:	66 90                	xchg   %ax,%ax
  1005ed:	66 90                	xchg   %ax,%ax
  1005ef:	66 90                	xchg   %ax,%ax
  1005f1:	66 90                	xchg   %ax,%ax
  1005f3:	66 90                	xchg   %ax,%ax
  1005f5:	66 90                	xchg   %ax,%ax
  1005f7:	66 90                	xchg   %ax,%ax
  1005f9:	66 90                	xchg   %ax,%ax
  1005fb:	66 90                	xchg   %ax,%ax
  1005fd:	66 90                	xchg   %ax,%ax
  1005ff:	66 90                	xchg   %ax,%ax
  100601:	66 90                	xchg   %ax,%ax
  100603:	66 90                	xchg   %ax,%ax
  100605:	66 90                	xchg   %ax,%ax
  100607:	66 90                	xchg   %ax,%ax
  100609:	66 90                	xchg   %ax,%ax
  10060b:	66 90                	xchg   %ax,%ax
  10060d:	66 90                	xchg   %ax,%ax
  10060f:	66 90                	xchg   %ax,%ax
  100611:	66 90                	xchg   %ax,%ax
  100613:	66 90                	xchg   %ax,%ax
  100615:	66 90                	xchg   %ax,%ax
  100617:	66 90                	xchg   %ax,%ax
  100619:	66 90                	xchg   %ax,%ax
  10061b:	66 90                	xchg   %ax,%ax
  10061d:	66 90                	xchg   %ax,%ax
  10061f:	66 90                	xchg   %ax,%ax
  100621:	66 90                	xchg   %ax,%ax
  100623:	66 90                	xchg   %ax,%ax
  100625:	66 90                	xchg   %ax,%ax
  100627:	66 90                	xchg   %ax,%ax
  100629:	66 90                	xchg   %ax,%ax
  10062b:	66 90                	xchg   %ax,%ax
  10062d:	66 90                	xchg   %ax,%ax
  10062f:	66 90                	xchg   %ax,%ax
  100631:	66 90                	xchg   %ax,%ax
  100633:	66 90                	xchg   %ax,%ax
  100635:	66 90                	xchg   %ax,%ax
  100637:	66 90                	xchg   %ax,%ax
  100639:	66 90                	xchg   %ax,%ax
  10063b:	66 90                	xchg   %ax,%ax
  10063d:	66 90                	xchg   %ax,%ax
  10063f:	66 90                	xchg   %ax,%ax
  100641:	66 90                	xchg   %ax,%ax
  100643:	66 90                	xchg   %ax,%ax
  100645:	66 90                	xchg   %ax,%ax
  100647:	66 90                	xchg   %ax,%ax
  100649:	66 90                	xchg   %ax,%ax
  10064b:	66 90                	xchg   %ax,%ax
  10064d:	66 90                	xchg   %ax,%ax
  10064f:	66 90                	xchg   %ax,%ax
  100651:	66 90                	xchg   %ax,%ax
  100653:	66 90                	xchg   %ax,%ax
  100655:	66 90                	xchg   %ax,%ax
  100657:	66 90                	xchg   %ax,%ax
  100659:	66 90                	xchg   %ax,%ax
  10065b:	66 90                	xchg   %ax,%ax
  10065d:	66 90                	xchg   %ax,%ax
  10065f:	66 90                	xchg   %ax,%ax
  100661:	66 90                	xchg   %ax,%ax
  100663:	66 90                	xchg   %ax,%ax
  100665:	66 90                	xchg   %ax,%ax
  100667:	66 90                	xchg   %ax,%ax
  100669:	66 90                	xchg   %ax,%ax
  10066b:	66 90                	xchg   %ax,%ax
  10066d:	66 90                	xchg   %ax,%ax
  10066f:	66 90                	xchg   %ax,%ax
  100671:	66 90                	xchg   %ax,%ax
  100673:	66 90                	xchg   %ax,%ax
  100675:	66 90                	xchg   %ax,%ax
  100677:	66 90                	xchg   %ax,%ax
  100679:	66 90                	xchg   %ax,%ax
  10067b:	66 90                	xchg   %ax,%ax
  10067d:	66 90                	xchg   %ax,%ax
  10067f:	66 90                	xchg   %ax,%ax
  100681:	66 90                	xchg   %ax,%ax
  100683:	66 90                	xchg   %ax,%ax
  100685:	66 90                	xchg   %ax,%ax
  100687:	66 90                	xchg   %ax,%ax
  100689:	66 90                	xchg   %ax,%ax
  10068b:	66 90                	xchg   %ax,%ax
  10068d:	66 90                	xchg   %ax,%ax
  10068f:	66 90                	xchg   %ax,%ax
  100691:	66 90                	xchg   %ax,%ax
  100693:	66 90                	xchg   %ax,%ax
  100695:	66 90                	xchg   %ax,%ax
  100697:	66 90                	xchg   %ax,%ax
  100699:	66 90                	xchg   %ax,%ax
  10069b:	66 90                	xchg   %ax,%ax
  10069d:	66 90                	xchg   %ax,%ax
  10069f:	66 90                	xchg   %ax,%ax
  1006a1:	66 90                	xchg   %ax,%ax
  1006a3:	66 90                	xchg   %ax,%ax
  1006a5:	66 90                	xchg   %ax,%ax
  1006a7:	66 90                	xchg   %ax,%ax
  1006a9:	66 90                	xchg   %ax,%ax
  1006ab:	66 90                	xchg   %ax,%ax
  1006ad:	66 90                	xchg   %ax,%ax
  1006af:	66 90                	xchg   %ax,%ax
  1006b1:	66 90                	xchg   %ax,%ax
  1006b3:	66 90                	xchg   %ax,%ax
  1006b5:	66 90                	xchg   %ax,%ax
  1006b7:	66 90                	xchg   %ax,%ax
  1006b9:	66 90                	xchg   %ax,%ax
  1006bb:	66 90                	xchg   %ax,%ax
  1006bd:	66 90                	xchg   %ax,%ax
  1006bf:	66 90                	xchg   %ax,%ax
  1006c1:	66 90                	xchg   %ax,%ax
  1006c3:	66 90                	xchg   %ax,%ax
  1006c5:	66 90                	xchg   %ax,%ax
  1006c7:	66 90                	xchg   %ax,%ax
  1006c9:	66 90                	xchg   %ax,%ax
  1006cb:	66 90                	xchg   %ax,%ax
  1006cd:	66 90                	xchg   %ax,%ax
  1006cf:	66 90                	xchg   %ax,%ax
  1006d1:	66 90                	xchg   %ax,%ax
  1006d3:	66 90                	xchg   %ax,%ax
  1006d5:	66 90                	xchg   %ax,%ax
  1006d7:	66 90                	xchg   %ax,%ax
  1006d9:	66 90                	xchg   %ax,%ax
  1006db:	66 90                	xchg   %ax,%ax
  1006dd:	66 90                	xchg   %ax,%ax
  1006df:	66 90                	xchg   %ax,%ax
  1006e1:	66 90                	xchg   %ax,%ax
  1006e3:	66 90                	xchg   %ax,%ax
  1006e5:	66 90                	xchg   %ax,%ax
  1006e7:	66 90                	xchg   %ax,%ax
  1006e9:	66 90                	xchg   %ax,%ax
  1006eb:	66 90                	xchg   %ax,%ax
  1006ed:	66 90                	xchg   %ax,%ax
  1006ef:	66 90                	xchg   %ax,%ax
  1006f1:	66 90                	xchg   %ax,%ax
  1006f3:	66 90                	xchg   %ax,%ax
  1006f5:	66 90                	xchg   %ax,%ax
  1006f7:	66 90                	xchg   %ax,%ax
  1006f9:	66 90                	xchg   %ax,%ax
  1006fb:	66 90                	xchg   %ax,%ax
  1006fd:	66 90                	xchg   %ax,%ax
  1006ff:	66 90                	xchg   %ax,%ax
  100701:	66 90                	xchg   %ax,%ax
  100703:	66 90                	xchg   %ax,%ax
  100705:	66 90                	xchg   %ax,%ax
  100707:	66 90                	xchg   %ax,%ax
  100709:	66 90                	xchg   %ax,%ax
  10070b:	66 90                	xchg   %ax,%ax
  10070d:	66 90                	xchg   %ax,%ax
  10070f:	66 90                	xchg   %ax,%ax
  100711:	66 90                	xchg   %ax,%ax
  100713:	66 90                	xchg   %ax,%ax
  100715:	66 90                	xchg   %ax,%ax
  100717:	66 90                	xchg   %ax,%ax
  100719:	66 90                	xchg   %ax,%ax
  10071b:	66 90                	xchg   %ax,%ax
  10071d:	66 90                	xchg   %ax,%ax
  10071f:	66 90                	xchg   %ax,%ax
  100721:	66 90                	xchg   %ax,%ax
  100723:	66 90                	xchg   %ax,%ax
  100725:	66 90                	xchg   %ax,%ax
  100727:	66 90                	xchg   %ax,%ax
  100729:	66 90                	xchg   %ax,%ax
  10072b:	66 90                	xchg   %ax,%ax
  10072d:	66 90                	xchg   %ax,%ax
  10072f:	66 90                	xchg   %ax,%ax
  100731:	66 90                	xchg   %ax,%ax
  100733:	66 90                	xchg   %ax,%ax
  100735:	66 90                	xchg   %ax,%ax
  100737:	66 90                	xchg   %ax,%ax
  100739:	66 90                	xchg   %ax,%ax
  10073b:	66 90                	xchg   %ax,%ax
  10073d:	66 90                	xchg   %ax,%ax
  10073f:	66 90                	xchg   %ax,%ax
  100741:	66 90                	xchg   %ax,%ax
  100743:	66 90                	xchg   %ax,%ax
  100745:	66 90                	xchg   %ax,%ax
  100747:	66 90                	xchg   %ax,%ax
  100749:	66 90                	xchg   %ax,%ax
  10074b:	66 90                	xchg   %ax,%ax
  10074d:	66 90                	xchg   %ax,%ax
  10074f:	66 90                	xchg   %ax,%ax
  100751:	66 90                	xchg   %ax,%ax
  100753:	66 90                	xchg   %ax,%ax
  100755:	66 90                	xchg   %ax,%ax
  100757:	66 90                	xchg   %ax,%ax
  100759:	66 90                	xchg   %ax,%ax
  10075b:	66 90                	xchg   %ax,%ax
  10075d:	66 90                	xchg   %ax,%ax
  10075f:	66 90                	xchg   %ax,%ax
  100761:	66 90                	xchg   %ax,%ax
  100763:	66 90                	xchg   %ax,%ax
  100765:	66 90                	xchg   %ax,%ax
  100767:	66 90                	xchg   %ax,%ax
  100769:	66 90                	xchg   %ax,%ax
  10076b:	66 90                	xchg   %ax,%ax
  10076d:	66 90                	xchg   %ax,%ax
  10076f:	66 90                	xchg   %ax,%ax
  100771:	66 90                	xchg   %ax,%ax
  100773:	66 90                	xchg   %ax,%ax
  100775:	66 90                	xchg   %ax,%ax
  100777:	66 90                	xchg   %ax,%ax
  100779:	66 90                	xchg   %ax,%ax
  10077b:	66 90                	xchg   %ax,%ax
  10077d:	66 90                	xchg   %ax,%ax
  10077f:	66 90                	xchg   %ax,%ax
  100781:	66 90                	xchg   %ax,%ax
  100783:	66 90                	xchg   %ax,%ax
  100785:	66 90                	xchg   %ax,%ax
  100787:	66 90                	xchg   %ax,%ax
  100789:	66 90                	xchg   %ax,%ax
  10078b:	66 90                	xchg   %ax,%ax
  10078d:	66 90                	xchg   %ax,%ax
  10078f:	66 90                	xchg   %ax,%ax
  100791:	66 90                	xchg   %ax,%ax
  100793:	66 90                	xchg   %ax,%ax
  100795:	66 90                	xchg   %ax,%ax
  100797:	66 90                	xchg   %ax,%ax
  100799:	66 90                	xchg   %ax,%ax
  10079b:	66 90                	xchg   %ax,%ax
  10079d:	66 90                	xchg   %ax,%ax
  10079f:	66 90                	xchg   %ax,%ax
  1007a1:	66 90                	xchg   %ax,%ax
  1007a3:	66 90                	xchg   %ax,%ax
  1007a5:	66 90                	xchg   %ax,%ax
  1007a7:	66 90                	xchg   %ax,%ax
  1007a9:	66 90                	xchg   %ax,%ax
  1007ab:	66 90                	xchg   %ax,%ax
  1007ad:	66 90                	xchg   %ax,%ax
  1007af:	66 90                	xchg   %ax,%ax
  1007b1:	66 90                	xchg   %ax,%ax
  1007b3:	66 90                	xchg   %ax,%ax
  1007b5:	66 90                	xchg   %ax,%ax
  1007b7:	66 90                	xchg   %ax,%ax
  1007b9:	66 90                	xchg   %ax,%ax
  1007bb:	66 90                	xchg   %ax,%ax
  1007bd:	66 90                	xchg   %ax,%ax
  1007bf:	66 90                	xchg   %ax,%ax
  1007c1:	66 90                	xchg   %ax,%ax
  1007c3:	66 90                	xchg   %ax,%ax
  1007c5:	66 90                	xchg   %ax,%ax
  1007c7:	66 90                	xchg   %ax,%ax
  1007c9:	66 90                	xchg   %ax,%ax
  1007cb:	66 90                	xchg   %ax,%ax
  1007cd:	66 90                	xchg   %ax,%ax
  1007cf:	66 90                	xchg   %ax,%ax
  1007d1:	66 90                	xchg   %ax,%ax
  1007d3:	66 90                	xchg   %ax,%ax
  1007d5:	66 90                	xchg   %ax,%ax
  1007d7:	66 90                	xchg   %ax,%ax
  1007d9:	66 90                	xchg   %ax,%ax
  1007db:	66 90                	xchg   %ax,%ax
  1007dd:	66 90                	xchg   %ax,%ax
  1007df:	66 90                	xchg   %ax,%ax
  1007e1:	66 90                	xchg   %ax,%ax
  1007e3:	66 90                	xchg   %ax,%ax
  1007e5:	66 90                	xchg   %ax,%ax
  1007e7:	66 90                	xchg   %ax,%ax
  1007e9:	66 90                	xchg   %ax,%ax
  1007eb:	66 90                	xchg   %ax,%ax
  1007ed:	66 90                	xchg   %ax,%ax
  1007ef:	66 90                	xchg   %ax,%ax
  1007f1:	66 90                	xchg   %ax,%ax
  1007f3:	66 90                	xchg   %ax,%ax
  1007f5:	66 90                	xchg   %ax,%ax
  1007f7:	66 90                	xchg   %ax,%ax
  1007f9:	66 90                	xchg   %ax,%ax
  1007fb:	66 90                	xchg   %ax,%ax
  1007fd:	66 90                	xchg   %ax,%ax
  1007ff:	66 90                	xchg   %ax,%ax
  100801:	66 90                	xchg   %ax,%ax
  100803:	66 90                	xchg   %ax,%ax
  100805:	66 90                	xchg   %ax,%ax
  100807:	66 90                	xchg   %ax,%ax
  100809:	66 90                	xchg   %ax,%ax
  10080b:	66 90                	xchg   %ax,%ax
  10080d:	66 90                	xchg   %ax,%ax
  10080f:	66 90                	xchg   %ax,%ax
  100811:	66 90                	xchg   %ax,%ax
  100813:	66 90                	xchg   %ax,%ax
  100815:	66 90                	xchg   %ax,%ax
  100817:	66 90                	xchg   %ax,%ax
  100819:	66 90                	xchg   %ax,%ax
  10081b:	66 90                	xchg   %ax,%ax
  10081d:	66 90                	xchg   %ax,%ax
  10081f:	66 90                	xchg   %ax,%ax
  100821:	66 90                	xchg   %ax,%ax
  100823:	66 90                	xchg   %ax,%ax
  100825:	66 90                	xchg   %ax,%ax
  100827:	66 90                	xchg   %ax,%ax
  100829:	66 90                	xchg   %ax,%ax
  10082b:	66 90                	xchg   %ax,%ax
  10082d:	66 90                	xchg   %ax,%ax
  10082f:	66 90                	xchg   %ax,%ax
  100831:	66 90                	xchg   %ax,%ax
  100833:	66 90                	xchg   %ax,%ax
  100835:	66 90                	xchg   %ax,%ax
  100837:	66 90                	xchg   %ax,%ax
  100839:	66 90                	xchg   %ax,%ax
  10083b:	66 90                	xchg   %ax,%ax
  10083d:	66 90                	xchg   %ax,%ax
  10083f:	66 90                	xchg   %ax,%ax
  100841:	66 90                	xchg   %ax,%ax
  100843:	66 90                	xchg   %ax,%ax
  100845:	66 90                	xchg   %ax,%ax
  100847:	66 90                	xchg   %ax,%ax
  100849:	66 90                	xchg   %ax,%ax
  10084b:	66 90                	xchg   %ax,%ax
  10084d:	66 90                	xchg   %ax,%ax
  10084f:	66 90                	xchg   %ax,%ax
  100851:	66 90                	xchg   %ax,%ax
  100853:	66 90                	xchg   %ax,%ax
  100855:	66 90                	xchg   %ax,%ax
  100857:	66 90                	xchg   %ax,%ax
  100859:	66 90                	xchg   %ax,%ax
  10085b:	66 90                	xchg   %ax,%ax
  10085d:	66 90                	xchg   %ax,%ax
  10085f:	66 90                	xchg   %ax,%ax
  100861:	66 90                	xchg   %ax,%ax
  100863:	66 90                	xchg   %ax,%ax
  100865:	66 90                	xchg   %ax,%ax
  100867:	66 90                	xchg   %ax,%ax
  100869:	66 90                	xchg   %ax,%ax
  10086b:	66 90                	xchg   %ax,%ax
  10086d:	66 90                	xchg   %ax,%ax
  10086f:	66 90                	xchg   %ax,%ax
  100871:	66 90                	xchg   %ax,%ax
  100873:	66 90                	xchg   %ax,%ax
  100875:	66 90                	xchg   %ax,%ax
  100877:	66 90                	xchg   %ax,%ax
  100879:	66 90                	xchg   %ax,%ax
  10087b:	66 90                	xchg   %ax,%ax
  10087d:	66 90                	xchg   %ax,%ax
  10087f:	66 90                	xchg   %ax,%ax
  100881:	66 90                	xchg   %ax,%ax
  100883:	66 90                	xchg   %ax,%ax
  100885:	66 90                	xchg   %ax,%ax
  100887:	66 90                	xchg   %ax,%ax
  100889:	66 90                	xchg   %ax,%ax
  10088b:	66 90                	xchg   %ax,%ax
  10088d:	66 90                	xchg   %ax,%ax
  10088f:	66 90                	xchg   %ax,%ax
  100891:	66 90                	xchg   %ax,%ax
  100893:	66 90                	xchg   %ax,%ax
  100895:	66 90                	xchg   %ax,%ax
  100897:	66 90                	xchg   %ax,%ax
  100899:	66 90                	xchg   %ax,%ax
  10089b:	66 90                	xchg   %ax,%ax
  10089d:	66 90                	xchg   %ax,%ax
  10089f:	66 90                	xchg   %ax,%ax
  1008a1:	66 90                	xchg   %ax,%ax
  1008a3:	66 90                	xchg   %ax,%ax
  1008a5:	66 90                	xchg   %ax,%ax
  1008a7:	66 90                	xchg   %ax,%ax
  1008a9:	66 90                	xchg   %ax,%ax
  1008ab:	66 90                	xchg   %ax,%ax
  1008ad:	66 90                	xchg   %ax,%ax
  1008af:	66 90                	xchg   %ax,%ax
  1008b1:	66 90                	xchg   %ax,%ax
  1008b3:	66 90                	xchg   %ax,%ax
  1008b5:	66 90                	xchg   %ax,%ax
  1008b7:	66 90                	xchg   %ax,%ax
  1008b9:	66 90                	xchg   %ax,%ax
  1008bb:	66 90                	xchg   %ax,%ax
  1008bd:	66 90                	xchg   %ax,%ax
  1008bf:	66 90                	xchg   %ax,%ax
  1008c1:	66 90                	xchg   %ax,%ax
  1008c3:	66 90                	xchg   %ax,%ax
  1008c5:	66 90                	xchg   %ax,%ax
  1008c7:	66 90                	xchg   %ax,%ax
  1008c9:	66 90                	xchg   %ax,%ax
  1008cb:	66 90                	xchg   %ax,%ax
  1008cd:	66 90                	xchg   %ax,%ax
  1008cf:	66 90                	xchg   %ax,%ax
  1008d1:	66 90                	xchg   %ax,%ax
  1008d3:	66 90                	xchg   %ax,%ax
  1008d5:	66 90                	xchg   %ax,%ax
  1008d7:	66 90                	xchg   %ax,%ax
  1008d9:	66 90                	xchg   %ax,%ax
  1008db:	66 90                	xchg   %ax,%ax
  1008dd:	66 90                	xchg   %ax,%ax
  1008df:	66 90                	xchg   %ax,%ax
  1008e1:	66 90                	xchg   %ax,%ax
  1008e3:	66 90                	xchg   %ax,%ax
  1008e5:	66 90                	xchg   %ax,%ax
  1008e7:	66 90                	xchg   %ax,%ax
  1008e9:	66 90                	xchg   %ax,%ax
  1008eb:	66 90                	xchg   %ax,%ax
  1008ed:	66 90                	xchg   %ax,%ax
  1008ef:	66 90                	xchg   %ax,%ax
  1008f1:	66 90                	xchg   %ax,%ax
  1008f3:	66 90                	xchg   %ax,%ax
  1008f5:	66 90                	xchg   %ax,%ax
  1008f7:	66 90                	xchg   %ax,%ax
  1008f9:	66 90                	xchg   %ax,%ax
  1008fb:	66 90                	xchg   %ax,%ax
  1008fd:	66 90                	xchg   %ax,%ax
  1008ff:	66 90                	xchg   %ax,%ax
  100901:	66 90                	xchg   %ax,%ax
  100903:	66 90                	xchg   %ax,%ax
  100905:	66 90                	xchg   %ax,%ax
  100907:	66 90                	xchg   %ax,%ax
  100909:	66 90                	xchg   %ax,%ax
  10090b:	66 90                	xchg   %ax,%ax
  10090d:	66 90                	xchg   %ax,%ax
  10090f:	66 90                	xchg   %ax,%ax
  100911:	66 90                	xchg   %ax,%ax
  100913:	66 90                	xchg   %ax,%ax
  100915:	66 90                	xchg   %ax,%ax
  100917:	66 90                	xchg   %ax,%ax
  100919:	66 90                	xchg   %ax,%ax
  10091b:	66 90                	xchg   %ax,%ax
  10091d:	66 90                	xchg   %ax,%ax
  10091f:	66 90                	xchg   %ax,%ax
  100921:	66 90                	xchg   %ax,%ax
  100923:	66 90                	xchg   %ax,%ax
  100925:	66 90                	xchg   %ax,%ax
  100927:	66 90                	xchg   %ax,%ax
  100929:	66 90                	xchg   %ax,%ax
  10092b:	66 90                	xchg   %ax,%ax
  10092d:	66 90                	xchg   %ax,%ax
  10092f:	66 90                	xchg   %ax,%ax
  100931:	66 90                	xchg   %ax,%ax
  100933:	66 90                	xchg   %ax,%ax
  100935:	66 90                	xchg   %ax,%ax
  100937:	66 90                	xchg   %ax,%ax
  100939:	66 90                	xchg   %ax,%ax
  10093b:	66 90                	xchg   %ax,%ax
  10093d:	66 90                	xchg   %ax,%ax
  10093f:	66 90                	xchg   %ax,%ax
  100941:	66 90                	xchg   %ax,%ax
  100943:	66 90                	xchg   %ax,%ax
  100945:	66 90                	xchg   %ax,%ax
  100947:	66 90                	xchg   %ax,%ax
  100949:	66 90                	xchg   %ax,%ax
  10094b:	66 90                	xchg   %ax,%ax
  10094d:	66 90                	xchg   %ax,%ax
  10094f:	66 90                	xchg   %ax,%ax
  100951:	66 90                	xchg   %ax,%ax
  100953:	66 90                	xchg   %ax,%ax
  100955:	66 90                	xchg   %ax,%ax
  100957:	66 90                	xchg   %ax,%ax
  100959:	66 90                	xchg   %ax,%ax
  10095b:	66 90                	xchg   %ax,%ax
  10095d:	66 90                	xchg   %ax,%ax
  10095f:	66 90                	xchg   %ax,%ax
  100961:	66 90                	xchg   %ax,%ax
  100963:	66 90                	xchg   %ax,%ax
  100965:	66 90                	xchg   %ax,%ax
  100967:	66 90                	xchg   %ax,%ax
  100969:	66 90                	xchg   %ax,%ax
  10096b:	66 90                	xchg   %ax,%ax
  10096d:	66 90                	xchg   %ax,%ax
  10096f:	66 90                	xchg   %ax,%ax
  100971:	66 90                	xchg   %ax,%ax
  100973:	66 90                	xchg   %ax,%ax
  100975:	66 90                	xchg   %ax,%ax
  100977:	66 90                	xchg   %ax,%ax
  100979:	66 90                	xchg   %ax,%ax
  10097b:	66 90                	xchg   %ax,%ax
  10097d:	66 90                	xchg   %ax,%ax
  10097f:	66 90                	xchg   %ax,%ax
  100981:	66 90                	xchg   %ax,%ax
  100983:	66 90                	xchg   %ax,%ax
  100985:	66 90                	xchg   %ax,%ax
  100987:	66 90                	xchg   %ax,%ax
  100989:	66 90                	xchg   %ax,%ax
  10098b:	66 90                	xchg   %ax,%ax
  10098d:	66 90                	xchg   %ax,%ax
  10098f:	66 90                	xchg   %ax,%ax
  100991:	66 90                	xchg   %ax,%ax
  100993:	66 90                	xchg   %ax,%ax
  100995:	66 90                	xchg   %ax,%ax
  100997:	66 90                	xchg   %ax,%ax
  100999:	66 90                	xchg   %ax,%ax
  10099b:	66 90                	xchg   %ax,%ax
  10099d:	66 90                	xchg   %ax,%ax
  10099f:	66 90                	xchg   %ax,%ax
  1009a1:	66 90                	xchg   %ax,%ax
  1009a3:	66 90                	xchg   %ax,%ax
  1009a5:	66 90                	xchg   %ax,%ax
  1009a7:	66 90                	xchg   %ax,%ax
  1009a9:	66 90                	xchg   %ax,%ax
  1009ab:	66 90                	xchg   %ax,%ax
  1009ad:	66 90                	xchg   %ax,%ax
  1009af:	66 90                	xchg   %ax,%ax
  1009b1:	66 90                	xchg   %ax,%ax
  1009b3:	66 90                	xchg   %ax,%ax
  1009b5:	66 90                	xchg   %ax,%ax
  1009b7:	66 90                	xchg   %ax,%ax
  1009b9:	66 90                	xchg   %ax,%ax
  1009bb:	66 90                	xchg   %ax,%ax
  1009bd:	66 90                	xchg   %ax,%ax
  1009bf:	66 90                	xchg   %ax,%ax
  1009c1:	66 90                	xchg   %ax,%ax
  1009c3:	66 90                	xchg   %ax,%ax
  1009c5:	66 90                	xchg   %ax,%ax
  1009c7:	66 90                	xchg   %ax,%ax
  1009c9:	66 90                	xchg   %ax,%ax
  1009cb:	66 90                	xchg   %ax,%ax
  1009cd:	66 90                	xchg   %ax,%ax
  1009cf:	66 90                	xchg   %ax,%ax
  1009d1:	66 90                	xchg   %ax,%ax
  1009d3:	66 90                	xchg   %ax,%ax
  1009d5:	66 90                	xchg   %ax,%ax
  1009d7:	66 90                	xchg   %ax,%ax
  1009d9:	66 90                	xchg   %ax,%ax
  1009db:	66 90                	xchg   %ax,%ax
  1009dd:	66 90                	xchg   %ax,%ax
  1009df:	66 90                	xchg   %ax,%ax
  1009e1:	66 90                	xchg   %ax,%ax
  1009e3:	66 90                	xchg   %ax,%ax
  1009e5:	66 90                	xchg   %ax,%ax
  1009e7:	66 90                	xchg   %ax,%ax
  1009e9:	66 90                	xchg   %ax,%ax
  1009eb:	66 90                	xchg   %ax,%ax
  1009ed:	66 90                	xchg   %ax,%ax
  1009ef:	66 90                	xchg   %ax,%ax
  1009f1:	66 90                	xchg   %ax,%ax
  1009f3:	66 90                	xchg   %ax,%ax
  1009f5:	66 90                	xchg   %ax,%ax
  1009f7:	66 90                	xchg   %ax,%ax
  1009f9:	66 90                	xchg   %ax,%ax
  1009fb:	66 90                	xchg   %ax,%ax
  1009fd:	66 90                	xchg   %ax,%ax
  1009ff:	66 90                	xchg   %ax,%ax
  100a01:	66 90                	xchg   %ax,%ax
  100a03:	66 90                	xchg   %ax,%ax
  100a05:	66 90                	xchg   %ax,%ax
  100a07:	66 90                	xchg   %ax,%ax
  100a09:	66 90                	xchg   %ax,%ax
  100a0b:	66 90                	xchg   %ax,%ax
  100a0d:	66 90                	xchg   %ax,%ax
  100a0f:	66 90                	xchg   %ax,%ax
  100a11:	66 90                	xchg   %ax,%ax
  100a13:	66 90                	xchg   %ax,%ax
  100a15:	66 90                	xchg   %ax,%ax
  100a17:	66 90                	xchg   %ax,%ax
  100a19:	66 90                	xchg   %ax,%ax
  100a1b:	66 90                	xchg   %ax,%ax
  100a1d:	66 90                	xchg   %ax,%ax
  100a1f:	66 90                	xchg   %ax,%ax
  100a21:	66 90                	xchg   %ax,%ax
  100a23:	66 90                	xchg   %ax,%ax
  100a25:	66 90                	xchg   %ax,%ax
  100a27:	66 90                	xchg   %ax,%ax
  100a29:	66 90                	xchg   %ax,%ax
  100a2b:	66 90                	xchg   %ax,%ax
  100a2d:	66 90                	xchg   %ax,%ax
  100a2f:	66 90                	xchg   %ax,%ax
  100a31:	66 90                	xchg   %ax,%ax
  100a33:	66 90                	xchg   %ax,%ax
  100a35:	66 90                	xchg   %ax,%ax
  100a37:	66 90                	xchg   %ax,%ax
  100a39:	66 90                	xchg   %ax,%ax
  100a3b:	66 90                	xchg   %ax,%ax
  100a3d:	66 90                	xchg   %ax,%ax
  100a3f:	66 90                	xchg   %ax,%ax
  100a41:	66 90                	xchg   %ax,%ax
  100a43:	66 90                	xchg   %ax,%ax
  100a45:	66 90                	xchg   %ax,%ax
  100a47:	66 90                	xchg   %ax,%ax
  100a49:	66 90                	xchg   %ax,%ax
  100a4b:	66 90                	xchg   %ax,%ax
  100a4d:	66 90                	xchg   %ax,%ax
  100a4f:	66 90                	xchg   %ax,%ax
  100a51:	66 90                	xchg   %ax,%ax
  100a53:	66 90                	xchg   %ax,%ax
  100a55:	66 90                	xchg   %ax,%ax
  100a57:	66 90                	xchg   %ax,%ax
  100a59:	66 90                	xchg   %ax,%ax
  100a5b:	66 90                	xchg   %ax,%ax
  100a5d:	66 90                	xchg   %ax,%ax
  100a5f:	66 90                	xchg   %ax,%ax
  100a61:	66 90                	xchg   %ax,%ax
  100a63:	66 90                	xchg   %ax,%ax
  100a65:	66 90                	xchg   %ax,%ax
  100a67:	66 90                	xchg   %ax,%ax
  100a69:	66 90                	xchg   %ax,%ax
  100a6b:	66 90                	xchg   %ax,%ax
  100a6d:	66 90                	xchg   %ax,%ax
  100a6f:	66 90                	xchg   %ax,%ax
  100a71:	66 90                	xchg   %ax,%ax
  100a73:	66 90                	xchg   %ax,%ax
  100a75:	66 90                	xchg   %ax,%ax
  100a77:	66 90                	xchg   %ax,%ax
  100a79:	66 90                	xchg   %ax,%ax
  100a7b:	66 90                	xchg   %ax,%ax
  100a7d:	66 90                	xchg   %ax,%ax
  100a7f:	66 90                	xchg   %ax,%ax
  100a81:	66 90                	xchg   %ax,%ax
  100a83:	66 90                	xchg   %ax,%ax
  100a85:	66 90                	xchg   %ax,%ax
  100a87:	66 90                	xchg   %ax,%ax
  100a89:	66 90                	xchg   %ax,%ax
  100a8b:	66 90                	xchg   %ax,%ax
  100a8d:	66 90                	xchg   %ax,%ax
  100a8f:	66 90                	xchg   %ax,%ax
  100a91:	66 90                	xchg   %ax,%ax
  100a93:	66 90                	xchg   %ax,%ax
  100a95:	66 90                	xchg   %ax,%ax
  100a97:	66 90                	xchg   %ax,%ax
  100a99:	66 90                	xchg   %ax,%ax
  100a9b:	66 90                	xchg   %ax,%ax
  100a9d:	66 90                	xchg   %ax,%ax
  100a9f:	66 90                	xchg   %ax,%ax
  100aa1:	66 90                	xchg   %ax,%ax
  100aa3:	66 90                	xchg   %ax,%ax
  100aa5:	66 90                	xchg   %ax,%ax
  100aa7:	66 90                	xchg   %ax,%ax
  100aa9:	66 90                	xchg   %ax,%ax
  100aab:	66 90                	xchg   %ax,%ax
  100aad:	66 90                	xchg   %ax,%ax
  100aaf:	66 90                	xchg   %ax,%ax
  100ab1:	66 90                	xchg   %ax,%ax
  100ab3:	66 90                	xchg   %ax,%ax
  100ab5:	66 90                	xchg   %ax,%ax
  100ab7:	66 90                	xchg   %ax,%ax
  100ab9:	66 90                	xchg   %ax,%ax
  100abb:	66 90                	xchg   %ax,%ax
  100abd:	66 90                	xchg   %ax,%ax
  100abf:	66 90                	xchg   %ax,%ax
  100ac1:	66 90                	xchg   %ax,%ax
  100ac3:	66 90                	xchg   %ax,%ax
  100ac5:	66 90                	xchg   %ax,%ax
  100ac7:	66 90                	xchg   %ax,%ax
  100ac9:	66 90                	xchg   %ax,%ax
  100acb:	66 90                	xchg   %ax,%ax
  100acd:	66 90                	xchg   %ax,%ax
  100acf:	66 90                	xchg   %ax,%ax
  100ad1:	66 90                	xchg   %ax,%ax
  100ad3:	66 90                	xchg   %ax,%ax
  100ad5:	66 90                	xchg   %ax,%ax
  100ad7:	66 90                	xchg   %ax,%ax
  100ad9:	66 90                	xchg   %ax,%ax
  100adb:	66 90                	xchg   %ax,%ax
  100add:	66 90                	xchg   %ax,%ax
  100adf:	66 90                	xchg   %ax,%ax
  100ae1:	66 90                	xchg   %ax,%ax
  100ae3:	66 90                	xchg   %ax,%ax
  100ae5:	66 90                	xchg   %ax,%ax
  100ae7:	66 90                	xchg   %ax,%ax
  100ae9:	66 90                	xchg   %ax,%ax
  100aeb:	66 90                	xchg   %ax,%ax
  100aed:	66 90                	xchg   %ax,%ax
  100aef:	66 90                	xchg   %ax,%ax
  100af1:	66 90                	xchg   %ax,%ax
  100af3:	66 90                	xchg   %ax,%ax
  100af5:	66 90                	xchg   %ax,%ax
  100af7:	66 90                	xchg   %ax,%ax
  100af9:	66 90                	xchg   %ax,%ax
  100afb:	66 90                	xchg   %ax,%ax
  100afd:	66 90                	xchg   %ax,%ax
  100aff:	66 90                	xchg   %ax,%ax
  100b01:	66 90                	xchg   %ax,%ax
  100b03:	66 90                	xchg   %ax,%ax
  100b05:	66 90                	xchg   %ax,%ax
  100b07:	66 90                	xchg   %ax,%ax
  100b09:	66 90                	xchg   %ax,%ax
  100b0b:	66 90                	xchg   %ax,%ax
  100b0d:	66 90                	xchg   %ax,%ax
  100b0f:	66 90                	xchg   %ax,%ax
  100b11:	66 90                	xchg   %ax,%ax
  100b13:	66 90                	xchg   %ax,%ax
  100b15:	66 90                	xchg   %ax,%ax
  100b17:	66 90                	xchg   %ax,%ax
  100b19:	66 90                	xchg   %ax,%ax
  100b1b:	66 90                	xchg   %ax,%ax
  100b1d:	66 90                	xchg   %ax,%ax
  100b1f:	66 90                	xchg   %ax,%ax
  100b21:	66 90                	xchg   %ax,%ax
  100b23:	66 90                	xchg   %ax,%ax
  100b25:	66 90                	xchg   %ax,%ax
  100b27:	66 90                	xchg   %ax,%ax
  100b29:	66 90                	xchg   %ax,%ax
  100b2b:	66 90                	xchg   %ax,%ax
  100b2d:	66 90                	xchg   %ax,%ax
  100b2f:	66 90                	xchg   %ax,%ax
  100b31:	66 90                	xchg   %ax,%ax
  100b33:	66 90                	xchg   %ax,%ax
  100b35:	66 90                	xchg   %ax,%ax
  100b37:	66 90                	xchg   %ax,%ax
  100b39:	66 90                	xchg   %ax,%ax
  100b3b:	66 90                	xchg   %ax,%ax
  100b3d:	66 90                	xchg   %ax,%ax
  100b3f:	66 90                	xchg   %ax,%ax
  100b41:	66 90                	xchg   %ax,%ax
  100b43:	66 90                	xchg   %ax,%ax
  100b45:	66 90                	xchg   %ax,%ax
  100b47:	66 90                	xchg   %ax,%ax
  100b49:	66 90                	xchg   %ax,%ax
  100b4b:	66 90                	xchg   %ax,%ax
  100b4d:	66 90                	xchg   %ax,%ax
  100b4f:	66 90                	xchg   %ax,%ax
  100b51:	66 90                	xchg   %ax,%ax
  100b53:	66 90                	xchg   %ax,%ax
  100b55:	66 90                	xchg   %ax,%ax
  100b57:	66 90                	xchg   %ax,%ax
  100b59:	66 90                	xchg   %ax,%ax
  100b5b:	66 90                	xchg   %ax,%ax
  100b5d:	66 90                	xchg   %ax,%ax
  100b5f:	66 90                	xchg   %ax,%ax
  100b61:	66 90                	xchg   %ax,%ax
  100b63:	66 90                	xchg   %ax,%ax
  100b65:	66 90                	xchg   %ax,%ax
  100b67:	66 90                	xchg   %ax,%ax
  100b69:	66 90                	xchg   %ax,%ax
  100b6b:	66 90                	xchg   %ax,%ax
  100b6d:	66 90                	xchg   %ax,%ax
  100b6f:	66 90                	xchg   %ax,%ax
  100b71:	66 90                	xchg   %ax,%ax
  100b73:	66 90                	xchg   %ax,%ax
  100b75:	66 90                	xchg   %ax,%ax
  100b77:	66 90                	xchg   %ax,%ax
  100b79:	66 90                	xchg   %ax,%ax
  100b7b:	66 90                	xchg   %ax,%ax
  100b7d:	66 90                	xchg   %ax,%ax
  100b7f:	66 90                	xchg   %ax,%ax
  100b81:	66 90                	xchg   %ax,%ax
  100b83:	66 90                	xchg   %ax,%ax
  100b85:	66 90                	xchg   %ax,%ax
  100b87:	66 90                	xchg   %ax,%ax
  100b89:	66 90                	xchg   %ax,%ax
  100b8b:	66 90                	xchg   %ax,%ax
  100b8d:	66 90                	xchg   %ax,%ax
  100b8f:	66 90                	xchg   %ax,%ax
  100b91:	66 90                	xchg   %ax,%ax
  100b93:	66 90                	xchg   %ax,%ax
  100b95:	66 90                	xchg   %ax,%ax
  100b97:	66 90                	xchg   %ax,%ax
  100b99:	66 90                	xchg   %ax,%ax
  100b9b:	66 90                	xchg   %ax,%ax
  100b9d:	66 90                	xchg   %ax,%ax
  100b9f:	66 90                	xchg   %ax,%ax
  100ba1:	66 90                	xchg   %ax,%ax
  100ba3:	66 90                	xchg   %ax,%ax
  100ba5:	66 90                	xchg   %ax,%ax
  100ba7:	66 90                	xchg   %ax,%ax
  100ba9:	66 90                	xchg   %ax,%ax
  100bab:	66 90                	xchg   %ax,%ax
  100bad:	66 90                	xchg   %ax,%ax
  100baf:	66 90                	xchg   %ax,%ax
  100bb1:	66 90                	xchg   %ax,%ax
  100bb3:	66 90                	xchg   %ax,%ax
  100bb5:	66 90                	xchg   %ax,%ax
  100bb7:	66 90                	xchg   %ax,%ax
  100bb9:	66 90                	xchg   %ax,%ax
  100bbb:	66 90                	xchg   %ax,%ax
  100bbd:	66 90                	xchg   %ax,%ax
  100bbf:	66 90                	xchg   %ax,%ax
  100bc1:	66 90                	xchg   %ax,%ax
  100bc3:	66 90                	xchg   %ax,%ax
  100bc5:	66 90                	xchg   %ax,%ax
  100bc7:	66 90                	xchg   %ax,%ax
  100bc9:	66 90                	xchg   %ax,%ax
  100bcb:	66 90                	xchg   %ax,%ax
  100bcd:	66 90                	xchg   %ax,%ax
  100bcf:	66 90                	xchg   %ax,%ax
  100bd1:	66 90                	xchg   %ax,%ax
  100bd3:	66 90                	xchg   %ax,%ax
  100bd5:	66 90                	xchg   %ax,%ax
  100bd7:	66 90                	xchg   %ax,%ax
  100bd9:	66 90                	xchg   %ax,%ax
  100bdb:	66 90                	xchg   %ax,%ax
  100bdd:	66 90                	xchg   %ax,%ax
  100bdf:	66 90                	xchg   %ax,%ax
  100be1:	66 90                	xchg   %ax,%ax
  100be3:	66 90                	xchg   %ax,%ax
  100be5:	66 90                	xchg   %ax,%ax
  100be7:	66 90                	xchg   %ax,%ax
  100be9:	66 90                	xchg   %ax,%ax
  100beb:	66 90                	xchg   %ax,%ax
  100bed:	66 90                	xchg   %ax,%ax
  100bef:	66 90                	xchg   %ax,%ax
  100bf1:	66 90                	xchg   %ax,%ax
  100bf3:	66 90                	xchg   %ax,%ax
  100bf5:	66 90                	xchg   %ax,%ax
  100bf7:	66 90                	xchg   %ax,%ax
  100bf9:	66 90                	xchg   %ax,%ax
  100bfb:	66 90                	xchg   %ax,%ax
  100bfd:	66 90                	xchg   %ax,%ax
  100bff:	66 90                	xchg   %ax,%ax
  100c01:	66 90                	xchg   %ax,%ax
  100c03:	66 90                	xchg   %ax,%ax
  100c05:	66 90                	xchg   %ax,%ax
  100c07:	66 90                	xchg   %ax,%ax
  100c09:	66 90                	xchg   %ax,%ax
  100c0b:	66 90                	xchg   %ax,%ax
  100c0d:	66 90                	xchg   %ax,%ax
  100c0f:	66 90                	xchg   %ax,%ax
  100c11:	66 90                	xchg   %ax,%ax
  100c13:	66 90                	xchg   %ax,%ax
  100c15:	66 90                	xchg   %ax,%ax
  100c17:	66 90                	xchg   %ax,%ax
  100c19:	66 90                	xchg   %ax,%ax
  100c1b:	66 90                	xchg   %ax,%ax
  100c1d:	66 90                	xchg   %ax,%ax
  100c1f:	66 90                	xchg   %ax,%ax
  100c21:	66 90                	xchg   %ax,%ax
  100c23:	66 90                	xchg   %ax,%ax
  100c25:	66 90                	xchg   %ax,%ax
  100c27:	66 90                	xchg   %ax,%ax
  100c29:	66 90                	xchg   %ax,%ax
  100c2b:	66 90                	xchg   %ax,%ax
  100c2d:	66 90                	xchg   %ax,%ax
  100c2f:	66 90                	xchg   %ax,%ax
  100c31:	66 90                	xchg   %ax,%ax
  100c33:	66 90                	xchg   %ax,%ax
  100c35:	66 90                	xchg   %ax,%ax
  100c37:	66 90                	xchg   %ax,%ax
  100c39:	66 90                	xchg   %ax,%ax
  100c3b:	66 90                	xchg   %ax,%ax
  100c3d:	66 90                	xchg   %ax,%ax
  100c3f:	66 90                	xchg   %ax,%ax
  100c41:	66 90                	xchg   %ax,%ax
  100c43:	66 90                	xchg   %ax,%ax
  100c45:	66 90                	xchg   %ax,%ax
  100c47:	66 90                	xchg   %ax,%ax
  100c49:	66 90                	xchg   %ax,%ax
  100c4b:	66 90                	xchg   %ax,%ax
  100c4d:	66 90                	xchg   %ax,%ax
  100c4f:	66 90                	xchg   %ax,%ax
  100c51:	66 90                	xchg   %ax,%ax
  100c53:	66 90                	xchg   %ax,%ax
  100c55:	66 90                	xchg   %ax,%ax
  100c57:	66 90                	xchg   %ax,%ax
  100c59:	66 90                	xchg   %ax,%ax
  100c5b:	66 90                	xchg   %ax,%ax
  100c5d:	66 90                	xchg   %ax,%ax
  100c5f:	66 90                	xchg   %ax,%ax
  100c61:	66 90                	xchg   %ax,%ax
  100c63:	66 90                	xchg   %ax,%ax
  100c65:	66 90                	xchg   %ax,%ax
  100c67:	66 90                	xchg   %ax,%ax
  100c69:	66 90                	xchg   %ax,%ax
  100c6b:	66 90                	xchg   %ax,%ax
  100c6d:	66 90                	xchg   %ax,%ax
  100c6f:	66 90                	xchg   %ax,%ax
  100c71:	66 90                	xchg   %ax,%ax
  100c73:	66 90                	xchg   %ax,%ax
  100c75:	66 90                	xchg   %ax,%ax
  100c77:	66 90                	xchg   %ax,%ax
  100c79:	66 90                	xchg   %ax,%ax
  100c7b:	66 90                	xchg   %ax,%ax
  100c7d:	66 90                	xchg   %ax,%ax
  100c7f:	66 90                	xchg   %ax,%ax
  100c81:	66 90                	xchg   %ax,%ax
  100c83:	66 90                	xchg   %ax,%ax
  100c85:	66 90                	xchg   %ax,%ax
  100c87:	66 90                	xchg   %ax,%ax
  100c89:	66 90                	xchg   %ax,%ax
  100c8b:	66 90                	xchg   %ax,%ax
  100c8d:	66 90                	xchg   %ax,%ax
  100c8f:	66 90                	xchg   %ax,%ax
  100c91:	66 90                	xchg   %ax,%ax
  100c93:	66 90                	xchg   %ax,%ax
  100c95:	66 90                	xchg   %ax,%ax
  100c97:	66 90                	xchg   %ax,%ax
  100c99:	66 90                	xchg   %ax,%ax
  100c9b:	66 90                	xchg   %ax,%ax
  100c9d:	66 90                	xchg   %ax,%ax
  100c9f:	66 90                	xchg   %ax,%ax
  100ca1:	66 90                	xchg   %ax,%ax
  100ca3:	66 90                	xchg   %ax,%ax
  100ca5:	66 90                	xchg   %ax,%ax
  100ca7:	66 90                	xchg   %ax,%ax
  100ca9:	66 90                	xchg   %ax,%ax
  100cab:	66 90                	xchg   %ax,%ax
  100cad:	66 90                	xchg   %ax,%ax
  100caf:	66 90                	xchg   %ax,%ax
  100cb1:	66 90                	xchg   %ax,%ax
  100cb3:	66 90                	xchg   %ax,%ax
  100cb5:	66 90                	xchg   %ax,%ax
  100cb7:	66 90                	xchg   %ax,%ax
  100cb9:	66 90                	xchg   %ax,%ax
  100cbb:	66 90                	xchg   %ax,%ax
  100cbd:	66 90                	xchg   %ax,%ax
  100cbf:	66 90                	xchg   %ax,%ax
  100cc1:	66 90                	xchg   %ax,%ax
  100cc3:	66 90                	xchg   %ax,%ax
  100cc5:	66 90                	xchg   %ax,%ax
  100cc7:	66 90                	xchg   %ax,%ax
  100cc9:	66 90                	xchg   %ax,%ax
  100ccb:	66 90                	xchg   %ax,%ax
  100ccd:	66 90                	xchg   %ax,%ax
  100ccf:	66 90                	xchg   %ax,%ax
  100cd1:	66 90                	xchg   %ax,%ax
  100cd3:	66 90                	xchg   %ax,%ax
  100cd5:	66 90                	xchg   %ax,%ax
  100cd7:	66 90                	xchg   %ax,%ax
  100cd9:	66 90                	xchg   %ax,%ax
  100cdb:	66 90                	xchg   %ax,%ax
  100cdd:	66 90                	xchg   %ax,%ax
  100cdf:	66 90                	xchg   %ax,%ax
  100ce1:	66 90                	xchg   %ax,%ax
  100ce3:	66 90                	xchg   %ax,%ax
  100ce5:	66 90                	xchg   %ax,%ax
  100ce7:	66 90                	xchg   %ax,%ax
  100ce9:	66 90                	xchg   %ax,%ax
  100ceb:	66 90                	xchg   %ax,%ax
  100ced:	66 90                	xchg   %ax,%ax
  100cef:	66 90                	xchg   %ax,%ax
  100cf1:	66 90                	xchg   %ax,%ax
  100cf3:	66 90                	xchg   %ax,%ax
  100cf5:	66 90                	xchg   %ax,%ax
  100cf7:	66 90                	xchg   %ax,%ax
  100cf9:	66 90                	xchg   %ax,%ax
  100cfb:	66 90                	xchg   %ax,%ax
  100cfd:	66 90                	xchg   %ax,%ax
  100cff:	66 90                	xchg   %ax,%ax
  100d01:	66 90                	xchg   %ax,%ax
  100d03:	66 90                	xchg   %ax,%ax
  100d05:	66 90                	xchg   %ax,%ax
  100d07:	66 90                	xchg   %ax,%ax
  100d09:	66 90                	xchg   %ax,%ax
  100d0b:	66 90                	xchg   %ax,%ax
  100d0d:	66 90                	xchg   %ax,%ax
  100d0f:	66 90                	xchg   %ax,%ax
  100d11:	66 90                	xchg   %ax,%ax
  100d13:	66 90                	xchg   %ax,%ax
  100d15:	66 90                	xchg   %ax,%ax
  100d17:	66 90                	xchg   %ax,%ax
  100d19:	66 90                	xchg   %ax,%ax
  100d1b:	66 90                	xchg   %ax,%ax
  100d1d:	66 90                	xchg   %ax,%ax
  100d1f:	66 90                	xchg   %ax,%ax
  100d21:	66 90                	xchg   %ax,%ax
  100d23:	66 90                	xchg   %ax,%ax
  100d25:	66 90                	xchg   %ax,%ax
  100d27:	66 90                	xchg   %ax,%ax
  100d29:	66 90                	xchg   %ax,%ax
  100d2b:	66 90                	xchg   %ax,%ax
  100d2d:	66 90                	xchg   %ax,%ax
  100d2f:	66 90                	xchg   %ax,%ax
  100d31:	66 90                	xchg   %ax,%ax
  100d33:	66 90                	xchg   %ax,%ax
  100d35:	66 90                	xchg   %ax,%ax
  100d37:	66 90                	xchg   %ax,%ax
  100d39:	66 90                	xchg   %ax,%ax
  100d3b:	66 90                	xchg   %ax,%ax
  100d3d:	66 90                	xchg   %ax,%ax
  100d3f:	66 90                	xchg   %ax,%ax
  100d41:	66 90                	xchg   %ax,%ax
  100d43:	66 90                	xchg   %ax,%ax
  100d45:	66 90                	xchg   %ax,%ax
  100d47:	66 90                	xchg   %ax,%ax
  100d49:	66 90                	xchg   %ax,%ax
  100d4b:	66 90                	xchg   %ax,%ax
  100d4d:	66 90                	xchg   %ax,%ax
  100d4f:	66 90                	xchg   %ax,%ax
  100d51:	66 90                	xchg   %ax,%ax
  100d53:	66 90                	xchg   %ax,%ax
  100d55:	66 90                	xchg   %ax,%ax
  100d57:	66 90                	xchg   %ax,%ax
  100d59:	66 90                	xchg   %ax,%ax
  100d5b:	66 90                	xchg   %ax,%ax
  100d5d:	66 90                	xchg   %ax,%ax
  100d5f:	66 90                	xchg   %ax,%ax
  100d61:	66 90                	xchg   %ax,%ax
  100d63:	66 90                	xchg   %ax,%ax
  100d65:	66 90                	xchg   %ax,%ax
  100d67:	66 90                	xchg   %ax,%ax
  100d69:	66 90                	xchg   %ax,%ax
  100d6b:	66 90                	xchg   %ax,%ax
  100d6d:	66 90                	xchg   %ax,%ax
  100d6f:	66 90                	xchg   %ax,%ax
  100d71:	66 90                	xchg   %ax,%ax
  100d73:	66 90                	xchg   %ax,%ax
  100d75:	66 90                	xchg   %ax,%ax
  100d77:	66 90                	xchg   %ax,%ax
  100d79:	66 90                	xchg   %ax,%ax
  100d7b:	66 90                	xchg   %ax,%ax
  100d7d:	66 90                	xchg   %ax,%ax
  100d7f:	66 90                	xchg   %ax,%ax
  100d81:	66 90                	xchg   %ax,%ax
  100d83:	66 90                	xchg   %ax,%ax
  100d85:	66 90                	xchg   %ax,%ax
  100d87:	66 90                	xchg   %ax,%ax
  100d89:	66 90                	xchg   %ax,%ax
  100d8b:	66 90                	xchg   %ax,%ax
  100d8d:	66 90                	xchg   %ax,%ax
  100d8f:	66 90                	xchg   %ax,%ax
  100d91:	66 90                	xchg   %ax,%ax
  100d93:	66 90                	xchg   %ax,%ax
  100d95:	66 90                	xchg   %ax,%ax
  100d97:	66 90                	xchg   %ax,%ax
  100d99:	66 90                	xchg   %ax,%ax
  100d9b:	66 90                	xchg   %ax,%ax
  100d9d:	66 90                	xchg   %ax,%ax
  100d9f:	66 90                	xchg   %ax,%ax
  100da1:	66 90                	xchg   %ax,%ax
  100da3:	66 90                	xchg   %ax,%ax
  100da5:	66 90                	xchg   %ax,%ax
  100da7:	66 90                	xchg   %ax,%ax
  100da9:	66 90                	xchg   %ax,%ax
  100dab:	66 90                	xchg   %ax,%ax
  100dad:	66 90                	xchg   %ax,%ax
  100daf:	66 90                	xchg   %ax,%ax
  100db1:	66 90                	xchg   %ax,%ax
  100db3:	66 90                	xchg   %ax,%ax
  100db5:	66 90                	xchg   %ax,%ax
  100db7:	66 90                	xchg   %ax,%ax
  100db9:	66 90                	xchg   %ax,%ax
  100dbb:	66 90                	xchg   %ax,%ax
  100dbd:	66 90                	xchg   %ax,%ax
  100dbf:	66 90                	xchg   %ax,%ax
  100dc1:	66 90                	xchg   %ax,%ax
  100dc3:	66 90                	xchg   %ax,%ax
  100dc5:	66 90                	xchg   %ax,%ax
  100dc7:	66 90                	xchg   %ax,%ax
  100dc9:	66 90                	xchg   %ax,%ax
  100dcb:	66 90                	xchg   %ax,%ax
  100dcd:	66 90                	xchg   %ax,%ax
  100dcf:	66 90                	xchg   %ax,%ax
  100dd1:	66 90                	xchg   %ax,%ax
  100dd3:	66 90                	xchg   %ax,%ax
  100dd5:	66 90                	xchg   %ax,%ax
  100dd7:	66 90                	xchg   %ax,%ax
  100dd9:	66 90                	xchg   %ax,%ax
  100ddb:	66 90                	xchg   %ax,%ax
  100ddd:	66 90                	xchg   %ax,%ax
  100ddf:	66 90                	xchg   %ax,%ax
  100de1:	66 90                	xchg   %ax,%ax
  100de3:	66 90                	xchg   %ax,%ax
  100de5:	66 90                	xchg   %ax,%ax
  100de7:	66 90                	xchg   %ax,%ax
  100de9:	66 90                	xchg   %ax,%ax
  100deb:	66 90                	xchg   %ax,%ax
  100ded:	66 90                	xchg   %ax,%ax
  100def:	66 90                	xchg   %ax,%ax
  100df1:	66 90                	xchg   %ax,%ax
  100df3:	66 90                	xchg   %ax,%ax
  100df5:	66 90                	xchg   %ax,%ax
  100df7:	66 90                	xchg   %ax,%ax
  100df9:	66 90                	xchg   %ax,%ax
  100dfb:	66 90                	xchg   %ax,%ax
  100dfd:	66 90                	xchg   %ax,%ax
  100dff:	66 90                	xchg   %ax,%ax
  100e01:	66 90                	xchg   %ax,%ax
  100e03:	66 90                	xchg   %ax,%ax
  100e05:	66 90                	xchg   %ax,%ax
  100e07:	66 90                	xchg   %ax,%ax
  100e09:	66 90                	xchg   %ax,%ax
  100e0b:	66 90                	xchg   %ax,%ax
  100e0d:	66 90                	xchg   %ax,%ax
  100e0f:	66 90                	xchg   %ax,%ax
  100e11:	66 90                	xchg   %ax,%ax
  100e13:	66 90                	xchg   %ax,%ax
  100e15:	66 90                	xchg   %ax,%ax
  100e17:	66 90                	xchg   %ax,%ax
  100e19:	66 90                	xchg   %ax,%ax
  100e1b:	66 90                	xchg   %ax,%ax
  100e1d:	66 90                	xchg   %ax,%ax
  100e1f:	66 90                	xchg   %ax,%ax
  100e21:	66 90                	xchg   %ax,%ax
  100e23:	66 90                	xchg   %ax,%ax
  100e25:	66 90                	xchg   %ax,%ax
  100e27:	66 90                	xchg   %ax,%ax
  100e29:	66 90                	xchg   %ax,%ax
  100e2b:	66 90                	xchg   %ax,%ax
  100e2d:	66 90                	xchg   %ax,%ax
  100e2f:	66 90                	xchg   %ax,%ax
  100e31:	66 90                	xchg   %ax,%ax
  100e33:	66 90                	xchg   %ax,%ax
  100e35:	66 90                	xchg   %ax,%ax
  100e37:	66 90                	xchg   %ax,%ax
  100e39:	66 90                	xchg   %ax,%ax
  100e3b:	66 90                	xchg   %ax,%ax
  100e3d:	66 90                	xchg   %ax,%ax
  100e3f:	66 90                	xchg   %ax,%ax
  100e41:	66 90                	xchg   %ax,%ax
  100e43:	66 90                	xchg   %ax,%ax
  100e45:	66 90                	xchg   %ax,%ax
  100e47:	66 90                	xchg   %ax,%ax
  100e49:	66 90                	xchg   %ax,%ax
  100e4b:	66 90                	xchg   %ax,%ax
  100e4d:	66 90                	xchg   %ax,%ax
  100e4f:	66 90                	xchg   %ax,%ax
  100e51:	66 90                	xchg   %ax,%ax
  100e53:	66 90                	xchg   %ax,%ax
  100e55:	66 90                	xchg   %ax,%ax
  100e57:	66 90                	xchg   %ax,%ax
  100e59:	66 90                	xchg   %ax,%ax
  100e5b:	66 90                	xchg   %ax,%ax
  100e5d:	66 90                	xchg   %ax,%ax
  100e5f:	66 90                	xchg   %ax,%ax
  100e61:	66 90                	xchg   %ax,%ax
  100e63:	66 90                	xchg   %ax,%ax
  100e65:	66 90                	xchg   %ax,%ax
  100e67:	66 90                	xchg   %ax,%ax
  100e69:	66 90                	xchg   %ax,%ax
  100e6b:	66 90                	xchg   %ax,%ax
  100e6d:	66 90                	xchg   %ax,%ax
  100e6f:	66 90                	xchg   %ax,%ax
  100e71:	66 90                	xchg   %ax,%ax
  100e73:	66 90                	xchg   %ax,%ax
  100e75:	66 90                	xchg   %ax,%ax
  100e77:	66 90                	xchg   %ax,%ax
  100e79:	66 90                	xchg   %ax,%ax
  100e7b:	66 90                	xchg   %ax,%ax
  100e7d:	66 90                	xchg   %ax,%ax
  100e7f:	66 90                	xchg   %ax,%ax
  100e81:	66 90                	xchg   %ax,%ax
  100e83:	66 90                	xchg   %ax,%ax
  100e85:	66 90                	xchg   %ax,%ax
  100e87:	66 90                	xchg   %ax,%ax
  100e89:	66 90                	xchg   %ax,%ax
  100e8b:	66 90                	xchg   %ax,%ax
  100e8d:	66 90                	xchg   %ax,%ax
  100e8f:	66 90                	xchg   %ax,%ax
  100e91:	66 90                	xchg   %ax,%ax
  100e93:	66 90                	xchg   %ax,%ax
  100e95:	66 90                	xchg   %ax,%ax
  100e97:	66 90                	xchg   %ax,%ax
  100e99:	66 90                	xchg   %ax,%ax
  100e9b:	66 90                	xchg   %ax,%ax
  100e9d:	66 90                	xchg   %ax,%ax
  100e9f:	66 90                	xchg   %ax,%ax
  100ea1:	66 90                	xchg   %ax,%ax
  100ea3:	66 90                	xchg   %ax,%ax
  100ea5:	66 90                	xchg   %ax,%ax
  100ea7:	66 90                	xchg   %ax,%ax
  100ea9:	66 90                	xchg   %ax,%ax
  100eab:	66 90                	xchg   %ax,%ax
  100ead:	66 90                	xchg   %ax,%ax
  100eaf:	66 90                	xchg   %ax,%ax
  100eb1:	66 90                	xchg   %ax,%ax
  100eb3:	66 90                	xchg   %ax,%ax
  100eb5:	66 90                	xchg   %ax,%ax
  100eb7:	66 90                	xchg   %ax,%ax
  100eb9:	66 90                	xchg   %ax,%ax
  100ebb:	66 90                	xchg   %ax,%ax
  100ebd:	66 90                	xchg   %ax,%ax
  100ebf:	66 90                	xchg   %ax,%ax
  100ec1:	66 90                	xchg   %ax,%ax
  100ec3:	66 90                	xchg   %ax,%ax
  100ec5:	66 90                	xchg   %ax,%ax
  100ec7:	66 90                	xchg   %ax,%ax
  100ec9:	66 90                	xchg   %ax,%ax
  100ecb:	66 90                	xchg   %ax,%ax
  100ecd:	66 90                	xchg   %ax,%ax
  100ecf:	66 90                	xchg   %ax,%ax
  100ed1:	66 90                	xchg   %ax,%ax
  100ed3:	66 90                	xchg   %ax,%ax
  100ed5:	66 90                	xchg   %ax,%ax
  100ed7:	66 90                	xchg   %ax,%ax
  100ed9:	66 90                	xchg   %ax,%ax
  100edb:	66 90                	xchg   %ax,%ax
  100edd:	66 90                	xchg   %ax,%ax
  100edf:	66 90                	xchg   %ax,%ax
  100ee1:	66 90                	xchg   %ax,%ax
  100ee3:	66 90                	xchg   %ax,%ax
  100ee5:	66 90                	xchg   %ax,%ax
  100ee7:	66 90                	xchg   %ax,%ax
  100ee9:	66 90                	xchg   %ax,%ax
  100eeb:	66 90                	xchg   %ax,%ax
  100eed:	66 90                	xchg   %ax,%ax
  100eef:	66 90                	xchg   %ax,%ax
  100ef1:	66 90                	xchg   %ax,%ax
  100ef3:	66 90                	xchg   %ax,%ax
  100ef5:	66 90                	xchg   %ax,%ax
  100ef7:	66 90                	xchg   %ax,%ax
  100ef9:	66 90                	xchg   %ax,%ax
  100efb:	66 90                	xchg   %ax,%ax
  100efd:	66 90                	xchg   %ax,%ax
  100eff:	66 90                	xchg   %ax,%ax
  100f01:	66 90                	xchg   %ax,%ax
  100f03:	66 90                	xchg   %ax,%ax
  100f05:	66 90                	xchg   %ax,%ax
  100f07:	66 90                	xchg   %ax,%ax
  100f09:	66 90                	xchg   %ax,%ax
  100f0b:	66 90                	xchg   %ax,%ax
  100f0d:	66 90                	xchg   %ax,%ax
  100f0f:	66 90                	xchg   %ax,%ax
  100f11:	66 90                	xchg   %ax,%ax
  100f13:	66 90                	xchg   %ax,%ax
  100f15:	66 90                	xchg   %ax,%ax
  100f17:	66 90                	xchg   %ax,%ax
  100f19:	66 90                	xchg   %ax,%ax
  100f1b:	66 90                	xchg   %ax,%ax
  100f1d:	66 90                	xchg   %ax,%ax
  100f1f:	66 90                	xchg   %ax,%ax
  100f21:	66 90                	xchg   %ax,%ax
  100f23:	66 90                	xchg   %ax,%ax
  100f25:	66 90                	xchg   %ax,%ax
  100f27:	66 90                	xchg   %ax,%ax
  100f29:	66 90                	xchg   %ax,%ax
  100f2b:	66 90                	xchg   %ax,%ax
  100f2d:	66 90                	xchg   %ax,%ax
  100f2f:	66 90                	xchg   %ax,%ax
  100f31:	66 90                	xchg   %ax,%ax
  100f33:	66 90                	xchg   %ax,%ax
  100f35:	66 90                	xchg   %ax,%ax
  100f37:	66 90                	xchg   %ax,%ax
  100f39:	66 90                	xchg   %ax,%ax
  100f3b:	66 90                	xchg   %ax,%ax
  100f3d:	66 90                	xchg   %ax,%ax
  100f3f:	66 90                	xchg   %ax,%ax
  100f41:	66 90                	xchg   %ax,%ax
  100f43:	66 90                	xchg   %ax,%ax
  100f45:	66 90                	xchg   %ax,%ax
  100f47:	66 90                	xchg   %ax,%ax
  100f49:	66 90                	xchg   %ax,%ax
  100f4b:	66 90                	xchg   %ax,%ax
  100f4d:	66 90                	xchg   %ax,%ax
  100f4f:	66 90                	xchg   %ax,%ax
  100f51:	66 90                	xchg   %ax,%ax
  100f53:	66 90                	xchg   %ax,%ax
  100f55:	66 90                	xchg   %ax,%ax
  100f57:	66 90                	xchg   %ax,%ax
  100f59:	66 90                	xchg   %ax,%ax
  100f5b:	66 90                	xchg   %ax,%ax
  100f5d:	66 90                	xchg   %ax,%ax
  100f5f:	66 90                	xchg   %ax,%ax
  100f61:	66 90                	xchg   %ax,%ax
  100f63:	66 90                	xchg   %ax,%ax
  100f65:	66 90                	xchg   %ax,%ax
  100f67:	66 90                	xchg   %ax,%ax
  100f69:	66 90                	xchg   %ax,%ax
  100f6b:	66 90                	xchg   %ax,%ax
  100f6d:	66 90                	xchg   %ax,%ax
  100f6f:	66 90                	xchg   %ax,%ax
  100f71:	66 90                	xchg   %ax,%ax
  100f73:	66 90                	xchg   %ax,%ax
  100f75:	66 90                	xchg   %ax,%ax
  100f77:	66 90                	xchg   %ax,%ax
  100f79:	66 90                	xchg   %ax,%ax
  100f7b:	66 90                	xchg   %ax,%ax
  100f7d:	66 90                	xchg   %ax,%ax
  100f7f:	66 90                	xchg   %ax,%ax
  100f81:	66 90                	xchg   %ax,%ax
  100f83:	66 90                	xchg   %ax,%ax
  100f85:	66 90                	xchg   %ax,%ax
  100f87:	66 90                	xchg   %ax,%ax
  100f89:	66 90                	xchg   %ax,%ax
  100f8b:	66 90                	xchg   %ax,%ax
  100f8d:	66 90                	xchg   %ax,%ax
  100f8f:	66 90                	xchg   %ax,%ax
  100f91:	66 90                	xchg   %ax,%ax
  100f93:	66 90                	xchg   %ax,%ax
  100f95:	66 90                	xchg   %ax,%ax
  100f97:	66 90                	xchg   %ax,%ax
  100f99:	66 90                	xchg   %ax,%ax
  100f9b:	66 90                	xchg   %ax,%ax
  100f9d:	66 90                	xchg   %ax,%ax
  100f9f:	66 90                	xchg   %ax,%ax
  100fa1:	66 90                	xchg   %ax,%ax
  100fa3:	66 90                	xchg   %ax,%ax
  100fa5:	66 90                	xchg   %ax,%ax
  100fa7:	66 90                	xchg   %ax,%ax
  100fa9:	66 90                	xchg   %ax,%ax
  100fab:	66 90                	xchg   %ax,%ax
  100fad:	66 90                	xchg   %ax,%ax
  100faf:	66 90                	xchg   %ax,%ax
  100fb1:	66 90                	xchg   %ax,%ax
  100fb3:	66 90                	xchg   %ax,%ax
  100fb5:	66 90                	xchg   %ax,%ax
  100fb7:	66 90                	xchg   %ax,%ax
  100fb9:	66 90                	xchg   %ax,%ax
  100fbb:	66 90                	xchg   %ax,%ax
  100fbd:	66 90                	xchg   %ax,%ax
  100fbf:	66 90                	xchg   %ax,%ax
  100fc1:	66 90                	xchg   %ax,%ax
  100fc3:	66 90                	xchg   %ax,%ax
  100fc5:	66 90                	xchg   %ax,%ax
  100fc7:	66 90                	xchg   %ax,%ax
  100fc9:	66 90                	xchg   %ax,%ax
  100fcb:	66 90                	xchg   %ax,%ax
  100fcd:	66 90                	xchg   %ax,%ax
  100fcf:	66 90                	xchg   %ax,%ax
  100fd1:	66 90                	xchg   %ax,%ax
  100fd3:	66 90                	xchg   %ax,%ax
  100fd5:	66 90                	xchg   %ax,%ax
  100fd7:	66 90                	xchg   %ax,%ax
  100fd9:	66 90                	xchg   %ax,%ax
  100fdb:	66 90                	xchg   %ax,%ax
  100fdd:	66 90                	xchg   %ax,%ax
  100fdf:	66 90                	xchg   %ax,%ax
  100fe1:	66 90                	xchg   %ax,%ax
  100fe3:	66 90                	xchg   %ax,%ax
  100fe5:	66 90                	xchg   %ax,%ax
  100fe7:	66 90                	xchg   %ax,%ax
  100fe9:	66 90                	xchg   %ax,%ax
  100feb:	66 90                	xchg   %ax,%ax
  100fed:	66 90                	xchg   %ax,%ax
  100fef:	66 90                	xchg   %ax,%ax
  100ff1:	66 90                	xchg   %ax,%ax
  100ff3:	66 90                	xchg   %ax,%ax
  100ff5:	66 90                	xchg   %ax,%ax
  100ff7:	66 90                	xchg   %ax,%ax
  100ff9:	66 90                	xchg   %ax,%ax
  100ffb:	66 90                	xchg   %ax,%ax
  100ffd:	66 90                	xchg   %ax,%ax
  100fff:	90                   	nop

Disassembly of section .text:

c0102000 <gdt_flush>:
c0102000:	8b 44 24 04          	mov    0x4(%esp),%eax
c0102004:	0f 01 10             	lgdtl  (%eax)
c0102007:	66 b8 10 00          	mov    $0x10,%ax
c010200b:	8e d8                	mov    %eax,%ds
c010200d:	8e c0                	mov    %eax,%es
c010200f:	8e e0                	mov    %eax,%fs
c0102011:	8e e8                	mov    %eax,%gs
c0102013:	8e d0                	mov    %eax,%ss
c0102015:	ea 1c 20 10 c0 08 00 	ljmp   $0x8,$0xc010201c

c010201c <gdt_flush.flush>:
c010201c:	c3                   	ret    

c010201d <tss_flush>:
c010201d:	66 b8 28 00          	mov    $0x28,%ax
c0102021:	0f 00 d8             	ltr    %ax
c0102024:	c3                   	ret    
c0102025:	66 90                	xchg   %ax,%ax
c0102027:	66 90                	xchg   %ax,%ax
c0102029:	66 90                	xchg   %ax,%ax
c010202b:	66 90                	xchg   %ax,%ax
c010202d:	66 90                	xchg   %ax,%ax
c010202f:	90                   	nop

c0102030 <idt_flush>:
c0102030:	8b 44 24 04          	mov    0x4(%esp),%eax
c0102034:	0f 01 18             	lidtl  (%eax)
c0102037:	c3                   	ret    

c0102038 <isr0>:
c0102038:	6a 00                	push   $0x0
c010203a:	6a 00                	push   $0x0
c010203c:	e9 d0 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102041 <isr1>:
c0102041:	6a 00                	push   $0x0
c0102043:	6a 01                	push   $0x1
c0102045:	e9 c7 00 00 00       	jmp    c0102111 <isr_common_stub>

c010204a <isr2>:
c010204a:	6a 00                	push   $0x0
c010204c:	6a 02                	push   $0x2
c010204e:	e9 be 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102053 <isr3>:
c0102053:	6a 00                	push   $0x0
c0102055:	6a 03                	push   $0x3
c0102057:	e9 b5 00 00 00       	jmp    c0102111 <isr_common_stub>

c010205c <isr4>:
c010205c:	6a 00                	push   $0x0
c010205e:	6a 04                	push   $0x4
c0102060:	e9 ac 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102065 <isr5>:
c0102065:	6a 00                	push   $0x0
c0102067:	6a 05                	push   $0x5
c0102069:	e9 a3 00 00 00       	jmp    c0102111 <isr_common_stub>

c010206e <isr6>:
c010206e:	6a 00                	push   $0x0
c0102070:	6a 06                	push   $0x6
c0102072:	e9 9a 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102077 <isr7>:
c0102077:	6a 00                	push   $0x0
c0102079:	6a 07                	push   $0x7
c010207b:	e9 91 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102080 <isr8>:
c0102080:	6a 08                	push   $0x8
c0102082:	e9 8a 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102087 <isr9>:
c0102087:	6a 00                	push   $0x0
c0102089:	6a 09                	push   $0x9
c010208b:	e9 81 00 00 00       	jmp    c0102111 <isr_common_stub>

c0102090 <isr10>:
c0102090:	6a 0a                	push   $0xa
c0102092:	eb 7d                	jmp    c0102111 <isr_common_stub>

c0102094 <isr11>:
c0102094:	6a 0b                	push   $0xb
c0102096:	eb 79                	jmp    c0102111 <isr_common_stub>

c0102098 <isr12>:
c0102098:	6a 0c                	push   $0xc
c010209a:	eb 75                	jmp    c0102111 <isr_common_stub>

c010209c <isr13>:
c010209c:	6a 0d                	push   $0xd
c010209e:	eb 71                	jmp    c0102111 <isr_common_stub>

c01020a0 <isr14>:
c01020a0:	6a 0e                	push   $0xe
c01020a2:	eb 6d                	jmp    c0102111 <isr_common_stub>

c01020a4 <isr15>:
c01020a4:	6a 00                	push   $0x0
c01020a6:	6a 0f                	push   $0xf
c01020a8:	eb 67                	jmp    c0102111 <isr_common_stub>

c01020aa <isr16>:
c01020aa:	6a 00                	push   $0x0
c01020ac:	6a 10                	push   $0x10
c01020ae:	eb 61                	jmp    c0102111 <isr_common_stub>

c01020b0 <isr17>:
c01020b0:	6a 11                	push   $0x11
c01020b2:	eb 5d                	jmp    c0102111 <isr_common_stub>

c01020b4 <isr18>:
c01020b4:	6a 00                	push   $0x0
c01020b6:	6a 12                	push   $0x12
c01020b8:	eb 57                	jmp    c0102111 <isr_common_stub>

c01020ba <isr19>:
c01020ba:	6a 00                	push   $0x0
c01020bc:	6a 13                	push   $0x13
c01020be:	eb 51                	jmp    c0102111 <isr_common_stub>

c01020c0 <isr20>:
c01020c0:	6a 00                	push   $0x0
c01020c2:	6a 14                	push   $0x14
c01020c4:	eb 4b                	jmp    c0102111 <isr_common_stub>

c01020c6 <isr21>:
c01020c6:	6a 00                	push   $0x0
c01020c8:	6a 15                	push   $0x15
c01020ca:	eb 45                	jmp    c0102111 <isr_common_stub>

c01020cc <isr22>:
c01020cc:	6a 00                	push   $0x0
c01020ce:	6a 16                	push   $0x16
c01020d0:	eb 3f                	jmp    c0102111 <isr_common_stub>

c01020d2 <isr23>:
c01020d2:	6a 00                	push   $0x0
c01020d4:	6a 17                	push   $0x17
c01020d6:	eb 39                	jmp    c0102111 <isr_common_stub>

c01020d8 <isr24>:
c01020d8:	6a 00                	push   $0x0
c01020da:	6a 18                	push   $0x18
c01020dc:	eb 33                	jmp    c0102111 <isr_common_stub>

c01020de <isr25>:
c01020de:	6a 00                	push   $0x0
c01020e0:	6a 19                	push   $0x19
c01020e2:	eb 2d                	jmp    c0102111 <isr_common_stub>

c01020e4 <isr26>:
c01020e4:	6a 00                	push   $0x0
c01020e6:	6a 1a                	push   $0x1a
c01020e8:	eb 27                	jmp    c0102111 <isr_common_stub>

c01020ea <isr27>:
c01020ea:	6a 00                	push   $0x0
c01020ec:	6a 1b                	push   $0x1b
c01020ee:	eb 21                	jmp    c0102111 <isr_common_stub>

c01020f0 <isr28>:
c01020f0:	6a 00                	push   $0x0
c01020f2:	6a 1c                	push   $0x1c
c01020f4:	eb 1b                	jmp    c0102111 <isr_common_stub>

c01020f6 <isr29>:
c01020f6:	6a 00                	push   $0x0
c01020f8:	6a 1d                	push   $0x1d
c01020fa:	eb 15                	jmp    c0102111 <isr_common_stub>

c01020fc <isr30>:
c01020fc:	6a 00                	push   $0x0
c01020fe:	6a 1e                	push   $0x1e
c0102100:	eb 0f                	jmp    c0102111 <isr_common_stub>

c0102102 <isr31>:
c0102102:	6a 00                	push   $0x0
c0102104:	6a 1f                	push   $0x1f
c0102106:	eb 09                	jmp    c0102111 <isr_common_stub>

c0102108 <isr128>:
c0102108:	6a 00                	push   $0x0
c010210a:	68 80 00 00 00       	push   $0x80
c010210f:	eb 00                	jmp    c0102111 <isr_common_stub>

c0102111 <isr_common_stub>:
c0102111:	60                   	pusha  
c0102112:	66 8c d8             	mov    %ds,%ax
c0102115:	50                   	push   %eax
c0102116:	66 b8 10 00          	mov    $0x10,%ax
c010211a:	8e d8                	mov    %eax,%ds
c010211c:	8e c0                	mov    %eax,%es
c010211e:	8e e0                	mov    %eax,%fs
c0102120:	8e e8                	mov    %eax,%gs
c0102122:	8e d0                	mov    %eax,%ss
c0102124:	54                   	push   %esp
c0102125:	e8 36 57 00 00       	call   c0107860 <isr_handler>
c010212a:	83 c4 04             	add    $0x4,%esp
c010212d:	5b                   	pop    %ebx
c010212e:	8e db                	mov    %ebx,%ds
c0102130:	8e c3                	mov    %ebx,%es
c0102132:	8e e3                	mov    %ebx,%fs
c0102134:	8e eb                	mov    %ebx,%gs
c0102136:	8e d3                	mov    %ebx,%ss
c0102138:	61                   	popa   
c0102139:	83 c4 08             	add    $0x8,%esp
c010213c:	cf                   	iret   

c010213d <irq0>:
c010213d:	6a 00                	push   $0x0
c010213f:	6a 20                	push   $0x20
c0102141:	eb 5a                	jmp    c010219d <irq_common_stub>

c0102143 <irq1>:
c0102143:	6a 00                	push   $0x0
c0102145:	6a 21                	push   $0x21
c0102147:	eb 54                	jmp    c010219d <irq_common_stub>

c0102149 <irq2>:
c0102149:	6a 00                	push   $0x0
c010214b:	6a 22                	push   $0x22
c010214d:	eb 4e                	jmp    c010219d <irq_common_stub>

c010214f <irq3>:
c010214f:	6a 00                	push   $0x0
c0102151:	6a 23                	push   $0x23
c0102153:	eb 48                	jmp    c010219d <irq_common_stub>

c0102155 <irq4>:
c0102155:	6a 00                	push   $0x0
c0102157:	6a 24                	push   $0x24
c0102159:	eb 42                	jmp    c010219d <irq_common_stub>

c010215b <irq5>:
c010215b:	6a 00                	push   $0x0
c010215d:	6a 25                	push   $0x25
c010215f:	eb 3c                	jmp    c010219d <irq_common_stub>

c0102161 <irq6>:
c0102161:	6a 00                	push   $0x0
c0102163:	6a 26                	push   $0x26
c0102165:	eb 36                	jmp    c010219d <irq_common_stub>

c0102167 <irq7>:
c0102167:	6a 00                	push   $0x0
c0102169:	6a 27                	push   $0x27
c010216b:	eb 30                	jmp    c010219d <irq_common_stub>

c010216d <irq8>:
c010216d:	6a 00                	push   $0x0
c010216f:	6a 28                	push   $0x28
c0102171:	eb 2a                	jmp    c010219d <irq_common_stub>

c0102173 <irq9>:
c0102173:	6a 00                	push   $0x0
c0102175:	6a 29                	push   $0x29
c0102177:	eb 24                	jmp    c010219d <irq_common_stub>

c0102179 <irq10>:
c0102179:	6a 00                	push   $0x0
c010217b:	6a 2a                	push   $0x2a
c010217d:	eb 1e                	jmp    c010219d <irq_common_stub>

c010217f <irq11>:
c010217f:	6a 00                	push   $0x0
c0102181:	6a 2b                	push   $0x2b
c0102183:	eb 18                	jmp    c010219d <irq_common_stub>

c0102185 <irq12>:
c0102185:	6a 00                	push   $0x0
c0102187:	6a 2c                	push   $0x2c
c0102189:	eb 12                	jmp    c010219d <irq_common_stub>

c010218b <irq13>:
c010218b:	6a 00                	push   $0x0
c010218d:	6a 2d                	push   $0x2d
c010218f:	eb 0c                	jmp    c010219d <irq_common_stub>

c0102191 <irq14>:
c0102191:	6a 00                	push   $0x0
c0102193:	6a 2e                	push   $0x2e
c0102195:	eb 06                	jmp    c010219d <irq_common_stub>

c0102197 <irq15>:
c0102197:	6a 00                	push   $0x0
c0102199:	6a 2f                	push   $0x2f
c010219b:	eb 00                	jmp    c010219d <irq_common_stub>

c010219d <irq_common_stub>:
c010219d:	60                   	pusha  
c010219e:	66 8c d8             	mov    %ds,%ax
c01021a1:	50                   	push   %eax
c01021a2:	66 b8 10 00          	mov    $0x10,%ax
c01021a6:	8e d8                	mov    %eax,%ds
c01021a8:	8e c0                	mov    %eax,%es
c01021aa:	8e e0                	mov    %eax,%fs
c01021ac:	8e e8                	mov    %eax,%gs
c01021ae:	8e d0                	mov    %eax,%ss
c01021b0:	54                   	push   %esp
c01021b1:	e8 33 57 00 00       	call   c01078e9 <irq_handler>
c01021b6:	83 c4 04             	add    $0x4,%esp

c01021b9 <forkret_s>:
c01021b9:	5b                   	pop    %ebx
c01021ba:	8e db                	mov    %ebx,%ds
c01021bc:	8e c3                	mov    %ebx,%es
c01021be:	8e e3                	mov    %ebx,%fs
c01021c0:	8e eb                	mov    %ebx,%gs
c01021c2:	8e d3                	mov    %ebx,%ss
c01021c4:	61                   	popa   
c01021c5:	83 c4 08             	add    $0x8,%esp
c01021c8:	cf                   	iret   

c01021c9 <forkret_s.end>:
c01021c9:	66 90                	xchg   %ax,%ax
c01021cb:	66 90                	xchg   %ax,%ax
c01021cd:	66 90                	xchg   %ax,%ax
c01021cf:	90                   	nop

c01021d0 <kthread_entry>:
c01021d0:	52                   	push   %edx
c01021d1:	ff d3                	call   *%ebx
c01021d3:	50                   	push   %eax
c01021d4:	e8 b9 64 00 00       	call   c0108692 <do_exit>
c01021d9:	66 90                	xchg   %ax,%ax
c01021db:	66 90                	xchg   %ax,%ax
c01021dd:	66 90                	xchg   %ax,%ax
c01021df:	90                   	nop

c01021e0 <switch_to>:
c01021e0:	8b 44 24 04          	mov    0x4(%esp),%eax
c01021e4:	53                   	push   %ebx
c01021e5:	8b 5c 24 04          	mov    0x4(%esp),%ebx
c01021e9:	89 18                	mov    %ebx,(%eax)
c01021eb:	5b                   	pop    %ebx
c01021ec:	89 60 04             	mov    %esp,0x4(%eax)
c01021ef:	89 68 08             	mov    %ebp,0x8(%eax)
c01021f2:	89 48 0c             	mov    %ecx,0xc(%eax)
c01021f5:	89 50 10             	mov    %edx,0x10(%eax)
c01021f8:	89 70 14             	mov    %esi,0x14(%eax)
c01021fb:	89 78 18             	mov    %edi,0x18(%eax)
c01021fe:	89 68 1c             	mov    %ebp,0x1c(%eax)
c0102201:	8b 44 24 08          	mov    0x8(%esp),%eax
c0102205:	8b 68 1c             	mov    0x1c(%eax),%ebp
c0102208:	8b 78 18             	mov    0x18(%eax),%edi
c010220b:	8b 70 14             	mov    0x14(%eax),%esi
c010220e:	8b 50 10             	mov    0x10(%eax),%edx
c0102211:	8b 48 0c             	mov    0xc(%eax),%ecx
c0102214:	8b 58 08             	mov    0x8(%eax),%ebx
c0102217:	8b 60 04             	mov    0x4(%eax),%esp
c010221a:	53                   	push   %ebx
c010221b:	53                   	push   %ebx
c010221c:	8b 18                	mov    (%eax),%ebx
c010221e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0102222:	5b                   	pop    %ebx
c0102223:	c3                   	ret    

c0102224 <__list_add>:
c0102224:	55                   	push   %ebp
c0102225:	89 e5                	mov    %esp,%ebp
c0102227:	8b 45 10             	mov    0x10(%ebp),%eax
c010222a:	8b 55 08             	mov    0x8(%ebp),%edx
c010222d:	89 50 04             	mov    %edx,0x4(%eax)
c0102230:	8b 45 08             	mov    0x8(%ebp),%eax
c0102233:	8b 55 10             	mov    0x10(%ebp),%edx
c0102236:	89 10                	mov    %edx,(%eax)
c0102238:	8b 45 08             	mov    0x8(%ebp),%eax
c010223b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010223e:	89 50 04             	mov    %edx,0x4(%eax)
c0102241:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102244:	8b 55 08             	mov    0x8(%ebp),%edx
c0102247:	89 10                	mov    %edx,(%eax)
c0102249:	5d                   	pop    %ebp
c010224a:	c3                   	ret    

c010224b <list_add>:
c010224b:	55                   	push   %ebp
c010224c:	89 e5                	mov    %esp,%ebp
c010224e:	83 ec 0c             	sub    $0xc,%esp
c0102251:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102254:	8b 00                	mov    (%eax),%eax
c0102256:	89 44 24 08          	mov    %eax,0x8(%esp)
c010225a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010225d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102261:	8b 45 08             	mov    0x8(%ebp),%eax
c0102264:	89 04 24             	mov    %eax,(%esp)
c0102267:	e8 b8 ff ff ff       	call   c0102224 <__list_add>
c010226c:	c9                   	leave  
c010226d:	c3                   	ret    

c010226e <__list_del>:
c010226e:	55                   	push   %ebp
c010226f:	89 e5                	mov    %esp,%ebp
c0102271:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102274:	8b 55 08             	mov    0x8(%ebp),%edx
c0102277:	89 50 04             	mov    %edx,0x4(%eax)
c010227a:	8b 45 08             	mov    0x8(%ebp),%eax
c010227d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102280:	89 10                	mov    %edx,(%eax)
c0102282:	5d                   	pop    %ebp
c0102283:	c3                   	ret    

c0102284 <list_del>:
c0102284:	55                   	push   %ebp
c0102285:	89 e5                	mov    %esp,%ebp
c0102287:	83 ec 08             	sub    $0x8,%esp
c010228a:	8b 45 08             	mov    0x8(%ebp),%eax
c010228d:	8b 10                	mov    (%eax),%edx
c010228f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102292:	8b 40 04             	mov    0x4(%eax),%eax
c0102295:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102299:	89 04 24             	mov    %eax,(%esp)
c010229c:	e8 cd ff ff ff       	call   c010226e <__list_del>
c01022a1:	c9                   	leave  
c01022a2:	c3                   	ret    

c01022a3 <list_empty>:
c01022a3:	55                   	push   %ebp
c01022a4:	89 e5                	mov    %esp,%ebp
c01022a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01022a9:	8b 00                	mov    (%eax),%eax
c01022ab:	3b 45 08             	cmp    0x8(%ebp),%eax
c01022ae:	0f 94 c0             	sete   %al
c01022b1:	0f b6 c0             	movzbl %al,%eax
c01022b4:	5d                   	pop    %ebp
c01022b5:	c3                   	ret    

c01022b6 <pa_to_ka>:
c01022b6:	55                   	push   %ebp
c01022b7:	89 e5                	mov    %esp,%ebp
c01022b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01022bc:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01022c1:	5d                   	pop    %ebp
c01022c2:	c3                   	ret    

c01022c3 <__slob_alloc_pages>:
c01022c3:	55                   	push   %ebp
c01022c4:	89 e5                	mov    %esp,%ebp
c01022c6:	83 ec 28             	sub    $0x28,%esp
c01022c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01022cc:	89 04 24             	mov    %eax,(%esp)
c01022cf:	e8 5c 4a 00 00       	call   c0106d30 <alloc_pages>
c01022d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01022d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01022db:	75 07                	jne    c01022e4 <__slob_alloc_pages+0x21>
c01022dd:	b8 00 00 00 00       	mov    $0x0,%eax
c01022e2:	eb 0b                	jmp    c01022ef <__slob_alloc_pages+0x2c>
c01022e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022e7:	89 04 24             	mov    %eax,(%esp)
c01022ea:	e8 c7 ff ff ff       	call   c01022b6 <pa_to_ka>
c01022ef:	c9                   	leave  
c01022f0:	c3                   	ret    

c01022f1 <slob_print>:
c01022f1:	55                   	push   %ebp
c01022f2:	89 e5                	mov    %esp,%ebp
c01022f4:	83 ec 28             	sub    $0x28,%esp
c01022f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01022fe:	a1 00 90 10 c0       	mov    0xc0109000,%eax
c0102303:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102306:	eb 3f                	jmp    c0102347 <slob_print+0x56>
c0102308:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010230b:	83 e8 04             	sub    $0x4,%eax
c010230e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102311:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102314:	0f b6 00             	movzbl (%eax),%eax
c0102317:	83 e0 01             	and    $0x1,%eax
c010231a:	0f b6 d0             	movzbl %al,%edx
c010231d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102320:	8b 00                	mov    (%eax),%eax
c0102322:	d1 e8                	shr    %eax
c0102324:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0102328:	89 44 24 08          	mov    %eax,0x8(%esp)
c010232c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010232f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102333:	c7 04 24 e0 96 10 c0 	movl   $0xc01096e0,(%esp)
c010233a:	e8 68 38 00 00       	call   c0105ba7 <printk>
c010233f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102342:	8b 00                	mov    (%eax),%eax
c0102344:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102347:	81 7d f4 00 90 10 c0 	cmpl   $0xc0109000,-0xc(%ebp)
c010234e:	75 b8                	jne    c0102308 <slob_print+0x17>
c0102350:	c7 04 24 02 97 10 c0 	movl   $0xc0109702,(%esp)
c0102357:	e8 4b 38 00 00       	call   c0105ba7 <printk>
c010235c:	c9                   	leave  
c010235d:	c3                   	ret    

c010235e <slob_test>:
c010235e:	55                   	push   %ebp
c010235f:	89 e5                	mov    %esp,%ebp
c0102361:	83 ec 38             	sub    $0x38,%esp
c0102364:	e8 88 ff ff ff       	call   c01022f1 <slob_print>
c0102369:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
c0102370:	e8 92 02 00 00       	call   c0102607 <kmalloc>
c0102375:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102378:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
c010237f:	e8 83 02 00 00       	call   c0102607 <kmalloc>
c0102384:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102387:	c7 04 24 2c 01 00 00 	movl   $0x12c,(%esp)
c010238e:	e8 74 02 00 00       	call   c0102607 <kmalloc>
c0102393:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102396:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102399:	89 04 24             	mov    %eax,(%esp)
c010239c:	e8 fb 02 00 00       	call   c010269c <kfree>
c01023a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023a4:	89 04 24             	mov    %eax,(%esp)
c01023a7:	e8 f0 02 00 00       	call   c010269c <kfree>
c01023ac:	c7 04 24 ac 08 00 00 	movl   $0x8ac,(%esp)
c01023b3:	e8 4f 02 00 00       	call   c0102607 <kmalloc>
c01023b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01023bb:	c7 04 24 f0 00 00 00 	movl   $0xf0,(%esp)
c01023c2:	e8 40 02 00 00       	call   c0102607 <kmalloc>
c01023c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01023ca:	c7 04 24 b6 08 00 00 	movl   $0x8b6,(%esp)
c01023d1:	e8 31 02 00 00       	call   c0102607 <kmalloc>
c01023d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01023d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01023dc:	89 04 24             	mov    %eax,(%esp)
c01023df:	e8 b8 02 00 00       	call   c010269c <kfree>
c01023e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023e7:	89 04 24             	mov    %eax,(%esp)
c01023ea:	e8 ad 02 00 00       	call   c010269c <kfree>
c01023ef:	c7 04 24 dc 00 00 00 	movl   $0xdc,(%esp)
c01023f6:	e8 0c 02 00 00       	call   c0102607 <kmalloc>
c01023fb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01023fe:	c7 04 24 b0 04 00 00 	movl   $0x4b0,(%esp)
c0102405:	e8 fd 01 00 00       	call   c0102607 <kmalloc>
c010240a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010240d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102410:	89 04 24             	mov    %eax,(%esp)
c0102413:	e8 84 02 00 00       	call   c010269c <kfree>
c0102418:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010241b:	89 04 24             	mov    %eax,(%esp)
c010241e:	e8 79 02 00 00       	call   c010269c <kfree>
c0102423:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102426:	89 04 24             	mov    %eax,(%esp)
c0102429:	e8 6e 02 00 00       	call   c010269c <kfree>
c010242e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102431:	89 04 24             	mov    %eax,(%esp)
c0102434:	e8 63 02 00 00       	call   c010269c <kfree>
c0102439:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010243c:	89 04 24             	mov    %eax,(%esp)
c010243f:	e8 58 02 00 00       	call   c010269c <kfree>
c0102444:	e8 a8 fe ff ff       	call   c01022f1 <slob_print>
c0102449:	c9                   	leave  
c010244a:	c3                   	ret    

c010244b <slob_init>:
c010244b:	55                   	push   %ebp
c010244c:	89 e5                	mov    %esp,%ebp
c010244e:	83 ec 28             	sub    $0x28,%esp
c0102451:	c7 04 24 00 04 00 00 	movl   $0x400,(%esp)
c0102458:	e8 66 fe ff ff       	call   c01022c3 <__slob_alloc_pages>
c010245d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102460:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102464:	75 0c                	jne    c0102472 <slob_init+0x27>
c0102466:	c7 04 24 04 97 10 c0 	movl   $0xc0109704,(%esp)
c010246d:	e8 50 4f 00 00       	call   c01073c2 <panic>
c0102472:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102475:	0f b6 10             	movzbl (%eax),%edx
c0102478:	83 e2 fe             	and    $0xfffffffe,%edx
c010247b:	88 10                	mov    %dl,(%eax)
c010247d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102480:	8b 10                	mov    (%eax),%edx
c0102482:	83 e2 01             	and    $0x1,%edx
c0102485:	81 ca e8 ff 7f 00    	or     $0x7fffe8,%edx
c010248b:	89 10                	mov    %edx,(%eax)
c010248d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102490:	83 c0 04             	add    $0x4,%eax
c0102493:	c7 44 24 04 00 90 10 	movl   $0xc0109000,0x4(%esp)
c010249a:	c0 
c010249b:	89 04 24             	mov    %eax,(%esp)
c010249e:	e8 a8 fd ff ff       	call   c010224b <list_add>
c01024a3:	c9                   	leave  
c01024a4:	c3                   	ret    

c01024a5 <split_chunk>:
c01024a5:	55                   	push   %ebp
c01024a6:	89 e5                	mov    %esp,%ebp
c01024a8:	83 ec 18             	sub    $0x18,%esp
c01024ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ae:	8b 00                	mov    (%eax),%eax
c01024b0:	d1 e8                	shr    %eax
c01024b2:	2b 45 0c             	sub    0xc(%ebp),%eax
c01024b5:	83 f8 2c             	cmp    $0x2c,%eax
c01024b8:	76 78                	jbe    c0102532 <split_chunk+0x8d>
c01024ba:	8b 55 08             	mov    0x8(%ebp),%edx
c01024bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024c0:	01 d0                	add    %edx,%eax
c01024c2:	83 c0 0c             	add    $0xc,%eax
c01024c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01024c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01024cb:	0f b6 10             	movzbl (%eax),%edx
c01024ce:	83 e2 fe             	and    $0xfffffffe,%edx
c01024d1:	88 10                	mov    %dl,(%eax)
c01024d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01024d6:	8b 00                	mov    (%eax),%eax
c01024d8:	d1 e8                	shr    %eax
c01024da:	2b 45 0c             	sub    0xc(%ebp),%eax
c01024dd:	83 e8 0c             	sub    $0xc,%eax
c01024e0:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
c01024e5:	89 c2                	mov    %eax,%edx
c01024e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01024ea:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
c01024ed:	8b 10                	mov    (%eax),%edx
c01024ef:	83 e2 01             	and    $0x1,%edx
c01024f2:	09 ca                	or     %ecx,%edx
c01024f4:	89 10                	mov    %edx,(%eax)
c01024f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01024f9:	8d 50 04             	lea    0x4(%eax),%edx
c01024fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01024ff:	83 c0 04             	add    $0x4,%eax
c0102502:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102506:	89 04 24             	mov    %eax,(%esp)
c0102509:	e8 3d fd ff ff       	call   c010224b <list_add>
c010250e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102511:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
c0102516:	89 c2                	mov    %eax,%edx
c0102518:	8b 45 08             	mov    0x8(%ebp),%eax
c010251b:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
c010251e:	8b 10                	mov    (%eax),%edx
c0102520:	83 e2 01             	and    $0x1,%edx
c0102523:	09 ca                	or     %ecx,%edx
c0102525:	89 10                	mov    %edx,(%eax)
c0102527:	8b 45 08             	mov    0x8(%ebp),%eax
c010252a:	0f b6 10             	movzbl (%eax),%edx
c010252d:	83 ca 01             	or     $0x1,%edx
c0102530:	88 10                	mov    %dl,(%eax)
c0102532:	c9                   	leave  
c0102533:	c3                   	ret    

c0102534 <glue_chunk>:
c0102534:	55                   	push   %ebp
c0102535:	89 e5                	mov    %esp,%ebp
c0102537:	83 ec 14             	sub    $0x14,%esp
c010253a:	8b 45 08             	mov    0x8(%ebp),%eax
c010253d:	83 c0 04             	add    $0x4,%eax
c0102540:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102543:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102546:	8b 40 04             	mov    0x4(%eax),%eax
c0102549:	3d 00 90 10 c0       	cmp    $0xc0109000,%eax
c010254e:	74 58                	je     c01025a8 <glue_chunk+0x74>
c0102550:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102553:	8b 40 04             	mov    0x4(%eax),%eax
c0102556:	83 e8 04             	sub    $0x4,%eax
c0102559:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010255c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010255f:	0f b6 00             	movzbl (%eax),%eax
c0102562:	83 e0 01             	and    $0x1,%eax
c0102565:	84 c0                	test   %al,%al
c0102567:	75 3f                	jne    c01025a8 <glue_chunk+0x74>
c0102569:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010256c:	8b 00                	mov    (%eax),%eax
c010256e:	d1 e8                	shr    %eax
c0102570:	89 c2                	mov    %eax,%edx
c0102572:	8b 45 08             	mov    0x8(%ebp),%eax
c0102575:	8b 00                	mov    (%eax),%eax
c0102577:	d1 e8                	shr    %eax
c0102579:	01 d0                	add    %edx,%eax
c010257b:	83 c0 0c             	add    $0xc,%eax
c010257e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
c0102583:	89 c2                	mov    %eax,%edx
c0102585:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102588:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
c010258b:	8b 10                	mov    (%eax),%edx
c010258d:	83 e2 01             	and    $0x1,%edx
c0102590:	09 ca                	or     %ecx,%edx
c0102592:	89 10                	mov    %edx,(%eax)
c0102594:	8b 45 08             	mov    0x8(%ebp),%eax
c0102597:	83 c0 04             	add    $0x4,%eax
c010259a:	89 04 24             	mov    %eax,(%esp)
c010259d:	e8 e2 fc ff ff       	call   c0102284 <list_del>
c01025a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01025a5:	89 45 08             	mov    %eax,0x8(%ebp)
c01025a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01025ab:	8b 00                	mov    (%eax),%eax
c01025ad:	3d 00 90 10 c0       	cmp    $0xc0109000,%eax
c01025b2:	74 51                	je     c0102605 <glue_chunk+0xd1>
c01025b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01025b7:	8b 00                	mov    (%eax),%eax
c01025b9:	83 e8 04             	sub    $0x4,%eax
c01025bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01025bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025c2:	0f b6 00             	movzbl (%eax),%eax
c01025c5:	83 e0 01             	and    $0x1,%eax
c01025c8:	84 c0                	test   %al,%al
c01025ca:	75 39                	jne    c0102605 <glue_chunk+0xd1>
c01025cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01025cf:	8b 00                	mov    (%eax),%eax
c01025d1:	d1 e8                	shr    %eax
c01025d3:	89 c2                	mov    %eax,%edx
c01025d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025d8:	8b 00                	mov    (%eax),%eax
c01025da:	d1 e8                	shr    %eax
c01025dc:	01 d0                	add    %edx,%eax
c01025de:	83 c0 0c             	add    $0xc,%eax
c01025e1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
c01025e6:	89 c2                	mov    %eax,%edx
c01025e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025eb:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
c01025ee:	8b 10                	mov    (%eax),%edx
c01025f0:	83 e2 01             	and    $0x1,%edx
c01025f3:	09 ca                	or     %ecx,%edx
c01025f5:	89 10                	mov    %edx,(%eax)
c01025f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025fa:	83 c0 04             	add    $0x4,%eax
c01025fd:	89 04 24             	mov    %eax,(%esp)
c0102600:	e8 7f fc ff ff       	call   c0102284 <list_del>
c0102605:	c9                   	leave  
c0102606:	c3                   	ret    

c0102607 <kmalloc>:
c0102607:	55                   	push   %ebp
c0102608:	89 e5                	mov    %esp,%ebp
c010260a:	83 ec 18             	sub    $0x18,%esp
c010260d:	b8 20 00 00 00       	mov    $0x20,%eax
c0102612:	83 7d 08 20          	cmpl   $0x20,0x8(%ebp)
c0102616:	0f 43 45 08          	cmovae 0x8(%ebp),%eax
c010261a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010261d:	83 45 f8 0c          	addl   $0xc,-0x8(%ebp)
c0102621:	c7 04 24 00 90 10 c0 	movl   $0xc0109000,(%esp)
c0102628:	e8 76 fc ff ff       	call   c01022a3 <list_empty>
c010262d:	85 c0                	test   %eax,%eax
c010262f:	75 64                	jne    c0102695 <kmalloc+0x8e>
c0102631:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102638:	a1 00 90 10 c0       	mov    0xc0109000,%eax
c010263d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102640:	eb 4a                	jmp    c010268c <kmalloc+0x85>
c0102642:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102645:	83 e8 04             	sub    $0x4,%eax
c0102648:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010264b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010264e:	0f b6 00             	movzbl (%eax),%eax
c0102651:	83 e0 01             	and    $0x1,%eax
c0102654:	84 c0                	test   %al,%al
c0102656:	75 2c                	jne    c0102684 <kmalloc+0x7d>
c0102658:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010265b:	8b 00                	mov    (%eax),%eax
c010265d:	d1 e8                	shr    %eax
c010265f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0102662:	76 20                	jbe    c0102684 <kmalloc+0x7d>
c0102664:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102667:	89 44 24 04          	mov    %eax,0x4(%esp)
c010266b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010266e:	89 04 24             	mov    %eax,(%esp)
c0102671:	e8 2f fe ff ff       	call   c01024a5 <split_chunk>
c0102676:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102679:	83 c0 0c             	add    $0xc,%eax
c010267c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010267f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102682:	eb 16                	jmp    c010269a <kmalloc+0x93>
c0102684:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102687:	8b 00                	mov    (%eax),%eax
c0102689:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010268c:	81 7d fc 00 90 10 c0 	cmpl   $0xc0109000,-0x4(%ebp)
c0102693:	75 ad                	jne    c0102642 <kmalloc+0x3b>
c0102695:	b8 00 00 00 00       	mov    $0x0,%eax
c010269a:	c9                   	leave  
c010269b:	c3                   	ret    

c010269c <kfree>:
c010269c:	55                   	push   %ebp
c010269d:	89 e5                	mov    %esp,%ebp
c010269f:	83 ec 14             	sub    $0x14,%esp
c01026a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01026a5:	83 e8 0c             	sub    $0xc,%eax
c01026a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01026ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01026ae:	0f b6 00             	movzbl (%eax),%eax
c01026b1:	83 e0 01             	and    $0x1,%eax
c01026b4:	84 c0                	test   %al,%al
c01026b6:	75 02                	jne    c01026ba <kfree+0x1e>
c01026b8:	eb 16                	jmp    c01026d0 <kfree+0x34>
c01026ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01026bd:	0f b6 10             	movzbl (%eax),%edx
c01026c0:	83 e2 fe             	and    $0xfffffffe,%edx
c01026c3:	88 10                	mov    %dl,(%eax)
c01026c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01026c8:	89 04 24             	mov    %eax,(%esp)
c01026cb:	e8 64 fe ff ff       	call   c0102534 <glue_chunk>
c01026d0:	c9                   	leave  
c01026d1:	c3                   	ret    

c01026d2 <set_bit>:
c01026d2:	55                   	push   %ebp
c01026d3:	89 e5                	mov    %esp,%ebp
c01026d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026d8:	8b 55 08             	mov    0x8(%ebp),%edx
c01026db:	0f ab 10             	bts    %edx,(%eax)
c01026de:	5d                   	pop    %ebp
c01026df:	c3                   	ret    

c01026e0 <clear_bit>:
c01026e0:	55                   	push   %ebp
c01026e1:	89 e5                	mov    %esp,%ebp
c01026e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026e6:	8b 55 08             	mov    0x8(%ebp),%edx
c01026e9:	0f b3 10             	btr    %edx,(%eax)
c01026ec:	5d                   	pop    %ebp
c01026ed:	c3                   	ret    

c01026ee <test_bit>:
c01026ee:	55                   	push   %ebp
c01026ef:	89 e5                	mov    %esp,%ebp
c01026f1:	83 ec 10             	sub    $0x10,%esp
c01026f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026f7:	8b 55 08             	mov    0x8(%ebp),%edx
c01026fa:	0f a3 10             	bt     %edx,(%eax)
c01026fd:	19 c0                	sbb    %eax,%eax
c01026ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102702:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0102706:	0f 95 c0             	setne  %al
c0102709:	0f b6 c0             	movzbl %al,%eax
c010270c:	c9                   	leave  
c010270d:	c3                   	ret    

c010270e <atomic_read>:
c010270e:	55                   	push   %ebp
c010270f:	89 e5                	mov    %esp,%ebp
c0102711:	8b 45 08             	mov    0x8(%ebp),%eax
c0102714:	8b 00                	mov    (%eax),%eax
c0102716:	5d                   	pop    %ebp
c0102717:	c3                   	ret    

c0102718 <atomic_set>:
c0102718:	55                   	push   %ebp
c0102719:	89 e5                	mov    %esp,%ebp
c010271b:	8b 45 08             	mov    0x8(%ebp),%eax
c010271e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102721:	89 10                	mov    %edx,(%eax)
c0102723:	5d                   	pop    %ebp
c0102724:	c3                   	ret    

c0102725 <atomic_add>:
c0102725:	55                   	push   %ebp
c0102726:	89 e5                	mov    %esp,%ebp
c0102728:	8b 45 08             	mov    0x8(%ebp),%eax
c010272b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010272e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102731:	f0 01 10             	lock add %edx,(%eax)
c0102734:	5d                   	pop    %ebp
c0102735:	c3                   	ret    

c0102736 <atomic_sub>:
c0102736:	55                   	push   %ebp
c0102737:	89 e5                	mov    %esp,%ebp
c0102739:	8b 45 08             	mov    0x8(%ebp),%eax
c010273c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010273f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102742:	f0 29 10             	lock sub %edx,(%eax)
c0102745:	5d                   	pop    %ebp
c0102746:	c3                   	ret    

c0102747 <set_page_ref>:
c0102747:	55                   	push   %ebp
c0102748:	89 e5                	mov    %esp,%ebp
c010274a:	83 ec 08             	sub    $0x8,%esp
c010274d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102750:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102753:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102757:	89 04 24             	mov    %eax,(%esp)
c010275a:	e8 b9 ff ff ff       	call   c0102718 <atomic_set>
c010275f:	c9                   	leave  
c0102760:	c3                   	ret    

c0102761 <INIT_LIST_HEAD>:
c0102761:	55                   	push   %ebp
c0102762:	89 e5                	mov    %esp,%ebp
c0102764:	8b 45 08             	mov    0x8(%ebp),%eax
c0102767:	8b 55 08             	mov    0x8(%ebp),%edx
c010276a:	89 10                	mov    %edx,(%eax)
c010276c:	8b 45 08             	mov    0x8(%ebp),%eax
c010276f:	8b 55 08             	mov    0x8(%ebp),%edx
c0102772:	89 50 04             	mov    %edx,0x4(%eax)
c0102775:	5d                   	pop    %ebp
c0102776:	c3                   	ret    

c0102777 <__list_add>:
c0102777:	55                   	push   %ebp
c0102778:	89 e5                	mov    %esp,%ebp
c010277a:	8b 45 10             	mov    0x10(%ebp),%eax
c010277d:	8b 55 08             	mov    0x8(%ebp),%edx
c0102780:	89 50 04             	mov    %edx,0x4(%eax)
c0102783:	8b 45 08             	mov    0x8(%ebp),%eax
c0102786:	8b 55 10             	mov    0x10(%ebp),%edx
c0102789:	89 10                	mov    %edx,(%eax)
c010278b:	8b 45 08             	mov    0x8(%ebp),%eax
c010278e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102791:	89 50 04             	mov    %edx,0x4(%eax)
c0102794:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102797:	8b 55 08             	mov    0x8(%ebp),%edx
c010279a:	89 10                	mov    %edx,(%eax)
c010279c:	5d                   	pop    %ebp
c010279d:	c3                   	ret    

c010279e <list_add_before>:
c010279e:	55                   	push   %ebp
c010279f:	89 e5                	mov    %esp,%ebp
c01027a1:	83 ec 0c             	sub    $0xc,%esp
c01027a4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027a7:	8b 40 04             	mov    0x4(%eax),%eax
c01027aa:	8b 55 0c             	mov    0xc(%ebp),%edx
c01027ad:	89 54 24 08          	mov    %edx,0x8(%esp)
c01027b1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01027b8:	89 04 24             	mov    %eax,(%esp)
c01027bb:	e8 b7 ff ff ff       	call   c0102777 <__list_add>
c01027c0:	c9                   	leave  
c01027c1:	c3                   	ret    

c01027c2 <__list_del>:
c01027c2:	55                   	push   %ebp
c01027c3:	89 e5                	mov    %esp,%ebp
c01027c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027c8:	8b 55 08             	mov    0x8(%ebp),%edx
c01027cb:	89 50 04             	mov    %edx,0x4(%eax)
c01027ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01027d1:	8b 55 0c             	mov    0xc(%ebp),%edx
c01027d4:	89 10                	mov    %edx,(%eax)
c01027d6:	5d                   	pop    %ebp
c01027d7:	c3                   	ret    

c01027d8 <list_del>:
c01027d8:	55                   	push   %ebp
c01027d9:	89 e5                	mov    %esp,%ebp
c01027db:	83 ec 08             	sub    $0x8,%esp
c01027de:	8b 45 08             	mov    0x8(%ebp),%eax
c01027e1:	8b 10                	mov    (%eax),%edx
c01027e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01027e6:	8b 40 04             	mov    0x4(%eax),%eax
c01027e9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01027ed:	89 04 24             	mov    %eax,(%esp)
c01027f0:	e8 cd ff ff ff       	call   c01027c2 <__list_del>
c01027f5:	c9                   	leave  
c01027f6:	c3                   	ret    

c01027f7 <ff_page_init>:
c01027f7:	55                   	push   %ebp
c01027f8:	89 e5                	mov    %esp,%ebp
c01027fa:	83 ec 28             	sub    $0x28,%esp
c01027fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102800:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102804:	c7 04 24 10 b0 10 c0 	movl   $0xc010b010,(%esp)
c010280b:	e8 08 ff ff ff       	call   c0102718 <atomic_set>
c0102810:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102813:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102817:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c010281e:	e8 f5 fe ff ff       	call   c0102718 <atomic_set>
c0102823:	8b 45 08             	mov    0x8(%ebp),%eax
c0102826:	89 04 24             	mov    %eax,(%esp)
c0102829:	e8 a5 44 00 00       	call   c0106cd3 <page_to_addr>
c010282e:	a3 08 b0 10 c0       	mov    %eax,0xc010b008
c0102833:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102836:	89 d0                	mov    %edx,%eax
c0102838:	c1 e0 02             	shl    $0x2,%eax
c010283b:	01 d0                	add    %edx,%eax
c010283d:	c1 e0 02             	shl    $0x2,%eax
c0102840:	8d 50 ec             	lea    -0x14(%eax),%edx
c0102843:	8b 45 08             	mov    0x8(%ebp),%eax
c0102846:	01 d0                	add    %edx,%eax
c0102848:	89 04 24             	mov    %eax,(%esp)
c010284b:	e8 83 44 00 00       	call   c0106cd3 <page_to_addr>
c0102850:	05 00 10 00 00       	add    $0x1000,%eax
c0102855:	a3 0c b0 10 c0       	mov    %eax,0xc010b00c
c010285a:	c7 04 24 00 b0 10 c0 	movl   $0xc010b000,(%esp)
c0102861:	e8 fb fe ff ff       	call   c0102761 <INIT_LIST_HEAD>
c0102866:	8b 45 08             	mov    0x8(%ebp),%eax
c0102869:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010286c:	eb 30                	jmp    c010289e <ff_page_init+0xa7>
c010286e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102871:	83 c0 04             	add    $0x4,%eax
c0102874:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102878:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010287f:	e8 4e fe ff ff       	call   c01026d2 <set_bit>
c0102884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102887:	83 c0 0c             	add    $0xc,%eax
c010288a:	c7 44 24 04 00 b0 10 	movl   $0xc010b000,0x4(%esp)
c0102891:	c0 
c0102892:	89 04 24             	mov    %eax,(%esp)
c0102895:	e8 04 ff ff ff       	call   c010279e <list_add_before>
c010289a:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
c010289e:	8b 55 0c             	mov    0xc(%ebp),%edx
c01028a1:	89 d0                	mov    %edx,%eax
c01028a3:	c1 e0 02             	shl    $0x2,%eax
c01028a6:	01 d0                	add    %edx,%eax
c01028a8:	c1 e0 02             	shl    $0x2,%eax
c01028ab:	89 c2                	mov    %eax,%edx
c01028ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01028b0:	01 d0                	add    %edx,%eax
c01028b2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01028b5:	77 b7                	ja     c010286e <ff_page_init+0x77>
c01028b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01028ba:	8b 55 0c             	mov    0xc(%ebp),%edx
c01028bd:	89 50 08             	mov    %edx,0x8(%eax)
c01028c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01028c3:	83 c0 04             	add    $0x4,%eax
c01028c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01028d1:	e8 fc fd ff ff       	call   c01026d2 <set_bit>
c01028d6:	e8 2c 03 00 00       	call   c0102c07 <ff_show_memory_info>
c01028db:	c9                   	leave  
c01028dc:	c3                   	ret    

c01028dd <ff_alloc_pages>:
c01028dd:	55                   	push   %ebp
c01028de:	89 e5                	mov    %esp,%ebp
c01028e0:	83 ec 38             	sub    $0x38,%esp
c01028e3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01028e7:	74 11                	je     c01028fa <ff_alloc_pages+0x1d>
c01028e9:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c01028f0:	e8 19 fe ff ff       	call   c010270e <atomic_read>
c01028f5:	3b 45 08             	cmp    0x8(%ebp),%eax
c01028f8:	73 0a                	jae    c0102904 <ff_alloc_pages+0x27>
c01028fa:	b8 00 00 00 00       	mov    $0x0,%eax
c01028ff:	e9 13 01 00 00       	jmp    c0102a17 <ff_alloc_pages+0x13a>
c0102904:	c7 45 f4 00 b0 10 c0 	movl   $0xc010b000,-0xc(%ebp)
c010290b:	90                   	nop
c010290c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010290f:	8b 00                	mov    (%eax),%eax
c0102911:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102914:	81 7d f4 00 b0 10 c0 	cmpl   $0xc010b000,-0xc(%ebp)
c010291b:	0f 84 f1 00 00 00    	je     c0102a12 <ff_alloc_pages+0x135>
c0102921:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102924:	83 e8 0c             	sub    $0xc,%eax
c0102927:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010292a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010292d:	83 c0 04             	add    $0x4,%eax
c0102930:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102934:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010293b:	e8 ae fd ff ff       	call   c01026ee <test_bit>
c0102940:	85 c0                	test   %eax,%eax
c0102942:	74 58                	je     c010299c <ff_alloc_pages+0xbf>
c0102944:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102947:	8b 40 08             	mov    0x8(%eax),%eax
c010294a:	3b 45 08             	cmp    0x8(%ebp),%eax
c010294d:	72 4d                	jb     c010299c <ff_alloc_pages+0xbf>
c010294f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102956:	eb 3c                	jmp    c0102994 <ff_alloc_pages+0xb7>
c0102958:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010295b:	8b 00                	mov    (%eax),%eax
c010295d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0102960:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102963:	83 e8 0c             	sub    $0xc,%eax
c0102966:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102969:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010296c:	83 c0 04             	add    $0x4,%eax
c010296f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102973:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010297a:	e8 61 fd ff ff       	call   c01026e0 <clear_bit>
c010297f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102982:	89 04 24             	mov    %eax,(%esp)
c0102985:	e8 4e fe ff ff       	call   c01027d8 <list_del>
c010298a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010298d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102990:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102994:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102997:	3b 45 08             	cmp    0x8(%ebp),%eax
c010299a:	72 bc                	jb     c0102958 <ff_alloc_pages+0x7b>
c010299c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010299f:	8b 40 08             	mov    0x8(%eax),%eax
c01029a2:	3b 45 08             	cmp    0x8(%ebp),%eax
c01029a5:	76 2b                	jbe    c01029d2 <ff_alloc_pages+0xf5>
c01029a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029aa:	83 e8 0c             	sub    $0xc,%eax
c01029ad:	83 c0 04             	add    $0x4,%eax
c01029b0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01029bb:	e8 12 fd ff ff       	call   c01026d2 <set_bit>
c01029c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029c3:	8d 50 f4             	lea    -0xc(%eax),%edx
c01029c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029c9:	8b 40 08             	mov    0x8(%eax),%eax
c01029cc:	2b 45 08             	sub    0x8(%ebp),%eax
c01029cf:	89 42 08             	mov    %eax,0x8(%edx)
c01029d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029d5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01029dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029df:	83 c0 04             	add    $0x4,%eax
c01029e2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01029ed:	e8 ee fc ff ff       	call   c01026e0 <clear_bit>
c01029f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01029f5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029f9:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c0102a00:	e8 31 fd ff ff       	call   c0102736 <atomic_sub>
c0102a05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a08:	89 04 24             	mov    %eax,(%esp)
c0102a0b:	e8 c3 42 00 00       	call   c0106cd3 <page_to_addr>
c0102a10:	eb 05                	jmp    c0102a17 <ff_alloc_pages+0x13a>
c0102a12:	b8 00 00 00 00       	mov    $0x0,%eax
c0102a17:	c9                   	leave  
c0102a18:	c3                   	ret    

c0102a19 <ff_free_pages>:
c0102a19:	55                   	push   %ebp
c0102a1a:	89 e5                	mov    %esp,%ebp
c0102a1c:	83 ec 28             	sub    $0x28,%esp
c0102a1f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a23:	75 05                	jne    c0102a2a <ff_free_pages+0x11>
c0102a25:	e9 c7 01 00 00       	jmp    c0102bf1 <ff_free_pages+0x1d8>
c0102a2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a2d:	89 04 24             	mov    %eax,(%esp)
c0102a30:	e8 57 42 00 00       	call   c0106c8c <addr_to_page>
c0102a35:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102a38:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a3b:	83 c0 04             	add    $0x4,%eax
c0102a3e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a42:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0102a49:	e8 a0 fc ff ff       	call   c01026ee <test_bit>
c0102a4e:	85 c0                	test   %eax,%eax
c0102a50:	74 0c                	je     c0102a5e <ff_free_pages+0x45>
c0102a52:	c7 04 24 3e 97 10 c0 	movl   $0xc010973e,(%esp)
c0102a59:	e8 64 49 00 00       	call   c01073c2 <panic>
c0102a5e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102a65:	00 
c0102a66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a69:	89 04 24             	mov    %eax,(%esp)
c0102a6c:	e8 d6 fc ff ff       	call   c0102747 <set_page_ref>
c0102a71:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a74:	83 c0 04             	add    $0x4,%eax
c0102a77:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102a82:	e8 4b fc ff ff       	call   c01026d2 <set_bit>
c0102a87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a8a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102a8d:	89 50 08             	mov    %edx,0x8(%eax)
c0102a90:	c7 45 f0 00 b0 10 c0 	movl   $0xc010b000,-0x10(%ebp)
c0102a97:	eb 13                	jmp    c0102aac <ff_free_pages+0x93>
c0102a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a9c:	83 e8 0c             	sub    $0xc,%eax
c0102a9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102aa5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0102aa8:	76 02                	jbe    c0102aac <ff_free_pages+0x93>
c0102aaa:	eb 11                	jmp    c0102abd <ff_free_pages+0xa4>
c0102aac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102aaf:	8b 00                	mov    (%eax),%eax
c0102ab1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102ab4:	81 7d f0 00 b0 10 c0 	cmpl   $0xc010b000,-0x10(%ebp)
c0102abb:	75 dc                	jne    c0102a99 <ff_free_pages+0x80>
c0102abd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ac0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102ac3:	eb 19                	jmp    c0102ade <ff_free_pages+0xc5>
c0102ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102ac8:	8d 50 0c             	lea    0xc(%eax),%edx
c0102acb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ace:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ad2:	89 14 24             	mov    %edx,(%esp)
c0102ad5:	e8 c4 fc ff ff       	call   c010279e <list_add_before>
c0102ada:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
c0102ade:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102ae1:	89 d0                	mov    %edx,%eax
c0102ae3:	c1 e0 02             	shl    $0x2,%eax
c0102ae6:	01 d0                	add    %edx,%eax
c0102ae8:	c1 e0 02             	shl    $0x2,%eax
c0102aeb:	89 c2                	mov    %eax,%edx
c0102aed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102af0:	01 d0                	add    %edx,%eax
c0102af2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0102af5:	77 ce                	ja     c0102ac5 <ff_free_pages+0xac>
c0102af7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102afa:	83 e8 0c             	sub    $0xc,%eax
c0102afd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b00:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102b03:	89 d0                	mov    %edx,%eax
c0102b05:	c1 e0 02             	shl    $0x2,%eax
c0102b08:	01 d0                	add    %edx,%eax
c0102b0a:	c1 e0 02             	shl    $0x2,%eax
c0102b0d:	89 c2                	mov    %eax,%edx
c0102b0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b12:	01 d0                	add    %edx,%eax
c0102b14:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0102b17:	75 34                	jne    c0102b4d <ff_free_pages+0x134>
c0102b19:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b1c:	8b 50 08             	mov    0x8(%eax),%edx
c0102b1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b22:	8b 40 08             	mov    0x8(%eax),%eax
c0102b25:	01 c2                	add    %eax,%edx
c0102b27:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b2a:	89 50 08             	mov    %edx,0x8(%eax)
c0102b2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b30:	83 c0 04             	add    $0x4,%eax
c0102b33:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102b3e:	e8 9d fb ff ff       	call   c01026e0 <clear_bit>
c0102b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b46:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0102b4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b50:	8b 40 10             	mov    0x10(%eax),%eax
c0102b53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b59:	83 e8 0c             	sub    $0xc,%eax
c0102b5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b5f:	81 7d f0 00 b0 10 c0 	cmpl   $0xc010b000,-0x10(%ebp)
c0102b66:	74 76                	je     c0102bde <ff_free_pages+0x1c5>
c0102b68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b6b:	83 e8 14             	sub    $0x14,%eax
c0102b6e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0102b71:	75 6b                	jne    c0102bde <ff_free_pages+0x1c5>
c0102b73:	eb 60                	jmp    c0102bd5 <ff_free_pages+0x1bc>
c0102b75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b78:	83 c0 04             	add    $0x4,%eax
c0102b7b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102b86:	e8 63 fb ff ff       	call   c01026ee <test_bit>
c0102b8b:	85 c0                	test   %eax,%eax
c0102b8d:	74 34                	je     c0102bc3 <ff_free_pages+0x1aa>
c0102b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b92:	8b 50 08             	mov    0x8(%eax),%edx
c0102b95:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b98:	8b 40 08             	mov    0x8(%eax),%eax
c0102b9b:	01 c2                	add    %eax,%edx
c0102b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102ba0:	89 50 08             	mov    %edx,0x8(%eax)
c0102ba3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ba6:	83 c0 04             	add    $0x4,%eax
c0102ba9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102bad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102bb4:	e8 27 fb ff ff       	call   c01026e0 <clear_bit>
c0102bb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102bbc:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0102bc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102bc6:	8b 40 04             	mov    0x4(%eax),%eax
c0102bc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102bcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102bcf:	83 e8 0c             	sub    $0xc,%eax
c0102bd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102bd5:	81 7d f0 00 b0 10 c0 	cmpl   $0xc010b000,-0x10(%ebp)
c0102bdc:	75 97                	jne    c0102b75 <ff_free_pages+0x15c>
c0102bde:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102be1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102be5:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c0102bec:	e8 34 fb ff ff       	call   c0102725 <atomic_add>
c0102bf1:	c9                   	leave  
c0102bf2:	c3                   	ret    

c0102bf3 <ff_free_pages_count>:
c0102bf3:	55                   	push   %ebp
c0102bf4:	89 e5                	mov    %esp,%ebp
c0102bf6:	83 ec 04             	sub    $0x4,%esp
c0102bf9:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c0102c00:	e8 09 fb ff ff       	call   c010270e <atomic_read>
c0102c05:	c9                   	leave  
c0102c06:	c3                   	ret    

c0102c07 <ff_show_memory_info>:
c0102c07:	55                   	push   %ebp
c0102c08:	89 e5                	mov    %esp,%ebp
c0102c0a:	53                   	push   %ebx
c0102c0b:	83 ec 14             	sub    $0x14,%esp
c0102c0e:	8b 15 0c b0 10 c0    	mov    0xc010b00c,%edx
c0102c14:	a1 08 b0 10 c0       	mov    0xc010b008,%eax
c0102c19:	89 54 24 08          	mov    %edx,0x8(%esp)
c0102c1d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c21:	c7 04 24 54 97 10 c0 	movl   $0xc0109754,(%esp)
c0102c28:	e8 7a 2f 00 00       	call   c0105ba7 <printk>
c0102c2d:	c7 04 24 10 b0 10 c0 	movl   $0xc010b010,(%esp)
c0102c34:	e8 d5 fa ff ff       	call   c010270e <atomic_read>
c0102c39:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
c0102c40:	c7 04 24 10 b0 10 c0 	movl   $0xc010b010,(%esp)
c0102c47:	e8 c2 fa ff ff       	call   c010270e <atomic_read>
c0102c4c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102c50:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c54:	c7 04 24 84 97 10 c0 	movl   $0xc0109784,(%esp)
c0102c5b:	e8 47 2f 00 00       	call   c0105ba7 <printk>
c0102c60:	83 c4 14             	add    $0x14,%esp
c0102c63:	5b                   	pop    %ebx
c0102c64:	5d                   	pop    %ebp
c0102c65:	c3                   	ret    

c0102c66 <ff_show_management_info>:
c0102c66:	55                   	push   %ebp
c0102c67:	89 e5                	mov    %esp,%ebp
c0102c69:	56                   	push   %esi
c0102c6a:	53                   	push   %ebx
c0102c6b:	83 ec 10             	sub    $0x10,%esp
c0102c6e:	c7 04 24 10 b0 10 c0 	movl   $0xc010b010,(%esp)
c0102c75:	e8 94 fa ff ff       	call   c010270e <atomic_read>
c0102c7a:	89 c3                	mov    %eax,%ebx
c0102c7c:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c0102c83:	e8 86 fa ff ff       	call   c010270e <atomic_read>
c0102c88:	29 c3                	sub    %eax,%ebx
c0102c8a:	89 d8                	mov    %ebx,%eax
c0102c8c:	8d 34 85 00 00 00 00 	lea    0x0(,%eax,4),%esi
c0102c93:	c7 04 24 10 b0 10 c0 	movl   $0xc010b010,(%esp)
c0102c9a:	e8 6f fa ff ff       	call   c010270e <atomic_read>
c0102c9f:	89 c3                	mov    %eax,%ebx
c0102ca1:	c7 04 24 14 b0 10 c0 	movl   $0xc010b014,(%esp)
c0102ca8:	e8 61 fa ff ff       	call   c010270e <atomic_read>
c0102cad:	29 c3                	sub    %eax,%ebx
c0102caf:	89 d8                	mov    %ebx,%eax
c0102cb1:	89 74 24 08          	mov    %esi,0x8(%esp)
c0102cb5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cb9:	c7 04 24 b4 97 10 c0 	movl   $0xc01097b4,(%esp)
c0102cc0:	e8 e2 2e 00 00       	call   c0105ba7 <printk>
c0102cc5:	83 c4 10             	add    $0x10,%esp
c0102cc8:	5b                   	pop    %ebx
c0102cc9:	5e                   	pop    %esi
c0102cca:	5d                   	pop    %ebp
c0102ccb:	c3                   	ret    

c0102ccc <ff_test_mm>:
c0102ccc:	55                   	push   %ebp
c0102ccd:	89 e5                	mov    %esp,%ebp
c0102ccf:	83 ec 28             	sub    $0x28,%esp
c0102cd2:	a1 08 90 10 c0       	mov    0xc0109008,%eax
c0102cd7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cdb:	c7 04 24 e3 97 10 c0 	movl   $0xc01097e3,(%esp)
c0102ce2:	e8 c0 2e 00 00       	call   c0105ba7 <printk>
c0102ce7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0102cee:	e8 ea fb ff ff       	call   c01028dd <ff_alloc_pages>
c0102cf3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102cf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cfd:	c7 04 24 f3 97 10 c0 	movl   $0xc01097f3,(%esp)
c0102d04:	e8 9e 2e 00 00       	call   c0105ba7 <printk>
c0102d09:	e8 58 ff ff ff       	call   c0102c66 <ff_show_management_info>
c0102d0e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0102d15:	e8 c3 fb ff ff       	call   c01028dd <ff_alloc_pages>
c0102d1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d20:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d24:	c7 04 24 0a 98 10 c0 	movl   $0xc010980a,(%esp)
c0102d2b:	e8 77 2e 00 00       	call   c0105ba7 <printk>
c0102d30:	e8 31 ff ff ff       	call   c0102c66 <ff_show_management_info>
c0102d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d38:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d3c:	c7 04 24 21 98 10 c0 	movl   $0xc0109821,(%esp)
c0102d43:	e8 5f 2e 00 00       	call   c0105ba7 <printk>
c0102d48:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0102d4f:	00 
c0102d50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d53:	89 04 24             	mov    %eax,(%esp)
c0102d56:	e8 be fc ff ff       	call   c0102a19 <ff_free_pages>
c0102d5b:	e8 06 ff ff ff       	call   c0102c66 <ff_show_management_info>
c0102d60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d63:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d67:	c7 04 24 37 98 10 c0 	movl   $0xc0109837,(%esp)
c0102d6e:	e8 34 2e 00 00       	call   c0105ba7 <printk>
c0102d73:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c0102d7a:	00 
c0102d7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d7e:	89 04 24             	mov    %eax,(%esp)
c0102d81:	e8 93 fc ff ff       	call   c0102a19 <ff_free_pages>
c0102d86:	e8 db fe ff ff       	call   c0102c66 <ff_show_management_info>
c0102d8b:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
c0102d92:	e8 46 fb ff ff       	call   c01028dd <ff_alloc_pages>
c0102d97:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102d9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d9d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102da1:	c7 04 24 4d 98 10 c0 	movl   $0xc010984d,(%esp)
c0102da8:	e8 fa 2d 00 00       	call   c0105ba7 <printk>
c0102dad:	e8 b4 fe ff ff       	call   c0102c66 <ff_show_management_info>
c0102db2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102db5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102db9:	c7 04 24 65 98 10 c0 	movl   $0xc0109865,(%esp)
c0102dc0:	e8 e2 2d 00 00       	call   c0105ba7 <printk>
c0102dc5:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
c0102dcc:	00 
c0102dcd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102dd0:	89 04 24             	mov    %eax,(%esp)
c0102dd3:	e8 41 fc ff ff       	call   c0102a19 <ff_free_pages>
c0102dd8:	e8 89 fe ff ff       	call   c0102c66 <ff_show_management_info>
c0102ddd:	c9                   	leave  
c0102dde:	c3                   	ret    

c0102ddf <mm_init>:
c0102ddf:	55                   	push   %ebp
c0102de0:	89 e5                	mov    %esp,%ebp
c0102de2:	83 ec 08             	sub    $0x8,%esp
c0102de5:	e8 ce 3a 00 00       	call   c01068b8 <pmm_init>
c0102dea:	e8 36 42 00 00       	call   c0107025 <vmm_init>
c0102def:	e8 57 f6 ff ff       	call   c010244b <slob_init>
c0102df4:	c9                   	leave  
c0102df5:	c3                   	ret    

c0102df6 <set_bit>:
c0102df6:	55                   	push   %ebp
c0102df7:	89 e5                	mov    %esp,%ebp
c0102df9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dfc:	8b 55 08             	mov    0x8(%ebp),%edx
c0102dff:	0f ab 10             	bts    %edx,(%eax)
c0102e02:	5d                   	pop    %ebp
c0102e03:	c3                   	ret    

c0102e04 <clear_bit>:
c0102e04:	55                   	push   %ebp
c0102e05:	89 e5                	mov    %esp,%ebp
c0102e07:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e0a:	8b 55 08             	mov    0x8(%ebp),%edx
c0102e0d:	0f b3 10             	btr    %edx,(%eax)
c0102e10:	5d                   	pop    %ebp
c0102e11:	c3                   	ret    

c0102e12 <test_bit>:
c0102e12:	55                   	push   %ebp
c0102e13:	89 e5                	mov    %esp,%ebp
c0102e15:	83 ec 10             	sub    $0x10,%esp
c0102e18:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e1b:	8b 55 08             	mov    0x8(%ebp),%edx
c0102e1e:	0f a3 10             	bt     %edx,(%eax)
c0102e21:	19 c0                	sbb    %eax,%eax
c0102e23:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102e26:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0102e2a:	0f 95 c0             	setne  %al
c0102e2d:	0f b6 c0             	movzbl %al,%eax
c0102e30:	c9                   	leave  
c0102e31:	c3                   	ret    

c0102e32 <atomic_read>:
c0102e32:	55                   	push   %ebp
c0102e33:	89 e5                	mov    %esp,%ebp
c0102e35:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e38:	8b 00                	mov    (%eax),%eax
c0102e3a:	5d                   	pop    %ebp
c0102e3b:	c3                   	ret    

c0102e3c <atomic_set>:
c0102e3c:	55                   	push   %ebp
c0102e3d:	89 e5                	mov    %esp,%ebp
c0102e3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e42:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102e45:	89 10                	mov    %edx,(%eax)
c0102e47:	5d                   	pop    %ebp
c0102e48:	c3                   	ret    

c0102e49 <atomic_add>:
c0102e49:	55                   	push   %ebp
c0102e4a:	89 e5                	mov    %esp,%ebp
c0102e4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e4f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102e52:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102e55:	f0 01 10             	lock add %edx,(%eax)
c0102e58:	5d                   	pop    %ebp
c0102e59:	c3                   	ret    

c0102e5a <atomic_sub>:
c0102e5a:	55                   	push   %ebp
c0102e5b:	89 e5                	mov    %esp,%ebp
c0102e5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e60:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102e63:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102e66:	f0 29 10             	lock sub %edx,(%eax)
c0102e69:	5d                   	pop    %ebp
c0102e6a:	c3                   	ret    

c0102e6b <atomic_inc>:
c0102e6b:	55                   	push   %ebp
c0102e6c:	89 e5                	mov    %esp,%ebp
c0102e6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e71:	8b 55 08             	mov    0x8(%ebp),%edx
c0102e74:	f0 ff 00             	lock incl (%eax)
c0102e77:	5d                   	pop    %ebp
c0102e78:	c3                   	ret    

c0102e79 <atomic_dec>:
c0102e79:	55                   	push   %ebp
c0102e7a:	89 e5                	mov    %esp,%ebp
c0102e7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e7f:	8b 55 08             	mov    0x8(%ebp),%edx
c0102e82:	f0 ff 08             	lock decl (%eax)
c0102e85:	5d                   	pop    %ebp
c0102e86:	c3                   	ret    

c0102e87 <set_page_ref>:
c0102e87:	55                   	push   %ebp
c0102e88:	89 e5                	mov    %esp,%ebp
c0102e8a:	83 ec 08             	sub    $0x8,%esp
c0102e8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e90:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102e93:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102e97:	89 04 24             	mov    %eax,(%esp)
c0102e9a:	e8 9d ff ff ff       	call   c0102e3c <atomic_set>
c0102e9f:	c9                   	leave  
c0102ea0:	c3                   	ret    

c0102ea1 <INIT_LIST_HEAD>:
c0102ea1:	55                   	push   %ebp
c0102ea2:	89 e5                	mov    %esp,%ebp
c0102ea4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ea7:	8b 55 08             	mov    0x8(%ebp),%edx
c0102eaa:	89 10                	mov    %edx,(%eax)
c0102eac:	8b 45 08             	mov    0x8(%ebp),%eax
c0102eaf:	8b 55 08             	mov    0x8(%ebp),%edx
c0102eb2:	89 50 04             	mov    %edx,0x4(%eax)
c0102eb5:	5d                   	pop    %ebp
c0102eb6:	c3                   	ret    

c0102eb7 <__list_add>:
c0102eb7:	55                   	push   %ebp
c0102eb8:	89 e5                	mov    %esp,%ebp
c0102eba:	8b 45 10             	mov    0x10(%ebp),%eax
c0102ebd:	8b 55 08             	mov    0x8(%ebp),%edx
c0102ec0:	89 50 04             	mov    %edx,0x4(%eax)
c0102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ec6:	8b 55 10             	mov    0x10(%ebp),%edx
c0102ec9:	89 10                	mov    %edx,(%eax)
c0102ecb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ece:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102ed1:	89 50 04             	mov    %edx,0x4(%eax)
c0102ed4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ed7:	8b 55 08             	mov    0x8(%ebp),%edx
c0102eda:	89 10                	mov    %edx,(%eax)
c0102edc:	5d                   	pop    %ebp
c0102edd:	c3                   	ret    

c0102ede <list_add>:
c0102ede:	55                   	push   %ebp
c0102edf:	89 e5                	mov    %esp,%ebp
c0102ee1:	83 ec 0c             	sub    $0xc,%esp
c0102ee4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ee7:	8b 00                	mov    (%eax),%eax
c0102ee9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102eed:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ef0:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ef7:	89 04 24             	mov    %eax,(%esp)
c0102efa:	e8 b8 ff ff ff       	call   c0102eb7 <__list_add>
c0102eff:	c9                   	leave  
c0102f00:	c3                   	ret    

c0102f01 <__list_del>:
c0102f01:	55                   	push   %ebp
c0102f02:	89 e5                	mov    %esp,%ebp
c0102f04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f07:	8b 55 08             	mov    0x8(%ebp),%edx
c0102f0a:	89 50 04             	mov    %edx,0x4(%eax)
c0102f0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f10:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102f13:	89 10                	mov    %edx,(%eax)
c0102f15:	5d                   	pop    %ebp
c0102f16:	c3                   	ret    

c0102f17 <list_del>:
c0102f17:	55                   	push   %ebp
c0102f18:	89 e5                	mov    %esp,%ebp
c0102f1a:	83 ec 08             	sub    $0x8,%esp
c0102f1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f20:	8b 10                	mov    (%eax),%edx
c0102f22:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f25:	8b 40 04             	mov    0x4(%eax),%eax
c0102f28:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102f2c:	89 04 24             	mov    %eax,(%esp)
c0102f2f:	e8 cd ff ff ff       	call   c0102f01 <__list_del>
c0102f34:	c9                   	leave  
c0102f35:	c3                   	ret    

c0102f36 <list_empty>:
c0102f36:	55                   	push   %ebp
c0102f37:	89 e5                	mov    %esp,%ebp
c0102f39:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f3c:	8b 00                	mov    (%eax),%eax
c0102f3e:	3b 45 08             	cmp    0x8(%ebp),%eax
c0102f41:	0f 94 c0             	sete   %al
c0102f44:	0f b6 c0             	movzbl %al,%eax
c0102f47:	5d                   	pop    %ebp
c0102f48:	c3                   	ret    

c0102f49 <buddy_page_init>:
c0102f49:	55                   	push   %ebp
c0102f4a:	89 e5                	mov    %esp,%ebp
c0102f4c:	83 ec 28             	sub    $0x28,%esp
c0102f4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f52:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f56:	c7 04 24 b0 b0 10 c0 	movl   $0xc010b0b0,(%esp)
c0102f5d:	e8 da fe ff ff       	call   c0102e3c <atomic_set>
c0102f62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f65:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f69:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c0102f70:	e8 c7 fe ff ff       	call   c0102e3c <atomic_set>
c0102f75:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f78:	a3 a4 b0 10 c0       	mov    %eax,0xc010b0a4
c0102f7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f80:	89 04 24             	mov    %eax,(%esp)
c0102f83:	e8 4b 3d 00 00       	call   c0106cd3 <page_to_addr>
c0102f88:	a3 a8 b0 10 c0       	mov    %eax,0xc010b0a8
c0102f8d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102f90:	89 d0                	mov    %edx,%eax
c0102f92:	c1 e0 02             	shl    $0x2,%eax
c0102f95:	01 d0                	add    %edx,%eax
c0102f97:	c1 e0 02             	shl    $0x2,%eax
c0102f9a:	8d 50 ec             	lea    -0x14(%eax),%edx
c0102f9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fa0:	01 d0                	add    %edx,%eax
c0102fa2:	89 04 24             	mov    %eax,(%esp)
c0102fa5:	e8 29 3d 00 00       	call   c0106cd3 <page_to_addr>
c0102faa:	05 00 10 00 00       	add    $0x1000,%eax
c0102faf:	a3 ac b0 10 c0       	mov    %eax,0xc010b0ac
c0102fb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102fbb:	eb 38                	jmp    c0102ff5 <buddy_page_init+0xac>
c0102fbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102fc0:	c1 e0 03             	shl    $0x3,%eax
c0102fc3:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0102fc8:	89 04 24             	mov    %eax,(%esp)
c0102fcb:	e8 d1 fe ff ff       	call   c0102ea1 <INIT_LIST_HEAD>
c0102fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102fd3:	83 c0 14             	add    $0x14,%eax
c0102fd6:	c1 e0 02             	shl    $0x2,%eax
c0102fd9:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0102fde:	83 c0 08             	add    $0x8,%eax
c0102fe1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0102fe8:	00 
c0102fe9:	89 04 24             	mov    %eax,(%esp)
c0102fec:	e8 4b fe ff ff       	call   c0102e3c <atomic_set>
c0102ff1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102ff5:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0102ff9:	7e c2                	jle    c0102fbd <buddy_page_init+0x74>
c0102ffb:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
c0103002:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103005:	ba 01 00 00 00       	mov    $0x1,%edx
c010300a:	89 c1                	mov    %eax,%ecx
c010300c:	d3 e2                	shl    %cl,%edx
c010300e:	89 d0                	mov    %edx,%eax
c0103010:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103013:	8b 45 08             	mov    0x8(%ebp),%eax
c0103016:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103019:	eb 7d                	jmp    c0103098 <buddy_page_init+0x14f>
c010301b:	eb 6c                	jmp    c0103089 <buddy_page_init+0x140>
c010301d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103020:	83 c0 04             	add    $0x4,%eax
c0103023:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103027:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c010302e:	e8 c3 fd ff ff       	call   c0102df6 <set_bit>
c0103033:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103036:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0103039:	89 50 08             	mov    %edx,0x8(%eax)
c010303c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010303f:	c1 e0 03             	shl    $0x3,%eax
c0103042:	8d 90 20 b0 10 c0    	lea    -0x3fef4fe0(%eax),%edx
c0103048:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010304b:	83 c0 0c             	add    $0xc,%eax
c010304e:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103052:	89 04 24             	mov    %eax,(%esp)
c0103055:	e8 84 fe ff ff       	call   c0102ede <list_add>
c010305a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010305d:	29 45 0c             	sub    %eax,0xc(%ebp)
c0103060:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103063:	89 d0                	mov    %edx,%eax
c0103065:	c1 e0 02             	shl    $0x2,%eax
c0103068:	01 d0                	add    %edx,%eax
c010306a:	c1 e0 02             	shl    $0x2,%eax
c010306d:	01 45 e8             	add    %eax,-0x18(%ebp)
c0103070:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103073:	83 c0 14             	add    $0x14,%eax
c0103076:	c1 e0 02             	shl    $0x2,%eax
c0103079:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c010307e:	83 c0 08             	add    $0x8,%eax
c0103081:	89 04 24             	mov    %eax,(%esp)
c0103084:	e8 e2 fd ff ff       	call   c0102e6b <atomic_inc>
c0103089:	8b 45 0c             	mov    0xc(%ebp),%eax
c010308c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c010308f:	73 8c                	jae    c010301d <buddy_page_init+0xd4>
c0103091:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0103095:	d1 6d ec             	shrl   -0x14(%ebp)
c0103098:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010309c:	0f 85 79 ff ff ff    	jne    c010301b <buddy_page_init+0xd2>
c01030a2:	e8 fd 04 00 00       	call   c01035a4 <buddy_show_memory_info>
c01030a7:	e8 57 05 00 00       	call   c0103603 <buddy_show_management_info>
c01030ac:	e8 8e 06 00 00       	call   c010373f <buddy_test_mm>
c01030b1:	c9                   	leave  
c01030b2:	c3                   	ret    

c01030b3 <get_order>:
c01030b3:	55                   	push   %ebp
c01030b4:	89 e5                	mov    %esp,%ebp
c01030b6:	83 ec 28             	sub    $0x28,%esp
c01030b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01030c0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01030c7:	eb 14                	jmp    c01030dd <get_order+0x2a>
c01030c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030cc:	3b 45 08             	cmp    0x8(%ebp),%eax
c01030cf:	72 05                	jb     c01030d6 <get_order+0x23>
c01030d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01030d4:	eb 1e                	jmp    c01030f4 <get_order+0x41>
c01030d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01030da:	d1 65 f0             	shll   -0x10(%ebp)
c01030dd:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01030e1:	76 e6                	jbe    c01030c9 <get_order+0x16>
c01030e3:	c7 04 24 96 98 10 c0 	movl   $0xc0109896,(%esp)
c01030ea:	e8 d3 42 00 00       	call   c01073c2 <panic>
c01030ef:	b8 00 00 00 00       	mov    $0x0,%eax
c01030f4:	c9                   	leave  
c01030f5:	c3                   	ret    

c01030f6 <buddy_alloc_pages_sub>:
c01030f6:	55                   	push   %ebp
c01030f7:	89 e5                	mov    %esp,%ebp
c01030f9:	83 ec 38             	sub    $0x38,%esp
c01030fc:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
c0103100:	76 0c                	jbe    c010310e <buddy_alloc_pages_sub+0x18>
c0103102:	c7 04 24 a8 98 10 c0 	movl   $0xc01098a8,(%esp)
c0103109:	e8 b4 42 00 00       	call   c01073c2 <panic>
c010310e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103111:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103114:	e9 03 01 00 00       	jmp    c010321c <buddy_alloc_pages_sub+0x126>
c0103119:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010311c:	c1 e0 03             	shl    $0x3,%eax
c010311f:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0103124:	89 04 24             	mov    %eax,(%esp)
c0103127:	e8 0a fe ff ff       	call   c0102f36 <list_empty>
c010312c:	85 c0                	test   %eax,%eax
c010312e:	0f 85 e4 00 00 00    	jne    c0103218 <buddy_alloc_pages_sub+0x122>
c0103134:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103137:	8b 04 c5 20 b0 10 c0 	mov    -0x3fef4fe0(,%eax,8),%eax
c010313e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103141:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103144:	83 e8 0c             	sub    $0xc,%eax
c0103147:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010314a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010314d:	83 c0 14             	add    $0x14,%eax
c0103150:	c1 e0 02             	shl    $0x2,%eax
c0103153:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0103158:	83 c0 08             	add    $0x8,%eax
c010315b:	89 04 24             	mov    %eax,(%esp)
c010315e:	e8 16 fd ff ff       	call   c0102e79 <atomic_dec>
c0103163:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103166:	89 04 24             	mov    %eax,(%esp)
c0103169:	e8 a9 fd ff ff       	call   c0102f17 <list_del>
c010316e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103171:	ba 01 00 00 00       	mov    $0x1,%edx
c0103176:	89 c1                	mov    %eax,%ecx
c0103178:	d3 e2                	shl    %cl,%edx
c010317a:	89 d0                	mov    %edx,%eax
c010317c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010317f:	eb 74                	jmp    c01031f5 <buddy_alloc_pages_sub+0xff>
c0103181:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0103185:	d1 6d f0             	shrl   -0x10(%ebp)
c0103188:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010318b:	89 d0                	mov    %edx,%eax
c010318d:	c1 e0 02             	shl    $0x2,%eax
c0103190:	01 d0                	add    %edx,%eax
c0103192:	c1 e0 02             	shl    $0x2,%eax
c0103195:	89 c2                	mov    %eax,%edx
c0103197:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010319a:	01 d0                	add    %edx,%eax
c010319c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010319f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01031a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01031a5:	89 50 08             	mov    %edx,0x8(%eax)
c01031a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01031ab:	83 c0 04             	add    $0x4,%eax
c01031ae:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031b2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c01031b9:	e8 38 fc ff ff       	call   c0102df6 <set_bit>
c01031be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01031c1:	83 c0 14             	add    $0x14,%eax
c01031c4:	c1 e0 02             	shl    $0x2,%eax
c01031c7:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c01031cc:	83 c0 08             	add    $0x8,%eax
c01031cf:	89 04 24             	mov    %eax,(%esp)
c01031d2:	e8 94 fc ff ff       	call   c0102e6b <atomic_inc>
c01031d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01031da:	c1 e0 03             	shl    $0x3,%eax
c01031dd:	8d 90 20 b0 10 c0    	lea    -0x3fef4fe0(%eax),%edx
c01031e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01031e6:	83 c0 0c             	add    $0xc,%eax
c01031e9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01031ed:	89 04 24             	mov    %eax,(%esp)
c01031f0:	e8 e9 fc ff ff       	call   c0102ede <list_add>
c01031f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01031f8:	3b 45 08             	cmp    0x8(%ebp),%eax
c01031fb:	77 84                	ja     c0103181 <buddy_alloc_pages_sub+0x8b>
c01031fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103200:	83 c0 04             	add    $0x4,%eax
c0103203:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103207:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c010320e:	e8 f1 fb ff ff       	call   c0102e04 <clear_bit>
c0103213:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103216:	eb 13                	jmp    c010322b <buddy_alloc_pages_sub+0x135>
c0103218:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010321c:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0103220:	0f 86 f3 fe ff ff    	jbe    c0103119 <buddy_alloc_pages_sub+0x23>
c0103226:	b8 00 00 00 00       	mov    $0x0,%eax
c010322b:	c9                   	leave  
c010322c:	c3                   	ret    

c010322d <buddy_alloc_pages>:
c010322d:	55                   	push   %ebp
c010322e:	89 e5                	mov    %esp,%ebp
c0103230:	53                   	push   %ebx
c0103231:	83 ec 24             	sub    $0x24,%esp
c0103234:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103238:	74 11                	je     c010324b <buddy_alloc_pages+0x1e>
c010323a:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c0103241:	e8 ec fb ff ff       	call   c0102e32 <atomic_read>
c0103246:	3b 45 08             	cmp    0x8(%ebp),%eax
c0103249:	73 0a                	jae    c0103255 <buddy_alloc_pages+0x28>
c010324b:	b8 00 00 00 00       	mov    $0x0,%eax
c0103250:	e9 92 00 00 00       	jmp    c01032e7 <buddy_alloc_pages+0xba>
c0103255:	8b 45 08             	mov    0x8(%ebp),%eax
c0103258:	89 04 24             	mov    %eax,(%esp)
c010325b:	e8 53 fe ff ff       	call   c01030b3 <get_order>
c0103260:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103263:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103266:	ba 01 00 00 00       	mov    $0x1,%edx
c010326b:	89 c1                	mov    %eax,%ecx
c010326d:	d3 e2                	shl    %cl,%edx
c010326f:	89 d0                	mov    %edx,%eax
c0103271:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103274:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103277:	89 04 24             	mov    %eax,(%esp)
c010327a:	e8 77 fe ff ff       	call   c01030f6 <buddy_alloc_pages_sub>
c010327f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103282:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0103286:	75 07                	jne    c010328f <buddy_alloc_pages+0x62>
c0103288:	b8 00 00 00 00       	mov    $0x0,%eax
c010328d:	eb 58                	jmp    c01032e7 <buddy_alloc_pages+0xba>
c010328f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103292:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0103295:	74 32                	je     c01032c9 <buddy_alloc_pages+0x9c>
c0103297:	8b 45 08             	mov    0x8(%ebp),%eax
c010329a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010329d:	89 d3                	mov    %edx,%ebx
c010329f:	29 c3                	sub    %eax,%ebx
c01032a1:	8b 55 08             	mov    0x8(%ebp),%edx
c01032a4:	89 d0                	mov    %edx,%eax
c01032a6:	c1 e0 02             	shl    $0x2,%eax
c01032a9:	01 d0                	add    %edx,%eax
c01032ab:	c1 e0 02             	shl    $0x2,%eax
c01032ae:	89 c2                	mov    %eax,%edx
c01032b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01032b3:	01 d0                	add    %edx,%eax
c01032b5:	89 04 24             	mov    %eax,(%esp)
c01032b8:	e8 16 3a 00 00       	call   c0106cd3 <page_to_addr>
c01032bd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c01032c1:	89 04 24             	mov    %eax,(%esp)
c01032c4:	e8 f9 01 00 00       	call   c01034c2 <buddy_free_pages>
c01032c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01032cc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01032d0:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c01032d7:	e8 7e fb ff ff       	call   c0102e5a <atomic_sub>
c01032dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01032df:	89 04 24             	mov    %eax,(%esp)
c01032e2:	e8 ec 39 00 00       	call   c0106cd3 <page_to_addr>
c01032e7:	83 c4 24             	add    $0x24,%esp
c01032ea:	5b                   	pop    %ebx
c01032eb:	5d                   	pop    %ebp
c01032ec:	c3                   	ret    

c01032ed <page_to_idx>:
c01032ed:	55                   	push   %ebp
c01032ee:	89 e5                	mov    %esp,%ebp
c01032f0:	8b 55 08             	mov    0x8(%ebp),%edx
c01032f3:	a1 a4 b0 10 c0       	mov    0xc010b0a4,%eax
c01032f8:	29 c2                	sub    %eax,%edx
c01032fa:	89 d0                	mov    %edx,%eax
c01032fc:	c1 f8 02             	sar    $0x2,%eax
c01032ff:	69 c0 cd cc cc cc    	imul   $0xcccccccd,%eax,%eax
c0103305:	5d                   	pop    %ebp
c0103306:	c3                   	ret    

c0103307 <idx_to_page>:
c0103307:	55                   	push   %ebp
c0103308:	89 e5                	mov    %esp,%ebp
c010330a:	8b 0d a4 b0 10 c0    	mov    0xc010b0a4,%ecx
c0103310:	8b 55 08             	mov    0x8(%ebp),%edx
c0103313:	89 d0                	mov    %edx,%eax
c0103315:	c1 e0 02             	shl    $0x2,%eax
c0103318:	01 d0                	add    %edx,%eax
c010331a:	c1 e0 02             	shl    $0x2,%eax
c010331d:	01 c8                	add    %ecx,%eax
c010331f:	5d                   	pop    %ebp
c0103320:	c3                   	ret    

c0103321 <page_is_buddy>:
c0103321:	55                   	push   %ebp
c0103322:	89 e5                	mov    %esp,%ebp
c0103324:	53                   	push   %ebx
c0103325:	83 ec 08             	sub    $0x8,%esp
c0103328:	8b 45 08             	mov    0x8(%ebp),%eax
c010332b:	89 04 24             	mov    %eax,(%esp)
c010332e:	e8 ba ff ff ff       	call   c01032ed <page_to_idx>
c0103333:	89 c3                	mov    %eax,%ebx
c0103335:	c7 04 24 b0 b0 10 c0 	movl   $0xc010b0b0,(%esp)
c010333c:	e8 f1 fa ff ff       	call   c0102e32 <atomic_read>
c0103341:	39 c3                	cmp    %eax,%ebx
c0103343:	73 33                	jae    c0103378 <page_is_buddy+0x57>
c0103345:	8b 45 08             	mov    0x8(%ebp),%eax
c0103348:	83 c0 04             	add    $0x4,%eax
c010334b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010334f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0103356:	e8 b7 fa ff ff       	call   c0102e12 <test_bit>
c010335b:	85 c0                	test   %eax,%eax
c010335d:	74 12                	je     c0103371 <page_is_buddy+0x50>
c010335f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103362:	8b 40 08             	mov    0x8(%eax),%eax
c0103365:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103368:	75 07                	jne    c0103371 <page_is_buddy+0x50>
c010336a:	b8 01 00 00 00       	mov    $0x1,%eax
c010336f:	eb 05                	jmp    c0103376 <page_is_buddy+0x55>
c0103371:	b8 00 00 00 00       	mov    $0x0,%eax
c0103376:	eb 05                	jmp    c010337d <page_is_buddy+0x5c>
c0103378:	b8 00 00 00 00       	mov    $0x0,%eax
c010337d:	83 c4 08             	add    $0x8,%esp
c0103380:	5b                   	pop    %ebx
c0103381:	5d                   	pop    %ebp
c0103382:	c3                   	ret    

c0103383 <buddy_free_pages_sub>:
c0103383:	55                   	push   %ebp
c0103384:	89 e5                	mov    %esp,%ebp
c0103386:	83 ec 28             	sub    $0x28,%esp
c0103389:	8b 45 08             	mov    0x8(%ebp),%eax
c010338c:	89 04 24             	mov    %eax,(%esp)
c010338f:	e8 59 ff ff ff       	call   c01032ed <page_to_idx>
c0103394:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103397:	8b 45 08             	mov    0x8(%ebp),%eax
c010339a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010339d:	eb 17                	jmp    c01033b6 <buddy_free_pages_sub+0x33>
c010339f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01033a6:	00 
c01033a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01033aa:	89 04 24             	mov    %eax,(%esp)
c01033ad:	e8 d5 fa ff ff       	call   c0102e87 <set_page_ref>
c01033b2:	83 45 f8 14          	addl   $0x14,-0x8(%ebp)
c01033b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033b9:	ba 14 00 00 00       	mov    $0x14,%edx
c01033be:	89 c1                	mov    %eax,%ecx
c01033c0:	d3 e2                	shl    %cl,%edx
c01033c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01033c5:	01 d0                	add    %edx,%eax
c01033c7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01033ca:	75 d3                	jne    c010339f <buddy_free_pages_sub+0x1c>
c01033cc:	e9 81 00 00 00       	jmp    c0103452 <buddy_free_pages_sub+0xcf>
c01033d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033d4:	ba 01 00 00 00       	mov    $0x1,%edx
c01033d9:	89 c1                	mov    %eax,%ecx
c01033db:	d3 e2                	shl    %cl,%edx
c01033dd:	89 d0                	mov    %edx,%eax
c01033df:	33 45 fc             	xor    -0x4(%ebp),%eax
c01033e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01033e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01033e8:	89 04 24             	mov    %eax,(%esp)
c01033eb:	e8 17 ff ff ff       	call   c0103307 <idx_to_page>
c01033f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01033f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01033fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01033fd:	89 04 24             	mov    %eax,(%esp)
c0103400:	e8 1c ff ff ff       	call   c0103321 <page_is_buddy>
c0103405:	85 c0                	test   %eax,%eax
c0103407:	75 02                	jne    c010340b <buddy_free_pages_sub+0x88>
c0103409:	eb 51                	jmp    c010345c <buddy_free_pages_sub+0xd9>
c010340b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010340e:	83 c0 14             	add    $0x14,%eax
c0103411:	c1 e0 02             	shl    $0x2,%eax
c0103414:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0103419:	83 c0 08             	add    $0x8,%eax
c010341c:	89 04 24             	mov    %eax,(%esp)
c010341f:	e8 55 fa ff ff       	call   c0102e79 <atomic_dec>
c0103424:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103427:	83 c0 0c             	add    $0xc,%eax
c010342a:	89 04 24             	mov    %eax,(%esp)
c010342d:	e8 e5 fa ff ff       	call   c0102f17 <list_del>
c0103432:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103435:	83 c0 04             	add    $0x4,%eax
c0103438:	89 44 24 04          	mov    %eax,0x4(%esp)
c010343c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0103443:	e8 bc f9 ff ff       	call   c0102e04 <clear_bit>
c0103448:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010344b:	21 45 fc             	and    %eax,-0x4(%ebp)
c010344e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0103452:	83 7d 0c 09          	cmpl   $0x9,0xc(%ebp)
c0103456:	0f 86 75 ff ff ff    	jbe    c01033d1 <buddy_free_pages_sub+0x4e>
c010345c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010345f:	89 04 24             	mov    %eax,(%esp)
c0103462:	e8 a0 fe ff ff       	call   c0103307 <idx_to_page>
c0103467:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010346a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010346d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103470:	89 50 08             	mov    %edx,0x8(%eax)
c0103473:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103476:	83 c0 04             	add    $0x4,%eax
c0103479:	89 44 24 04          	mov    %eax,0x4(%esp)
c010347d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0103484:	e8 6d f9 ff ff       	call   c0102df6 <set_bit>
c0103489:	8b 45 0c             	mov    0xc(%ebp),%eax
c010348c:	83 c0 14             	add    $0x14,%eax
c010348f:	c1 e0 02             	shl    $0x2,%eax
c0103492:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0103497:	83 c0 08             	add    $0x8,%eax
c010349a:	89 04 24             	mov    %eax,(%esp)
c010349d:	e8 c9 f9 ff ff       	call   c0102e6b <atomic_inc>
c01034a2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034a5:	c1 e0 03             	shl    $0x3,%eax
c01034a8:	8d 90 20 b0 10 c0    	lea    -0x3fef4fe0(%eax),%edx
c01034ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01034b1:	83 c0 0c             	add    $0xc,%eax
c01034b4:	89 54 24 04          	mov    %edx,0x4(%esp)
c01034b8:	89 04 24             	mov    %eax,(%esp)
c01034bb:	e8 1e fa ff ff       	call   c0102ede <list_add>
c01034c0:	c9                   	leave  
c01034c1:	c3                   	ret    

c01034c2 <buddy_free_pages>:
c01034c2:	55                   	push   %ebp
c01034c3:	89 e5                	mov    %esp,%ebp
c01034c5:	83 ec 28             	sub    $0x28,%esp
c01034c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01034cc:	75 05                	jne    c01034d3 <buddy_free_pages+0x11>
c01034ce:	e9 bb 00 00 00       	jmp    c010358e <buddy_free_pages+0xcc>
c01034d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01034d6:	89 04 24             	mov    %eax,(%esp)
c01034d9:	e8 ae 37 00 00       	call   c0106c8c <addr_to_page>
c01034de:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01034e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01034e8:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01034ef:	eb 41                	jmp    c0103532 <buddy_free_pages+0x70>
c01034f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01034f4:	89 04 24             	mov    %eax,(%esp)
c01034f7:	e8 f1 fd ff ff       	call   c01032ed <page_to_idx>
c01034fc:	23 45 ec             	and    -0x14(%ebp),%eax
c01034ff:	85 c0                	test   %eax,%eax
c0103501:	74 28                	je     c010352b <buddy_free_pages+0x69>
c0103503:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103506:	89 44 24 04          	mov    %eax,0x4(%esp)
c010350a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010350d:	89 04 24             	mov    %eax,(%esp)
c0103510:	e8 6e fe ff ff       	call   c0103383 <buddy_free_pages_sub>
c0103515:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103518:	89 d0                	mov    %edx,%eax
c010351a:	c1 e0 02             	shl    $0x2,%eax
c010351d:	01 d0                	add    %edx,%eax
c010351f:	c1 e0 02             	shl    $0x2,%eax
c0103522:	01 45 f4             	add    %eax,-0xc(%ebp)
c0103525:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103528:	29 45 0c             	sub    %eax,0xc(%ebp)
c010352b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010352f:	d1 65 ec             	shll   -0x14(%ebp)
c0103532:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103535:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0103538:	73 b7                	jae    c01034f1 <buddy_free_pages+0x2f>
c010353a:	eb 39                	jmp    c0103575 <buddy_free_pages+0xb3>
c010353c:	eb 07                	jmp    c0103545 <buddy_free_pages+0x83>
c010353e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0103542:	d1 6d ec             	shrl   -0x14(%ebp)
c0103545:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103548:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c010354b:	72 f1                	jb     c010353e <buddy_free_pages+0x7c>
c010354d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103550:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103557:	89 04 24             	mov    %eax,(%esp)
c010355a:	e8 24 fe ff ff       	call   c0103383 <buddy_free_pages_sub>
c010355f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103562:	89 d0                	mov    %edx,%eax
c0103564:	c1 e0 02             	shl    $0x2,%eax
c0103567:	01 d0                	add    %edx,%eax
c0103569:	c1 e0 02             	shl    $0x2,%eax
c010356c:	01 45 f4             	add    %eax,-0xc(%ebp)
c010356f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103572:	29 45 0c             	sub    %eax,0xc(%ebp)
c0103575:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103579:	75 c1                	jne    c010353c <buddy_free_pages+0x7a>
c010357b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010357e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103582:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c0103589:	e8 bb f8 ff ff       	call   c0102e49 <atomic_add>
c010358e:	c9                   	leave  
c010358f:	c3                   	ret    

c0103590 <buddy_free_pages_count>:
c0103590:	55                   	push   %ebp
c0103591:	89 e5                	mov    %esp,%ebp
c0103593:	83 ec 04             	sub    $0x4,%esp
c0103596:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c010359d:	e8 90 f8 ff ff       	call   c0102e32 <atomic_read>
c01035a2:	c9                   	leave  
c01035a3:	c3                   	ret    

c01035a4 <buddy_show_memory_info>:
c01035a4:	55                   	push   %ebp
c01035a5:	89 e5                	mov    %esp,%ebp
c01035a7:	53                   	push   %ebx
c01035a8:	83 ec 14             	sub    $0x14,%esp
c01035ab:	8b 15 ac b0 10 c0    	mov    0xc010b0ac,%edx
c01035b1:	a1 a8 b0 10 c0       	mov    0xc010b0a8,%eax
c01035b6:	89 54 24 08          	mov    %edx,0x8(%esp)
c01035ba:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035be:	c7 04 24 dc 98 10 c0 	movl   $0xc01098dc,(%esp)
c01035c5:	e8 dd 25 00 00       	call   c0105ba7 <printk>
c01035ca:	c7 04 24 b0 b0 10 c0 	movl   $0xc010b0b0,(%esp)
c01035d1:	e8 5c f8 ff ff       	call   c0102e32 <atomic_read>
c01035d6:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
c01035dd:	c7 04 24 b0 b0 10 c0 	movl   $0xc010b0b0,(%esp)
c01035e4:	e8 49 f8 ff ff       	call   c0102e32 <atomic_read>
c01035e9:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01035ed:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035f1:	c7 04 24 0c 99 10 c0 	movl   $0xc010990c,(%esp)
c01035f8:	e8 aa 25 00 00       	call   c0105ba7 <printk>
c01035fd:	83 c4 14             	add    $0x14,%esp
c0103600:	5b                   	pop    %ebx
c0103601:	5d                   	pop    %ebp
c0103602:	c3                   	ret    

c0103603 <buddy_show_management_info>:
c0103603:	55                   	push   %ebp
c0103604:	89 e5                	mov    %esp,%ebp
c0103606:	56                   	push   %esi
c0103607:	53                   	push   %ebx
c0103608:	83 ec 30             	sub    $0x30,%esp
c010360b:	c7 44 24 08 3c 99 10 	movl   $0xc010993c,0x8(%esp)
c0103612:	c0 
c0103613:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c010361a:	00 
c010361b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103622:	e8 c2 25 00 00       	call   c0105be9 <cprintk>
c0103627:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010362e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103635:	eb 7d                	jmp    c01036b4 <buddy_show_management_info+0xb1>
c0103637:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010363a:	83 c0 14             	add    $0x14,%eax
c010363d:	c1 e0 02             	shl    $0x2,%eax
c0103640:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0103645:	83 c0 08             	add    $0x8,%eax
c0103648:	89 04 24             	mov    %eax,(%esp)
c010364b:	e8 e2 f7 ff ff       	call   c0102e32 <atomic_read>
c0103650:	89 c2                	mov    %eax,%edx
c0103652:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103655:	89 c1                	mov    %eax,%ecx
c0103657:	d3 e2                	shl    %cl,%edx
c0103659:	89 d0                	mov    %edx,%eax
c010365b:	01 45 f4             	add    %eax,-0xc(%ebp)
c010365e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103661:	83 c0 14             	add    $0x14,%eax
c0103664:	c1 e0 02             	shl    $0x2,%eax
c0103667:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c010366c:	83 c0 08             	add    $0x8,%eax
c010366f:	89 04 24             	mov    %eax,(%esp)
c0103672:	e8 bb f7 ff ff       	call   c0102e32 <atomic_read>
c0103677:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010367a:	bb 01 00 00 00       	mov    $0x1,%ebx
c010367f:	89 d1                	mov    %edx,%ecx
c0103681:	d3 e3                	shl    %cl,%ebx
c0103683:	89 da                	mov    %ebx,%edx
c0103685:	89 44 24 14          	mov    %eax,0x14(%esp)
c0103689:	89 54 24 10          	mov    %edx,0x10(%esp)
c010368d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103690:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103694:	c7 44 24 08 54 99 10 	movl   $0xc0109954,0x8(%esp)
c010369b:	c0 
c010369c:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c01036a3:	00 
c01036a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01036ab:	e8 39 25 00 00       	call   c0105be9 <cprintk>
c01036b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01036b4:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
c01036b8:	0f 86 79 ff ff ff    	jbe    c0103637 <buddy_show_management_info+0x34>
c01036be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036c1:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01036c5:	c7 44 24 08 80 99 10 	movl   $0xc0109980,0x8(%esp)
c01036cc:	c0 
c01036cd:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c01036d4:	00 
c01036d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01036dc:	e8 08 25 00 00       	call   c0105be9 <cprintk>
c01036e1:	c7 04 24 b0 b0 10 c0 	movl   $0xc010b0b0,(%esp)
c01036e8:	e8 45 f7 ff ff       	call   c0102e32 <atomic_read>
c01036ed:	89 c3                	mov    %eax,%ebx
c01036ef:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c01036f6:	e8 37 f7 ff ff       	call   c0102e32 <atomic_read>
c01036fb:	29 c3                	sub    %eax,%ebx
c01036fd:	89 d8                	mov    %ebx,%eax
c01036ff:	8d 34 85 00 00 00 00 	lea    0x0(,%eax,4),%esi
c0103706:	c7 04 24 b0 b0 10 c0 	movl   $0xc010b0b0,(%esp)
c010370d:	e8 20 f7 ff ff       	call   c0102e32 <atomic_read>
c0103712:	89 c3                	mov    %eax,%ebx
c0103714:	c7 04 24 b4 b0 10 c0 	movl   $0xc010b0b4,(%esp)
c010371b:	e8 12 f7 ff ff       	call   c0102e32 <atomic_read>
c0103720:	29 c3                	sub    %eax,%ebx
c0103722:	89 d8                	mov    %ebx,%eax
c0103724:	89 74 24 08          	mov    %esi,0x8(%esp)
c0103728:	89 44 24 04          	mov    %eax,0x4(%esp)
c010372c:	c7 04 24 a8 99 10 c0 	movl   $0xc01099a8,(%esp)
c0103733:	e8 6f 24 00 00       	call   c0105ba7 <printk>
c0103738:	83 c4 30             	add    $0x30,%esp
c010373b:	5b                   	pop    %ebx
c010373c:	5e                   	pop    %esi
c010373d:	5d                   	pop    %ebp
c010373e:	c3                   	ret    

c010373f <buddy_test_mm>:
c010373f:	55                   	push   %ebp
c0103740:	89 e5                	mov    %esp,%ebp
c0103742:	83 ec 48             	sub    $0x48,%esp
c0103745:	a1 1c 90 10 c0       	mov    0xc010901c,%eax
c010374a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010374e:	c7 44 24 08 d7 99 10 	movl   $0xc01099d7,0x8(%esp)
c0103755:	c0 
c0103756:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c010375d:	00 
c010375e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103765:	e8 7f 24 00 00       	call   c0105be9 <cprintk>
c010376a:	c7 44 24 08 e8 99 10 	movl   $0xc01099e8,0x8(%esp)
c0103771:	c0 
c0103772:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0103779:	00 
c010377a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103781:	e8 63 24 00 00       	call   c0105be9 <cprintk>
c0103786:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010378d:	eb 3d                	jmp    c01037cc <buddy_test_mm+0x8d>
c010378f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103792:	83 c0 14             	add    $0x14,%eax
c0103795:	c1 e0 02             	shl    $0x2,%eax
c0103798:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c010379d:	83 c0 08             	add    $0x8,%eax
c01037a0:	89 04 24             	mov    %eax,(%esp)
c01037a3:	e8 8a f6 ff ff       	call   c0102e32 <atomic_read>
c01037a8:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01037ac:	c7 44 24 08 0b 9a 10 	movl   $0xc0109a0b,0x8(%esp)
c01037b3:	c0 
c01037b4:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c01037bb:	00 
c01037bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01037c3:	e8 21 24 00 00       	call   c0105be9 <cprintk>
c01037c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01037cc:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01037d0:	76 bd                	jbe    c010378f <buddy_test_mm+0x50>
c01037d2:	c7 04 24 10 9a 10 c0 	movl   $0xc0109a10,(%esp)
c01037d9:	e8 c9 23 00 00       	call   c0105ba7 <printk>
c01037de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01037e5:	e8 43 fa ff ff       	call   c010322d <buddy_alloc_pages>
c01037ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01037ed:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c01037f4:	e8 34 fa ff ff       	call   c010322d <buddy_alloc_pages>
c01037f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01037fc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01037ff:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0103806:	00 
c0103807:	89 04 24             	mov    %eax,(%esp)
c010380a:	e8 b3 fc ff ff       	call   c01034c2 <buddy_free_pages>
c010380f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103812:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c0103819:	00 
c010381a:	89 04 24             	mov    %eax,(%esp)
c010381d:	e8 a0 fc ff ff       	call   c01034c2 <buddy_free_pages>
c0103822:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0103829:	e8 ff f9 ff ff       	call   c010322d <buddy_alloc_pages>
c010382e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103831:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
c0103838:	e8 f0 f9 ff ff       	call   c010322d <buddy_alloc_pages>
c010383d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103840:	c7 04 24 12 00 00 00 	movl   $0x12,(%esp)
c0103847:	e8 e1 f9 ff ff       	call   c010322d <buddy_alloc_pages>
c010384c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010384f:	c7 04 24 1b 00 00 00 	movl   $0x1b,(%esp)
c0103856:	e8 d2 f9 ff ff       	call   c010322d <buddy_alloc_pages>
c010385b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010385e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0103865:	e8 c3 f9 ff ff       	call   c010322d <buddy_alloc_pages>
c010386a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010386d:	c7 04 24 81 00 00 00 	movl   $0x81,(%esp)
c0103874:	e8 b4 f9 ff ff       	call   c010322d <buddy_alloc_pages>
c0103879:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010387c:	c7 04 24 23 02 00 00 	movl   $0x223,(%esp)
c0103883:	e8 a5 f9 ff ff       	call   c010322d <buddy_alloc_pages>
c0103888:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010388b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010388e:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
c0103895:	00 
c0103896:	89 04 24             	mov    %eax,(%esp)
c0103899:	e8 24 fc ff ff       	call   c01034c2 <buddy_free_pages>
c010389e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01038a1:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c01038a8:	00 
c01038a9:	89 04 24             	mov    %eax,(%esp)
c01038ac:	e8 11 fc ff ff       	call   c01034c2 <buddy_free_pages>
c01038b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01038b4:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
c01038bb:	00 
c01038bc:	89 04 24             	mov    %eax,(%esp)
c01038bf:	e8 fe fb ff ff       	call   c01034c2 <buddy_free_pages>
c01038c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01038c7:	c7 44 24 04 1b 00 00 	movl   $0x1b,0x4(%esp)
c01038ce:	00 
c01038cf:	89 04 24             	mov    %eax,(%esp)
c01038d2:	e8 eb fb ff ff       	call   c01034c2 <buddy_free_pages>
c01038d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01038da:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c01038e1:	00 
c01038e2:	89 04 24             	mov    %eax,(%esp)
c01038e5:	e8 d8 fb ff ff       	call   c01034c2 <buddy_free_pages>
c01038ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038ed:	c7 44 24 04 81 00 00 	movl   $0x81,0x4(%esp)
c01038f4:	00 
c01038f5:	89 04 24             	mov    %eax,(%esp)
c01038f8:	e8 c5 fb ff ff       	call   c01034c2 <buddy_free_pages>
c01038fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103900:	c7 44 24 04 23 02 00 	movl   $0x223,0x4(%esp)
c0103907:	00 
c0103908:	89 04 24             	mov    %eax,(%esp)
c010390b:	e8 b2 fb ff ff       	call   c01034c2 <buddy_free_pages>
c0103910:	c7 44 24 08 14 9a 10 	movl   $0xc0109a14,0x8(%esp)
c0103917:	c0 
c0103918:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010391f:	00 
c0103920:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103927:	e8 bd 22 00 00       	call   c0105be9 <cprintk>
c010392c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103933:	eb 3d                	jmp    c0103972 <buddy_test_mm+0x233>
c0103935:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103938:	83 c0 14             	add    $0x14,%eax
c010393b:	c1 e0 02             	shl    $0x2,%eax
c010393e:	05 20 b0 10 c0       	add    $0xc010b020,%eax
c0103943:	83 c0 08             	add    $0x8,%eax
c0103946:	89 04 24             	mov    %eax,(%esp)
c0103949:	e8 e4 f4 ff ff       	call   c0102e32 <atomic_read>
c010394e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103952:	c7 44 24 08 0b 9a 10 	movl   $0xc0109a0b,0x8(%esp)
c0103959:	c0 
c010395a:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0103961:	00 
c0103962:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103969:	e8 7b 22 00 00       	call   c0105be9 <cprintk>
c010396e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0103972:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
c0103976:	76 bd                	jbe    c0103935 <buddy_test_mm+0x1f6>
c0103978:	c7 04 24 10 9a 10 c0 	movl   $0xc0109a10,(%esp)
c010397f:	e8 23 22 00 00       	call   c0105ba7 <printk>
c0103984:	c9                   	leave  
c0103985:	c3                   	ret    

c0103986 <atomic_set>:
c0103986:	55                   	push   %ebp
c0103987:	89 e5                	mov    %esp,%ebp
c0103989:	8b 45 08             	mov    0x8(%ebp),%eax
c010398c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010398f:	89 10                	mov    %edx,(%eax)
c0103991:	5d                   	pop    %ebp
c0103992:	c3                   	ret    

c0103993 <INIT_LIST_HEAD>:
c0103993:	55                   	push   %ebp
c0103994:	89 e5                	mov    %esp,%ebp
c0103996:	8b 45 08             	mov    0x8(%ebp),%eax
c0103999:	8b 55 08             	mov    0x8(%ebp),%edx
c010399c:	89 10                	mov    %edx,(%eax)
c010399e:	8b 45 08             	mov    0x8(%ebp),%eax
c01039a1:	8b 55 08             	mov    0x8(%ebp),%edx
c01039a4:	89 50 04             	mov    %edx,0x4(%eax)
c01039a7:	5d                   	pop    %ebp
c01039a8:	c3                   	ret    

c01039a9 <__list_add>:
c01039a9:	55                   	push   %ebp
c01039aa:	89 e5                	mov    %esp,%ebp
c01039ac:	8b 45 10             	mov    0x10(%ebp),%eax
c01039af:	8b 55 08             	mov    0x8(%ebp),%edx
c01039b2:	89 50 04             	mov    %edx,0x4(%eax)
c01039b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01039b8:	8b 55 10             	mov    0x10(%ebp),%edx
c01039bb:	89 10                	mov    %edx,(%eax)
c01039bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01039c0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01039c3:	89 50 04             	mov    %edx,0x4(%eax)
c01039c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039c9:	8b 55 08             	mov    0x8(%ebp),%edx
c01039cc:	89 10                	mov    %edx,(%eax)
c01039ce:	5d                   	pop    %ebp
c01039cf:	c3                   	ret    

c01039d0 <list_add>:
c01039d0:	55                   	push   %ebp
c01039d1:	89 e5                	mov    %esp,%ebp
c01039d3:	83 ec 0c             	sub    $0xc,%esp
c01039d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039d9:	8b 00                	mov    (%eax),%eax
c01039db:	89 44 24 08          	mov    %eax,0x8(%esp)
c01039df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039e2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01039e9:	89 04 24             	mov    %eax,(%esp)
c01039ec:	e8 b8 ff ff ff       	call   c01039a9 <__list_add>
c01039f1:	c9                   	leave  
c01039f2:	c3                   	ret    

c01039f3 <vfs_init>:
c01039f3:	55                   	push   %ebp
c01039f4:	89 e5                	mov    %esp,%ebp
c01039f6:	83 ec 28             	sub    $0x28,%esp
c01039f9:	c7 44 24 08 38 9a 10 	movl   $0xc0109a38,0x8(%esp)
c0103a00:	c0 
c0103a01:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
c0103a08:	00 
c0103a09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103a10:	e8 d4 21 00 00       	call   c0105be9 <cprintk>
c0103a15:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
c0103a1c:	e8 e6 eb ff ff       	call   c0102607 <kmalloc>
c0103a21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a24:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103a28:	75 0c                	jne    c0103a36 <vfs_init+0x43>
c0103a2a:	c7 04 24 58 9a 10 c0 	movl   $0xc0109a58,(%esp)
c0103a31:	e8 8c 39 00 00       	call   c01073c2 <panic>
c0103a36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a39:	89 04 24             	mov    %eax,(%esp)
c0103a3c:	e8 0d 00 00 00       	call   c0103a4e <init_mount_tree>
c0103a41:	e8 84 49 00 00       	call   c01083ca <get_current>
c0103a46:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103a49:	89 50 64             	mov    %edx,0x64(%eax)
c0103a4c:	c9                   	leave  
c0103a4d:	c3                   	ret    

c0103a4e <init_mount_tree>:
c0103a4e:	55                   	push   %ebp
c0103a4f:	89 e5                	mov    %esp,%ebp
c0103a51:	83 ec 28             	sub    $0x28,%esp
c0103a54:	c7 04 24 30 90 10 c0 	movl   $0xc0109030,(%esp)
c0103a5b:	e8 37 01 00 00       	call   c0103b97 <add_filesystem>
c0103a60:	c7 04 24 3c 90 10 c0 	movl   $0xc010903c,(%esp)
c0103a67:	e8 27 ff ff ff       	call   c0103993 <INIT_LIST_HEAD>
c0103a6c:	e8 81 01 00 00       	call   c0103bf2 <alloc_super_block>
c0103a71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a74:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
c0103a7b:	00 
c0103a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a7f:	89 04 24             	mov    %eax,(%esp)
c0103a82:	e8 31 09 00 00       	call   c01043b8 <bzero>
c0103a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a8a:	83 c0 1c             	add    $0x1c,%eax
c0103a8d:	c7 44 24 04 3c 90 10 	movl   $0xc010903c,0x4(%esp)
c0103a94:	c0 
c0103a95:	89 04 24             	mov    %eax,(%esp)
c0103a98:	e8 33 ff ff ff       	call   c01039d0 <list_add>
c0103a9d:	a1 38 90 10 c0       	mov    0xc0109038,%eax
c0103aa2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103aa5:	89 14 24             	mov    %edx,(%esp)
c0103aa8:	ff d0                	call   *%eax
c0103aaa:	e8 9b 01 00 00       	call   c0103c4a <alloc_inode>
c0103aaf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103ab2:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c0103ab9:	00 
c0103aba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103abd:	89 04 24             	mov    %eax,(%esp)
c0103ac0:	e8 f3 08 00 00       	call   c01043b8 <bzero>
c0103ac5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ac8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103acb:	89 50 2c             	mov    %edx,0x2c(%eax)
c0103ace:	e8 cf 01 00 00       	call   c0103ca2 <alloc_dentry>
c0103ad3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103ad6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103ad9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0103ae0:	00 
c0103ae1:	89 04 24             	mov    %eax,(%esp)
c0103ae4:	e8 9d fe ff ff       	call   c0103986 <atomic_set>
c0103ae9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103aec:	05 8c 00 00 00       	add    $0x8c,%eax
c0103af1:	89 04 24             	mov    %eax,(%esp)
c0103af4:	e8 9a fe ff ff       	call   c0103993 <INIT_LIST_HEAD>
c0103af9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103afc:	05 94 00 00 00       	add    $0x94,%eax
c0103b01:	89 04 24             	mov    %eax,(%esp)
c0103b04:	e8 8a fe ff ff       	call   c0103993 <INIT_LIST_HEAD>
c0103b09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b0c:	c7 80 84 00 00 00 01 	movl   $0x1,0x84(%eax)
c0103b13:	00 00 00 
c0103b16:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b19:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
c0103b20:	00 00 00 
c0103b23:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b26:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103b29:	89 90 a0 00 00 00    	mov    %edx,0xa0(%eax)
c0103b2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b32:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0103b35:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
c0103b3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b3e:	c7 80 9c 00 00 00 00 	movl   $0x0,0x9c(%eax)
c0103b45:	00 00 00 
c0103b48:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b4b:	83 c0 08             	add    $0x8,%eax
c0103b4e:	c7 44 24 04 78 9a 10 	movl   $0xc0109a78,0x4(%esp)
c0103b55:	c0 
c0103b56:	89 04 24             	mov    %eax,(%esp)
c0103b59:	e8 dd 08 00 00       	call   c010443b <strcpy>
c0103b5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b61:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103b64:	89 50 28             	mov    %edx,0x28(%eax)
c0103b67:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b6a:	c7 00 7a 9a 10 c0    	movl   $0xc0109a7a,(%eax)
c0103b70:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b73:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103b76:	89 50 04             	mov    %edx,0x4(%eax)
c0103b79:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b7c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103b7f:	89 50 08             	mov    %edx,0x8(%eax)
c0103b82:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b85:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103b88:	89 50 0c             	mov    %edx,0xc(%eax)
c0103b8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b8e:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c0103b95:	c9                   	leave  
c0103b96:	c3                   	ret    

c0103b97 <add_filesystem>:
c0103b97:	55                   	push   %ebp
c0103b98:	89 e5                	mov    %esp,%ebp
c0103b9a:	83 ec 28             	sub    $0x28,%esp
c0103b9d:	a1 00 70 11 c0       	mov    0xc0117000,%eax
c0103ba2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103ba5:	eb 2a                	jmp    c0103bd1 <add_filesystem+0x3a>
c0103ba7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103baa:	8b 10                	mov    (%eax),%edx
c0103bac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103baf:	8b 00                	mov    (%eax),%eax
c0103bb1:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103bb5:	89 04 24             	mov    %eax,(%esp)
c0103bb8:	e8 1d 08 00 00       	call   c01043da <strcmp>
c0103bbd:	85 c0                	test   %eax,%eax
c0103bbf:	75 07                	jne    c0103bc8 <add_filesystem+0x31>
c0103bc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103bc6:	eb 28                	jmp    c0103bf0 <add_filesystem+0x59>
c0103bc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103bcb:	8b 40 14             	mov    0x14(%eax),%eax
c0103bce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103bd1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103bd5:	75 d0                	jne    c0103ba7 <add_filesystem+0x10>
c0103bd7:	8b 15 00 70 11 c0    	mov    0xc0117000,%edx
c0103bdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103be0:	89 50 14             	mov    %edx,0x14(%eax)
c0103be3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103be6:	a3 00 70 11 c0       	mov    %eax,0xc0117000
c0103beb:	b8 00 00 00 00       	mov    $0x0,%eax
c0103bf0:	c9                   	leave  
c0103bf1:	c3                   	ret    

c0103bf2 <alloc_super_block>:
c0103bf2:	55                   	push   %ebp
c0103bf3:	89 e5                	mov    %esp,%ebp
c0103bf5:	83 ec 28             	sub    $0x28,%esp
c0103bf8:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c0103bff:	e8 03 ea ff ff       	call   c0102607 <kmalloc>
c0103c04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c07:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103c0b:	75 0c                	jne    c0103c19 <alloc_super_block+0x27>
c0103c0d:	c7 04 24 7e 9a 10 c0 	movl   $0xc0109a7e,(%esp)
c0103c14:	e8 a9 37 00 00       	call   c01073c2 <panic>
c0103c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c1c:	c9                   	leave  
c0103c1d:	c3                   	ret    

c0103c1e <alloc_super_block_ops>:
c0103c1e:	55                   	push   %ebp
c0103c1f:	89 e5                	mov    %esp,%ebp
c0103c21:	83 ec 28             	sub    $0x28,%esp
c0103c24:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
c0103c2b:	e8 d7 e9 ff ff       	call   c0102607 <kmalloc>
c0103c30:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103c37:	75 0c                	jne    c0103c45 <alloc_super_block_ops+0x27>
c0103c39:	c7 04 24 98 9a 10 c0 	movl   $0xc0109a98,(%esp)
c0103c40:	e8 7d 37 00 00       	call   c01073c2 <panic>
c0103c45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c48:	c9                   	leave  
c0103c49:	c3                   	ret    

c0103c4a <alloc_inode>:
c0103c4a:	55                   	push   %ebp
c0103c4b:	89 e5                	mov    %esp,%ebp
c0103c4d:	83 ec 28             	sub    $0x28,%esp
c0103c50:	c7 04 24 38 00 00 00 	movl   $0x38,(%esp)
c0103c57:	e8 ab e9 ff ff       	call   c0102607 <kmalloc>
c0103c5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103c63:	75 0c                	jne    c0103c71 <alloc_inode+0x27>
c0103c65:	c7 04 24 b6 9a 10 c0 	movl   $0xc0109ab6,(%esp)
c0103c6c:	e8 51 37 00 00       	call   c01073c2 <panic>
c0103c71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c74:	c9                   	leave  
c0103c75:	c3                   	ret    

c0103c76 <alloc_inode_ops>:
c0103c76:	55                   	push   %ebp
c0103c77:	89 e5                	mov    %esp,%ebp
c0103c79:	83 ec 28             	sub    $0x28,%esp
c0103c7c:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
c0103c83:	e8 7f e9 ff ff       	call   c0102607 <kmalloc>
c0103c88:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103c8f:	75 0c                	jne    c0103c9d <alloc_inode_ops+0x27>
c0103c91:	c7 04 24 ca 9a 10 c0 	movl   $0xc0109aca,(%esp)
c0103c98:	e8 25 37 00 00       	call   c01073c2 <panic>
c0103c9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ca0:	c9                   	leave  
c0103ca1:	c3                   	ret    

c0103ca2 <alloc_dentry>:
c0103ca2:	55                   	push   %ebp
c0103ca3:	89 e5                	mov    %esp,%ebp
c0103ca5:	83 ec 28             	sub    $0x28,%esp
c0103ca8:	c7 04 24 ac 00 00 00 	movl   $0xac,(%esp)
c0103caf:	e8 53 e9 ff ff       	call   c0102607 <kmalloc>
c0103cb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103cb7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103cbb:	75 0c                	jne    c0103cc9 <alloc_dentry+0x27>
c0103cbd:	c7 04 24 e2 9a 10 c0 	movl   $0xc0109ae2,(%esp)
c0103cc4:	e8 f9 36 00 00       	call   c01073c2 <panic>
c0103cc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ccc:	c9                   	leave  
c0103ccd:	c3                   	ret    

c0103cce <alloc_dentry_ops>:
c0103cce:	55                   	push   %ebp
c0103ccf:	89 e5                	mov    %esp,%ebp
c0103cd1:	83 ec 28             	sub    $0x28,%esp
c0103cd4:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0103cdb:	e8 27 e9 ff ff       	call   c0102607 <kmalloc>
c0103ce0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103ce3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103ce7:	75 0c                	jne    c0103cf5 <alloc_dentry_ops+0x27>
c0103ce9:	c7 04 24 f7 9a 10 c0 	movl   $0xc0109af7,(%esp)
c0103cf0:	e8 cd 36 00 00       	call   c01073c2 <panic>
c0103cf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103cf8:	c9                   	leave  
c0103cf9:	c3                   	ret    

c0103cfa <alloc_file>:
c0103cfa:	55                   	push   %ebp
c0103cfb:	89 e5                	mov    %esp,%ebp
c0103cfd:	83 ec 28             	sub    $0x28,%esp
c0103d00:	c7 04 24 1c 04 00 00 	movl   $0x41c,(%esp)
c0103d07:	e8 fb e8 ff ff       	call   c0102607 <kmalloc>
c0103d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103d0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103d13:	75 0c                	jne    c0103d21 <alloc_file+0x27>
c0103d15:	c7 04 24 10 9b 10 c0 	movl   $0xc0109b10,(%esp)
c0103d1c:	e8 a1 36 00 00       	call   c01073c2 <panic>
c0103d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103d24:	c9                   	leave  
c0103d25:	c3                   	ret    

c0103d26 <alloc_file_ops>:
c0103d26:	55                   	push   %ebp
c0103d27:	89 e5                	mov    %esp,%ebp
c0103d29:	83 ec 28             	sub    $0x28,%esp
c0103d2c:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
c0103d33:	e8 cf e8 ff ff       	call   c0102607 <kmalloc>
c0103d38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103d3b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103d3f:	75 0c                	jne    c0103d4d <alloc_file_ops+0x27>
c0103d41:	c7 04 24 23 9b 10 c0 	movl   $0xc0109b23,(%esp)
c0103d48:	e8 75 36 00 00       	call   c01073c2 <panic>
c0103d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103d50:	c9                   	leave  
c0103d51:	c3                   	ret    

c0103d52 <free_super_block>:
c0103d52:	55                   	push   %ebp
c0103d53:	89 e5                	mov    %esp,%ebp
c0103d55:	83 ec 18             	sub    $0x18,%esp
c0103d58:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103d5c:	75 0c                	jne    c0103d6a <free_super_block+0x18>
c0103d5e:	c7 04 24 3c 9b 10 c0 	movl   $0xc0109b3c,(%esp)
c0103d65:	e8 58 36 00 00       	call   c01073c2 <panic>
c0103d6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d6d:	89 04 24             	mov    %eax,(%esp)
c0103d70:	e8 27 e9 ff ff       	call   c010269c <kfree>
c0103d75:	c9                   	leave  
c0103d76:	c3                   	ret    

c0103d77 <free_super_block_ops>:
c0103d77:	55                   	push   %ebp
c0103d78:	89 e5                	mov    %esp,%ebp
c0103d7a:	83 ec 18             	sub    $0x18,%esp
c0103d7d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103d81:	75 0c                	jne    c0103d8f <free_super_block_ops+0x18>
c0103d83:	c7 04 24 60 9b 10 c0 	movl   $0xc0109b60,(%esp)
c0103d8a:	e8 33 36 00 00       	call   c01073c2 <panic>
c0103d8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d92:	89 04 24             	mov    %eax,(%esp)
c0103d95:	e8 02 e9 ff ff       	call   c010269c <kfree>
c0103d9a:	c9                   	leave  
c0103d9b:	c3                   	ret    

c0103d9c <free_inode>:
c0103d9c:	55                   	push   %ebp
c0103d9d:	89 e5                	mov    %esp,%ebp
c0103d9f:	83 ec 18             	sub    $0x18,%esp
c0103da2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103da6:	75 0c                	jne    c0103db4 <free_inode+0x18>
c0103da8:	c7 04 24 8c 9b 10 c0 	movl   $0xc0109b8c,(%esp)
c0103daf:	e8 0e 36 00 00       	call   c01073c2 <panic>
c0103db4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103db7:	89 04 24             	mov    %eax,(%esp)
c0103dba:	e8 dd e8 ff ff       	call   c010269c <kfree>
c0103dbf:	c9                   	leave  
c0103dc0:	c3                   	ret    

c0103dc1 <free_inode_ops>:
c0103dc1:	55                   	push   %ebp
c0103dc2:	89 e5                	mov    %esp,%ebp
c0103dc4:	83 ec 18             	sub    $0x18,%esp
c0103dc7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103dcb:	75 0c                	jne    c0103dd9 <free_inode_ops+0x18>
c0103dcd:	c7 04 24 b0 9b 10 c0 	movl   $0xc0109bb0,(%esp)
c0103dd4:	e8 e9 35 00 00       	call   c01073c2 <panic>
c0103dd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ddc:	89 04 24             	mov    %eax,(%esp)
c0103ddf:	e8 b8 e8 ff ff       	call   c010269c <kfree>
c0103de4:	c9                   	leave  
c0103de5:	c3                   	ret    

c0103de6 <free_dentry>:
c0103de6:	55                   	push   %ebp
c0103de7:	89 e5                	mov    %esp,%ebp
c0103de9:	83 ec 18             	sub    $0x18,%esp
c0103dec:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103df0:	75 0c                	jne    c0103dfe <free_dentry+0x18>
c0103df2:	c7 04 24 dc 9b 10 c0 	movl   $0xc0109bdc,(%esp)
c0103df9:	e8 c4 35 00 00       	call   c01073c2 <panic>
c0103dfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e01:	89 04 24             	mov    %eax,(%esp)
c0103e04:	e8 93 e8 ff ff       	call   c010269c <kfree>
c0103e09:	c9                   	leave  
c0103e0a:	c3                   	ret    

c0103e0b <free_dentry_ops>:
c0103e0b:	55                   	push   %ebp
c0103e0c:	89 e5                	mov    %esp,%ebp
c0103e0e:	83 ec 18             	sub    $0x18,%esp
c0103e11:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103e15:	75 0c                	jne    c0103e23 <free_dentry_ops+0x18>
c0103e17:	c7 04 24 00 9c 10 c0 	movl   $0xc0109c00,(%esp)
c0103e1e:	e8 9f 35 00 00       	call   c01073c2 <panic>
c0103e23:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e26:	89 04 24             	mov    %eax,(%esp)
c0103e29:	e8 6e e8 ff ff       	call   c010269c <kfree>
c0103e2e:	c9                   	leave  
c0103e2f:	c3                   	ret    

c0103e30 <free_file>:
c0103e30:	55                   	push   %ebp
c0103e31:	89 e5                	mov    %esp,%ebp
c0103e33:	83 ec 18             	sub    $0x18,%esp
c0103e36:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103e3a:	75 0c                	jne    c0103e48 <free_file+0x18>
c0103e3c:	c7 04 24 2c 9c 10 c0 	movl   $0xc0109c2c,(%esp)
c0103e43:	e8 7a 35 00 00       	call   c01073c2 <panic>
c0103e48:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e4b:	89 04 24             	mov    %eax,(%esp)
c0103e4e:	e8 49 e8 ff ff       	call   c010269c <kfree>
c0103e53:	c9                   	leave  
c0103e54:	c3                   	ret    

c0103e55 <free_file_ops>:
c0103e55:	55                   	push   %ebp
c0103e56:	89 e5                	mov    %esp,%ebp
c0103e58:	83 ec 18             	sub    $0x18,%esp
c0103e5b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103e5f:	75 0c                	jne    c0103e6d <free_file_ops+0x18>
c0103e61:	c7 04 24 4c 9c 10 c0 	movl   $0xc0109c4c,(%esp)
c0103e68:	e8 55 35 00 00       	call   c01073c2 <panic>
c0103e6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e70:	89 04 24             	mov    %eax,(%esp)
c0103e73:	e8 24 e8 ff ff       	call   c010269c <kfree>
c0103e78:	c9                   	leave  
c0103e79:	c3                   	ret    

c0103e7a <vfs_open>:
c0103e7a:	55                   	push   %ebp
c0103e7b:	89 e5                	mov    %esp,%ebp
c0103e7d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103e81:	74 06                	je     c0103e89 <vfs_open+0xf>
c0103e83:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103e87:	75 07                	jne    c0103e90 <vfs_open+0x16>
c0103e89:	b8 00 00 00 00       	mov    $0x0,%eax
c0103e8e:	eb 05                	jmp    c0103e95 <vfs_open+0x1b>
c0103e90:	b8 00 00 00 00       	mov    $0x0,%eax
c0103e95:	5d                   	pop    %ebp
c0103e96:	c3                   	ret    

c0103e97 <vfs_close>:
c0103e97:	55                   	push   %ebp
c0103e98:	89 e5                	mov    %esp,%ebp
c0103e9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e9d:	5d                   	pop    %ebp
c0103e9e:	c3                   	ret    

c0103e9f <vfs_read>:
c0103e9f:	55                   	push   %ebp
c0103ea0:	89 e5                	mov    %esp,%ebp
c0103ea2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103ea6:	74 06                	je     c0103eae <vfs_read+0xf>
c0103ea8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103eac:	75 07                	jne    c0103eb5 <vfs_read+0x16>
c0103eae:	b8 00 00 00 00       	mov    $0x0,%eax
c0103eb3:	eb 03                	jmp    c0103eb8 <vfs_read+0x19>
c0103eb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb8:	5d                   	pop    %ebp
c0103eb9:	c3                   	ret    

c0103eba <vfs_write>:
c0103eba:	55                   	push   %ebp
c0103ebb:	89 e5                	mov    %esp,%ebp
c0103ebd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103ec1:	74 06                	je     c0103ec9 <vfs_write+0xf>
c0103ec3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103ec7:	75 07                	jne    c0103ed0 <vfs_write+0x16>
c0103ec9:	b8 00 00 00 00       	mov    $0x0,%eax
c0103ece:	eb 03                	jmp    c0103ed3 <vfs_write+0x19>
c0103ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed3:	5d                   	pop    %ebp
c0103ed4:	c3                   	ret    

c0103ed5 <ramfs_read_super>:
c0103ed5:	55                   	push   %ebp
c0103ed6:	89 e5                	mov    %esp,%ebp
c0103ed8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103edb:	66 c7 00 a0 00       	movw   $0xa0,(%eax)
c0103ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee3:	c7 40 2c 48 90 10 c0 	movl   $0xc0109048,0x2c(%eax)
c0103eea:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eed:	5d                   	pop    %ebp
c0103eee:	c3                   	ret    

c0103eef <ramfs_alloc_inode>:
c0103eef:	55                   	push   %ebp
c0103ef0:	89 e5                	mov    %esp,%ebp
c0103ef2:	83 ec 08             	sub    $0x8,%esp
c0103ef5:	e8 50 fd ff ff       	call   c0103c4a <alloc_inode>
c0103efa:	c9                   	leave  
c0103efb:	c3                   	ret    

c0103efc <ramfs_destroy_inode>:
c0103efc:	55                   	push   %ebp
c0103efd:	89 e5                	mov    %esp,%ebp
c0103eff:	83 ec 18             	sub    $0x18,%esp
c0103f02:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f05:	89 04 24             	mov    %eax,(%esp)
c0103f08:	e8 8f fe ff ff       	call   c0103d9c <free_inode>
c0103f0d:	c9                   	leave  
c0103f0e:	c3                   	ret    

c0103f0f <ramfs_write_super>:
c0103f0f:	55                   	push   %ebp
c0103f10:	89 e5                	mov    %esp,%ebp
c0103f12:	5d                   	pop    %ebp
c0103f13:	c3                   	ret    

c0103f14 <ramfs_sync_fs>:
c0103f14:	55                   	push   %ebp
c0103f15:	89 e5                	mov    %esp,%ebp
c0103f17:	b8 00 00 00 00       	mov    $0x0,%eax
c0103f1c:	5d                   	pop    %ebp
c0103f1d:	c3                   	ret    

c0103f1e <sfs_init>:
c0103f1e:	55                   	push   %ebp
c0103f1f:	89 e5                	mov    %esp,%ebp
c0103f21:	83 ec 38             	sub    $0x38,%esp
c0103f24:	c7 44 24 08 80 9c 10 	movl   $0xc0109c80,0x8(%esp)
c0103f2b:	c0 
c0103f2c:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0103f33:	00 
c0103f34:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103f3b:	e8 a9 1c 00 00       	call   c0105be9 <cprintk>
c0103f40:	c7 04 24 58 90 10 c0 	movl   $0xc0109058,(%esp)
c0103f47:	e8 4b fc ff ff       	call   c0103b97 <add_filesystem>
c0103f4c:	83 f8 ff             	cmp    $0xffffffff,%eax
c0103f4f:	75 0c                	jne    c0103f5d <sfs_init+0x3f>
c0103f51:	c7 04 24 9a 9c 10 c0 	movl   $0xc0109c9a,(%esp)
c0103f58:	e8 4a 1c 00 00       	call   c0105ba7 <printk>
c0103f5d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103f64:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103f6b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0103f72:	e9 a7 00 00 00       	jmp    c010401e <sfs_init+0x100>
c0103f77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103f7a:	83 c0 1b             	add    $0x1b,%eax
c0103f7d:	c1 e0 04             	shl    $0x4,%eax
c0103f80:	05 32 70 11 c0       	add    $0xc0117032,%eax
c0103f85:	0f b6 00             	movzbl (%eax),%eax
c0103f88:	3c aa                	cmp    $0xaa,%al
c0103f8a:	0f 85 8a 00 00 00    	jne    c010401a <sfs_init+0xfc>
c0103f90:	c7 44 24 08 b8 9c 10 	movl   $0xc0109cb8,0x8(%esp)
c0103f97:	c0 
c0103f98:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0103f9f:	00 
c0103fa0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103fa7:	e8 3d 1c 00 00       	call   c0105be9 <cprintk>
c0103fac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103faf:	83 c0 1b             	add    $0x1b,%eax
c0103fb2:	c1 e0 04             	shl    $0x4,%eax
c0103fb5:	05 20 70 11 c0       	add    $0xc0117020,%eax
c0103fba:	8b 50 1a             	mov    0x1a(%eax),%edx
c0103fbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103fc0:	83 c0 1b             	add    $0x1b,%eax
c0103fc3:	c1 e0 04             	shl    $0x4,%eax
c0103fc6:	05 20 70 11 c0       	add    $0xc0117020,%eax
c0103fcb:	8b 40 16             	mov    0x16(%eax),%eax
c0103fce:	89 54 24 10          	mov    %edx,0x10(%esp)
c0103fd2:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103fd6:	c7 44 24 08 da 9c 10 	movl   $0xc0109cda,0x8(%esp)
c0103fdd:	c0 
c0103fde:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0103fe5:	00 
c0103fe6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103fed:	e8 f7 1b 00 00       	call   c0105be9 <cprintk>
c0103ff2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103ff5:	83 c0 1b             	add    $0x1b,%eax
c0103ff8:	c1 e0 04             	shl    $0x4,%eax
c0103ffb:	05 20 70 11 c0       	add    $0xc0117020,%eax
c0104000:	8b 40 16             	mov    0x16(%eax),%eax
c0104003:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104006:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104009:	83 c0 1b             	add    $0x1b,%eax
c010400c:	c1 e0 04             	shl    $0x4,%eax
c010400f:	05 20 70 11 c0       	add    $0xc0117020,%eax
c0104014:	8b 40 1a             	mov    0x1a(%eax),%eax
c0104017:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010401a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010401e:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
c0104022:	0f 8e 4f ff ff ff    	jle    c0103f77 <sfs_init+0x59>
c0104028:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010402c:	74 28                	je     c0104056 <sfs_init+0x138>
c010402e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0104032:	74 22                	je     c0104056 <sfs_init+0x138>
c0104034:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104037:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c010403a:	76 1a                	jbe    c0104056 <sfs_init+0x138>
c010403c:	c7 44 24 08 00 08 00 	movl   $0x800,0x8(%esp)
c0104043:	00 
c0104044:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104047:	89 44 24 04          	mov    %eax,0x4(%esp)
c010404b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010404e:	89 04 24             	mov    %eax,(%esp)
c0104051:	e8 02 00 00 00       	call   c0104058 <sfs_mkfs>
c0104056:	c9                   	leave  
c0104057:	c3                   	ret    

c0104058 <sfs_mkfs>:
c0104058:	55                   	push   %ebp
c0104059:	89 e5                	mov    %esp,%ebp
c010405b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104061:	8b 45 08             	mov    0x8(%ebp),%eax
c0104064:	83 c0 04             	add    $0x4,%eax
c0104067:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010406a:	8b 45 08             	mov    0x8(%ebp),%eax
c010406d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104070:	29 c2                	sub    %eax,%edx
c0104072:	89 d0                	mov    %edx,%eax
c0104074:	83 e8 0c             	sub    $0xc,%eax
c0104077:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010407a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010407d:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0104082:	f7 e2                	mul    %edx
c0104084:	89 d0                	mov    %edx,%eax
c0104086:	c1 e8 03             	shr    $0x3,%eax
c0104089:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010408c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010408f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0104094:	f7 e2                	mul    %edx
c0104096:	c1 ea 03             	shr    $0x3,%edx
c0104099:	89 d0                	mov    %edx,%eax
c010409b:	c1 e0 03             	shl    $0x3,%eax
c010409e:	01 d0                	add    %edx,%eax
c01040a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01040a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01040a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01040a9:	8b 45 10             	mov    0x10(%ebp),%eax
c01040ac:	c1 e8 09             	shr    $0x9,%eax
c01040af:	89 c1                	mov    %eax,%ecx
c01040b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01040b4:	ba 00 00 00 00       	mov    $0x0,%edx
c01040b9:	f7 f1                	div    %ecx
c01040bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01040be:	8b 45 08             	mov    0x8(%ebp),%eax
c01040c1:	83 c0 0c             	add    $0xc,%eax
c01040c4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01040c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01040ca:	c1 e8 09             	shr    $0x9,%eax
c01040cd:	83 c0 01             	add    $0x1,%eax
c01040d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01040d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01040d6:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01040d9:	01 d0                	add    %edx,%eax
c01040db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01040de:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01040e1:	ba 00 00 00 00       	mov    $0x0,%edx
c01040e6:	f7 75 10             	divl   0x10(%ebp)
c01040e9:	83 c0 01             	add    $0x1,%eax
c01040ec:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01040ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01040f2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01040f5:	01 d0                	add    %edx,%eax
c01040f7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01040fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01040fd:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0104100:	01 d0                	add    %edx,%eax
c0104102:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0104105:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104108:	89 44 24 04          	mov    %eax,0x4(%esp)
c010410c:	c7 04 24 f0 9c 10 c0 	movl   $0xc0109cf0,(%esp)
c0104113:	e8 8f 1a 00 00       	call   c0105ba7 <printk>
c0104118:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010411b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010411f:	c7 04 24 07 9d 10 c0 	movl   $0xc0109d07,(%esp)
c0104126:	e8 7c 1a 00 00       	call   c0105ba7 <printk>
c010412b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010412e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104132:	c7 04 24 1f 9d 10 c0 	movl   $0xc0109d1f,(%esp)
c0104139:	e8 69 1a 00 00       	call   c0105ba7 <printk>
c010413e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104141:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104145:	c7 04 24 36 9d 10 c0 	movl   $0xc0109d36,(%esp)
c010414c:	e8 56 1a 00 00       	call   c0105ba7 <printk>
c0104151:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104154:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104158:	c7 04 24 4e 9d 10 c0 	movl   $0xc0109d4e,(%esp)
c010415f:	e8 43 1a 00 00       	call   c0105ba7 <printk>
c0104164:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104167:	89 44 24 04          	mov    %eax,0x4(%esp)
c010416b:	c7 04 24 65 9d 10 c0 	movl   $0xc0109d65,(%esp)
c0104172:	e8 30 1a 00 00       	call   c0105ba7 <printk>
c0104177:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010417a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010417e:	c7 04 24 7d 9d 10 c0 	movl   $0xc0109d7d,(%esp)
c0104185:	e8 1d 1a 00 00       	call   c0105ba7 <printk>
c010418a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010418d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104191:	c7 04 24 94 9d 10 c0 	movl   $0xc0109d94,(%esp)
c0104198:	e8 0a 1a 00 00       	call   c0105ba7 <printk>
c010419d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01041a0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041a4:	c7 04 24 ab 9d 10 c0 	movl   $0xc0109dab,(%esp)
c01041ab:	e8 f7 19 00 00       	call   c0105ba7 <printk>
c01041b0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01041b3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041b7:	c7 04 24 c3 9d 10 c0 	movl   $0xc0109dc3,(%esp)
c01041be:	e8 e4 19 00 00       	call   c0105ba7 <printk>
c01041c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01041c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041ca:	c7 04 24 da 9d 10 c0 	movl   $0xc0109dda,(%esp)
c01041d1:	e8 d1 19 00 00       	call   c0105ba7 <printk>
c01041d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01041d9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041dd:	c7 04 24 f1 9d 10 c0 	movl   $0xc0109df1,(%esp)
c01041e4:	e8 be 19 00 00       	call   c0105ba7 <printk>
c01041e9:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
c01041f0:	00 
c01041f1:	c7 44 24 04 00 00 01 	movl   $0x2010000,0x4(%esp)
c01041f8:	02 
c01041f9:	c7 04 24 0c 9e 10 c0 	movl   $0xc0109e0c,(%esp)
c0104200:	e8 a2 19 00 00       	call   c0105ba7 <printk>
c0104205:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
c010420c:	00 
c010420d:	8d 45 90             	lea    -0x70(%ebp),%eax
c0104210:	89 04 24             	mov    %eax,(%esp)
c0104213:	e8 a0 01 00 00       	call   c01043b8 <bzero>
c0104218:	66 c7 45 90 aa 00    	movw   $0xaa,-0x70(%ebp)
c010421e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104221:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104224:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104227:	89 45 98             	mov    %eax,-0x68(%ebp)
c010422a:	8b 45 10             	mov    0x10(%ebp),%eax
c010422d:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0104230:	c7 45 a0 00 00 01 02 	movl   $0x2010000,-0x60(%ebp)
c0104237:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
c010423e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104241:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104244:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104247:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010424a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010424d:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0104250:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104253:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104256:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104259:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010425c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010425f:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104262:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0104265:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104268:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010426b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010426e:	c9                   	leave  
c010426f:	c3                   	ret    

c0104270 <sfs_read_super>:
c0104270:	55                   	push   %ebp
c0104271:	89 e5                	mov    %esp,%ebp
c0104273:	c7 05 b8 b0 10 c0 00 	movl   $0x0,0xc010b0b8
c010427a:	00 00 00 
c010427d:	b8 00 00 00 00       	mov    $0x0,%eax
c0104282:	5d                   	pop    %ebp
c0104283:	c3                   	ret    

c0104284 <sfs_write_super>:
c0104284:	55                   	push   %ebp
c0104285:	89 e5                	mov    %esp,%ebp
c0104287:	5d                   	pop    %ebp
c0104288:	c3                   	ret    

c0104289 <sfs_read_inode_map>:
c0104289:	55                   	push   %ebp
c010428a:	89 e5                	mov    %esp,%ebp
c010428c:	c7 05 bc b0 10 c0 00 	movl   $0x0,0xc010b0bc
c0104293:	00 00 00 
c0104296:	b8 00 00 00 00       	mov    $0x0,%eax
c010429b:	5d                   	pop    %ebp
c010429c:	c3                   	ret    

c010429d <sfs_write_inode_map>:
c010429d:	55                   	push   %ebp
c010429e:	89 e5                	mov    %esp,%ebp
c01042a0:	5d                   	pop    %ebp
c01042a1:	c3                   	ret    

c01042a2 <sfs_read_block_map>:
c01042a2:	55                   	push   %ebp
c01042a3:	89 e5                	mov    %esp,%ebp
c01042a5:	c7 05 c0 b0 10 c0 00 	movl   $0x0,0xc010b0c0
c01042ac:	00 00 00 
c01042af:	b8 00 00 00 00       	mov    $0x0,%eax
c01042b4:	5d                   	pop    %ebp
c01042b5:	c3                   	ret    

c01042b6 <sfs_write_block_map>:
c01042b6:	55                   	push   %ebp
c01042b7:	89 e5                	mov    %esp,%ebp
c01042b9:	5d                   	pop    %ebp
c01042ba:	c3                   	ret    

c01042bb <sfs_alloc_inode>:
c01042bb:	55                   	push   %ebp
c01042bc:	89 e5                	mov    %esp,%ebp
c01042be:	b8 00 00 00 00       	mov    $0x0,%eax
c01042c3:	5d                   	pop    %ebp
c01042c4:	c3                   	ret    

c01042c5 <sfs_free_inode>:
c01042c5:	55                   	push   %ebp
c01042c6:	89 e5                	mov    %esp,%ebp
c01042c8:	5d                   	pop    %ebp
c01042c9:	c3                   	ret    

c01042ca <sfs_alloc_block>:
c01042ca:	55                   	push   %ebp
c01042cb:	89 e5                	mov    %esp,%ebp
c01042cd:	b8 00 00 00 00       	mov    $0x0,%eax
c01042d2:	5d                   	pop    %ebp
c01042d3:	c3                   	ret    

c01042d4 <sfs_free_block>:
c01042d4:	55                   	push   %ebp
c01042d5:	89 e5                	mov    %esp,%ebp
c01042d7:	5d                   	pop    %ebp
c01042d8:	c3                   	ret    

c01042d9 <sfs_read_inode>:
c01042d9:	55                   	push   %ebp
c01042da:	89 e5                	mov    %esp,%ebp
c01042dc:	b8 00 00 00 00       	mov    $0x0,%eax
c01042e1:	5d                   	pop    %ebp
c01042e2:	c3                   	ret    

c01042e3 <sfs_read_block>:
c01042e3:	55                   	push   %ebp
c01042e4:	89 e5                	mov    %esp,%ebp
c01042e6:	b8 00 00 00 00       	mov    $0x0,%eax
c01042eb:	5d                   	pop    %ebp
c01042ec:	c3                   	ret    

c01042ed <fs_init>:
c01042ed:	55                   	push   %ebp
c01042ee:	89 e5                	mov    %esp,%ebp
c01042f0:	83 ec 08             	sub    $0x8,%esp
c01042f3:	e8 fb f6 ff ff       	call   c01039f3 <vfs_init>
c01042f8:	e8 0c 17 00 00       	call   c0105a09 <device_init>
c01042fd:	e8 1c fc ff ff       	call   c0103f1e <sfs_init>
c0104302:	c9                   	leave  
c0104303:	c3                   	ret    

c0104304 <read_mbr_info>:
c0104304:	55                   	push   %ebp
c0104305:	89 e5                	mov    %esp,%ebp
c0104307:	83 ec 38             	sub    $0x38,%esp
c010430a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104311:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104318:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010431f:	c7 45 f0 20 70 11 c0 	movl   $0xc0117020,-0x10(%ebp)
c0104326:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c010432d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104330:	8b 40 18             	mov    0x18(%eax),%eax
c0104333:	8d 55 e4             	lea    -0x1c(%ebp),%edx
c0104336:	89 14 24             	mov    %edx,(%esp)
c0104339:	ff d0                	call   *%eax
c010433b:	85 c0                	test   %eax,%eax
c010433d:	75 07                	jne    c0104346 <read_mbr_info+0x42>
c010433f:	b8 00 00 00 00       	mov    $0x0,%eax
c0104344:	eb 05                	jmp    c010434b <read_mbr_info+0x47>
c0104346:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010434b:	c9                   	leave  
c010434c:	c3                   	ret    

c010434d <show_partition_info>:
c010434d:	55                   	push   %ebp
c010434e:	89 e5                	mov    %esp,%ebp
c0104350:	5d                   	pop    %ebp
c0104351:	c3                   	ret    

c0104352 <memcpy>:
c0104352:	55                   	push   %ebp
c0104353:	89 e5                	mov    %esp,%ebp
c0104355:	83 ec 10             	sub    $0x10,%esp
c0104358:	8b 45 0c             	mov    0xc(%ebp),%eax
c010435b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010435e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104361:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0104364:	eb 1b                	jmp    c0104381 <memcpy+0x2f>
c0104366:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104369:	8d 50 01             	lea    0x1(%eax),%edx
c010436c:	89 55 f8             	mov    %edx,-0x8(%ebp)
c010436f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104372:	8d 4a 01             	lea    0x1(%edx),%ecx
c0104375:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0104378:	0f b6 12             	movzbl (%edx),%edx
c010437b:	88 10                	mov    %dl,(%eax)
c010437d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0104381:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0104385:	75 df                	jne    c0104366 <memcpy+0x14>
c0104387:	c9                   	leave  
c0104388:	c3                   	ret    

c0104389 <memset>:
c0104389:	55                   	push   %ebp
c010438a:	89 e5                	mov    %esp,%ebp
c010438c:	83 ec 14             	sub    $0x14,%esp
c010438f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104392:	88 45 ec             	mov    %al,-0x14(%ebp)
c0104395:	8b 45 08             	mov    0x8(%ebp),%eax
c0104398:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010439b:	eb 13                	jmp    c01043b0 <memset+0x27>
c010439d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01043a0:	8d 50 01             	lea    0x1(%eax),%edx
c01043a3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01043a6:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
c01043aa:	88 10                	mov    %dl,(%eax)
c01043ac:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01043b0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01043b4:	75 e7                	jne    c010439d <memset+0x14>
c01043b6:	c9                   	leave  
c01043b7:	c3                   	ret    

c01043b8 <bzero>:
c01043b8:	55                   	push   %ebp
c01043b9:	89 e5                	mov    %esp,%ebp
c01043bb:	83 ec 0c             	sub    $0xc,%esp
c01043be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043c1:	89 44 24 08          	mov    %eax,0x8(%esp)
c01043c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01043cc:	00 
c01043cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d0:	89 04 24             	mov    %eax,(%esp)
c01043d3:	e8 b1 ff ff ff       	call   c0104389 <memset>
c01043d8:	c9                   	leave  
c01043d9:	c3                   	ret    

c01043da <strcmp>:
c01043da:	55                   	push   %ebp
c01043db:	89 e5                	mov    %esp,%ebp
c01043dd:	83 ec 10             	sub    $0x10,%esp
c01043e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01043e7:	eb 08                	jmp    c01043f1 <strcmp+0x17>
c01043e9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01043ed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01043f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043f4:	0f b6 00             	movzbl (%eax),%eax
c01043f7:	0f b6 d0             	movzbl %al,%edx
c01043fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01043fd:	0f b6 00             	movzbl (%eax),%eax
c0104400:	0f b6 c0             	movzbl %al,%eax
c0104403:	29 c2                	sub    %eax,%edx
c0104405:	89 d0                	mov    %edx,%eax
c0104407:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010440a:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010440e:	75 0a                	jne    c010441a <strcmp+0x40>
c0104410:	8b 45 08             	mov    0x8(%ebp),%eax
c0104413:	0f b6 00             	movzbl (%eax),%eax
c0104416:	84 c0                	test   %al,%al
c0104418:	75 cf                	jne    c01043e9 <strcmp+0xf>
c010441a:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010441e:	79 09                	jns    c0104429 <strcmp+0x4f>
c0104420:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%ebp)
c0104427:	eb 0d                	jmp    c0104436 <strcmp+0x5c>
c0104429:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010442d:	7e 07                	jle    c0104436 <strcmp+0x5c>
c010442f:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
c0104436:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104439:	c9                   	leave  
c010443a:	c3                   	ret    

c010443b <strcpy>:
c010443b:	55                   	push   %ebp
c010443c:	89 e5                	mov    %esp,%ebp
c010443e:	83 ec 10             	sub    $0x10,%esp
c0104441:	8b 45 08             	mov    0x8(%ebp),%eax
c0104444:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104447:	eb 17                	jmp    c0104460 <strcpy+0x25>
c0104449:	8b 45 08             	mov    0x8(%ebp),%eax
c010444c:	8d 50 01             	lea    0x1(%eax),%edx
c010444f:	89 55 08             	mov    %edx,0x8(%ebp)
c0104452:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104455:	8d 4a 01             	lea    0x1(%edx),%ecx
c0104458:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c010445b:	0f b6 12             	movzbl (%edx),%edx
c010445e:	88 10                	mov    %dl,(%eax)
c0104460:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104463:	0f b6 00             	movzbl (%eax),%eax
c0104466:	84 c0                	test   %al,%al
c0104468:	75 df                	jne    c0104449 <strcpy+0xe>
c010446a:	8b 45 08             	mov    0x8(%ebp),%eax
c010446d:	c6 00 00             	movb   $0x0,(%eax)
c0104470:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104473:	c9                   	leave  
c0104474:	c3                   	ret    

c0104475 <strncpy>:
c0104475:	55                   	push   %ebp
c0104476:	89 e5                	mov    %esp,%ebp
c0104478:	83 ec 10             	sub    $0x10,%esp
c010447b:	8b 45 08             	mov    0x8(%ebp),%eax
c010447e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104481:	eb 27                	jmp    c01044aa <strncpy+0x35>
c0104483:	eb 17                	jmp    c010449c <strncpy+0x27>
c0104485:	8b 45 08             	mov    0x8(%ebp),%eax
c0104488:	8d 50 01             	lea    0x1(%eax),%edx
c010448b:	89 55 08             	mov    %edx,0x8(%ebp)
c010448e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104491:	8d 4a 01             	lea    0x1(%edx),%ecx
c0104494:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c0104497:	0f b6 12             	movzbl (%edx),%edx
c010449a:	88 10                	mov    %dl,(%eax)
c010449c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010449f:	0f b6 00             	movzbl (%eax),%eax
c01044a2:	84 c0                	test   %al,%al
c01044a4:	75 df                	jne    c0104485 <strncpy+0x10>
c01044a6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01044aa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01044ae:	75 d3                	jne    c0104483 <strncpy+0xe>
c01044b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b3:	c6 00 00             	movb   $0x0,(%eax)
c01044b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01044b9:	c9                   	leave  
c01044ba:	c3                   	ret    

c01044bb <strcat>:
c01044bb:	55                   	push   %ebp
c01044bc:	89 e5                	mov    %esp,%ebp
c01044be:	83 ec 10             	sub    $0x10,%esp
c01044c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01044c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01044c7:	eb 04                	jmp    c01044cd <strcat+0x12>
c01044c9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01044cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01044d0:	0f b6 00             	movzbl (%eax),%eax
c01044d3:	84 c0                	test   %al,%al
c01044d5:	75 f2                	jne    c01044c9 <strcat+0xe>
c01044d7:	90                   	nop
c01044d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01044db:	8d 50 01             	lea    0x1(%eax),%edx
c01044de:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01044e1:	8b 55 0c             	mov    0xc(%ebp),%edx
c01044e4:	8d 4a 01             	lea    0x1(%edx),%ecx
c01044e7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
c01044ea:	0f b6 12             	movzbl (%edx),%edx
c01044ed:	88 10                	mov    %dl,(%eax)
c01044ef:	0f b6 00             	movzbl (%eax),%eax
c01044f2:	84 c0                	test   %al,%al
c01044f4:	75 e2                	jne    c01044d8 <strcat+0x1d>
c01044f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01044f9:	c9                   	leave  
c01044fa:	c3                   	ret    

c01044fb <strlen>:
c01044fb:	55                   	push   %ebp
c01044fc:	89 e5                	mov    %esp,%ebp
c01044fe:	83 ec 10             	sub    $0x10,%esp
c0104501:	8b 45 08             	mov    0x8(%ebp),%eax
c0104504:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104507:	90                   	nop
c0104508:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010450b:	8d 50 01             	lea    0x1(%eax),%edx
c010450e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0104511:	0f b6 00             	movzbl (%eax),%eax
c0104514:	84 c0                	test   %al,%al
c0104516:	75 f0                	jne    c0104508 <strlen+0xd>
c0104518:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010451b:	8b 45 08             	mov    0x8(%ebp),%eax
c010451e:	29 c2                	sub    %eax,%edx
c0104520:	89 d0                	mov    %edx,%eax
c0104522:	83 e8 01             	sub    $0x1,%eax
c0104525:	c9                   	leave  
c0104526:	c3                   	ret    

c0104527 <rb_set_parent>:
c0104527:	55                   	push   %ebp
c0104528:	89 e5                	mov    %esp,%ebp
c010452a:	8b 45 08             	mov    0x8(%ebp),%eax
c010452d:	8b 00                	mov    (%eax),%eax
c010452f:	83 e0 03             	and    $0x3,%eax
c0104532:	89 c2                	mov    %eax,%edx
c0104534:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104537:	09 c2                	or     %eax,%edx
c0104539:	8b 45 08             	mov    0x8(%ebp),%eax
c010453c:	89 10                	mov    %edx,(%eax)
c010453e:	5d                   	pop    %ebp
c010453f:	c3                   	ret    

c0104540 <rb_set_color>:
c0104540:	55                   	push   %ebp
c0104541:	89 e5                	mov    %esp,%ebp
c0104543:	8b 45 08             	mov    0x8(%ebp),%eax
c0104546:	8b 00                	mov    (%eax),%eax
c0104548:	83 e0 fe             	and    $0xfffffffe,%eax
c010454b:	89 c2                	mov    %eax,%edx
c010454d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104550:	09 c2                	or     %eax,%edx
c0104552:	8b 45 08             	mov    0x8(%ebp),%eax
c0104555:	89 10                	mov    %edx,(%eax)
c0104557:	5d                   	pop    %ebp
c0104558:	c3                   	ret    

c0104559 <__rb_rotate_left>:
c0104559:	55                   	push   %ebp
c010455a:	89 e5                	mov    %esp,%ebp
c010455c:	83 ec 18             	sub    $0x18,%esp
c010455f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104562:	8b 40 04             	mov    0x4(%eax),%eax
c0104565:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104568:	8b 45 08             	mov    0x8(%ebp),%eax
c010456b:	8b 00                	mov    (%eax),%eax
c010456d:	83 e0 fc             	and    $0xfffffffc,%eax
c0104570:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0104573:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104576:	8b 50 08             	mov    0x8(%eax),%edx
c0104579:	8b 45 08             	mov    0x8(%ebp),%eax
c010457c:	89 50 04             	mov    %edx,0x4(%eax)
c010457f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104582:	8b 40 04             	mov    0x4(%eax),%eax
c0104585:	85 c0                	test   %eax,%eax
c0104587:	74 15                	je     c010459e <__rb_rotate_left+0x45>
c0104589:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010458c:	8b 40 08             	mov    0x8(%eax),%eax
c010458f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104592:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104596:	89 04 24             	mov    %eax,(%esp)
c0104599:	e8 89 ff ff ff       	call   c0104527 <rb_set_parent>
c010459e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01045a1:	8b 55 08             	mov    0x8(%ebp),%edx
c01045a4:	89 50 08             	mov    %edx,0x8(%eax)
c01045a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01045aa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01045b1:	89 04 24             	mov    %eax,(%esp)
c01045b4:	e8 6e ff ff ff       	call   c0104527 <rb_set_parent>
c01045b9:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c01045bd:	74 21                	je     c01045e0 <__rb_rotate_left+0x87>
c01045bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01045c2:	8b 40 08             	mov    0x8(%eax),%eax
c01045c5:	3b 45 08             	cmp    0x8(%ebp),%eax
c01045c8:	75 0b                	jne    c01045d5 <__rb_rotate_left+0x7c>
c01045ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01045cd:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01045d0:	89 50 08             	mov    %edx,0x8(%eax)
c01045d3:	eb 13                	jmp    c01045e8 <__rb_rotate_left+0x8f>
c01045d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01045d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01045db:	89 50 04             	mov    %edx,0x4(%eax)
c01045de:	eb 08                	jmp    c01045e8 <__rb_rotate_left+0x8f>
c01045e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01045e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01045e6:	89 10                	mov    %edx,(%eax)
c01045e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01045eb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01045f2:	89 04 24             	mov    %eax,(%esp)
c01045f5:	e8 2d ff ff ff       	call   c0104527 <rb_set_parent>
c01045fa:	c9                   	leave  
c01045fb:	c3                   	ret    

c01045fc <__rb_rotate_right>:
c01045fc:	55                   	push   %ebp
c01045fd:	89 e5                	mov    %esp,%ebp
c01045ff:	83 ec 18             	sub    $0x18,%esp
c0104602:	8b 45 08             	mov    0x8(%ebp),%eax
c0104605:	8b 40 08             	mov    0x8(%eax),%eax
c0104608:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010460b:	8b 45 08             	mov    0x8(%ebp),%eax
c010460e:	8b 00                	mov    (%eax),%eax
c0104610:	83 e0 fc             	and    $0xfffffffc,%eax
c0104613:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0104616:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104619:	8b 50 04             	mov    0x4(%eax),%edx
c010461c:	8b 45 08             	mov    0x8(%ebp),%eax
c010461f:	89 50 08             	mov    %edx,0x8(%eax)
c0104622:	8b 45 08             	mov    0x8(%ebp),%eax
c0104625:	8b 40 08             	mov    0x8(%eax),%eax
c0104628:	85 c0                	test   %eax,%eax
c010462a:	74 15                	je     c0104641 <__rb_rotate_right+0x45>
c010462c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010462f:	8b 40 04             	mov    0x4(%eax),%eax
c0104632:	8b 55 08             	mov    0x8(%ebp),%edx
c0104635:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104639:	89 04 24             	mov    %eax,(%esp)
c010463c:	e8 e6 fe ff ff       	call   c0104527 <rb_set_parent>
c0104641:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104644:	8b 55 08             	mov    0x8(%ebp),%edx
c0104647:	89 50 04             	mov    %edx,0x4(%eax)
c010464a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010464d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104651:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104654:	89 04 24             	mov    %eax,(%esp)
c0104657:	e8 cb fe ff ff       	call   c0104527 <rb_set_parent>
c010465c:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c0104660:	74 21                	je     c0104683 <__rb_rotate_right+0x87>
c0104662:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104665:	8b 40 04             	mov    0x4(%eax),%eax
c0104668:	3b 45 08             	cmp    0x8(%ebp),%eax
c010466b:	75 0b                	jne    c0104678 <__rb_rotate_right+0x7c>
c010466d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104670:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104673:	89 50 04             	mov    %edx,0x4(%eax)
c0104676:	eb 13                	jmp    c010468b <__rb_rotate_right+0x8f>
c0104678:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010467b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010467e:	89 50 08             	mov    %edx,0x8(%eax)
c0104681:	eb 08                	jmp    c010468b <__rb_rotate_right+0x8f>
c0104683:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104686:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104689:	89 10                	mov    %edx,(%eax)
c010468b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010468e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104692:	8b 45 08             	mov    0x8(%ebp),%eax
c0104695:	89 04 24             	mov    %eax,(%esp)
c0104698:	e8 8a fe ff ff       	call   c0104527 <rb_set_parent>
c010469d:	c9                   	leave  
c010469e:	c3                   	ret    

c010469f <rb_insert_color>:
c010469f:	55                   	push   %ebp
c01046a0:	89 e5                	mov    %esp,%ebp
c01046a2:	53                   	push   %ebx
c01046a3:	83 ec 18             	sub    $0x18,%esp
c01046a6:	e9 54 01 00 00       	jmp    c01047ff <rb_insert_color+0x160>
c01046ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01046ae:	8b 00                	mov    (%eax),%eax
c01046b0:	83 e0 fc             	and    $0xfffffffc,%eax
c01046b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01046b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046b9:	8b 40 08             	mov    0x8(%eax),%eax
c01046bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01046bf:	0f 85 a1 00 00 00    	jne    c0104766 <rb_insert_color+0xc7>
c01046c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046c8:	8b 58 04             	mov    0x4(%eax),%ebx
c01046cb:	85 db                	test   %ebx,%ebx
c01046cd:	74 39                	je     c0104708 <rb_insert_color+0x69>
c01046cf:	8b 03                	mov    (%ebx),%eax
c01046d1:	83 e0 01             	and    $0x1,%eax
c01046d4:	85 c0                	test   %eax,%eax
c01046d6:	75 30                	jne    c0104708 <rb_insert_color+0x69>
c01046d8:	8b 03                	mov    (%ebx),%eax
c01046da:	83 c8 01             	or     $0x1,%eax
c01046dd:	89 03                	mov    %eax,(%ebx)
c01046df:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01046e2:	8b 00                	mov    (%eax),%eax
c01046e4:	83 c8 01             	or     $0x1,%eax
c01046e7:	89 c2                	mov    %eax,%edx
c01046e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01046ec:	89 10                	mov    %edx,(%eax)
c01046ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046f1:	8b 00                	mov    (%eax),%eax
c01046f3:	83 e0 fe             	and    $0xfffffffe,%eax
c01046f6:	89 c2                	mov    %eax,%edx
c01046f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046fb:	89 10                	mov    %edx,(%eax)
c01046fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104700:	89 45 08             	mov    %eax,0x8(%ebp)
c0104703:	e9 f7 00 00 00       	jmp    c01047ff <rb_insert_color+0x160>
c0104708:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010470b:	8b 40 04             	mov    0x4(%eax),%eax
c010470e:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104711:	75 1e                	jne    c0104731 <rb_insert_color+0x92>
c0104713:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104716:	89 44 24 04          	mov    %eax,0x4(%esp)
c010471a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010471d:	89 04 24             	mov    %eax,(%esp)
c0104720:	e8 34 fe ff ff       	call   c0104559 <__rb_rotate_left>
c0104725:	8b 5d f8             	mov    -0x8(%ebp),%ebx
c0104728:	8b 45 08             	mov    0x8(%ebp),%eax
c010472b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010472e:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0104731:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104734:	8b 00                	mov    (%eax),%eax
c0104736:	83 c8 01             	or     $0x1,%eax
c0104739:	89 c2                	mov    %eax,%edx
c010473b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010473e:	89 10                	mov    %edx,(%eax)
c0104740:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104743:	8b 00                	mov    (%eax),%eax
c0104745:	83 e0 fe             	and    $0xfffffffe,%eax
c0104748:	89 c2                	mov    %eax,%edx
c010474a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010474d:	89 10                	mov    %edx,(%eax)
c010474f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104752:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104756:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104759:	89 04 24             	mov    %eax,(%esp)
c010475c:	e8 9b fe ff ff       	call   c01045fc <__rb_rotate_right>
c0104761:	e9 99 00 00 00       	jmp    c01047ff <rb_insert_color+0x160>
c0104766:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104769:	8b 58 08             	mov    0x8(%eax),%ebx
c010476c:	85 db                	test   %ebx,%ebx
c010476e:	74 36                	je     c01047a6 <rb_insert_color+0x107>
c0104770:	8b 03                	mov    (%ebx),%eax
c0104772:	83 e0 01             	and    $0x1,%eax
c0104775:	85 c0                	test   %eax,%eax
c0104777:	75 2d                	jne    c01047a6 <rb_insert_color+0x107>
c0104779:	8b 03                	mov    (%ebx),%eax
c010477b:	83 c8 01             	or     $0x1,%eax
c010477e:	89 03                	mov    %eax,(%ebx)
c0104780:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104783:	8b 00                	mov    (%eax),%eax
c0104785:	83 c8 01             	or     $0x1,%eax
c0104788:	89 c2                	mov    %eax,%edx
c010478a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010478d:	89 10                	mov    %edx,(%eax)
c010478f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104792:	8b 00                	mov    (%eax),%eax
c0104794:	83 e0 fe             	and    $0xfffffffe,%eax
c0104797:	89 c2                	mov    %eax,%edx
c0104799:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010479c:	89 10                	mov    %edx,(%eax)
c010479e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047a1:	89 45 08             	mov    %eax,0x8(%ebp)
c01047a4:	eb 59                	jmp    c01047ff <rb_insert_color+0x160>
c01047a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01047a9:	8b 40 08             	mov    0x8(%eax),%eax
c01047ac:	3b 45 08             	cmp    0x8(%ebp),%eax
c01047af:	75 1e                	jne    c01047cf <rb_insert_color+0x130>
c01047b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01047b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01047b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01047bb:	89 04 24             	mov    %eax,(%esp)
c01047be:	e8 39 fe ff ff       	call   c01045fc <__rb_rotate_right>
c01047c3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
c01047c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01047c9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01047cc:	89 5d 08             	mov    %ebx,0x8(%ebp)
c01047cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01047d2:	8b 00                	mov    (%eax),%eax
c01047d4:	83 c8 01             	or     $0x1,%eax
c01047d7:	89 c2                	mov    %eax,%edx
c01047d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01047dc:	89 10                	mov    %edx,(%eax)
c01047de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047e1:	8b 00                	mov    (%eax),%eax
c01047e3:	83 e0 fe             	and    $0xfffffffe,%eax
c01047e6:	89 c2                	mov    %eax,%edx
c01047e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047eb:	89 10                	mov    %edx,(%eax)
c01047ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01047f0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01047f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047f7:	89 04 24             	mov    %eax,(%esp)
c01047fa:	e8 5a fd ff ff       	call   c0104559 <__rb_rotate_left>
c01047ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104802:	8b 00                	mov    (%eax),%eax
c0104804:	83 e0 fc             	and    $0xfffffffc,%eax
c0104807:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010480a:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c010480e:	74 10                	je     c0104820 <rb_insert_color+0x181>
c0104810:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104813:	8b 00                	mov    (%eax),%eax
c0104815:	83 e0 01             	and    $0x1,%eax
c0104818:	85 c0                	test   %eax,%eax
c010481a:	0f 84 8b fe ff ff    	je     c01046ab <rb_insert_color+0xc>
c0104820:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104823:	8b 00                	mov    (%eax),%eax
c0104825:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104828:	8b 12                	mov    (%edx),%edx
c010482a:	8b 12                	mov    (%edx),%edx
c010482c:	83 ca 01             	or     $0x1,%edx
c010482f:	89 10                	mov    %edx,(%eax)
c0104831:	83 c4 18             	add    $0x18,%esp
c0104834:	5b                   	pop    %ebx
c0104835:	5d                   	pop    %ebp
c0104836:	c3                   	ret    

c0104837 <__rb_erase_color>:
c0104837:	55                   	push   %ebp
c0104838:	89 e5                	mov    %esp,%ebp
c010483a:	83 ec 18             	sub    $0x18,%esp
c010483d:	e9 b2 02 00 00       	jmp    c0104af4 <__rb_erase_color+0x2bd>
c0104842:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104845:	8b 40 08             	mov    0x8(%eax),%eax
c0104848:	3b 45 08             	cmp    0x8(%ebp),%eax
c010484b:	0f 85 53 01 00 00    	jne    c01049a4 <__rb_erase_color+0x16d>
c0104851:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104854:	8b 40 04             	mov    0x4(%eax),%eax
c0104857:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010485a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010485d:	8b 00                	mov    (%eax),%eax
c010485f:	83 e0 01             	and    $0x1,%eax
c0104862:	85 c0                	test   %eax,%eax
c0104864:	75 39                	jne    c010489f <__rb_erase_color+0x68>
c0104866:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104869:	8b 00                	mov    (%eax),%eax
c010486b:	83 c8 01             	or     $0x1,%eax
c010486e:	89 c2                	mov    %eax,%edx
c0104870:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104873:	89 10                	mov    %edx,(%eax)
c0104875:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104878:	8b 00                	mov    (%eax),%eax
c010487a:	83 e0 fe             	and    $0xfffffffe,%eax
c010487d:	89 c2                	mov    %eax,%edx
c010487f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104882:	89 10                	mov    %edx,(%eax)
c0104884:	8b 45 10             	mov    0x10(%ebp),%eax
c0104887:	89 44 24 04          	mov    %eax,0x4(%esp)
c010488b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010488e:	89 04 24             	mov    %eax,(%esp)
c0104891:	e8 c3 fc ff ff       	call   c0104559 <__rb_rotate_left>
c0104896:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104899:	8b 40 04             	mov    0x4(%eax),%eax
c010489c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010489f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048a2:	8b 40 08             	mov    0x8(%eax),%eax
c01048a5:	85 c0                	test   %eax,%eax
c01048a7:	74 0f                	je     c01048b8 <__rb_erase_color+0x81>
c01048a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048ac:	8b 40 08             	mov    0x8(%eax),%eax
c01048af:	8b 00                	mov    (%eax),%eax
c01048b1:	83 e0 01             	and    $0x1,%eax
c01048b4:	85 c0                	test   %eax,%eax
c01048b6:	74 3e                	je     c01048f6 <__rb_erase_color+0xbf>
c01048b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048bb:	8b 40 04             	mov    0x4(%eax),%eax
c01048be:	85 c0                	test   %eax,%eax
c01048c0:	74 0f                	je     c01048d1 <__rb_erase_color+0x9a>
c01048c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048c5:	8b 40 04             	mov    0x4(%eax),%eax
c01048c8:	8b 00                	mov    (%eax),%eax
c01048ca:	83 e0 01             	and    $0x1,%eax
c01048cd:	85 c0                	test   %eax,%eax
c01048cf:	74 25                	je     c01048f6 <__rb_erase_color+0xbf>
c01048d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048d4:	8b 00                	mov    (%eax),%eax
c01048d6:	83 e0 fe             	and    $0xfffffffe,%eax
c01048d9:	89 c2                	mov    %eax,%edx
c01048db:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048de:	89 10                	mov    %edx,(%eax)
c01048e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01048e3:	89 45 08             	mov    %eax,0x8(%ebp)
c01048e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01048e9:	8b 00                	mov    (%eax),%eax
c01048eb:	83 e0 fc             	and    $0xfffffffc,%eax
c01048ee:	89 45 0c             	mov    %eax,0xc(%ebp)
c01048f1:	e9 fe 01 00 00       	jmp    c0104af4 <__rb_erase_color+0x2bd>
c01048f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01048f9:	8b 40 04             	mov    0x4(%eax),%eax
c01048fc:	85 c0                	test   %eax,%eax
c01048fe:	74 0f                	je     c010490f <__rb_erase_color+0xd8>
c0104900:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104903:	8b 40 04             	mov    0x4(%eax),%eax
c0104906:	8b 00                	mov    (%eax),%eax
c0104908:	83 e0 01             	and    $0x1,%eax
c010490b:	85 c0                	test   %eax,%eax
c010490d:	74 3d                	je     c010494c <__rb_erase_color+0x115>
c010490f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104912:	8b 40 08             	mov    0x8(%eax),%eax
c0104915:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104918:	8b 52 08             	mov    0x8(%edx),%edx
c010491b:	8b 12                	mov    (%edx),%edx
c010491d:	83 ca 01             	or     $0x1,%edx
c0104920:	89 10                	mov    %edx,(%eax)
c0104922:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104925:	8b 00                	mov    (%eax),%eax
c0104927:	83 e0 fe             	and    $0xfffffffe,%eax
c010492a:	89 c2                	mov    %eax,%edx
c010492c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010492f:	89 10                	mov    %edx,(%eax)
c0104931:	8b 45 10             	mov    0x10(%ebp),%eax
c0104934:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104938:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010493b:	89 04 24             	mov    %eax,(%esp)
c010493e:	e8 b9 fc ff ff       	call   c01045fc <__rb_rotate_right>
c0104943:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104946:	8b 40 04             	mov    0x4(%eax),%eax
c0104949:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010494c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010494f:	8b 00                	mov    (%eax),%eax
c0104951:	83 e0 01             	and    $0x1,%eax
c0104954:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104958:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010495b:	89 04 24             	mov    %eax,(%esp)
c010495e:	e8 dd fb ff ff       	call   c0104540 <rb_set_color>
c0104963:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104966:	8b 00                	mov    (%eax),%eax
c0104968:	83 c8 01             	or     $0x1,%eax
c010496b:	89 c2                	mov    %eax,%edx
c010496d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104970:	89 10                	mov    %edx,(%eax)
c0104972:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104975:	8b 40 04             	mov    0x4(%eax),%eax
c0104978:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010497b:	8b 52 04             	mov    0x4(%edx),%edx
c010497e:	8b 12                	mov    (%edx),%edx
c0104980:	83 ca 01             	or     $0x1,%edx
c0104983:	89 10                	mov    %edx,(%eax)
c0104985:	8b 45 10             	mov    0x10(%ebp),%eax
c0104988:	89 44 24 04          	mov    %eax,0x4(%esp)
c010498c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010498f:	89 04 24             	mov    %eax,(%esp)
c0104992:	e8 c2 fb ff ff       	call   c0104559 <__rb_rotate_left>
c0104997:	8b 45 10             	mov    0x10(%ebp),%eax
c010499a:	8b 00                	mov    (%eax),%eax
c010499c:	89 45 08             	mov    %eax,0x8(%ebp)
c010499f:	e9 70 01 00 00       	jmp    c0104b14 <__rb_erase_color+0x2dd>
c01049a4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049a7:	8b 40 08             	mov    0x8(%eax),%eax
c01049aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01049ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01049b0:	8b 00                	mov    (%eax),%eax
c01049b2:	83 e0 01             	and    $0x1,%eax
c01049b5:	85 c0                	test   %eax,%eax
c01049b7:	75 39                	jne    c01049f2 <__rb_erase_color+0x1bb>
c01049b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01049bc:	8b 00                	mov    (%eax),%eax
c01049be:	83 c8 01             	or     $0x1,%eax
c01049c1:	89 c2                	mov    %eax,%edx
c01049c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01049c6:	89 10                	mov    %edx,(%eax)
c01049c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049cb:	8b 00                	mov    (%eax),%eax
c01049cd:	83 e0 fe             	and    $0xfffffffe,%eax
c01049d0:	89 c2                	mov    %eax,%edx
c01049d2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049d5:	89 10                	mov    %edx,(%eax)
c01049d7:	8b 45 10             	mov    0x10(%ebp),%eax
c01049da:	89 44 24 04          	mov    %eax,0x4(%esp)
c01049de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049e1:	89 04 24             	mov    %eax,(%esp)
c01049e4:	e8 13 fc ff ff       	call   c01045fc <__rb_rotate_right>
c01049e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049ec:	8b 40 08             	mov    0x8(%eax),%eax
c01049ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01049f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01049f5:	8b 40 08             	mov    0x8(%eax),%eax
c01049f8:	85 c0                	test   %eax,%eax
c01049fa:	74 0f                	je     c0104a0b <__rb_erase_color+0x1d4>
c01049fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01049ff:	8b 40 08             	mov    0x8(%eax),%eax
c0104a02:	8b 00                	mov    (%eax),%eax
c0104a04:	83 e0 01             	and    $0x1,%eax
c0104a07:	85 c0                	test   %eax,%eax
c0104a09:	74 3e                	je     c0104a49 <__rb_erase_color+0x212>
c0104a0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a0e:	8b 40 04             	mov    0x4(%eax),%eax
c0104a11:	85 c0                	test   %eax,%eax
c0104a13:	74 0f                	je     c0104a24 <__rb_erase_color+0x1ed>
c0104a15:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a18:	8b 40 04             	mov    0x4(%eax),%eax
c0104a1b:	8b 00                	mov    (%eax),%eax
c0104a1d:	83 e0 01             	and    $0x1,%eax
c0104a20:	85 c0                	test   %eax,%eax
c0104a22:	74 25                	je     c0104a49 <__rb_erase_color+0x212>
c0104a24:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a27:	8b 00                	mov    (%eax),%eax
c0104a29:	83 e0 fe             	and    $0xfffffffe,%eax
c0104a2c:	89 c2                	mov    %eax,%edx
c0104a2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a31:	89 10                	mov    %edx,(%eax)
c0104a33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a36:	89 45 08             	mov    %eax,0x8(%ebp)
c0104a39:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a3c:	8b 00                	mov    (%eax),%eax
c0104a3e:	83 e0 fc             	and    $0xfffffffc,%eax
c0104a41:	89 45 0c             	mov    %eax,0xc(%ebp)
c0104a44:	e9 ab 00 00 00       	jmp    c0104af4 <__rb_erase_color+0x2bd>
c0104a49:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a4c:	8b 40 08             	mov    0x8(%eax),%eax
c0104a4f:	85 c0                	test   %eax,%eax
c0104a51:	74 0f                	je     c0104a62 <__rb_erase_color+0x22b>
c0104a53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a56:	8b 40 08             	mov    0x8(%eax),%eax
c0104a59:	8b 00                	mov    (%eax),%eax
c0104a5b:	83 e0 01             	and    $0x1,%eax
c0104a5e:	85 c0                	test   %eax,%eax
c0104a60:	74 3d                	je     c0104a9f <__rb_erase_color+0x268>
c0104a62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a65:	8b 40 04             	mov    0x4(%eax),%eax
c0104a68:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104a6b:	8b 52 04             	mov    0x4(%edx),%edx
c0104a6e:	8b 12                	mov    (%edx),%edx
c0104a70:	83 ca 01             	or     $0x1,%edx
c0104a73:	89 10                	mov    %edx,(%eax)
c0104a75:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a78:	8b 00                	mov    (%eax),%eax
c0104a7a:	83 e0 fe             	and    $0xfffffffe,%eax
c0104a7d:	89 c2                	mov    %eax,%edx
c0104a7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a82:	89 10                	mov    %edx,(%eax)
c0104a84:	8b 45 10             	mov    0x10(%ebp),%eax
c0104a87:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104a8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104a8e:	89 04 24             	mov    %eax,(%esp)
c0104a91:	e8 c3 fa ff ff       	call   c0104559 <__rb_rotate_left>
c0104a96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a99:	8b 40 08             	mov    0x8(%eax),%eax
c0104a9c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104a9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104aa2:	8b 00                	mov    (%eax),%eax
c0104aa4:	83 e0 01             	and    $0x1,%eax
c0104aa7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104aab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104aae:	89 04 24             	mov    %eax,(%esp)
c0104ab1:	e8 8a fa ff ff       	call   c0104540 <rb_set_color>
c0104ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ab9:	8b 00                	mov    (%eax),%eax
c0104abb:	83 c8 01             	or     $0x1,%eax
c0104abe:	89 c2                	mov    %eax,%edx
c0104ac0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ac3:	89 10                	mov    %edx,(%eax)
c0104ac5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104ac8:	8b 40 08             	mov    0x8(%eax),%eax
c0104acb:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104ace:	8b 52 08             	mov    0x8(%edx),%edx
c0104ad1:	8b 12                	mov    (%edx),%edx
c0104ad3:	83 ca 01             	or     $0x1,%edx
c0104ad6:	89 10                	mov    %edx,(%eax)
c0104ad8:	8b 45 10             	mov    0x10(%ebp),%eax
c0104adb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104adf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ae2:	89 04 24             	mov    %eax,(%esp)
c0104ae5:	e8 12 fb ff ff       	call   c01045fc <__rb_rotate_right>
c0104aea:	8b 45 10             	mov    0x10(%ebp),%eax
c0104aed:	8b 00                	mov    (%eax),%eax
c0104aef:	89 45 08             	mov    %eax,0x8(%ebp)
c0104af2:	eb 20                	jmp    c0104b14 <__rb_erase_color+0x2dd>
c0104af4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0104af8:	74 0c                	je     c0104b06 <__rb_erase_color+0x2cf>
c0104afa:	8b 45 08             	mov    0x8(%ebp),%eax
c0104afd:	8b 00                	mov    (%eax),%eax
c0104aff:	83 e0 01             	and    $0x1,%eax
c0104b02:	85 c0                	test   %eax,%eax
c0104b04:	74 0e                	je     c0104b14 <__rb_erase_color+0x2dd>
c0104b06:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b09:	8b 00                	mov    (%eax),%eax
c0104b0b:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104b0e:	0f 85 2e fd ff ff    	jne    c0104842 <__rb_erase_color+0xb>
c0104b14:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0104b18:	74 0f                	je     c0104b29 <__rb_erase_color+0x2f2>
c0104b1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b1d:	8b 00                	mov    (%eax),%eax
c0104b1f:	83 c8 01             	or     $0x1,%eax
c0104b22:	89 c2                	mov    %eax,%edx
c0104b24:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b27:	89 10                	mov    %edx,(%eax)
c0104b29:	c9                   	leave  
c0104b2a:	c3                   	ret    

c0104b2b <rb_erase>:
c0104b2b:	55                   	push   %ebp
c0104b2c:	89 e5                	mov    %esp,%ebp
c0104b2e:	83 ec 2c             	sub    $0x2c,%esp
c0104b31:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b34:	8b 40 08             	mov    0x8(%eax),%eax
c0104b37:	85 c0                	test   %eax,%eax
c0104b39:	75 0e                	jne    c0104b49 <rb_erase+0x1e>
c0104b3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b3e:	8b 40 04             	mov    0x4(%eax),%eax
c0104b41:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104b44:	e9 20 01 00 00       	jmp    c0104c69 <rb_erase+0x13e>
c0104b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b4c:	8b 40 04             	mov    0x4(%eax),%eax
c0104b4f:	85 c0                	test   %eax,%eax
c0104b51:	75 0e                	jne    c0104b61 <rb_erase+0x36>
c0104b53:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b56:	8b 40 08             	mov    0x8(%eax),%eax
c0104b59:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104b5c:	e9 08 01 00 00       	jmp    c0104c69 <rb_erase+0x13e>
c0104b61:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b64:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b67:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b6a:	8b 40 04             	mov    0x4(%eax),%eax
c0104b6d:	89 45 08             	mov    %eax,0x8(%ebp)
c0104b70:	eb 06                	jmp    c0104b78 <rb_erase+0x4d>
c0104b72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b75:	89 45 08             	mov    %eax,0x8(%ebp)
c0104b78:	8b 45 08             	mov    0x8(%ebp),%eax
c0104b7b:	8b 40 08             	mov    0x8(%eax),%eax
c0104b7e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104b81:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104b85:	75 eb                	jne    c0104b72 <rb_erase+0x47>
c0104b87:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b8a:	8b 00                	mov    (%eax),%eax
c0104b8c:	83 e0 fc             	and    $0xfffffffc,%eax
c0104b8f:	85 c0                	test   %eax,%eax
c0104b91:	74 30                	je     c0104bc3 <rb_erase+0x98>
c0104b93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b96:	8b 00                	mov    (%eax),%eax
c0104b98:	83 e0 fc             	and    $0xfffffffc,%eax
c0104b9b:	8b 40 08             	mov    0x8(%eax),%eax
c0104b9e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0104ba1:	75 10                	jne    c0104bb3 <rb_erase+0x88>
c0104ba3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ba6:	8b 00                	mov    (%eax),%eax
c0104ba8:	83 e0 fc             	and    $0xfffffffc,%eax
c0104bab:	8b 55 08             	mov    0x8(%ebp),%edx
c0104bae:	89 50 08             	mov    %edx,0x8(%eax)
c0104bb1:	eb 18                	jmp    c0104bcb <rb_erase+0xa0>
c0104bb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104bb6:	8b 00                	mov    (%eax),%eax
c0104bb8:	83 e0 fc             	and    $0xfffffffc,%eax
c0104bbb:	8b 55 08             	mov    0x8(%ebp),%edx
c0104bbe:	89 50 04             	mov    %edx,0x4(%eax)
c0104bc1:	eb 08                	jmp    c0104bcb <rb_erase+0xa0>
c0104bc3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104bc6:	8b 55 08             	mov    0x8(%ebp),%edx
c0104bc9:	89 10                	mov    %edx,(%eax)
c0104bcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0104bce:	8b 40 04             	mov    0x4(%eax),%eax
c0104bd1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104bd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0104bd7:	8b 00                	mov    (%eax),%eax
c0104bd9:	83 e0 fc             	and    $0xfffffffc,%eax
c0104bdc:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0104bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0104be2:	8b 00                	mov    (%eax),%eax
c0104be4:	83 e0 01             	and    $0x1,%eax
c0104be7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104bea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104bed:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0104bf0:	75 08                	jne    c0104bfa <rb_erase+0xcf>
c0104bf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104bf5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0104bf8:	eb 42                	jmp    c0104c3c <rb_erase+0x111>
c0104bfa:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104bfe:	74 12                	je     c0104c12 <rb_erase+0xe7>
c0104c00:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104c03:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c07:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104c0a:	89 04 24             	mov    %eax,(%esp)
c0104c0d:	e8 15 f9 ff ff       	call   c0104527 <rb_set_parent>
c0104c12:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104c15:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104c18:	89 50 08             	mov    %edx,0x8(%eax)
c0104c1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c1e:	8b 50 04             	mov    0x4(%eax),%edx
c0104c21:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c24:	89 50 04             	mov    %edx,0x4(%eax)
c0104c27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c2a:	8b 40 04             	mov    0x4(%eax),%eax
c0104c2d:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c30:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104c34:	89 04 24             	mov    %eax,(%esp)
c0104c37:	e8 eb f8 ff ff       	call   c0104527 <rb_set_parent>
c0104c3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c3f:	8b 10                	mov    (%eax),%edx
c0104c41:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c44:	89 10                	mov    %edx,(%eax)
c0104c46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c49:	8b 50 08             	mov    0x8(%eax),%edx
c0104c4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c4f:	89 50 08             	mov    %edx,0x8(%eax)
c0104c52:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c55:	8b 40 08             	mov    0x8(%eax),%eax
c0104c58:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c5b:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104c5f:	89 04 24             	mov    %eax,(%esp)
c0104c62:	e8 c0 f8 ff ff       	call   c0104527 <rb_set_parent>
c0104c67:	eb 5d                	jmp    c0104cc6 <rb_erase+0x19b>
c0104c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c6c:	8b 00                	mov    (%eax),%eax
c0104c6e:	83 e0 fc             	and    $0xfffffffc,%eax
c0104c71:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0104c74:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c77:	8b 00                	mov    (%eax),%eax
c0104c79:	83 e0 01             	and    $0x1,%eax
c0104c7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c7f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104c83:	74 12                	je     c0104c97 <rb_erase+0x16c>
c0104c85:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104c88:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104c8f:	89 04 24             	mov    %eax,(%esp)
c0104c92:	e8 90 f8 ff ff       	call   c0104527 <rb_set_parent>
c0104c97:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c0104c9b:	74 21                	je     c0104cbe <rb_erase+0x193>
c0104c9d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104ca0:	8b 40 08             	mov    0x8(%eax),%eax
c0104ca3:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104ca6:	75 0b                	jne    c0104cb3 <rb_erase+0x188>
c0104ca8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104cab:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104cae:	89 50 08             	mov    %edx,0x8(%eax)
c0104cb1:	eb 13                	jmp    c0104cc6 <rb_erase+0x19b>
c0104cb3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104cb6:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104cb9:	89 50 04             	mov    %edx,0x4(%eax)
c0104cbc:	eb 08                	jmp    c0104cc6 <rb_erase+0x19b>
c0104cbe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104cc1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0104cc4:	89 10                	mov    %edx,(%eax)
c0104cc6:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0104cca:	75 19                	jne    c0104ce5 <rb_erase+0x1ba>
c0104ccc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ccf:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104cd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0104cd6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104cda:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104cdd:	89 04 24             	mov    %eax,(%esp)
c0104ce0:	e8 52 fb ff ff       	call   c0104837 <__rb_erase_color>
c0104ce5:	c9                   	leave  
c0104ce6:	c3                   	ret    

c0104ce7 <rb_augment_path>:
c0104ce7:	55                   	push   %ebp
c0104ce8:	89 e5                	mov    %esp,%ebp
c0104cea:	83 ec 28             	sub    $0x28,%esp
c0104ced:	8b 45 10             	mov    0x10(%ebp),%eax
c0104cf0:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104cf4:	8b 45 08             	mov    0x8(%ebp),%eax
c0104cf7:	89 04 24             	mov    %eax,(%esp)
c0104cfa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104cfd:	ff d0                	call   *%eax
c0104cff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d02:	8b 00                	mov    (%eax),%eax
c0104d04:	83 e0 fc             	and    $0xfffffffc,%eax
c0104d07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104d0a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104d0e:	75 02                	jne    c0104d12 <rb_augment_path+0x2b>
c0104d10:	eb 53                	jmp    c0104d65 <rb_augment_path+0x7e>
c0104d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d15:	8b 40 08             	mov    0x8(%eax),%eax
c0104d18:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104d1b:	75 21                	jne    c0104d3e <rb_augment_path+0x57>
c0104d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d20:	8b 40 04             	mov    0x4(%eax),%eax
c0104d23:	85 c0                	test   %eax,%eax
c0104d25:	74 17                	je     c0104d3e <rb_augment_path+0x57>
c0104d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d2a:	8b 40 04             	mov    0x4(%eax),%eax
c0104d2d:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d30:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104d34:	89 04 24             	mov    %eax,(%esp)
c0104d37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104d3a:	ff d0                	call   *%eax
c0104d3c:	eb 1f                	jmp    c0104d5d <rb_augment_path+0x76>
c0104d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d41:	8b 40 08             	mov    0x8(%eax),%eax
c0104d44:	85 c0                	test   %eax,%eax
c0104d46:	74 15                	je     c0104d5d <rb_augment_path+0x76>
c0104d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d4b:	8b 40 08             	mov    0x8(%eax),%eax
c0104d4e:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d51:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104d55:	89 04 24             	mov    %eax,(%esp)
c0104d58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104d5b:	ff d0                	call   *%eax
c0104d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d60:	89 45 08             	mov    %eax,0x8(%ebp)
c0104d63:	eb 88                	jmp    c0104ced <rb_augment_path+0x6>
c0104d65:	c9                   	leave  
c0104d66:	c3                   	ret    

c0104d67 <rb_augment_insert>:
c0104d67:	55                   	push   %ebp
c0104d68:	89 e5                	mov    %esp,%ebp
c0104d6a:	83 ec 18             	sub    $0x18,%esp
c0104d6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d70:	8b 40 08             	mov    0x8(%eax),%eax
c0104d73:	85 c0                	test   %eax,%eax
c0104d75:	74 0b                	je     c0104d82 <rb_augment_insert+0x1b>
c0104d77:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d7a:	8b 40 08             	mov    0x8(%eax),%eax
c0104d7d:	89 45 08             	mov    %eax,0x8(%ebp)
c0104d80:	eb 13                	jmp    c0104d95 <rb_augment_insert+0x2e>
c0104d82:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d85:	8b 40 04             	mov    0x4(%eax),%eax
c0104d88:	85 c0                	test   %eax,%eax
c0104d8a:	74 09                	je     c0104d95 <rb_augment_insert+0x2e>
c0104d8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d8f:	8b 40 04             	mov    0x4(%eax),%eax
c0104d92:	89 45 08             	mov    %eax,0x8(%ebp)
c0104d95:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d98:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104d9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104d9f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104da3:	8b 45 08             	mov    0x8(%ebp),%eax
c0104da6:	89 04 24             	mov    %eax,(%esp)
c0104da9:	e8 39 ff ff ff       	call   c0104ce7 <rb_augment_path>
c0104dae:	c9                   	leave  
c0104daf:	c3                   	ret    

c0104db0 <rb_augment_erase_begin>:
c0104db0:	55                   	push   %ebp
c0104db1:	89 e5                	mov    %esp,%ebp
c0104db3:	83 ec 28             	sub    $0x28,%esp
c0104db6:	8b 45 08             	mov    0x8(%ebp),%eax
c0104db9:	8b 40 04             	mov    0x4(%eax),%eax
c0104dbc:	85 c0                	test   %eax,%eax
c0104dbe:	75 17                	jne    c0104dd7 <rb_augment_erase_begin+0x27>
c0104dc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0104dc3:	8b 40 08             	mov    0x8(%eax),%eax
c0104dc6:	85 c0                	test   %eax,%eax
c0104dc8:	75 0d                	jne    c0104dd7 <rb_augment_erase_begin+0x27>
c0104dca:	8b 45 08             	mov    0x8(%ebp),%eax
c0104dcd:	8b 00                	mov    (%eax),%eax
c0104dcf:	83 e0 fc             	and    $0xfffffffc,%eax
c0104dd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104dd5:	eb 65                	jmp    c0104e3c <rb_augment_erase_begin+0x8c>
c0104dd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104dda:	8b 40 04             	mov    0x4(%eax),%eax
c0104ddd:	85 c0                	test   %eax,%eax
c0104ddf:	75 0b                	jne    c0104dec <rb_augment_erase_begin+0x3c>
c0104de1:	8b 45 08             	mov    0x8(%ebp),%eax
c0104de4:	8b 40 08             	mov    0x8(%eax),%eax
c0104de7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104dea:	eb 50                	jmp    c0104e3c <rb_augment_erase_begin+0x8c>
c0104dec:	8b 45 08             	mov    0x8(%ebp),%eax
c0104def:	8b 40 08             	mov    0x8(%eax),%eax
c0104df2:	85 c0                	test   %eax,%eax
c0104df4:	75 0b                	jne    c0104e01 <rb_augment_erase_begin+0x51>
c0104df6:	8b 45 08             	mov    0x8(%ebp),%eax
c0104df9:	8b 40 04             	mov    0x4(%eax),%eax
c0104dfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104dff:	eb 3b                	jmp    c0104e3c <rb_augment_erase_begin+0x8c>
c0104e01:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e04:	89 04 24             	mov    %eax,(%esp)
c0104e07:	e8 c6 00 00 00       	call   c0104ed2 <rb_next>
c0104e0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e12:	8b 40 04             	mov    0x4(%eax),%eax
c0104e15:	85 c0                	test   %eax,%eax
c0104e17:	74 0b                	je     c0104e24 <rb_augment_erase_begin+0x74>
c0104e19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e1c:	8b 40 04             	mov    0x4(%eax),%eax
c0104e1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e22:	eb 18                	jmp    c0104e3c <rb_augment_erase_begin+0x8c>
c0104e24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e27:	8b 00                	mov    (%eax),%eax
c0104e29:	83 e0 fc             	and    $0xfffffffc,%eax
c0104e2c:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104e2f:	74 0b                	je     c0104e3c <rb_augment_erase_begin+0x8c>
c0104e31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e34:	8b 00                	mov    (%eax),%eax
c0104e36:	83 e0 fc             	and    $0xfffffffc,%eax
c0104e39:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e3f:	c9                   	leave  
c0104e40:	c3                   	ret    

c0104e41 <rb_augment_erase_end>:
c0104e41:	55                   	push   %ebp
c0104e42:	89 e5                	mov    %esp,%ebp
c0104e44:	83 ec 18             	sub    $0x18,%esp
c0104e47:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0104e4b:	74 19                	je     c0104e66 <rb_augment_erase_end+0x25>
c0104e4d:	8b 45 10             	mov    0x10(%ebp),%eax
c0104e50:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104e54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104e57:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104e5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e5e:	89 04 24             	mov    %eax,(%esp)
c0104e61:	e8 81 fe ff ff       	call   c0104ce7 <rb_augment_path>
c0104e66:	c9                   	leave  
c0104e67:	c3                   	ret    

c0104e68 <rb_first>:
c0104e68:	55                   	push   %ebp
c0104e69:	89 e5                	mov    %esp,%ebp
c0104e6b:	83 ec 10             	sub    $0x10,%esp
c0104e6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e71:	8b 00                	mov    (%eax),%eax
c0104e73:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104e76:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104e7a:	75 07                	jne    c0104e83 <rb_first+0x1b>
c0104e7c:	b8 00 00 00 00       	mov    $0x0,%eax
c0104e81:	eb 18                	jmp    c0104e9b <rb_first+0x33>
c0104e83:	eb 09                	jmp    c0104e8e <rb_first+0x26>
c0104e85:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104e88:	8b 40 08             	mov    0x8(%eax),%eax
c0104e8b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104e8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104e91:	8b 40 08             	mov    0x8(%eax),%eax
c0104e94:	85 c0                	test   %eax,%eax
c0104e96:	75 ed                	jne    c0104e85 <rb_first+0x1d>
c0104e98:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104e9b:	c9                   	leave  
c0104e9c:	c3                   	ret    

c0104e9d <rb_last>:
c0104e9d:	55                   	push   %ebp
c0104e9e:	89 e5                	mov    %esp,%ebp
c0104ea0:	83 ec 10             	sub    $0x10,%esp
c0104ea3:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ea6:	8b 00                	mov    (%eax),%eax
c0104ea8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104eab:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104eaf:	75 07                	jne    c0104eb8 <rb_last+0x1b>
c0104eb1:	b8 00 00 00 00       	mov    $0x0,%eax
c0104eb6:	eb 18                	jmp    c0104ed0 <rb_last+0x33>
c0104eb8:	eb 09                	jmp    c0104ec3 <rb_last+0x26>
c0104eba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104ebd:	8b 40 04             	mov    0x4(%eax),%eax
c0104ec0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104ec3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104ec6:	8b 40 04             	mov    0x4(%eax),%eax
c0104ec9:	85 c0                	test   %eax,%eax
c0104ecb:	75 ed                	jne    c0104eba <rb_last+0x1d>
c0104ecd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104ed0:	c9                   	leave  
c0104ed1:	c3                   	ret    

c0104ed2 <rb_next>:
c0104ed2:	55                   	push   %ebp
c0104ed3:	89 e5                	mov    %esp,%ebp
c0104ed5:	83 ec 10             	sub    $0x10,%esp
c0104ed8:	8b 45 08             	mov    0x8(%ebp),%eax
c0104edb:	8b 00                	mov    (%eax),%eax
c0104edd:	83 e0 fc             	and    $0xfffffffc,%eax
c0104ee0:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104ee3:	75 07                	jne    c0104eec <rb_next+0x1a>
c0104ee5:	b8 00 00 00 00       	mov    $0x0,%eax
c0104eea:	eb 54                	jmp    c0104f40 <rb_next+0x6e>
c0104eec:	8b 45 08             	mov    0x8(%ebp),%eax
c0104eef:	8b 40 04             	mov    0x4(%eax),%eax
c0104ef2:	85 c0                	test   %eax,%eax
c0104ef4:	74 23                	je     c0104f19 <rb_next+0x47>
c0104ef6:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ef9:	8b 40 04             	mov    0x4(%eax),%eax
c0104efc:	89 45 08             	mov    %eax,0x8(%ebp)
c0104eff:	eb 09                	jmp    c0104f0a <rb_next+0x38>
c0104f01:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f04:	8b 40 08             	mov    0x8(%eax),%eax
c0104f07:	89 45 08             	mov    %eax,0x8(%ebp)
c0104f0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f0d:	8b 40 08             	mov    0x8(%eax),%eax
c0104f10:	85 c0                	test   %eax,%eax
c0104f12:	75 ed                	jne    c0104f01 <rb_next+0x2f>
c0104f14:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f17:	eb 27                	jmp    c0104f40 <rb_next+0x6e>
c0104f19:	eb 06                	jmp    c0104f21 <rb_next+0x4f>
c0104f1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104f1e:	89 45 08             	mov    %eax,0x8(%ebp)
c0104f21:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f24:	8b 00                	mov    (%eax),%eax
c0104f26:	83 e0 fc             	and    $0xfffffffc,%eax
c0104f29:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104f2c:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104f30:	74 0b                	je     c0104f3d <rb_next+0x6b>
c0104f32:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104f35:	8b 40 04             	mov    0x4(%eax),%eax
c0104f38:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104f3b:	74 de                	je     c0104f1b <rb_next+0x49>
c0104f3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104f40:	c9                   	leave  
c0104f41:	c3                   	ret    

c0104f42 <rb_prev>:
c0104f42:	55                   	push   %ebp
c0104f43:	89 e5                	mov    %esp,%ebp
c0104f45:	83 ec 10             	sub    $0x10,%esp
c0104f48:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f4b:	8b 00                	mov    (%eax),%eax
c0104f4d:	83 e0 fc             	and    $0xfffffffc,%eax
c0104f50:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104f53:	75 07                	jne    c0104f5c <rb_prev+0x1a>
c0104f55:	b8 00 00 00 00       	mov    $0x0,%eax
c0104f5a:	eb 54                	jmp    c0104fb0 <rb_prev+0x6e>
c0104f5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f5f:	8b 40 08             	mov    0x8(%eax),%eax
c0104f62:	85 c0                	test   %eax,%eax
c0104f64:	74 23                	je     c0104f89 <rb_prev+0x47>
c0104f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f69:	8b 40 08             	mov    0x8(%eax),%eax
c0104f6c:	89 45 08             	mov    %eax,0x8(%ebp)
c0104f6f:	eb 09                	jmp    c0104f7a <rb_prev+0x38>
c0104f71:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f74:	8b 40 04             	mov    0x4(%eax),%eax
c0104f77:	89 45 08             	mov    %eax,0x8(%ebp)
c0104f7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f7d:	8b 40 04             	mov    0x4(%eax),%eax
c0104f80:	85 c0                	test   %eax,%eax
c0104f82:	75 ed                	jne    c0104f71 <rb_prev+0x2f>
c0104f84:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f87:	eb 27                	jmp    c0104fb0 <rb_prev+0x6e>
c0104f89:	eb 06                	jmp    c0104f91 <rb_prev+0x4f>
c0104f8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104f8e:	89 45 08             	mov    %eax,0x8(%ebp)
c0104f91:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f94:	8b 00                	mov    (%eax),%eax
c0104f96:	83 e0 fc             	and    $0xfffffffc,%eax
c0104f99:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104f9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104fa0:	74 0b                	je     c0104fad <rb_prev+0x6b>
c0104fa2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104fa5:	8b 40 08             	mov    0x8(%eax),%eax
c0104fa8:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104fab:	74 de                	je     c0104f8b <rb_prev+0x49>
c0104fad:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104fb0:	c9                   	leave  
c0104fb1:	c3                   	ret    

c0104fb2 <rb_replace_node>:
c0104fb2:	55                   	push   %ebp
c0104fb3:	89 e5                	mov    %esp,%ebp
c0104fb5:	83 ec 18             	sub    $0x18,%esp
c0104fb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0104fbb:	8b 00                	mov    (%eax),%eax
c0104fbd:	83 e0 fc             	and    $0xfffffffc,%eax
c0104fc0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104fc3:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0104fc7:	74 21                	je     c0104fea <rb_replace_node+0x38>
c0104fc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104fcc:	8b 40 08             	mov    0x8(%eax),%eax
c0104fcf:	3b 45 08             	cmp    0x8(%ebp),%eax
c0104fd2:	75 0b                	jne    c0104fdf <rb_replace_node+0x2d>
c0104fd4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104fd7:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104fda:	89 50 08             	mov    %edx,0x8(%eax)
c0104fdd:	eb 13                	jmp    c0104ff2 <rb_replace_node+0x40>
c0104fdf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104fe2:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104fe5:	89 50 04             	mov    %edx,0x4(%eax)
c0104fe8:	eb 08                	jmp    c0104ff2 <rb_replace_node+0x40>
c0104fea:	8b 45 10             	mov    0x10(%ebp),%eax
c0104fed:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104ff0:	89 10                	mov    %edx,(%eax)
c0104ff2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ff5:	8b 40 08             	mov    0x8(%eax),%eax
c0104ff8:	85 c0                	test   %eax,%eax
c0104ffa:	74 15                	je     c0105011 <rb_replace_node+0x5f>
c0104ffc:	8b 45 08             	mov    0x8(%ebp),%eax
c0104fff:	8b 40 08             	mov    0x8(%eax),%eax
c0105002:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105005:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105009:	89 04 24             	mov    %eax,(%esp)
c010500c:	e8 16 f5 ff ff       	call   c0104527 <rb_set_parent>
c0105011:	8b 45 08             	mov    0x8(%ebp),%eax
c0105014:	8b 40 04             	mov    0x4(%eax),%eax
c0105017:	85 c0                	test   %eax,%eax
c0105019:	74 15                	je     c0105030 <rb_replace_node+0x7e>
c010501b:	8b 45 08             	mov    0x8(%ebp),%eax
c010501e:	8b 40 04             	mov    0x4(%eax),%eax
c0105021:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105024:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105028:	89 04 24             	mov    %eax,(%esp)
c010502b:	e8 f7 f4 ff ff       	call   c0104527 <rb_set_parent>
c0105030:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105033:	8b 55 08             	mov    0x8(%ebp),%edx
c0105036:	8b 0a                	mov    (%edx),%ecx
c0105038:	89 08                	mov    %ecx,(%eax)
c010503a:	8b 4a 04             	mov    0x4(%edx),%ecx
c010503d:	89 48 04             	mov    %ecx,0x4(%eax)
c0105040:	8b 52 08             	mov    0x8(%edx),%edx
c0105043:	89 50 08             	mov    %edx,0x8(%eax)
c0105046:	c9                   	leave  
c0105047:	c3                   	ret    

c0105048 <inb>:
c0105048:	55                   	push   %ebp
c0105049:	89 e5                	mov    %esp,%ebp
c010504b:	83 ec 14             	sub    $0x14,%esp
c010504e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105051:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c0105055:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0105059:	89 c2                	mov    %eax,%edx
c010505b:	ec                   	in     (%dx),%al
c010505c:	88 45 ff             	mov    %al,-0x1(%ebp)
c010505f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105063:	c9                   	leave  
c0105064:	c3                   	ret    

c0105065 <kb_init>:
c0105065:	55                   	push   %ebp
c0105066:	89 e5                	mov    %esp,%ebp
c0105068:	83 ec 18             	sub    $0x18,%esp
c010506b:	c7 05 e4 b0 10 c0 80 	movl   $0xc0109080,0xc010b0e4
c0105072:	90 10 c0 
c0105075:	c7 05 e0 b0 10 c0 01 	movl   $0x1,0xc010b0e0
c010507c:	00 00 00 
c010507f:	c7 44 24 04 45 51 10 	movl   $0xc0105145,0x4(%esp)
c0105086:	c0 
c0105087:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
c010508e:	e8 3a 28 00 00       	call   c01078cd <register_interrupt_handler>
c0105093:	b8 00 00 00 00       	mov    $0x0,%eax
c0105098:	c9                   	leave  
c0105099:	c3                   	ret    

c010509a <kb_device_valid>:
c010509a:	55                   	push   %ebp
c010509b:	89 e5                	mov    %esp,%ebp
c010509d:	a1 e0 b0 10 c0       	mov    0xc010b0e0,%eax
c01050a2:	5d                   	pop    %ebp
c01050a3:	c3                   	ret    

c01050a4 <kb_get_desc>:
c01050a4:	55                   	push   %ebp
c01050a5:	89 e5                	mov    %esp,%ebp
c01050a7:	b8 2b 9e 10 c0       	mov    $0xc0109e2b,%eax
c01050ac:	5d                   	pop    %ebp
c01050ad:	c3                   	ret    

c01050ae <kb_getchar>:
c01050ae:	55                   	push   %ebp
c01050af:	89 e5                	mov    %esp,%ebp
c01050b1:	83 ec 10             	sub    $0x10,%esp
c01050b4:	8b 15 e8 b4 10 c0    	mov    0xc010b4e8,%edx
c01050ba:	a1 ec b4 10 c0       	mov    0xc010b4ec,%eax
c01050bf:	39 c2                	cmp    %eax,%edx
c01050c1:	74 27                	je     c01050ea <kb_getchar+0x3c>
c01050c3:	a1 e8 b4 10 c0       	mov    0xc010b4e8,%eax
c01050c8:	0f b6 80 e8 b0 10 c0 	movzbl -0x3fef4f18(%eax),%eax
c01050cf:	88 45 ff             	mov    %al,-0x1(%ebp)
c01050d2:	a1 e8 b4 10 c0       	mov    0xc010b4e8,%eax
c01050d7:	83 c0 01             	add    $0x1,%eax
c01050da:	25 ff 03 00 00       	and    $0x3ff,%eax
c01050df:	a3 e8 b4 10 c0       	mov    %eax,0xc010b4e8
c01050e4:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c01050e8:	eb 05                	jmp    c01050ef <kb_getchar+0x41>
c01050ea:	b8 00 00 00 00       	mov    $0x0,%eax
c01050ef:	c9                   	leave  
c01050f0:	c3                   	ret    

c01050f1 <kb_read>:
c01050f1:	55                   	push   %ebp
c01050f2:	89 e5                	mov    %esp,%ebp
c01050f4:	83 ec 10             	sub    $0x10,%esp
c01050f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01050fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01050fd:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0105101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105108:	eb 24                	jmp    c010512e <kb_read+0x3d>
c010510a:	e8 9f ff ff ff       	call   c01050ae <kb_getchar>
c010510f:	88 45 f7             	mov    %al,-0x9(%ebp)
c0105112:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
c0105116:	74 14                	je     c010512c <kb_read+0x3b>
c0105118:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010511b:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010511e:	01 c2                	add    %eax,%edx
c0105120:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0105124:	88 02                	mov    %al,(%edx)
c0105126:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010512a:	eb 02                	jmp    c010512e <kb_read+0x3d>
c010512c:	eb 08                	jmp    c0105136 <kb_read+0x45>
c010512e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105131:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0105134:	72 d4                	jb     c010510a <kb_read+0x19>
c0105136:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105139:	c9                   	leave  
c010513a:	c3                   	ret    

c010513b <kb_write>:
c010513b:	55                   	push   %ebp
c010513c:	89 e5                	mov    %esp,%ebp
c010513e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105143:	5d                   	pop    %ebp
c0105144:	c3                   	ret    

c0105145 <keyboard_handler>:
c0105145:	55                   	push   %ebp
c0105146:	89 e5                	mov    %esp,%ebp
c0105148:	53                   	push   %ebx
c0105149:	83 ec 24             	sub    $0x24,%esp
c010514c:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
c0105153:	e8 f0 fe ff ff       	call   c0105048 <inb>
c0105158:	88 45 ef             	mov    %al,-0x11(%ebp)
c010515b:	a1 e4 b0 10 c0       	mov    0xc010b0e4,%eax
c0105160:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105163:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0105167:	84 c0                	test   %al,%al
c0105169:	79 64                	jns    c01051cf <keyboard_handler+0x8a>
c010516b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105172:	eb 50                	jmp    c01051c4 <keyboard_handler+0x7f>
c0105174:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0105177:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010517a:	01 d0                	add    %edx,%eax
c010517c:	05 80 01 00 00       	add    $0x180,%eax
c0105181:	0f b6 00             	movzbl (%eax),%eax
c0105184:	0f b6 c0             	movzbl %al,%eax
c0105187:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
c010518b:	80 e2 7f             	and    $0x7f,%dl
c010518e:	39 d0                	cmp    %edx,%eax
c0105190:	75 2e                	jne    c01051c0 <keyboard_handler+0x7b>
c0105192:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105195:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c010519c:	89 c2                	mov    %eax,%edx
c010519e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01051a1:	bb 01 00 00 00       	mov    $0x1,%ebx
c01051a6:	89 c1                	mov    %eax,%ecx
c01051a8:	d3 e3                	shl    %cl,%ebx
c01051aa:	89 d8                	mov    %ebx,%eax
c01051ac:	f7 d0                	not    %eax
c01051ae:	21 d0                	and    %edx,%eax
c01051b0:	89 c2                	mov    %eax,%edx
c01051b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01051b5:	88 90 88 01 00 00    	mov    %dl,0x188(%eax)
c01051bb:	e9 60 01 00 00       	jmp    c0105320 <keyboard_handler+0x1db>
c01051c0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01051c4:	83 7d f8 04          	cmpl   $0x4,-0x8(%ebp)
c01051c8:	76 aa                	jbe    c0105174 <keyboard_handler+0x2f>
c01051ca:	e9 51 01 00 00       	jmp    c0105320 <keyboard_handler+0x1db>
c01051cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01051d6:	e9 90 00 00 00       	jmp    c010526b <keyboard_handler+0x126>
c01051db:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01051de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051e1:	01 d0                	add    %edx,%eax
c01051e3:	05 80 01 00 00       	add    $0x180,%eax
c01051e8:	0f b6 00             	movzbl (%eax),%eax
c01051eb:	3a 45 ef             	cmp    -0x11(%ebp),%al
c01051ee:	75 77                	jne    c0105267 <keyboard_handler+0x122>
c01051f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01051f3:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c01051fa:	0f b6 d0             	movzbl %al,%edx
c01051fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105200:	89 c1                	mov    %eax,%ecx
c0105202:	d3 fa                	sar    %cl,%edx
c0105204:	89 d0                	mov    %edx,%eax
c0105206:	83 e0 01             	and    $0x1,%eax
c0105209:	85 c0                	test   %eax,%eax
c010520b:	74 2e                	je     c010523b <keyboard_handler+0xf6>
c010520d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105210:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c0105217:	89 c2                	mov    %eax,%edx
c0105219:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010521c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105221:	89 c1                	mov    %eax,%ecx
c0105223:	d3 e3                	shl    %cl,%ebx
c0105225:	89 d8                	mov    %ebx,%eax
c0105227:	f7 d0                	not    %eax
c0105229:	21 d0                	and    %edx,%eax
c010522b:	89 c2                	mov    %eax,%edx
c010522d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105230:	88 90 88 01 00 00    	mov    %dl,0x188(%eax)
c0105236:	e9 e5 00 00 00       	jmp    c0105320 <keyboard_handler+0x1db>
c010523b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010523e:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c0105245:	89 c2                	mov    %eax,%edx
c0105247:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010524a:	bb 01 00 00 00       	mov    $0x1,%ebx
c010524f:	89 c1                	mov    %eax,%ecx
c0105251:	d3 e3                	shl    %cl,%ebx
c0105253:	89 d8                	mov    %ebx,%eax
c0105255:	09 d0                	or     %edx,%eax
c0105257:	89 c2                	mov    %eax,%edx
c0105259:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010525c:	88 90 88 01 00 00    	mov    %dl,0x188(%eax)
c0105262:	e9 b9 00 00 00       	jmp    c0105320 <keyboard_handler+0x1db>
c0105267:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010526b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c010526f:	0f 86 66 ff ff ff    	jbe    c01051db <keyboard_handler+0x96>
c0105275:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105278:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010527b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010527e:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c0105285:	0f b6 c0             	movzbl %al,%eax
c0105288:	83 e0 18             	and    $0x18,%eax
c010528b:	85 c0                	test   %eax,%eax
c010528d:	74 1f                	je     c01052ae <keyboard_handler+0x169>
c010528f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105292:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c0105299:	0f b6 c0             	movzbl %al,%eax
c010529c:	83 e0 01             	and    $0x1,%eax
c010529f:	85 c0                	test   %eax,%eax
c01052a1:	75 0b                	jne    c01052ae <keyboard_handler+0x169>
c01052a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052a6:	05 00 01 00 00       	add    $0x100,%eax
c01052ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01052ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052b1:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c01052b8:	0f b6 c0             	movzbl %al,%eax
c01052bb:	83 e0 20             	and    $0x20,%eax
c01052be:	85 c0                	test   %eax,%eax
c01052c0:	74 1d                	je     c01052df <keyboard_handler+0x19a>
c01052c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052c5:	0f b6 80 88 01 00 00 	movzbl 0x188(%eax),%eax
c01052cc:	0f b6 c0             	movzbl %al,%eax
c01052cf:	83 e0 01             	and    $0x1,%eax
c01052d2:	85 c0                	test   %eax,%eax
c01052d4:	75 09                	jne    c01052df <keyboard_handler+0x19a>
c01052d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052d9:	83 e8 80             	sub    $0xffffff80,%eax
c01052dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01052df:	a1 e8 b4 10 c0       	mov    0xc010b4e8,%eax
c01052e4:	8b 15 ec b4 10 c0    	mov    0xc010b4ec,%edx
c01052ea:	83 c2 01             	add    $0x1,%edx
c01052ed:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01052f3:	39 d0                	cmp    %edx,%eax
c01052f5:	74 29                	je     c0105320 <keyboard_handler+0x1db>
c01052f7:	a1 ec b4 10 c0       	mov    0xc010b4ec,%eax
c01052fc:	0f b6 4d ef          	movzbl -0x11(%ebp),%ecx
c0105300:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105303:	01 ca                	add    %ecx,%edx
c0105305:	0f b6 12             	movzbl (%edx),%edx
c0105308:	88 90 e8 b0 10 c0    	mov    %dl,-0x3fef4f18(%eax)
c010530e:	a1 ec b4 10 c0       	mov    0xc010b4ec,%eax
c0105313:	83 c0 01             	add    $0x1,%eax
c0105316:	25 ff 03 00 00       	and    $0x3ff,%eax
c010531b:	a3 ec b4 10 c0       	mov    %eax,0xc010b4ec
c0105320:	83 c4 24             	add    $0x24,%esp
c0105323:	5b                   	pop    %ebx
c0105324:	5d                   	pop    %ebp
c0105325:	c3                   	ret    

c0105326 <kb_ioctl>:
c0105326:	55                   	push   %ebp
c0105327:	89 e5                	mov    %esp,%ebp
c0105329:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010532d:	74 0d                	je     c010533c <kb_ioctl+0x16>
c010532f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105333:	74 07                	je     c010533c <kb_ioctl+0x16>
c0105335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010533a:	eb 05                	jmp    c0105341 <kb_ioctl+0x1b>
c010533c:	b8 00 00 00 00       	mov    $0x0,%eax
c0105341:	5d                   	pop    %ebp
c0105342:	c3                   	ret    

c0105343 <outb>:
c0105343:	55                   	push   %ebp
c0105344:	89 e5                	mov    %esp,%ebp
c0105346:	83 ec 08             	sub    $0x8,%esp
c0105349:	8b 55 08             	mov    0x8(%ebp),%edx
c010534c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010534f:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c0105353:	88 45 f8             	mov    %al,-0x8(%ebp)
c0105356:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c010535a:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c010535e:	ee                   	out    %al,(%dx)
c010535f:	c9                   	leave  
c0105360:	c3                   	ret    

c0105361 <inb>:
c0105361:	55                   	push   %ebp
c0105362:	89 e5                	mov    %esp,%ebp
c0105364:	83 ec 14             	sub    $0x14,%esp
c0105367:	8b 45 08             	mov    0x8(%ebp),%eax
c010536a:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c010536e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0105372:	89 c2                	mov    %eax,%edx
c0105374:	ec                   	in     (%dx),%al
c0105375:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105378:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c010537c:	c9                   	leave  
c010537d:	c3                   	ret    

c010537e <insl>:
c010537e:	55                   	push   %ebp
c010537f:	89 e5                	mov    %esp,%ebp
c0105381:	57                   	push   %edi
c0105382:	53                   	push   %ebx
c0105383:	8b 55 08             	mov    0x8(%ebp),%edx
c0105386:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105389:	8b 45 10             	mov    0x10(%ebp),%eax
c010538c:	89 cb                	mov    %ecx,%ebx
c010538e:	89 df                	mov    %ebx,%edi
c0105390:	89 c1                	mov    %eax,%ecx
c0105392:	fc                   	cld    
c0105393:	f2 6d                	repnz insl (%dx),%es:(%edi)
c0105395:	89 c8                	mov    %ecx,%eax
c0105397:	89 fb                	mov    %edi,%ebx
c0105399:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c010539c:	89 45 10             	mov    %eax,0x10(%ebp)
c010539f:	5b                   	pop    %ebx
c01053a0:	5f                   	pop    %edi
c01053a1:	5d                   	pop    %ebp
c01053a2:	c3                   	ret    

c01053a3 <outsl>:
c01053a3:	55                   	push   %ebp
c01053a4:	89 e5                	mov    %esp,%ebp
c01053a6:	56                   	push   %esi
c01053a7:	53                   	push   %ebx
c01053a8:	8b 55 08             	mov    0x8(%ebp),%edx
c01053ab:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c01053ae:	8b 45 10             	mov    0x10(%ebp),%eax
c01053b1:	89 cb                	mov    %ecx,%ebx
c01053b3:	89 de                	mov    %ebx,%esi
c01053b5:	89 c1                	mov    %eax,%ecx
c01053b7:	fc                   	cld    
c01053b8:	f2 6f                	repnz outsl %ds:(%esi),(%dx)
c01053ba:	89 c8                	mov    %ecx,%eax
c01053bc:	89 f3                	mov    %esi,%ebx
c01053be:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01053c1:	89 45 10             	mov    %eax,0x10(%ebp)
c01053c4:	5b                   	pop    %ebx
c01053c5:	5e                   	pop    %esi
c01053c6:	5d                   	pop    %ebp
c01053c7:	c3                   	ret    

c01053c8 <ide_wait_ready>:
c01053c8:	55                   	push   %ebp
c01053c9:	89 e5                	mov    %esp,%ebp
c01053cb:	83 ec 18             	sub    $0x18,%esp
c01053ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01053d1:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c01053d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01053dc:	90                   	nop
c01053dd:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c01053e1:	83 c0 07             	add    $0x7,%eax
c01053e4:	0f b7 c0             	movzwl %ax,%eax
c01053e7:	89 04 24             	mov    %eax,(%esp)
c01053ea:	e8 72 ff ff ff       	call   c0105361 <inb>
c01053ef:	0f b6 c0             	movzbl %al,%eax
c01053f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01053f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01053f8:	25 80 00 00 00       	and    $0x80,%eax
c01053fd:	85 c0                	test   %eax,%eax
c01053ff:	75 dc                	jne    c01053dd <ide_wait_ready+0x15>
c0105401:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105405:	74 11                	je     c0105418 <ide_wait_ready+0x50>
c0105407:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010540a:	83 e0 21             	and    $0x21,%eax
c010540d:	85 c0                	test   %eax,%eax
c010540f:	74 07                	je     c0105418 <ide_wait_ready+0x50>
c0105411:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105416:	eb 05                	jmp    c010541d <ide_wait_ready+0x55>
c0105418:	b8 00 00 00 00       	mov    $0x0,%eax
c010541d:	c9                   	leave  
c010541e:	c3                   	ret    

c010541f <ide_get_desc>:
c010541f:	55                   	push   %ebp
c0105420:	89 e5                	mov    %esp,%ebp
c0105422:	b8 0c b5 10 c0       	mov    $0xc010b50c,%eax
c0105427:	5d                   	pop    %ebp
c0105428:	c3                   	ret    

c0105429 <ide_init>:
c0105429:	55                   	push   %ebp
c010542a:	89 e5                	mov    %esp,%ebp
c010542c:	81 ec 2c 02 00 00    	sub    $0x22c,%esp
c0105432:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105439:	00 
c010543a:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c0105441:	e8 82 ff ff ff       	call   c01053c8 <ide_wait_ready>
c0105446:	c7 44 24 04 e0 00 00 	movl   $0xe0,0x4(%esp)
c010544d:	00 
c010544e:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
c0105455:	e8 e9 fe ff ff       	call   c0105343 <outb>
c010545a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105461:	00 
c0105462:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c0105469:	e8 5a ff ff ff       	call   c01053c8 <ide_wait_ready>
c010546e:	c7 44 24 04 ec 00 00 	movl   $0xec,0x4(%esp)
c0105475:	00 
c0105476:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
c010547d:	e8 c1 fe ff ff       	call   c0105343 <outb>
c0105482:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105489:	00 
c010548a:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c0105491:	e8 32 ff ff ff       	call   c01053c8 <ide_wait_ready>
c0105496:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
c010549d:	e8 bf fe ff ff       	call   c0105361 <inb>
c01054a2:	84 c0                	test   %al,%al
c01054a4:	74 18                	je     c01054be <ide_init+0x95>
c01054a6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01054ad:	00 
c01054ae:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c01054b5:	e8 0e ff ff ff       	call   c01053c8 <ide_wait_ready>
c01054ba:	85 c0                	test   %eax,%eax
c01054bc:	74 0a                	je     c01054c8 <ide_init+0x9f>
c01054be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01054c3:	e9 f5 00 00 00       	jmp    c01055bd <ide_init+0x194>
c01054c8:	c6 05 00 b5 10 c0 01 	movb   $0x1,0xc010b500
c01054cf:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
c01054d6:	00 
c01054d7:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01054dd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01054e1:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c01054e8:	e8 91 fe ff ff       	call   c010537e <insl>
c01054ed:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01054f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01054f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01054f9:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
c01054ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105502:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105505:	25 00 00 00 04       	and    $0x4000000,%eax
c010550a:	85 c0                	test   %eax,%eax
c010550c:	74 0e                	je     c010551c <ide_init+0xf3>
c010550e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105511:	8b 80 c8 00 00 00    	mov    0xc8(%eax),%eax
c0105517:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010551a:	eb 09                	jmp    c0105525 <ide_init+0xfc>
c010551c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010551f:	8b 40 78             	mov    0x78(%eax),%eax
c0105522:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105525:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105528:	a3 04 b5 10 c0       	mov    %eax,0xc010b504
c010552d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105530:	a3 08 b5 10 c0       	mov    %eax,0xc010b508
c0105535:	c7 45 ec 0c b5 10 c0 	movl   $0xc010b50c,-0x14(%ebp)
c010553c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010553f:	83 c0 36             	add    $0x36,%eax
c0105542:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105545:	c7 45 e4 28 00 00 00 	movl   $0x28,-0x1c(%ebp)
c010554c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105553:	eb 34                	jmp    c0105589 <ide_init+0x160>
c0105555:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0105558:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010555b:	01 c2                	add    %eax,%edx
c010555d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105560:	8d 48 01             	lea    0x1(%eax),%ecx
c0105563:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105566:	01 c8                	add    %ecx,%eax
c0105568:	0f b6 00             	movzbl (%eax),%eax
c010556b:	88 02                	mov    %al,(%edx)
c010556d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105570:	8d 50 01             	lea    0x1(%eax),%edx
c0105573:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105576:	01 c2                	add    %eax,%edx
c0105578:	8b 4d f8             	mov    -0x8(%ebp),%ecx
c010557b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010557e:	01 c8                	add    %ecx,%eax
c0105580:	0f b6 00             	movzbl (%eax),%eax
c0105583:	88 02                	mov    %al,(%edx)
c0105585:	83 45 f8 02          	addl   $0x2,-0x8(%ebp)
c0105589:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010558c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c010558f:	7c c4                	jl     c0105555 <ide_init+0x12c>
c0105591:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0105594:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105597:	01 d0                	add    %edx,%eax
c0105599:	c6 00 00             	movb   $0x0,(%eax)
c010559c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010559f:	8d 50 ff             	lea    -0x1(%eax),%edx
c01055a2:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01055a5:	85 c0                	test   %eax,%eax
c01055a7:	7e 0f                	jle    c01055b8 <ide_init+0x18f>
c01055a9:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01055ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01055af:	01 d0                	add    %edx,%eax
c01055b1:	0f b6 00             	movzbl (%eax),%eax
c01055b4:	3c 20                	cmp    $0x20,%al
c01055b6:	74 d9                	je     c0105591 <ide_init+0x168>
c01055b8:	b8 00 00 00 00       	mov    $0x0,%eax
c01055bd:	c9                   	leave  
c01055be:	c3                   	ret    

c01055bf <ide_device_valid>:
c01055bf:	55                   	push   %ebp
c01055c0:	89 e5                	mov    %esp,%ebp
c01055c2:	0f b6 05 00 b5 10 c0 	movzbl 0xc010b500,%eax
c01055c9:	3c 01                	cmp    $0x1,%al
c01055cb:	0f 94 c0             	sete   %al
c01055ce:	0f b6 c0             	movzbl %al,%eax
c01055d1:	5d                   	pop    %ebp
c01055d2:	c3                   	ret    

c01055d3 <ide_get_nr_block>:
c01055d3:	55                   	push   %ebp
c01055d4:	89 e5                	mov    %esp,%ebp
c01055d6:	e8 e4 ff ff ff       	call   c01055bf <ide_device_valid>
c01055db:	85 c0                	test   %eax,%eax
c01055dd:	74 07                	je     c01055e6 <ide_get_nr_block+0x13>
c01055df:	a1 08 b5 10 c0       	mov    0xc010b508,%eax
c01055e4:	eb 05                	jmp    c01055eb <ide_get_nr_block+0x18>
c01055e6:	b8 00 00 00 00       	mov    $0x0,%eax
c01055eb:	5d                   	pop    %ebp
c01055ec:	c3                   	ret    

c01055ed <ide_request>:
c01055ed:	55                   	push   %ebp
c01055ee:	89 e5                	mov    %esp,%ebp
c01055f0:	83 ec 18             	sub    $0x18,%esp
c01055f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01055f6:	8b 00                	mov    (%eax),%eax
c01055f8:	85 c0                	test   %eax,%eax
c01055fa:	75 3e                	jne    c010563a <ide_request+0x4d>
c01055fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01055ff:	8b 50 10             	mov    0x10(%eax),%edx
c0105602:	8b 45 08             	mov    0x8(%ebp),%eax
c0105605:	8b 40 08             	mov    0x8(%eax),%eax
c0105608:	c1 e0 09             	shl    $0x9,%eax
c010560b:	39 c2                	cmp    %eax,%edx
c010560d:	73 07                	jae    c0105616 <ide_request+0x29>
c010560f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105614:	eb 71                	jmp    c0105687 <ide_request+0x9a>
c0105616:	8b 45 08             	mov    0x8(%ebp),%eax
c0105619:	8b 48 08             	mov    0x8(%eax),%ecx
c010561c:	8b 45 08             	mov    0x8(%ebp),%eax
c010561f:	8b 50 0c             	mov    0xc(%eax),%edx
c0105622:	8b 45 08             	mov    0x8(%ebp),%eax
c0105625:	8b 40 04             	mov    0x4(%eax),%eax
c0105628:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c010562c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105630:	89 04 24             	mov    %eax,(%esp)
c0105633:	e8 51 00 00 00       	call   c0105689 <ide_read_secs>
c0105638:	eb 4d                	jmp    c0105687 <ide_request+0x9a>
c010563a:	8b 45 08             	mov    0x8(%ebp),%eax
c010563d:	8b 00                	mov    (%eax),%eax
c010563f:	83 f8 01             	cmp    $0x1,%eax
c0105642:	75 3e                	jne    c0105682 <ide_request+0x95>
c0105644:	8b 45 08             	mov    0x8(%ebp),%eax
c0105647:	8b 50 10             	mov    0x10(%eax),%edx
c010564a:	8b 45 08             	mov    0x8(%ebp),%eax
c010564d:	8b 40 08             	mov    0x8(%eax),%eax
c0105650:	c1 e0 09             	shl    $0x9,%eax
c0105653:	39 c2                	cmp    %eax,%edx
c0105655:	73 07                	jae    c010565e <ide_request+0x71>
c0105657:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010565c:	eb 29                	jmp    c0105687 <ide_request+0x9a>
c010565e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105661:	8b 48 08             	mov    0x8(%eax),%ecx
c0105664:	8b 45 08             	mov    0x8(%ebp),%eax
c0105667:	8b 50 0c             	mov    0xc(%eax),%edx
c010566a:	8b 45 08             	mov    0x8(%ebp),%eax
c010566d:	8b 40 04             	mov    0x4(%eax),%eax
c0105670:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0105674:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105678:	89 04 24             	mov    %eax,(%esp)
c010567b:	e8 68 01 00 00       	call   c01057e8 <ide_write_secs>
c0105680:	eb 05                	jmp    c0105687 <ide_request+0x9a>
c0105682:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105687:	c9                   	leave  
c0105688:	c3                   	ret    

c0105689 <ide_read_secs>:
c0105689:	55                   	push   %ebp
c010568a:	89 e5                	mov    %esp,%ebp
c010568c:	83 ec 28             	sub    $0x28,%esp
c010568f:	81 7d 10 80 00 00 00 	cmpl   $0x80,0x10(%ebp)
c0105696:	77 0b                	ja     c01056a3 <ide_read_secs+0x1a>
c0105698:	0f b6 05 00 b5 10 c0 	movzbl 0xc010b500,%eax
c010569f:	3c 01                	cmp    $0x1,%al
c01056a1:	74 0c                	je     c01056af <ide_read_secs+0x26>
c01056a3:	c7 04 24 3d 9e 10 c0 	movl   $0xc0109e3d,(%esp)
c01056aa:	e8 13 1d 00 00       	call   c01073c2 <panic>
c01056af:	81 7d 08 ff ff ff 0f 	cmpl   $0xfffffff,0x8(%ebp)
c01056b6:	77 0f                	ja     c01056c7 <ide_read_secs+0x3e>
c01056b8:	8b 45 10             	mov    0x10(%ebp),%eax
c01056bb:	8b 55 08             	mov    0x8(%ebp),%edx
c01056be:	01 d0                	add    %edx,%eax
c01056c0:	3d 00 00 00 10       	cmp    $0x10000000,%eax
c01056c5:	76 0c                	jbe    c01056d3 <ide_read_secs+0x4a>
c01056c7:	c7 04 24 51 9e 10 c0 	movl   $0xc0109e51,(%esp)
c01056ce:	e8 ef 1c 00 00       	call   c01073c2 <panic>
c01056d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01056da:	00 
c01056db:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c01056e2:	e8 e1 fc ff ff       	call   c01053c8 <ide_wait_ready>
c01056e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01056ee:	00 
c01056ef:	c7 04 24 f6 03 00 00 	movl   $0x3f6,(%esp)
c01056f6:	e8 48 fc ff ff       	call   c0105343 <outb>
c01056fb:	8b 45 10             	mov    0x10(%ebp),%eax
c01056fe:	0f b6 c0             	movzbl %al,%eax
c0105701:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105705:	c7 04 24 f2 01 00 00 	movl   $0x1f2,(%esp)
c010570c:	e8 32 fc ff ff       	call   c0105343 <outb>
c0105711:	8b 45 08             	mov    0x8(%ebp),%eax
c0105714:	0f b6 c0             	movzbl %al,%eax
c0105717:	89 44 24 04          	mov    %eax,0x4(%esp)
c010571b:	c7 04 24 f3 01 00 00 	movl   $0x1f3,(%esp)
c0105722:	e8 1c fc ff ff       	call   c0105343 <outb>
c0105727:	8b 45 08             	mov    0x8(%ebp),%eax
c010572a:	c1 e8 08             	shr    $0x8,%eax
c010572d:	0f b6 c0             	movzbl %al,%eax
c0105730:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105734:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
c010573b:	e8 03 fc ff ff       	call   c0105343 <outb>
c0105740:	8b 45 08             	mov    0x8(%ebp),%eax
c0105743:	c1 e8 10             	shr    $0x10,%eax
c0105746:	0f b6 c0             	movzbl %al,%eax
c0105749:	89 44 24 04          	mov    %eax,0x4(%esp)
c010574d:	c7 04 24 f5 01 00 00 	movl   $0x1f5,(%esp)
c0105754:	e8 ea fb ff ff       	call   c0105343 <outb>
c0105759:	8b 45 08             	mov    0x8(%ebp),%eax
c010575c:	c1 e8 18             	shr    $0x18,%eax
c010575f:	83 e0 0f             	and    $0xf,%eax
c0105762:	83 c8 e0             	or     $0xffffffe0,%eax
c0105765:	0f b6 c0             	movzbl %al,%eax
c0105768:	89 44 24 04          	mov    %eax,0x4(%esp)
c010576c:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
c0105773:	e8 cb fb ff ff       	call   c0105343 <outb>
c0105778:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c010577f:	00 
c0105780:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
c0105787:	e8 b7 fb ff ff       	call   c0105343 <outb>
c010578c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105793:	eb 48                	jmp    c01057dd <ide_read_secs+0x154>
c0105795:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010579c:	00 
c010579d:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c01057a4:	e8 1f fc ff ff       	call   c01053c8 <ide_wait_ready>
c01057a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01057b0:	74 05                	je     c01057b7 <ide_read_secs+0x12e>
c01057b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01057b5:	eb 2f                	jmp    c01057e6 <ide_read_secs+0x15d>
c01057b7:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
c01057be:	00 
c01057bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01057c2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01057c6:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c01057cd:	e8 ac fb ff ff       	call   c010537e <insl>
c01057d2:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c01057d6:	81 45 0c 00 02 00 00 	addl   $0x200,0xc(%ebp)
c01057dd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01057e1:	75 b2                	jne    c0105795 <ide_read_secs+0x10c>
c01057e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01057e6:	c9                   	leave  
c01057e7:	c3                   	ret    

c01057e8 <ide_write_secs>:
c01057e8:	55                   	push   %ebp
c01057e9:	89 e5                	mov    %esp,%ebp
c01057eb:	83 ec 28             	sub    $0x28,%esp
c01057ee:	81 7d 10 80 00 00 00 	cmpl   $0x80,0x10(%ebp)
c01057f5:	77 0b                	ja     c0105802 <ide_write_secs+0x1a>
c01057f7:	0f b6 05 00 b5 10 c0 	movzbl 0xc010b500,%eax
c01057fe:	3c 01                	cmp    $0x1,%al
c0105800:	74 0c                	je     c010580e <ide_write_secs+0x26>
c0105802:	c7 04 24 5e 9e 10 c0 	movl   $0xc0109e5e,(%esp)
c0105809:	e8 b4 1b 00 00       	call   c01073c2 <panic>
c010580e:	81 7d 08 ff ff ff 0f 	cmpl   $0xfffffff,0x8(%ebp)
c0105815:	77 0f                	ja     c0105826 <ide_write_secs+0x3e>
c0105817:	8b 45 10             	mov    0x10(%ebp),%eax
c010581a:	8b 55 08             	mov    0x8(%ebp),%edx
c010581d:	01 d0                	add    %edx,%eax
c010581f:	3d 00 00 00 10       	cmp    $0x10000000,%eax
c0105824:	76 0c                	jbe    c0105832 <ide_write_secs+0x4a>
c0105826:	c7 04 24 51 9e 10 c0 	movl   $0xc0109e51,(%esp)
c010582d:	e8 90 1b 00 00       	call   c01073c2 <panic>
c0105832:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105839:	00 
c010583a:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c0105841:	e8 82 fb ff ff       	call   c01053c8 <ide_wait_ready>
c0105846:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010584d:	00 
c010584e:	c7 04 24 f6 03 00 00 	movl   $0x3f6,(%esp)
c0105855:	e8 e9 fa ff ff       	call   c0105343 <outb>
c010585a:	8b 45 10             	mov    0x10(%ebp),%eax
c010585d:	0f b6 c0             	movzbl %al,%eax
c0105860:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105864:	c7 04 24 f2 01 00 00 	movl   $0x1f2,(%esp)
c010586b:	e8 d3 fa ff ff       	call   c0105343 <outb>
c0105870:	8b 45 08             	mov    0x8(%ebp),%eax
c0105873:	0f b6 c0             	movzbl %al,%eax
c0105876:	89 44 24 04          	mov    %eax,0x4(%esp)
c010587a:	c7 04 24 f3 01 00 00 	movl   $0x1f3,(%esp)
c0105881:	e8 bd fa ff ff       	call   c0105343 <outb>
c0105886:	8b 45 08             	mov    0x8(%ebp),%eax
c0105889:	c1 e8 08             	shr    $0x8,%eax
c010588c:	0f b6 c0             	movzbl %al,%eax
c010588f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105893:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
c010589a:	e8 a4 fa ff ff       	call   c0105343 <outb>
c010589f:	8b 45 08             	mov    0x8(%ebp),%eax
c01058a2:	c1 e8 10             	shr    $0x10,%eax
c01058a5:	0f b6 c0             	movzbl %al,%eax
c01058a8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01058ac:	c7 04 24 f5 01 00 00 	movl   $0x1f5,(%esp)
c01058b3:	e8 8b fa ff ff       	call   c0105343 <outb>
c01058b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01058bb:	c1 e8 18             	shr    $0x18,%eax
c01058be:	83 e0 0f             	and    $0xf,%eax
c01058c1:	83 c8 e0             	or     $0xffffffe0,%eax
c01058c4:	0f b6 c0             	movzbl %al,%eax
c01058c7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01058cb:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
c01058d2:	e8 6c fa ff ff       	call   c0105343 <outb>
c01058d7:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
c01058de:	00 
c01058df:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
c01058e6:	e8 58 fa ff ff       	call   c0105343 <outb>
c01058eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01058f2:	eb 48                	jmp    c010593c <ide_write_secs+0x154>
c01058f4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01058fb:	00 
c01058fc:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c0105903:	e8 c0 fa ff ff       	call   c01053c8 <ide_wait_ready>
c0105908:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010590b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010590f:	74 05                	je     c0105916 <ide_write_secs+0x12e>
c0105911:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105914:	eb 2f                	jmp    c0105945 <ide_write_secs+0x15d>
c0105916:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
c010591d:	00 
c010591e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105921:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105925:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
c010592c:	e8 72 fa ff ff       	call   c01053a3 <outsl>
c0105931:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0105935:	81 45 0c 00 02 00 00 	addl   $0x200,0xc(%ebp)
c010593c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105940:	75 b2                	jne    c01058f4 <ide_write_secs+0x10c>
c0105942:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105945:	c9                   	leave  
c0105946:	c3                   	ret    

c0105947 <ide_ioctl>:
c0105947:	55                   	push   %ebp
c0105948:	89 e5                	mov    %esp,%ebp
c010594a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010594e:	74 0d                	je     c010595d <ide_ioctl+0x16>
c0105950:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105954:	74 07                	je     c010595d <ide_ioctl+0x16>
c0105956:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010595b:	eb 05                	jmp    c0105962 <ide_ioctl+0x1b>
c010595d:	b8 00 00 00 00       	mov    $0x0,%eax
c0105962:	5d                   	pop    %ebp
c0105963:	c3                   	ret    

c0105964 <char_dev_init>:
c0105964:	55                   	push   %ebp
c0105965:	89 e5                	mov    %esp,%ebp
c0105967:	83 ec 28             	sub    $0x28,%esp
c010596a:	c7 45 f4 20 92 10 c0 	movl   $0xc0109220,-0xc(%ebp)
c0105971:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105974:	8b 40 0c             	mov    0xc(%eax),%eax
c0105977:	ff d0                	call   *%eax
c0105979:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010597c:	89 04 24             	mov    %eax,(%esp)
c010597f:	e8 2a 00 00 00       	call   c01059ae <add_char_dev>
c0105984:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105987:	8b 40 14             	mov    0x14(%eax),%eax
c010598a:	ff d0                	call   *%eax
c010598c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0105990:	c7 44 24 08 71 9e 10 	movl   $0xc0109e71,0x8(%esp)
c0105997:	c0 
c0105998:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
c010599f:	00 
c01059a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01059a7:	e8 3d 02 00 00       	call   c0105be9 <cprintk>
c01059ac:	c9                   	leave  
c01059ad:	c3                   	ret    

c01059ae <add_char_dev>:
c01059ae:	55                   	push   %ebp
c01059af:	89 e5                	mov    %esp,%ebp
c01059b1:	83 ec 28             	sub    $0x28,%esp
c01059b4:	a1 20 72 11 c0       	mov    0xc0117220,%eax
c01059b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059bc:	eb 2a                	jmp    c01059e8 <add_char_dev+0x3a>
c01059be:	8b 45 08             	mov    0x8(%ebp),%eax
c01059c1:	8b 10                	mov    (%eax),%edx
c01059c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059c6:	8b 00                	mov    (%eax),%eax
c01059c8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01059cc:	89 04 24             	mov    %eax,(%esp)
c01059cf:	e8 06 ea ff ff       	call   c01043da <strcmp>
c01059d4:	85 c0                	test   %eax,%eax
c01059d6:	75 07                	jne    c01059df <add_char_dev+0x31>
c01059d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01059dd:	eb 28                	jmp    c0105a07 <add_char_dev+0x59>
c01059df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059e2:	8b 40 24             	mov    0x24(%eax),%eax
c01059e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059e8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01059ec:	75 d0                	jne    c01059be <add_char_dev+0x10>
c01059ee:	8b 15 20 72 11 c0    	mov    0xc0117220,%edx
c01059f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01059f7:	89 50 24             	mov    %edx,0x24(%eax)
c01059fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01059fd:	a3 20 72 11 c0       	mov    %eax,0xc0117220
c0105a02:	b8 00 00 00 00       	mov    $0x0,%eax
c0105a07:	c9                   	leave  
c0105a08:	c3                   	ret    

c0105a09 <device_init>:
c0105a09:	55                   	push   %ebp
c0105a0a:	89 e5                	mov    %esp,%ebp
c0105a0c:	83 ec 08             	sub    $0x8,%esp
c0105a0f:	e8 50 ff ff ff       	call   c0105964 <char_dev_init>
c0105a14:	e8 02 00 00 00       	call   c0105a1b <block_dev_init>
c0105a19:	c9                   	leave  
c0105a1a:	c3                   	ret    

c0105a1b <block_dev_init>:
c0105a1b:	55                   	push   %ebp
c0105a1c:	89 e5                	mov    %esp,%ebp
c0105a1e:	53                   	push   %ebx
c0105a1f:	83 ec 34             	sub    $0x34,%esp
c0105a22:	c7 44 24 08 88 9e 10 	movl   $0xc0109e88,0x8(%esp)
c0105a29:	c0 
c0105a2a:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0105a31:	00 
c0105a32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0105a39:	e8 ab 01 00 00       	call   c0105be9 <cprintk>
c0105a3e:	c7 45 f4 60 92 10 c0 	movl   $0xc0109260,-0xc(%ebp)
c0105a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a48:	8b 40 08             	mov    0x8(%eax),%eax
c0105a4b:	ff d0                	call   *%eax
c0105a4d:	83 f8 ff             	cmp    $0xffffffff,%eax
c0105a50:	75 0e                	jne    c0105a60 <block_dev_init+0x45>
c0105a52:	c7 04 24 9d 9e 10 c0 	movl   $0xc0109e9d,(%esp)
c0105a59:	e8 49 01 00 00       	call   c0105ba7 <printk>
c0105a5e:	eb 76                	jmp    c0105ad6 <block_dev_init+0xbb>
c0105a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a63:	89 04 24             	mov    %eax,(%esp)
c0105a66:	e8 71 00 00 00       	call   c0105adc <add_block_dev>
c0105a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a6e:	8b 40 0c             	mov    0xc(%eax),%eax
c0105a71:	ff d0                	call   *%eax
c0105a73:	85 c0                	test   %eax,%eax
c0105a75:	75 0e                	jne    c0105a85 <block_dev_init+0x6a>
c0105a77:	c7 04 24 b9 9e 10 c0 	movl   $0xc0109eb9,(%esp)
c0105a7e:	e8 24 01 00 00       	call   c0105ba7 <printk>
c0105a83:	eb 51                	jmp    c0105ad6 <block_dev_init+0xbb>
c0105a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a88:	8b 40 10             	mov    0x10(%eax),%eax
c0105a8b:	ff d0                	call   *%eax
c0105a8d:	89 c3                	mov    %eax,%ebx
c0105a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a92:	8b 40 14             	mov    0x14(%eax),%eax
c0105a95:	ff d0                	call   *%eax
c0105a97:	89 5c 24 10          	mov    %ebx,0x10(%esp)
c0105a9b:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0105a9f:	c7 44 24 08 d4 9e 10 	movl   $0xc0109ed4,0x8(%esp)
c0105aa6:	c0 
c0105aa7:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0105aae:	00 
c0105aaf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0105ab6:	e8 2e 01 00 00       	call   c0105be9 <cprintk>
c0105abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105abe:	89 04 24             	mov    %eax,(%esp)
c0105ac1:	e8 3e e8 ff ff       	call   c0104304 <read_mbr_info>
c0105ac6:	85 c0                	test   %eax,%eax
c0105ac8:	74 0c                	je     c0105ad6 <block_dev_init+0xbb>
c0105aca:	c7 04 24 fe 9e 10 c0 	movl   $0xc0109efe,(%esp)
c0105ad1:	e8 d1 00 00 00       	call   c0105ba7 <printk>
c0105ad6:	83 c4 34             	add    $0x34,%esp
c0105ad9:	5b                   	pop    %ebx
c0105ada:	5d                   	pop    %ebp
c0105adb:	c3                   	ret    

c0105adc <add_block_dev>:
c0105adc:	55                   	push   %ebp
c0105add:	89 e5                	mov    %esp,%ebp
c0105adf:	83 ec 28             	sub    $0x28,%esp
c0105ae2:	a1 24 72 11 c0       	mov    0xc0117224,%eax
c0105ae7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105aea:	eb 2a                	jmp    c0105b16 <add_block_dev+0x3a>
c0105aec:	8b 45 08             	mov    0x8(%ebp),%eax
c0105aef:	8b 10                	mov    (%eax),%edx
c0105af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105af4:	8b 00                	mov    (%eax),%eax
c0105af6:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105afa:	89 04 24             	mov    %eax,(%esp)
c0105afd:	e8 d8 e8 ff ff       	call   c01043da <strcmp>
c0105b02:	85 c0                	test   %eax,%eax
c0105b04:	75 07                	jne    c0105b0d <add_block_dev+0x31>
c0105b06:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105b0b:	eb 28                	jmp    c0105b35 <add_block_dev+0x59>
c0105b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b10:	8b 40 20             	mov    0x20(%eax),%eax
c0105b13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105b1a:	75 d0                	jne    c0105aec <add_block_dev+0x10>
c0105b1c:	8b 15 24 72 11 c0    	mov    0xc0117224,%edx
c0105b22:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b25:	89 50 20             	mov    %edx,0x20(%eax)
c0105b28:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b2b:	a3 24 72 11 c0       	mov    %eax,0xc0117224
c0105b30:	b8 00 00 00 00       	mov    $0x0,%eax
c0105b35:	c9                   	leave  
c0105b36:	c3                   	ret    

c0105b37 <cpu_hlt>:
c0105b37:	55                   	push   %ebp
c0105b38:	89 e5                	mov    %esp,%ebp
c0105b3a:	f4                   	hlt    
c0105b3b:	5d                   	pop    %ebp
c0105b3c:	c3                   	ret    

c0105b3d <getchar>:
c0105b3d:	55                   	push   %ebp
c0105b3e:	89 e5                	mov    %esp,%ebp
c0105b40:	83 ec 28             	sub    $0x28,%esp
c0105b43:	c7 45 f4 20 92 10 c0 	movl   $0xc0109220,-0xc(%ebp)
c0105b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b4d:	8b 40 10             	mov    0x10(%eax),%eax
c0105b50:	ff d0                	call   *%eax
c0105b52:	85 c0                	test   %eax,%eax
c0105b54:	75 07                	jne    c0105b5d <getchar+0x20>
c0105b56:	b8 00 00 00 00       	mov    $0x0,%eax
c0105b5b:	eb 2c                	jmp    c0105b89 <getchar+0x4c>
c0105b5d:	90                   	nop
c0105b5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b61:	8b 40 18             	mov    0x18(%eax),%eax
c0105b64:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105b6b:	00 
c0105b6c:	8d 55 f3             	lea    -0xd(%ebp),%edx
c0105b6f:	89 14 24             	mov    %edx,(%esp)
c0105b72:	ff d0                	call   *%eax
c0105b74:	83 f8 01             	cmp    $0x1,%eax
c0105b77:	75 0b                	jne    c0105b84 <getchar+0x47>
c0105b79:	e8 b9 ff ff ff       	call   c0105b37 <cpu_hlt>
c0105b7e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0105b82:	eb 05                	jmp    c0105b89 <getchar+0x4c>
c0105b84:	b8 00 00 00 00       	mov    $0x0,%eax
c0105b89:	c9                   	leave  
c0105b8a:	c3                   	ret    

c0105b8b <strerr>:
c0105b8b:	55                   	push   %ebp
c0105b8c:	89 e5                	mov    %esp,%ebp
c0105b8e:	83 7d 08 05          	cmpl   $0x5,0x8(%ebp)
c0105b92:	7f 0c                	jg     c0105ba0 <strerr+0x15>
c0105b94:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b97:	8b 04 85 78 9f 10 c0 	mov    -0x3fef6088(,%eax,4),%eax
c0105b9e:	eb 05                	jmp    c0105ba5 <strerr+0x1a>
c0105ba0:	b8 94 9f 10 c0       	mov    $0xc0109f94,%eax
c0105ba5:	5d                   	pop    %ebp
c0105ba6:	c3                   	ret    

c0105ba7 <printk>:
c0105ba7:	55                   	push   %ebp
c0105ba8:	89 e5                	mov    %esp,%ebp
c0105baa:	83 ec 28             	sub    $0x28,%esp
c0105bad:	8d 45 0c             	lea    0xc(%ebp),%eax
c0105bb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bb6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105bba:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bbd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105bc1:	c7 04 24 40 b5 10 c0 	movl   $0xc010b540,(%esp)
c0105bc8:	e8 fe 02 00 00       	call   c0105ecb <vsprintf>
c0105bcd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bd3:	05 40 b5 10 c0       	add    $0xc010b540,%eax
c0105bd8:	c6 00 00             	movb   $0x0,(%eax)
c0105bdb:	c7 04 24 40 b5 10 c0 	movl   $0xc010b540,(%esp)
c0105be2:	e8 a5 20 00 00       	call   c0107c8c <console_write>
c0105be7:	c9                   	leave  
c0105be8:	c3                   	ret    

c0105be9 <cprintk>:
c0105be9:	55                   	push   %ebp
c0105bea:	89 e5                	mov    %esp,%ebp
c0105bec:	83 ec 28             	sub    $0x28,%esp
c0105bef:	8d 45 14             	lea    0x14(%ebp),%eax
c0105bf2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bf8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105bfc:	8b 45 10             	mov    0x10(%ebp),%eax
c0105bff:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105c03:	c7 04 24 40 dd 10 c0 	movl   $0xc010dd40,(%esp)
c0105c0a:	e8 bc 02 00 00       	call   c0105ecb <vsprintf>
c0105c0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c15:	05 40 dd 10 c0       	add    $0xc010dd40,%eax
c0105c1a:	c6 00 00             	movb   $0x0,(%eax)
c0105c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c20:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105c24:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c27:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105c2b:	c7 04 24 40 dd 10 c0 	movl   $0xc010dd40,(%esp)
c0105c32:	e8 af 20 00 00       	call   c0107ce6 <console_write_color>
c0105c37:	c9                   	leave  
c0105c38:	c3                   	ret    

c0105c39 <skip_atoi>:
c0105c39:	55                   	push   %ebp
c0105c3a:	89 e5                	mov    %esp,%ebp
c0105c3c:	53                   	push   %ebx
c0105c3d:	83 ec 10             	sub    $0x10,%esp
c0105c40:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105c47:	eb 29                	jmp    c0105c72 <skip_atoi+0x39>
c0105c49:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0105c4c:	89 d0                	mov    %edx,%eax
c0105c4e:	c1 e0 02             	shl    $0x2,%eax
c0105c51:	01 d0                	add    %edx,%eax
c0105c53:	01 c0                	add    %eax,%eax
c0105c55:	89 c3                	mov    %eax,%ebx
c0105c57:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c5a:	8b 00                	mov    (%eax),%eax
c0105c5c:	8d 48 01             	lea    0x1(%eax),%ecx
c0105c5f:	8b 55 08             	mov    0x8(%ebp),%edx
c0105c62:	89 0a                	mov    %ecx,(%edx)
c0105c64:	0f b6 00             	movzbl (%eax),%eax
c0105c67:	0f be c0             	movsbl %al,%eax
c0105c6a:	01 d8                	add    %ebx,%eax
c0105c6c:	83 e8 30             	sub    $0x30,%eax
c0105c6f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c72:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c75:	8b 00                	mov    (%eax),%eax
c0105c77:	0f b6 00             	movzbl (%eax),%eax
c0105c7a:	3c 2f                	cmp    $0x2f,%al
c0105c7c:	7e 0c                	jle    c0105c8a <skip_atoi+0x51>
c0105c7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c81:	8b 00                	mov    (%eax),%eax
c0105c83:	0f b6 00             	movzbl (%eax),%eax
c0105c86:	3c 39                	cmp    $0x39,%al
c0105c88:	7e bf                	jle    c0105c49 <skip_atoi+0x10>
c0105c8a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c8d:	83 c4 10             	add    $0x10,%esp
c0105c90:	5b                   	pop    %ebx
c0105c91:	5d                   	pop    %ebp
c0105c92:	c3                   	ret    

c0105c93 <number>:
c0105c93:	55                   	push   %ebp
c0105c94:	89 e5                	mov    %esp,%ebp
c0105c96:	53                   	push   %ebx
c0105c97:	83 ec 40             	sub    $0x40,%esp
c0105c9a:	c7 45 f4 a4 9f 10 c0 	movl   $0xc0109fa4,-0xc(%ebp)
c0105ca1:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105ca4:	83 e0 40             	and    $0x40,%eax
c0105ca7:	85 c0                	test   %eax,%eax
c0105ca9:	74 07                	je     c0105cb2 <number+0x1f>
c0105cab:	c7 45 f4 cc 9f 10 c0 	movl   $0xc0109fcc,-0xc(%ebp)
c0105cb2:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105cb5:	83 e0 10             	and    $0x10,%eax
c0105cb8:	85 c0                	test   %eax,%eax
c0105cba:	74 04                	je     c0105cc0 <number+0x2d>
c0105cbc:	83 65 1c fe          	andl   $0xfffffffe,0x1c(%ebp)
c0105cc0:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
c0105cc4:	7e 06                	jle    c0105ccc <number+0x39>
c0105cc6:	83 7d 10 24          	cmpl   $0x24,0x10(%ebp)
c0105cca:	7e 0a                	jle    c0105cd6 <number+0x43>
c0105ccc:	b8 00 00 00 00       	mov    $0x0,%eax
c0105cd1:	e9 ef 01 00 00       	jmp    c0105ec5 <number+0x232>
c0105cd6:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105cd9:	83 e0 01             	and    $0x1,%eax
c0105cdc:	85 c0                	test   %eax,%eax
c0105cde:	74 07                	je     c0105ce7 <number+0x54>
c0105ce0:	b8 30 00 00 00       	mov    $0x30,%eax
c0105ce5:	eb 05                	jmp    c0105cec <number+0x59>
c0105ce7:	b8 20 00 00 00       	mov    $0x20,%eax
c0105cec:	88 45 ef             	mov    %al,-0x11(%ebp)
c0105cef:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105cf2:	83 e0 02             	and    $0x2,%eax
c0105cf5:	85 c0                	test   %eax,%eax
c0105cf7:	74 0f                	je     c0105d08 <number+0x75>
c0105cf9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105cfd:	79 09                	jns    c0105d08 <number+0x75>
c0105cff:	c6 45 fb 2d          	movb   $0x2d,-0x5(%ebp)
c0105d03:	f7 5d 0c             	negl   0xc(%ebp)
c0105d06:	eb 2a                	jmp    c0105d32 <number+0x9f>
c0105d08:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105d0b:	83 e0 04             	and    $0x4,%eax
c0105d0e:	85 c0                	test   %eax,%eax
c0105d10:	75 18                	jne    c0105d2a <number+0x97>
c0105d12:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105d15:	83 e0 08             	and    $0x8,%eax
c0105d18:	85 c0                	test   %eax,%eax
c0105d1a:	74 07                	je     c0105d23 <number+0x90>
c0105d1c:	b8 20 00 00 00       	mov    $0x20,%eax
c0105d21:	eb 0c                	jmp    c0105d2f <number+0x9c>
c0105d23:	b8 00 00 00 00       	mov    $0x0,%eax
c0105d28:	eb 05                	jmp    c0105d2f <number+0x9c>
c0105d2a:	b8 2b 00 00 00       	mov    $0x2b,%eax
c0105d2f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0105d32:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0105d36:	74 04                	je     c0105d3c <number+0xa9>
c0105d38:	83 6d 14 01          	subl   $0x1,0x14(%ebp)
c0105d3c:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105d3f:	83 e0 20             	and    $0x20,%eax
c0105d42:	85 c0                	test   %eax,%eax
c0105d44:	74 16                	je     c0105d5c <number+0xc9>
c0105d46:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0105d4a:	75 06                	jne    c0105d52 <number+0xbf>
c0105d4c:	83 6d 14 02          	subl   $0x2,0x14(%ebp)
c0105d50:	eb 0a                	jmp    c0105d5c <number+0xc9>
c0105d52:	83 7d 10 08          	cmpl   $0x8,0x10(%ebp)
c0105d56:	75 04                	jne    c0105d5c <number+0xc9>
c0105d58:	83 6d 14 01          	subl   $0x1,0x14(%ebp)
c0105d5c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105d63:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105d67:	75 10                	jne    c0105d79 <number+0xe6>
c0105d69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d6c:	8d 50 01             	lea    0x1(%eax),%edx
c0105d6f:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0105d72:	c6 44 05 c4 30       	movb   $0x30,-0x3c(%ebp,%eax,1)
c0105d77:	eb 35                	jmp    c0105dae <number+0x11b>
c0105d79:	eb 2d                	jmp    c0105da8 <number+0x115>
c0105d7b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105d7e:	8d 41 01             	lea    0x1(%ecx),%eax
c0105d81:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d84:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d87:	ba 00 00 00 00       	mov    $0x0,%edx
c0105d8c:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105d8f:	f7 f3                	div    %ebx
c0105d91:	89 45 0c             	mov    %eax,0xc(%ebp)
c0105d94:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105d97:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d9a:	89 c2                	mov    %eax,%edx
c0105d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d9f:	01 d0                	add    %edx,%eax
c0105da1:	0f b6 00             	movzbl (%eax),%eax
c0105da4:	88 44 0d c4          	mov    %al,-0x3c(%ebp,%ecx,1)
c0105da8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105dac:	75 cd                	jne    c0105d7b <number+0xe8>
c0105dae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105db1:	3b 45 18             	cmp    0x18(%ebp),%eax
c0105db4:	7e 06                	jle    c0105dbc <number+0x129>
c0105db6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105db9:	89 45 18             	mov    %eax,0x18(%ebp)
c0105dbc:	8b 45 18             	mov    0x18(%ebp),%eax
c0105dbf:	29 45 14             	sub    %eax,0x14(%ebp)
c0105dc2:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105dc5:	83 e0 11             	and    $0x11,%eax
c0105dc8:	85 c0                	test   %eax,%eax
c0105dca:	75 1b                	jne    c0105de7 <number+0x154>
c0105dcc:	eb 0c                	jmp    c0105dda <number+0x147>
c0105dce:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dd1:	8d 50 01             	lea    0x1(%eax),%edx
c0105dd4:	89 55 08             	mov    %edx,0x8(%ebp)
c0105dd7:	c6 00 20             	movb   $0x20,(%eax)
c0105dda:	8b 45 14             	mov    0x14(%ebp),%eax
c0105ddd:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105de0:	89 55 14             	mov    %edx,0x14(%ebp)
c0105de3:	85 c0                	test   %eax,%eax
c0105de5:	7f e7                	jg     c0105dce <number+0x13b>
c0105de7:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0105deb:	74 0f                	je     c0105dfc <number+0x169>
c0105ded:	8b 45 08             	mov    0x8(%ebp),%eax
c0105df0:	8d 50 01             	lea    0x1(%eax),%edx
c0105df3:	89 55 08             	mov    %edx,0x8(%ebp)
c0105df6:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0105dfa:	88 10                	mov    %dl,(%eax)
c0105dfc:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105dff:	83 e0 20             	and    $0x20,%eax
c0105e02:	85 c0                	test   %eax,%eax
c0105e04:	74 38                	je     c0105e3e <number+0x1ab>
c0105e06:	83 7d 10 08          	cmpl   $0x8,0x10(%ebp)
c0105e0a:	75 0e                	jne    c0105e1a <number+0x187>
c0105e0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e0f:	8d 50 01             	lea    0x1(%eax),%edx
c0105e12:	89 55 08             	mov    %edx,0x8(%ebp)
c0105e15:	c6 00 30             	movb   $0x30,(%eax)
c0105e18:	eb 24                	jmp    c0105e3e <number+0x1ab>
c0105e1a:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c0105e1e:	75 1e                	jne    c0105e3e <number+0x1ab>
c0105e20:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e23:	8d 50 01             	lea    0x1(%eax),%edx
c0105e26:	89 55 08             	mov    %edx,0x8(%ebp)
c0105e29:	c6 00 30             	movb   $0x30,(%eax)
c0105e2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e2f:	8d 50 01             	lea    0x1(%eax),%edx
c0105e32:	89 55 08             	mov    %edx,0x8(%ebp)
c0105e35:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105e38:	0f b6 52 21          	movzbl 0x21(%edx),%edx
c0105e3c:	88 10                	mov    %dl,(%eax)
c0105e3e:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0105e41:	83 e0 10             	and    $0x10,%eax
c0105e44:	85 c0                	test   %eax,%eax
c0105e46:	75 1e                	jne    c0105e66 <number+0x1d3>
c0105e48:	eb 0f                	jmp    c0105e59 <number+0x1c6>
c0105e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e4d:	8d 50 01             	lea    0x1(%eax),%edx
c0105e50:	89 55 08             	mov    %edx,0x8(%ebp)
c0105e53:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
c0105e57:	88 10                	mov    %dl,(%eax)
c0105e59:	8b 45 14             	mov    0x14(%ebp),%eax
c0105e5c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105e5f:	89 55 14             	mov    %edx,0x14(%ebp)
c0105e62:	85 c0                	test   %eax,%eax
c0105e64:	7f e4                	jg     c0105e4a <number+0x1b7>
c0105e66:	eb 0c                	jmp    c0105e74 <number+0x1e1>
c0105e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e6b:	8d 50 01             	lea    0x1(%eax),%edx
c0105e6e:	89 55 08             	mov    %edx,0x8(%ebp)
c0105e71:	c6 00 30             	movb   $0x30,(%eax)
c0105e74:	8b 45 18             	mov    0x18(%ebp),%eax
c0105e77:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105e7a:	89 55 18             	mov    %edx,0x18(%ebp)
c0105e7d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0105e80:	7f e6                	jg     c0105e68 <number+0x1d5>
c0105e82:	eb 16                	jmp    c0105e9a <number+0x207>
c0105e84:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e87:	8d 50 01             	lea    0x1(%eax),%edx
c0105e8a:	89 55 08             	mov    %edx,0x8(%ebp)
c0105e8d:	8d 4d c4             	lea    -0x3c(%ebp),%ecx
c0105e90:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105e93:	01 ca                	add    %ecx,%edx
c0105e95:	0f b6 12             	movzbl (%edx),%edx
c0105e98:	88 10                	mov    %dl,(%eax)
c0105e9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e9d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105ea0:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0105ea3:	85 c0                	test   %eax,%eax
c0105ea5:	7f dd                	jg     c0105e84 <number+0x1f1>
c0105ea7:	eb 0c                	jmp    c0105eb5 <number+0x222>
c0105ea9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eac:	8d 50 01             	lea    0x1(%eax),%edx
c0105eaf:	89 55 08             	mov    %edx,0x8(%ebp)
c0105eb2:	c6 00 20             	movb   $0x20,(%eax)
c0105eb5:	8b 45 14             	mov    0x14(%ebp),%eax
c0105eb8:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105ebb:	89 55 14             	mov    %edx,0x14(%ebp)
c0105ebe:	85 c0                	test   %eax,%eax
c0105ec0:	7f e7                	jg     c0105ea9 <number+0x216>
c0105ec2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ec5:	83 c4 40             	add    $0x40,%esp
c0105ec8:	5b                   	pop    %ebx
c0105ec9:	5d                   	pop    %ebp
c0105eca:	c3                   	ret    

c0105ecb <vsprintf>:
c0105ecb:	55                   	push   %ebp
c0105ecc:	89 e5                	mov    %esp,%ebp
c0105ece:	83 ec 48             	sub    $0x48,%esp
c0105ed1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ed4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ed7:	e9 14 04 00 00       	jmp    c01062f0 <vsprintf+0x425>
c0105edc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105edf:	0f b6 00             	movzbl (%eax),%eax
c0105ee2:	3c 25                	cmp    $0x25,%al
c0105ee4:	74 16                	je     c0105efc <vsprintf+0x31>
c0105ee6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ee9:	8d 50 01             	lea    0x1(%eax),%edx
c0105eec:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0105eef:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105ef2:	0f b6 12             	movzbl (%edx),%edx
c0105ef5:	88 10                	mov    %dl,(%eax)
c0105ef7:	e9 eb 03 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c0105efc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0105f03:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f06:	83 c0 01             	add    $0x1,%eax
c0105f09:	89 45 0c             	mov    %eax,0xc(%ebp)
c0105f0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f0f:	0f b6 00             	movzbl (%eax),%eax
c0105f12:	0f be c0             	movsbl %al,%eax
c0105f15:	83 e8 20             	sub    $0x20,%eax
c0105f18:	83 f8 10             	cmp    $0x10,%eax
c0105f1b:	77 27                	ja     c0105f44 <vsprintf+0x79>
c0105f1d:	8b 04 85 f4 9f 10 c0 	mov    -0x3fef600c(,%eax,4),%eax
c0105f24:	ff e0                	jmp    *%eax
c0105f26:	83 4d e4 10          	orl    $0x10,-0x1c(%ebp)
c0105f2a:	eb d7                	jmp    c0105f03 <vsprintf+0x38>
c0105f2c:	83 4d e4 04          	orl    $0x4,-0x1c(%ebp)
c0105f30:	eb d1                	jmp    c0105f03 <vsprintf+0x38>
c0105f32:	83 4d e4 08          	orl    $0x8,-0x1c(%ebp)
c0105f36:	eb cb                	jmp    c0105f03 <vsprintf+0x38>
c0105f38:	83 4d e4 20          	orl    $0x20,-0x1c(%ebp)
c0105f3c:	eb c5                	jmp    c0105f03 <vsprintf+0x38>
c0105f3e:	83 4d e4 01          	orl    $0x1,-0x1c(%ebp)
c0105f42:	eb bf                	jmp    c0105f03 <vsprintf+0x38>
c0105f44:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
c0105f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f4e:	0f b6 00             	movzbl (%eax),%eax
c0105f51:	3c 2f                	cmp    $0x2f,%al
c0105f53:	7e 1a                	jle    c0105f6f <vsprintf+0xa4>
c0105f55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f58:	0f b6 00             	movzbl (%eax),%eax
c0105f5b:	3c 39                	cmp    $0x39,%al
c0105f5d:	7f 10                	jg     c0105f6f <vsprintf+0xa4>
c0105f5f:	8d 45 0c             	lea    0xc(%ebp),%eax
c0105f62:	89 04 24             	mov    %eax,(%esp)
c0105f65:	e8 cf fc ff ff       	call   c0105c39 <skip_atoi>
c0105f6a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f6d:	eb 25                	jmp    c0105f94 <vsprintf+0xc9>
c0105f6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f72:	0f b6 00             	movzbl (%eax),%eax
c0105f75:	3c 2a                	cmp    $0x2a,%al
c0105f77:	75 1b                	jne    c0105f94 <vsprintf+0xc9>
c0105f79:	8b 45 10             	mov    0x10(%ebp),%eax
c0105f7c:	8d 50 04             	lea    0x4(%eax),%edx
c0105f7f:	89 55 10             	mov    %edx,0x10(%ebp)
c0105f82:	8b 00                	mov    (%eax),%eax
c0105f84:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f87:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0105f8b:	79 07                	jns    c0105f94 <vsprintf+0xc9>
c0105f8d:	f7 5d e0             	negl   -0x20(%ebp)
c0105f90:	83 4d e4 10          	orl    $0x10,-0x1c(%ebp)
c0105f94:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
c0105f9b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f9e:	0f b6 00             	movzbl (%eax),%eax
c0105fa1:	3c 2e                	cmp    $0x2e,%al
c0105fa3:	75 52                	jne    c0105ff7 <vsprintf+0x12c>
c0105fa5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fa8:	83 c0 01             	add    $0x1,%eax
c0105fab:	89 45 0c             	mov    %eax,0xc(%ebp)
c0105fae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fb1:	0f b6 00             	movzbl (%eax),%eax
c0105fb4:	3c 2f                	cmp    $0x2f,%al
c0105fb6:	7e 1a                	jle    c0105fd2 <vsprintf+0x107>
c0105fb8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fbb:	0f b6 00             	movzbl (%eax),%eax
c0105fbe:	3c 39                	cmp    $0x39,%al
c0105fc0:	7f 10                	jg     c0105fd2 <vsprintf+0x107>
c0105fc2:	8d 45 0c             	lea    0xc(%ebp),%eax
c0105fc5:	89 04 24             	mov    %eax,(%esp)
c0105fc8:	e8 6c fc ff ff       	call   c0105c39 <skip_atoi>
c0105fcd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105fd0:	eb 18                	jmp    c0105fea <vsprintf+0x11f>
c0105fd2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fd5:	0f b6 00             	movzbl (%eax),%eax
c0105fd8:	3c 2a                	cmp    $0x2a,%al
c0105fda:	75 0e                	jne    c0105fea <vsprintf+0x11f>
c0105fdc:	8b 45 10             	mov    0x10(%ebp),%eax
c0105fdf:	8d 50 04             	lea    0x4(%eax),%edx
c0105fe2:	89 55 10             	mov    %edx,0x10(%ebp)
c0105fe5:	8b 00                	mov    (%eax),%eax
c0105fe7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105fea:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0105fee:	79 07                	jns    c0105ff7 <vsprintf+0x12c>
c0105ff0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0105ff7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ffa:	0f b6 00             	movzbl (%eax),%eax
c0105ffd:	3c 68                	cmp    $0x68,%al
c0105fff:	74 14                	je     c0106015 <vsprintf+0x14a>
c0106001:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106004:	0f b6 00             	movzbl (%eax),%eax
c0106007:	3c 6c                	cmp    $0x6c,%al
c0106009:	74 0a                	je     c0106015 <vsprintf+0x14a>
c010600b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010600e:	0f b6 00             	movzbl (%eax),%eax
c0106011:	3c 4c                	cmp    $0x4c,%al
c0106013:	75 09                	jne    c010601e <vsprintf+0x153>
c0106015:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106018:	83 c0 01             	add    $0x1,%eax
c010601b:	89 45 0c             	mov    %eax,0xc(%ebp)
c010601e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106021:	0f b6 00             	movzbl (%eax),%eax
c0106024:	0f be c0             	movsbl %al,%eax
c0106027:	83 e8 58             	sub    $0x58,%eax
c010602a:	83 f8 20             	cmp    $0x20,%eax
c010602d:	0f 87 77 02 00 00    	ja     c01062aa <vsprintf+0x3df>
c0106033:	8b 04 85 38 a0 10 c0 	mov    -0x3fef5fc8(,%eax,4),%eax
c010603a:	ff e0                	jmp    *%eax
c010603c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010603f:	83 e0 10             	and    $0x10,%eax
c0106042:	85 c0                	test   %eax,%eax
c0106044:	75 18                	jne    c010605e <vsprintf+0x193>
c0106046:	eb 0c                	jmp    c0106054 <vsprintf+0x189>
c0106048:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010604b:	8d 50 01             	lea    0x1(%eax),%edx
c010604e:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0106051:	c6 00 20             	movb   $0x20,(%eax)
c0106054:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c0106058:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c010605c:	7f ea                	jg     c0106048 <vsprintf+0x17d>
c010605e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106061:	8d 50 01             	lea    0x1(%eax),%edx
c0106064:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0106067:	8b 55 10             	mov    0x10(%ebp),%edx
c010606a:	8d 4a 04             	lea    0x4(%edx),%ecx
c010606d:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0106070:	8b 12                	mov    (%edx),%edx
c0106072:	88 10                	mov    %dl,(%eax)
c0106074:	eb 0c                	jmp    c0106082 <vsprintf+0x1b7>
c0106076:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106079:	8d 50 01             	lea    0x1(%eax),%edx
c010607c:	89 55 ec             	mov    %edx,-0x14(%ebp)
c010607f:	c6 00 20             	movb   $0x20,(%eax)
c0106082:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
c0106086:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c010608a:	7f ea                	jg     c0106076 <vsprintf+0x1ab>
c010608c:	e9 56 02 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c0106091:	8b 45 10             	mov    0x10(%ebp),%eax
c0106094:	8d 50 04             	lea    0x4(%eax),%edx
c0106097:	89 55 10             	mov    %edx,0x10(%ebp)
c010609a:	8b 00                	mov    (%eax),%eax
c010609c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010609f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01060a2:	89 04 24             	mov    %eax,(%esp)
c01060a5:	e8 51 e4 ff ff       	call   c01044fb <strlen>
c01060aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060ad:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01060b1:	79 08                	jns    c01060bb <vsprintf+0x1f0>
c01060b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01060b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01060b9:	eb 0e                	jmp    c01060c9 <vsprintf+0x1fe>
c01060bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01060be:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01060c1:	7e 06                	jle    c01060c9 <vsprintf+0x1fe>
c01060c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060cc:	83 e0 10             	and    $0x10,%eax
c01060cf:	85 c0                	test   %eax,%eax
c01060d1:	75 1c                	jne    c01060ef <vsprintf+0x224>
c01060d3:	eb 0c                	jmp    c01060e1 <vsprintf+0x216>
c01060d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060d8:	8d 50 01             	lea    0x1(%eax),%edx
c01060db:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01060de:	c6 00 20             	movb   $0x20,(%eax)
c01060e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01060e4:	8d 50 ff             	lea    -0x1(%eax),%edx
c01060e7:	89 55 e0             	mov    %edx,-0x20(%ebp)
c01060ea:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01060ed:	7f e6                	jg     c01060d5 <vsprintf+0x20a>
c01060ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01060f6:	eb 1b                	jmp    c0106113 <vsprintf+0x248>
c01060f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060fb:	8d 50 01             	lea    0x1(%eax),%edx
c01060fe:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0106101:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106104:	8d 4a 01             	lea    0x1(%edx),%ecx
c0106107:	89 4d e8             	mov    %ecx,-0x18(%ebp)
c010610a:	0f b6 12             	movzbl (%edx),%edx
c010610d:	88 10                	mov    %dl,(%eax)
c010610f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0106113:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106116:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0106119:	7c dd                	jl     c01060f8 <vsprintf+0x22d>
c010611b:	eb 0c                	jmp    c0106129 <vsprintf+0x25e>
c010611d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106120:	8d 50 01             	lea    0x1(%eax),%edx
c0106123:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0106126:	c6 00 20             	movb   $0x20,(%eax)
c0106129:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010612c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010612f:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0106132:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0106135:	7f e6                	jg     c010611d <vsprintf+0x252>
c0106137:	e9 ab 01 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c010613c:	8b 45 10             	mov    0x10(%ebp),%eax
c010613f:	8d 50 04             	lea    0x4(%eax),%edx
c0106142:	89 55 10             	mov    %edx,0x10(%ebp)
c0106145:	8b 00                	mov    (%eax),%eax
c0106147:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010614a:	89 54 24 14          	mov    %edx,0x14(%esp)
c010614e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106151:	89 54 24 10          	mov    %edx,0x10(%esp)
c0106155:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106158:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010615c:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
c0106163:	00 
c0106164:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106168:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010616b:	89 04 24             	mov    %eax,(%esp)
c010616e:	e8 20 fb ff ff       	call   c0105c93 <number>
c0106173:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106176:	e9 6c 01 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c010617b:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c010617f:	75 0b                	jne    c010618c <vsprintf+0x2c1>
c0106181:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%ebp)
c0106188:	83 4d e4 01          	orl    $0x1,-0x1c(%ebp)
c010618c:	8b 45 10             	mov    0x10(%ebp),%eax
c010618f:	8d 50 04             	lea    0x4(%eax),%edx
c0106192:	89 55 10             	mov    %edx,0x10(%ebp)
c0106195:	8b 00                	mov    (%eax),%eax
c0106197:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010619a:	89 54 24 14          	mov    %edx,0x14(%esp)
c010619e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01061a1:	89 54 24 10          	mov    %edx,0x10(%esp)
c01061a5:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01061a8:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01061ac:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
c01061b3:	00 
c01061b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01061b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061bb:	89 04 24             	mov    %eax,(%esp)
c01061be:	e8 d0 fa ff ff       	call   c0105c93 <number>
c01061c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01061c6:	e9 1c 01 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c01061cb:	83 4d e4 40          	orl    $0x40,-0x1c(%ebp)
c01061cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01061d2:	8d 50 04             	lea    0x4(%eax),%edx
c01061d5:	89 55 10             	mov    %edx,0x10(%ebp)
c01061d8:	8b 00                	mov    (%eax),%eax
c01061da:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01061dd:	89 54 24 14          	mov    %edx,0x14(%esp)
c01061e1:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01061e4:	89 54 24 10          	mov    %edx,0x10(%esp)
c01061e8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01061eb:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01061ef:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
c01061f6:	00 
c01061f7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01061fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061fe:	89 04 24             	mov    %eax,(%esp)
c0106201:	e8 8d fa ff ff       	call   c0105c93 <number>
c0106206:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106209:	e9 d9 00 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c010620e:	83 4d e4 02          	orl    $0x2,-0x1c(%ebp)
c0106212:	8b 45 10             	mov    0x10(%ebp),%eax
c0106215:	8d 50 04             	lea    0x4(%eax),%edx
c0106218:	89 55 10             	mov    %edx,0x10(%ebp)
c010621b:	8b 00                	mov    (%eax),%eax
c010621d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106220:	89 54 24 14          	mov    %edx,0x14(%esp)
c0106224:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106227:	89 54 24 10          	mov    %edx,0x10(%esp)
c010622b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010622e:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0106232:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0106239:	00 
c010623a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010623e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106241:	89 04 24             	mov    %eax,(%esp)
c0106244:	e8 4a fa ff ff       	call   c0105c93 <number>
c0106249:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010624c:	e9 96 00 00 00       	jmp    c01062e7 <vsprintf+0x41c>
c0106251:	8b 45 10             	mov    0x10(%ebp),%eax
c0106254:	8d 50 04             	lea    0x4(%eax),%edx
c0106257:	89 55 10             	mov    %edx,0x10(%ebp)
c010625a:	8b 00                	mov    (%eax),%eax
c010625c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010625f:	89 54 24 14          	mov    %edx,0x14(%esp)
c0106263:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106266:	89 54 24 10          	mov    %edx,0x10(%esp)
c010626a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010626d:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0106271:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0106278:	00 
c0106279:	89 44 24 04          	mov    %eax,0x4(%esp)
c010627d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106280:	89 04 24             	mov    %eax,(%esp)
c0106283:	e8 0b fa ff ff       	call   c0105c93 <number>
c0106288:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010628b:	eb 5a                	jmp    c01062e7 <vsprintf+0x41c>
c010628d:	8b 45 10             	mov    0x10(%ebp),%eax
c0106290:	8d 50 04             	lea    0x4(%eax),%edx
c0106293:	89 55 10             	mov    %edx,0x10(%ebp)
c0106296:	8b 00                	mov    (%eax),%eax
c0106298:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010629b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010629e:	8b 45 08             	mov    0x8(%ebp),%eax
c01062a1:	29 c2                	sub    %eax,%edx
c01062a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01062a6:	89 10                	mov    %edx,(%eax)
c01062a8:	eb 3d                	jmp    c01062e7 <vsprintf+0x41c>
c01062aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062ad:	0f b6 00             	movzbl (%eax),%eax
c01062b0:	3c 25                	cmp    $0x25,%al
c01062b2:	74 0c                	je     c01062c0 <vsprintf+0x3f5>
c01062b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062b7:	8d 50 01             	lea    0x1(%eax),%edx
c01062ba:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01062bd:	c6 00 25             	movb   $0x25,(%eax)
c01062c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062c3:	0f b6 00             	movzbl (%eax),%eax
c01062c6:	84 c0                	test   %al,%al
c01062c8:	74 13                	je     c01062dd <vsprintf+0x412>
c01062ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062cd:	8d 50 01             	lea    0x1(%eax),%edx
c01062d0:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01062d3:	8b 55 0c             	mov    0xc(%ebp),%edx
c01062d6:	0f b6 12             	movzbl (%edx),%edx
c01062d9:	88 10                	mov    %dl,(%eax)
c01062db:	eb 09                	jmp    c01062e6 <vsprintf+0x41b>
c01062dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062e0:	83 e8 01             	sub    $0x1,%eax
c01062e3:	89 45 0c             	mov    %eax,0xc(%ebp)
c01062e6:	90                   	nop
c01062e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062ea:	83 c0 01             	add    $0x1,%eax
c01062ed:	89 45 0c             	mov    %eax,0xc(%ebp)
c01062f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062f3:	0f b6 00             	movzbl (%eax),%eax
c01062f6:	84 c0                	test   %al,%al
c01062f8:	0f 85 de fb ff ff    	jne    c0105edc <vsprintf+0x11>
c01062fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106301:	c6 00 00             	movb   $0x0,(%eax)
c0106304:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106307:	8b 45 08             	mov    0x8(%ebp),%eax
c010630a:	29 c2                	sub    %eax,%edx
c010630c:	89 d0                	mov    %edx,%eax
c010630e:	c9                   	leave  
c010630f:	c3                   	ret    

c0106310 <enable_intr>:
c0106310:	55                   	push   %ebp
c0106311:	89 e5                	mov    %esp,%ebp
c0106313:	fb                   	sti    
c0106314:	5d                   	pop    %ebp
c0106315:	c3                   	ret    

c0106316 <disable_intr>:
c0106316:	55                   	push   %ebp
c0106317:	89 e5                	mov    %esp,%ebp
c0106319:	fa                   	cli    
c010631a:	5d                   	pop    %ebp
c010631b:	c3                   	ret    

c010631c <read_eflags>:
c010631c:	55                   	push   %ebp
c010631d:	89 e5                	mov    %esp,%ebp
c010631f:	83 ec 10             	sub    $0x10,%esp
c0106322:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106329:	9c                   	pushf  
c010632a:	58                   	pop    %eax
c010632b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010632e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106331:	c9                   	leave  
c0106332:	c3                   	ret    

c0106333 <__intr_store>:
c0106333:	55                   	push   %ebp
c0106334:	89 e5                	mov    %esp,%ebp
c0106336:	e8 e1 ff ff ff       	call   c010631c <read_eflags>
c010633b:	25 00 02 00 00       	and    $0x200,%eax
c0106340:	85 c0                	test   %eax,%eax
c0106342:	74 0c                	je     c0106350 <__intr_store+0x1d>
c0106344:	e8 cd ff ff ff       	call   c0106316 <disable_intr>
c0106349:	b8 01 00 00 00       	mov    $0x1,%eax
c010634e:	eb 05                	jmp    c0106355 <__intr_store+0x22>
c0106350:	b8 00 00 00 00       	mov    $0x0,%eax
c0106355:	5d                   	pop    %ebp
c0106356:	c3                   	ret    

c0106357 <__intr_restore>:
c0106357:	55                   	push   %ebp
c0106358:	89 e5                	mov    %esp,%ebp
c010635a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010635e:	74 05                	je     c0106365 <__intr_restore+0xe>
c0106360:	e8 ab ff ff ff       	call   c0106310 <enable_intr>
c0106365:	5d                   	pop    %ebp
c0106366:	c3                   	ret    

c0106367 <clock_callback>:
c0106367:	55                   	push   %ebp
c0106368:	89 e5                	mov    %esp,%ebp
c010636a:	83 ec 08             	sub    $0x8,%esp
c010636d:	e8 02 00 00 00       	call   c0106374 <schedule>
c0106372:	c9                   	leave  
c0106373:	c3                   	ret    

c0106374 <schedule>:
c0106374:	55                   	push   %ebp
c0106375:	89 e5                	mov    %esp,%ebp
c0106377:	83 ec 28             	sub    $0x28,%esp
c010637a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106381:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106388:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010638f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106396:	e8 98 ff ff ff       	call   c0106333 <__intr_store>
c010639b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010639e:	e8 27 20 00 00       	call   c01083ca <get_current>
c01063a3:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
c01063aa:	e8 1b 20 00 00       	call   c01083ca <get_current>
c01063af:	8b 15 04 b0 11 c0    	mov    0xc011b004,%edx
c01063b5:	39 d0                	cmp    %edx,%eax
c01063b7:	74 0c                	je     c01063c5 <schedule+0x51>
c01063b9:	e8 0c 20 00 00       	call   c01083ca <get_current>
c01063be:	05 68 01 00 00       	add    $0x168,%eax
c01063c3:	eb 05                	jmp    c01063ca <schedule+0x56>
c01063c5:	b8 08 b0 11 c0       	mov    $0xc011b008,%eax
c01063ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01063cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01063d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01063d6:	8b 00                	mov    (%eax),%eax
c01063d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01063db:	eb 28                	jmp    c0106405 <schedule+0x91>
c01063dd:	81 7d f0 08 b0 11 c0 	cmpl   $0xc011b008,-0x10(%ebp)
c01063e4:	74 17                	je     c01063fd <schedule+0x89>
c01063e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01063e9:	2d 68 01 00 00       	sub    $0x168,%eax
c01063ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01063f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01063f4:	8b 00                	mov    (%eax),%eax
c01063f6:	83 f8 02             	cmp    $0x2,%eax
c01063f9:	75 02                	jne    c01063fd <schedule+0x89>
c01063fb:	eb 10                	jmp    c010640d <schedule+0x99>
c01063fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106400:	8b 00                	mov    (%eax),%eax
c0106402:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106405:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106408:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c010640b:	75 d0                	jne    c01063dd <schedule+0x69>
c010640d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106411:	74 0a                	je     c010641d <schedule+0xa9>
c0106413:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106416:	8b 00                	mov    (%eax),%eax
c0106418:	83 f8 02             	cmp    $0x2,%eax
c010641b:	74 08                	je     c0106425 <schedule+0xb1>
c010641d:	a1 04 b0 11 c0       	mov    0xc011b004,%eax
c0106422:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106425:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106428:	8b 40 24             	mov    0x24(%eax),%eax
c010642b:	8d 50 01             	lea    0x1(%eax),%edx
c010642e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106431:	89 50 24             	mov    %edx,0x24(%eax)
c0106434:	e8 91 1f 00 00       	call   c01083ca <get_current>
c0106439:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c010643c:	74 0b                	je     c0106449 <schedule+0xd5>
c010643e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106441:	89 04 24             	mov    %eax,(%esp)
c0106444:	e8 21 1f 00 00       	call   c010836a <task_run>
c0106449:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010644c:	89 04 24             	mov    %eax,(%esp)
c010644f:	e8 03 ff ff ff       	call   c0106357 <__intr_restore>
c0106454:	c9                   	leave  
c0106455:	c3                   	ret    

c0106456 <wakeup_task>:
c0106456:	55                   	push   %ebp
c0106457:	89 e5                	mov    %esp,%ebp
c0106459:	8b 45 08             	mov    0x8(%ebp),%eax
c010645c:	8b 00                	mov    (%eax),%eax
c010645e:	83 f8 03             	cmp    $0x3,%eax
c0106461:	74 09                	je     c010646c <wakeup_task+0x16>
c0106463:	8b 45 08             	mov    0x8(%ebp),%eax
c0106466:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010646c:	5d                   	pop    %ebp
c010646d:	c3                   	ret    

c010646e <enable_intr>:
c010646e:	55                   	push   %ebp
c010646f:	89 e5                	mov    %esp,%ebp
c0106471:	fb                   	sti    
c0106472:	5d                   	pop    %ebp
c0106473:	c3                   	ret    

c0106474 <kern_init>:
c0106474:	55                   	push   %ebp
c0106475:	89 e5                	mov    %esp,%ebp
c0106477:	83 ec 28             	sub    $0x28,%esp
c010647a:	e8 16 0e 00 00       	call   c0107295 <debug_init>
c010647f:	e8 04 1c 00 00       	call   c0108088 <arch_init>
c0106484:	e8 56 c9 ff ff       	call   c0102ddf <mm_init>
c0106489:	e8 d7 1d 00 00       	call   c0108265 <task_init>
c010648e:	e8 5a de ff ff       	call   c01042ed <fs_init>
c0106493:	e8 d6 ff ff ff       	call   c010646e <enable_intr>
c0106498:	e8 55 01 00 00       	call   c01065f2 <kthread_test>
c010649d:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01064a1:	e8 97 f6 ff ff       	call   c0105b3d <getchar>
c01064a6:	88 45 f7             	mov    %al,-0x9(%ebp)
c01064a9:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
c01064ad:	74 28                	je     c01064d7 <kern_init+0x63>
c01064af:	80 7d f7 50          	cmpb   $0x50,-0x9(%ebp)
c01064b3:	75 0e                	jne    c01064c3 <kern_init+0x4f>
c01064b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01064bc:	e8 c3 19 00 00       	call   c0107e84 <console_view_down>
c01064c1:	eb 14                	jmp    c01064d7 <kern_init+0x63>
c01064c3:	80 7d f7 48          	cmpb   $0x48,-0x9(%ebp)
c01064c7:	75 0e                	jne    c01064d7 <kern_init+0x63>
c01064c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01064d0:	e8 72 19 00 00       	call   c0107e47 <console_view_up>
c01064d5:	eb ca                	jmp    c01064a1 <kern_init+0x2d>
c01064d7:	eb c8                	jmp    c01064a1 <kern_init+0x2d>

c01064d9 <init_main>:
c01064d9:	55                   	push   %ebp
c01064da:	89 e5                	mov    %esp,%ebp
c01064dc:	53                   	push   %ebx
c01064dd:	83 ec 34             	sub    $0x34,%esp
c01064e0:	e8 e5 1e 00 00       	call   c01083ca <get_current>
c01064e5:	8b 58 08             	mov    0x8(%eax),%ebx
c01064e8:	e8 dd 1e 00 00       	call   c01083ca <get_current>
c01064ed:	8d 50 0c             	lea    0xc(%eax),%edx
c01064f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01064f3:	89 44 24 14          	mov    %eax,0x14(%esp)
c01064f7:	89 5c 24 10          	mov    %ebx,0x10(%esp)
c01064fb:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01064ff:	c7 44 24 08 bc a0 10 	movl   $0xc010a0bc,0x8(%esp)
c0106506:	c0 
c0106507:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010650e:	00 
c010650f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0106516:	e8 ce f6 ff ff       	call   c0105be9 <cprintk>
c010651b:	c7 44 24 08 e1 a0 10 	movl   $0xc010a0e1,0x8(%esp)
c0106522:	c0 
c0106523:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010652a:	00 
c010652b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0106532:	e8 b2 f6 ff ff       	call   c0105be9 <cprintk>
c0106537:	c7 45 f4 a0 86 01 00 	movl   $0x186a0,-0xc(%ebp)
c010653e:	90                   	nop
c010653f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106542:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106545:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0106548:	85 c0                	test   %eax,%eax
c010654a:	75 f3                	jne    c010653f <init_main+0x66>
c010654c:	eb cd                	jmp    c010651b <init_main+0x42>

c010654e <user_mode_test_main>:
c010654e:	55                   	push   %ebp
c010654f:	89 e5                	mov    %esp,%ebp
c0106551:	53                   	push   %ebx
c0106552:	83 ec 34             	sub    $0x34,%esp
c0106555:	e8 70 1e 00 00       	call   c01083ca <get_current>
c010655a:	8b 58 08             	mov    0x8(%eax),%ebx
c010655d:	e8 68 1e 00 00       	call   c01083ca <get_current>
c0106562:	8d 50 0c             	lea    0xc(%eax),%edx
c0106565:	8b 45 08             	mov    0x8(%ebp),%eax
c0106568:	89 44 24 14          	mov    %eax,0x14(%esp)
c010656c:	89 5c 24 10          	mov    %ebx,0x10(%esp)
c0106570:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0106574:	c7 44 24 08 e4 a0 10 	movl   $0xc010a0e4,0x8(%esp)
c010657b:	c0 
c010657c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106583:	00 
c0106584:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010658b:	e8 59 f6 ff ff       	call   c0105be9 <cprintk>
c0106590:	c7 44 24 08 08 a1 10 	movl   $0xc010a108,0x8(%esp)
c0106597:	c0 
c0106598:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
c010659f:	00 
c01065a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01065a7:	e8 3d f6 ff ff       	call   c0105be9 <cprintk>
c01065ac:	b8 00 00 00 00       	mov    $0x0,%eax
c01065b1:	cd 80                	int    $0x80
c01065b3:	c7 04 24 1c a1 10 c0 	movl   $0xc010a11c,(%esp)
c01065ba:	e8 e8 f5 ff ff       	call   c0105ba7 <printk>
c01065bf:	c7 44 24 08 1e a1 10 	movl   $0xc010a11e,0x8(%esp)
c01065c6:	c0 
c01065c7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c01065ce:	00 
c01065cf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01065d6:	e8 0e f6 ff ff       	call   c0105be9 <cprintk>
c01065db:	c7 45 f4 a0 86 01 00 	movl   $0x186a0,-0xc(%ebp)
c01065e2:	90                   	nop
c01065e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065e6:	8d 50 ff             	lea    -0x1(%eax),%edx
c01065e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01065ec:	85 c0                	test   %eax,%eax
c01065ee:	75 f3                	jne    c01065e3 <user_mode_test_main+0x95>
c01065f0:	eb cd                	jmp    c01065bf <user_mode_test_main+0x71>

c01065f2 <kthread_test>:
c01065f2:	55                   	push   %ebp
c01065f3:	89 e5                	mov    %esp,%ebp
c01065f5:	53                   	push   %ebx
c01065f6:	83 ec 34             	sub    $0x34,%esp
c01065f9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0106600:	00 
c0106601:	c7 44 24 04 20 a1 10 	movl   $0xc010a120,0x4(%esp)
c0106608:	c0 
c0106609:	c7 04 24 4e 65 10 c0 	movl   $0xc010654e,(%esp)
c0106610:	e8 fd 1c 00 00       	call   c0108312 <kernel_thread>
c0106615:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106618:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010661c:	7f 0c                	jg     c010662a <kthread_test+0x38>
c010661e:	c7 04 24 2f a1 10 c0 	movl   $0xc010a12f,(%esp)
c0106625:	e8 98 0d 00 00       	call   c01073c2 <panic>
c010662a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010662d:	89 04 24             	mov    %eax,(%esp)
c0106630:	e8 a1 1d 00 00       	call   c01083d6 <find_task>
c0106635:	a3 00 b0 11 c0       	mov    %eax,0xc011b000
c010663a:	a1 00 b0 11 c0       	mov    0xc011b000,%eax
c010663f:	c7 44 24 04 4c a1 10 	movl   $0xc010a14c,0x4(%esp)
c0106646:	c0 
c0106647:	89 04 24             	mov    %eax,(%esp)
c010664a:	e8 d9 1d 00 00       	call   c0108428 <set_proc_name>
c010664f:	e8 76 1d 00 00       	call   c01083ca <get_current>
c0106654:	8b 58 08             	mov    0x8(%eax),%ebx
c0106657:	e8 6e 1d 00 00       	call   c01083ca <get_current>
c010665c:	83 c0 0c             	add    $0xc,%eax
c010665f:	89 5c 24 10          	mov    %ebx,0x10(%esp)
c0106663:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106667:	c7 44 24 08 5b a1 10 	movl   $0xc010a15b,0x8(%esp)
c010666e:	c0 
c010666f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c0106676:	00 
c0106677:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010667e:	e8 66 f5 ff ff       	call   c0105be9 <cprintk>
c0106683:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010668a:	00 
c010668b:	c7 44 24 04 77 a1 10 	movl   $0xc010a177,0x4(%esp)
c0106692:	c0 
c0106693:	c7 04 24 d9 64 10 c0 	movl   $0xc01064d9,(%esp)
c010669a:	e8 73 1c 00 00       	call   c0108312 <kernel_thread>
c010669f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01066a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01066a6:	7f 0c                	jg     c01066b4 <kthread_test+0xc2>
c01066a8:	c7 04 24 88 a1 10 c0 	movl   $0xc010a188,(%esp)
c01066af:	e8 0e 0d 00 00       	call   c01073c2 <panic>
c01066b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066b7:	89 04 24             	mov    %eax,(%esp)
c01066ba:	e8 17 1d 00 00       	call   c01083d6 <find_task>
c01066bf:	a3 00 b0 11 c0       	mov    %eax,0xc011b000
c01066c4:	a1 00 b0 11 c0       	mov    0xc011b000,%eax
c01066c9:	c7 44 24 04 99 a1 10 	movl   $0xc010a199,0x4(%esp)
c01066d0:	c0 
c01066d1:	89 04 24             	mov    %eax,(%esp)
c01066d4:	e8 4f 1d 00 00       	call   c0108428 <set_proc_name>
c01066d9:	c7 44 24 08 9e a1 10 	movl   $0xc010a19e,0x8(%esp)
c01066e0:	c0 
c01066e1:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c01066e8:	00 
c01066e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01066f0:	e8 f4 f4 ff ff       	call   c0105be9 <cprintk>
c01066f5:	c7 45 f4 a0 86 01 00 	movl   $0x186a0,-0xc(%ebp)
c01066fc:	90                   	nop
c01066fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106700:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106703:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0106706:	85 c0                	test   %eax,%eax
c0106708:	75 f3                	jne    c01066fd <kthread_test+0x10b>
c010670a:	eb cd                	jmp    c01066d9 <kthread_test+0xe7>

c010670c <cpu_hlt>:
c010670c:	55                   	push   %ebp
c010670d:	89 e5                	mov    %esp,%ebp
c010670f:	f4                   	hlt    
c0106710:	5d                   	pop    %ebp
c0106711:	c3                   	ret    

c0106712 <do_page_fault>:
c0106712:	55                   	push   %ebp
c0106713:	89 e5                	mov    %esp,%ebp
c0106715:	83 ec 28             	sub    $0x28,%esp
c0106718:	0f 20 d0             	mov    %cr2,%eax
c010671b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010671e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106721:	8b 40 2c             	mov    0x2c(%eax),%eax
c0106724:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106727:	89 54 24 08          	mov    %edx,0x8(%esp)
c010672b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010672f:	c7 04 24 a0 a1 10 c0 	movl   $0xc010a1a0,(%esp)
c0106736:	e8 6c f4 ff ff       	call   c0105ba7 <printk>
c010673b:	8b 45 08             	mov    0x8(%ebp),%eax
c010673e:	8b 40 28             	mov    0x28(%eax),%eax
c0106741:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106745:	c7 04 24 d8 a1 10 c0 	movl   $0xc010a1d8,(%esp)
c010674c:	e8 56 f4 ff ff       	call   c0105ba7 <printk>
c0106751:	8b 45 08             	mov    0x8(%ebp),%eax
c0106754:	8b 40 28             	mov    0x28(%eax),%eax
c0106757:	83 e0 01             	and    $0x1,%eax
c010675a:	85 c0                	test   %eax,%eax
c010675c:	75 1c                	jne    c010677a <do_page_fault+0x68>
c010675e:	c7 44 24 08 e8 a1 10 	movl   $0xc010a1e8,0x8(%esp)
c0106765:	c0 
c0106766:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010676d:	00 
c010676e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0106775:	e8 6f f4 ff ff       	call   c0105be9 <cprintk>
c010677a:	8b 45 08             	mov    0x8(%ebp),%eax
c010677d:	8b 40 28             	mov    0x28(%eax),%eax
c0106780:	83 e0 02             	and    $0x2,%eax
c0106783:	85 c0                	test   %eax,%eax
c0106785:	74 1e                	je     c01067a5 <do_page_fault+0x93>
c0106787:	c7 44 24 08 0a a2 10 	movl   $0xc010a20a,0x8(%esp)
c010678e:	c0 
c010678f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0106796:	00 
c0106797:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010679e:	e8 46 f4 ff ff       	call   c0105be9 <cprintk>
c01067a3:	eb 1c                	jmp    c01067c1 <do_page_fault+0xaf>
c01067a5:	c7 44 24 08 18 a2 10 	movl   $0xc010a218,0x8(%esp)
c01067ac:	c0 
c01067ad:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c01067b4:	00 
c01067b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01067bc:	e8 28 f4 ff ff       	call   c0105be9 <cprintk>
c01067c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01067c4:	8b 40 28             	mov    0x28(%eax),%eax
c01067c7:	83 e0 04             	and    $0x4,%eax
c01067ca:	85 c0                	test   %eax,%eax
c01067cc:	74 1e                	je     c01067ec <do_page_fault+0xda>
c01067ce:	c7 44 24 08 25 a2 10 	movl   $0xc010a225,0x8(%esp)
c01067d5:	c0 
c01067d6:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c01067dd:	00 
c01067de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01067e5:	e8 ff f3 ff ff       	call   c0105be9 <cprintk>
c01067ea:	eb 1c                	jmp    c0106808 <do_page_fault+0xf6>
c01067ec:	c7 44 24 08 34 a2 10 	movl   $0xc010a234,0x8(%esp)
c01067f3:	c0 
c01067f4:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c01067fb:	00 
c01067fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0106803:	e8 e1 f3 ff ff       	call   c0105be9 <cprintk>
c0106808:	8b 45 08             	mov    0x8(%ebp),%eax
c010680b:	8b 40 28             	mov    0x28(%eax),%eax
c010680e:	83 e0 08             	and    $0x8,%eax
c0106811:	85 c0                	test   %eax,%eax
c0106813:	74 1c                	je     c0106831 <do_page_fault+0x11f>
c0106815:	c7 44 24 08 48 a2 10 	movl   $0xc010a248,0x8(%esp)
c010681c:	c0 
c010681d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0106824:	00 
c0106825:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010682c:	e8 b8 f3 ff ff       	call   c0105be9 <cprintk>
c0106831:	8b 45 08             	mov    0x8(%ebp),%eax
c0106834:	8b 40 28             	mov    0x28(%eax),%eax
c0106837:	83 e0 10             	and    $0x10,%eax
c010683a:	85 c0                	test   %eax,%eax
c010683c:	74 1c                	je     c010685a <do_page_fault+0x148>
c010683e:	c7 44 24 08 6c a2 10 	movl   $0xc010a26c,0x8(%esp)
c0106845:	c0 
c0106846:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010684d:	00 
c010684e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0106855:	e8 8f f3 ff ff       	call   c0105be9 <cprintk>
c010685a:	e8 ad fe ff ff       	call   c010670c <cpu_hlt>
c010685f:	eb f9                	jmp    c010685a <do_page_fault+0x148>

c0106861 <enable_intr>:
c0106861:	55                   	push   %ebp
c0106862:	89 e5                	mov    %esp,%ebp
c0106864:	fb                   	sti    
c0106865:	5d                   	pop    %ebp
c0106866:	c3                   	ret    

c0106867 <disable_intr>:
c0106867:	55                   	push   %ebp
c0106868:	89 e5                	mov    %esp,%ebp
c010686a:	fa                   	cli    
c010686b:	5d                   	pop    %ebp
c010686c:	c3                   	ret    

c010686d <read_eflags>:
c010686d:	55                   	push   %ebp
c010686e:	89 e5                	mov    %esp,%ebp
c0106870:	83 ec 10             	sub    $0x10,%esp
c0106873:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010687a:	9c                   	pushf  
c010687b:	58                   	pop    %eax
c010687c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010687f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106882:	c9                   	leave  
c0106883:	c3                   	ret    

c0106884 <__intr_store>:
c0106884:	55                   	push   %ebp
c0106885:	89 e5                	mov    %esp,%ebp
c0106887:	e8 e1 ff ff ff       	call   c010686d <read_eflags>
c010688c:	25 00 02 00 00       	and    $0x200,%eax
c0106891:	85 c0                	test   %eax,%eax
c0106893:	74 0c                	je     c01068a1 <__intr_store+0x1d>
c0106895:	e8 cd ff ff ff       	call   c0106867 <disable_intr>
c010689a:	b8 01 00 00 00       	mov    $0x1,%eax
c010689f:	eb 05                	jmp    c01068a6 <__intr_store+0x22>
c01068a1:	b8 00 00 00 00       	mov    $0x0,%eax
c01068a6:	5d                   	pop    %ebp
c01068a7:	c3                   	ret    

c01068a8 <__intr_restore>:
c01068a8:	55                   	push   %ebp
c01068a9:	89 e5                	mov    %esp,%ebp
c01068ab:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01068af:	74 05                	je     c01068b6 <__intr_restore+0xe>
c01068b1:	e8 ab ff ff ff       	call   c0106861 <enable_intr>
c01068b6:	5d                   	pop    %ebp
c01068b7:	c3                   	ret    

c01068b8 <pmm_init>:
c01068b8:	55                   	push   %ebp
c01068b9:	89 e5                	mov    %esp,%ebp
c01068bb:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c01068c1:	e8 84 0d 00 00       	call   c010764a <show_kernel_memory_map>
c01068c6:	c7 44 24 04 94 01 00 	movl   $0x194,0x4(%esp)
c01068cd:	00 
c01068ce:	8d 85 64 fe ff ff    	lea    -0x19c(%ebp),%eax
c01068d4:	89 04 24             	mov    %eax,(%esp)
c01068d7:	e8 dc da ff ff       	call   c01043b8 <bzero>
c01068dc:	8d 85 64 fe ff ff    	lea    -0x19c(%ebp),%eax
c01068e2:	89 04 24             	mov    %eax,(%esp)
c01068e5:	e8 27 00 00 00       	call   c0106911 <get_ram_info>
c01068ea:	8d 85 64 fe ff ff    	lea    -0x19c(%ebp),%eax
c01068f0:	89 04 24             	mov    %eax,(%esp)
c01068f3:	e8 32 01 00 00       	call   c0106a2a <phy_pages_init>
c01068f8:	8b 15 40 05 11 c0    	mov    0xc0110540,%edx
c01068fe:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106903:	89 54 24 04          	mov    %edx,0x4(%esp)
c0106907:	89 04 24             	mov    %eax,(%esp)
c010690a:	e8 02 04 00 00       	call   c0106d11 <page_init>
c010690f:	c9                   	leave  
c0106910:	c3                   	ret    

c0106911 <get_ram_info>:
c0106911:	55                   	push   %ebp
c0106912:	89 e5                	mov    %esp,%ebp
c0106914:	53                   	push   %ebx
c0106915:	83 ec 10             	sub    $0x10,%esp
c0106918:	a1 00 90 11 c0       	mov    0xc0119000,%eax
c010691d:	8b 40 30             	mov    0x30(%eax),%eax
c0106920:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106923:	a1 00 90 11 c0       	mov    0xc0119000,%eax
c0106928:	8b 50 2c             	mov    0x2c(%eax),%edx
c010692b:	89 d0                	mov    %edx,%eax
c010692d:	01 c0                	add    %eax,%eax
c010692f:	01 d0                	add    %edx,%eax
c0106931:	c1 e0 03             	shl    $0x3,%eax
c0106934:	89 c2                	mov    %eax,%edx
c0106936:	a1 00 90 11 c0       	mov    0xc0119000,%eax
c010693b:	8b 40 30             	mov    0x30(%eax),%eax
c010693e:	01 d0                	add    %edx,%eax
c0106940:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106943:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106946:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106949:	e9 ca 00 00 00       	jmp    c0106a18 <get_ram_info+0x107>
c010694e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0106951:	8b 40 14             	mov    0x14(%eax),%eax
c0106954:	83 f8 01             	cmp    $0x1,%eax
c0106957:	0f 85 b7 00 00 00    	jne    c0106a14 <get_ram_info+0x103>
c010695d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0106960:	8b 40 04             	mov    0x4(%eax),%eax
c0106963:	3d 00 00 10 00       	cmp    $0x100000,%eax
c0106968:	0f 85 a6 00 00 00    	jne    c0106a14 <get_ram_info+0x103>
c010696e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106971:	8b 10                	mov    (%eax),%edx
c0106973:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0106976:	8b 48 04             	mov    0x4(%eax),%ecx
c0106979:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010697c:	89 d0                	mov    %edx,%eax
c010697e:	c1 e0 02             	shl    $0x2,%eax
c0106981:	01 d0                	add    %edx,%eax
c0106983:	c1 e0 02             	shl    $0x2,%eax
c0106986:	01 d8                	add    %ebx,%eax
c0106988:	83 c0 04             	add    $0x4,%eax
c010698b:	89 08                	mov    %ecx,(%eax)
c010698d:	8b 45 08             	mov    0x8(%ebp),%eax
c0106990:	8b 10                	mov    (%eax),%edx
c0106992:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0106995:	8b 48 08             	mov    0x8(%eax),%ecx
c0106998:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010699b:	89 d0                	mov    %edx,%eax
c010699d:	c1 e0 02             	shl    $0x2,%eax
c01069a0:	01 d0                	add    %edx,%eax
c01069a2:	c1 e0 02             	shl    $0x2,%eax
c01069a5:	01 d8                	add    %ebx,%eax
c01069a7:	83 c0 08             	add    $0x8,%eax
c01069aa:	89 08                	mov    %ecx,(%eax)
c01069ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01069af:	8b 10                	mov    (%eax),%edx
c01069b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01069b4:	8b 48 0c             	mov    0xc(%eax),%ecx
c01069b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01069ba:	89 d0                	mov    %edx,%eax
c01069bc:	c1 e0 02             	shl    $0x2,%eax
c01069bf:	01 d0                	add    %edx,%eax
c01069c1:	c1 e0 02             	shl    $0x2,%eax
c01069c4:	01 d8                	add    %ebx,%eax
c01069c6:	83 c0 0c             	add    $0xc,%eax
c01069c9:	89 08                	mov    %ecx,(%eax)
c01069cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01069ce:	8b 10                	mov    (%eax),%edx
c01069d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01069d3:	8b 48 10             	mov    0x10(%eax),%ecx
c01069d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01069d9:	89 d0                	mov    %edx,%eax
c01069db:	c1 e0 02             	shl    $0x2,%eax
c01069de:	01 d0                	add    %edx,%eax
c01069e0:	c1 e0 02             	shl    $0x2,%eax
c01069e3:	01 d8                	add    %ebx,%eax
c01069e5:	83 c0 10             	add    $0x10,%eax
c01069e8:	89 08                	mov    %ecx,(%eax)
c01069ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01069ed:	8b 10                	mov    (%eax),%edx
c01069ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01069f2:	89 d0                	mov    %edx,%eax
c01069f4:	c1 e0 02             	shl    $0x2,%eax
c01069f7:	01 d0                	add    %edx,%eax
c01069f9:	c1 e0 02             	shl    $0x2,%eax
c01069fc:	01 c8                	add    %ecx,%eax
c01069fe:	83 c0 14             	add    $0x14,%eax
c0106a01:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0106a07:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a0a:	8b 00                	mov    (%eax),%eax
c0106a0c:	8d 50 01             	lea    0x1(%eax),%edx
c0106a0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a12:	89 10                	mov    %edx,(%eax)
c0106a14:	83 45 f8 18          	addl   $0x18,-0x8(%ebp)
c0106a18:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0106a1b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0106a1e:	0f 82 2a ff ff ff    	jb     c010694e <get_ram_info+0x3d>
c0106a24:	83 c4 10             	add    $0x10,%esp
c0106a27:	5b                   	pop    %ebx
c0106a28:	5d                   	pop    %ebp
c0106a29:	c3                   	ret    

c0106a2a <phy_pages_init>:
c0106a2a:	55                   	push   %ebp
c0106a2b:	89 e5                	mov    %esp,%ebp
c0106a2d:	53                   	push   %ebx
c0106a2e:	83 ec 34             	sub    $0x34,%esp
c0106a31:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106a38:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106a3f:	eb 7e                	jmp    c0106abf <phy_pages_init+0x95>
c0106a41:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106a44:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106a47:	89 d0                	mov    %edx,%eax
c0106a49:	c1 e0 02             	shl    $0x2,%eax
c0106a4c:	01 d0                	add    %edx,%eax
c0106a4e:	c1 e0 02             	shl    $0x2,%eax
c0106a51:	01 c8                	add    %ecx,%eax
c0106a53:	83 c0 04             	add    $0x4,%eax
c0106a56:	8b 00                	mov    (%eax),%eax
c0106a58:	3d 00 00 00 38       	cmp    $0x38000000,%eax
c0106a5d:	76 02                	jbe    c0106a61 <phy_pages_init+0x37>
c0106a5f:	eb 6c                	jmp    c0106acd <phy_pages_init+0xa3>
c0106a61:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106a64:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106a67:	89 d0                	mov    %edx,%eax
c0106a69:	c1 e0 02             	shl    $0x2,%eax
c0106a6c:	01 d0                	add    %edx,%eax
c0106a6e:	c1 e0 02             	shl    $0x2,%eax
c0106a71:	01 c8                	add    %ecx,%eax
c0106a73:	83 c0 04             	add    $0x4,%eax
c0106a76:	8b 08                	mov    (%eax),%ecx
c0106a78:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106a7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106a7e:	89 d0                	mov    %edx,%eax
c0106a80:	c1 e0 02             	shl    $0x2,%eax
c0106a83:	01 d0                	add    %edx,%eax
c0106a85:	c1 e0 02             	shl    $0x2,%eax
c0106a88:	01 d8                	add    %ebx,%eax
c0106a8a:	83 c0 0c             	add    $0xc,%eax
c0106a8d:	8b 00                	mov    (%eax),%eax
c0106a8f:	01 c8                	add    %ecx,%eax
c0106a91:	3d 00 00 00 38       	cmp    $0x38000000,%eax
c0106a96:	76 09                	jbe    c0106aa1 <phy_pages_init+0x77>
c0106a98:	c7 45 f4 00 00 00 38 	movl   $0x38000000,-0xc(%ebp)
c0106a9f:	eb 2c                	jmp    c0106acd <phy_pages_init+0xa3>
c0106aa1:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106aa4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106aa7:	89 d0                	mov    %edx,%eax
c0106aa9:	c1 e0 02             	shl    $0x2,%eax
c0106aac:	01 d0                	add    %edx,%eax
c0106aae:	c1 e0 02             	shl    $0x2,%eax
c0106ab1:	01 c8                	add    %ecx,%eax
c0106ab3:	83 c0 0c             	add    $0xc,%eax
c0106ab6:	8b 00                	mov    (%eax),%eax
c0106ab8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106abb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0106abf:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ac2:	8b 00                	mov    (%eax),%eax
c0106ac4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0106ac7:	0f 87 74 ff ff ff    	ja     c0106a41 <phy_pages_init+0x17>
c0106acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ad0:	c1 e8 0c             	shr    $0xc,%eax
c0106ad3:	89 c2                	mov    %eax,%edx
c0106ad5:	89 d0                	mov    %edx,%eax
c0106ad7:	c1 e0 02             	shl    $0x2,%eax
c0106ada:	01 d0                	add    %edx,%eax
c0106adc:	c1 e0 02             	shl    $0x2,%eax
c0106adf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106ae2:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106ae7:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106aea:	89 54 24 04          	mov    %edx,0x4(%esp)
c0106aee:	89 04 24             	mov    %eax,(%esp)
c0106af1:	e8 c2 d8 ff ff       	call   c01043b8 <bzero>
c0106af6:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106afb:	89 c2                	mov    %eax,%edx
c0106afd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106b00:	01 d0                	add    %edx,%eax
c0106b02:	05 00 10 00 40       	add    $0x40001000,%eax
c0106b07:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106b0c:	a3 44 05 11 c0       	mov    %eax,0xc0110544
c0106b11:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106b18:	e9 9f 00 00 00       	jmp    c0106bbc <phy_pages_init+0x192>
c0106b1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106b20:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106b23:	89 d0                	mov    %edx,%eax
c0106b25:	c1 e0 02             	shl    $0x2,%eax
c0106b28:	01 d0                	add    %edx,%eax
c0106b2a:	c1 e0 02             	shl    $0x2,%eax
c0106b2d:	01 c8                	add    %ecx,%eax
c0106b2f:	83 c0 04             	add    $0x4,%eax
c0106b32:	8b 00                	mov    (%eax),%eax
c0106b34:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b37:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106b3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106b3d:	89 d0                	mov    %edx,%eax
c0106b3f:	c1 e0 02             	shl    $0x2,%eax
c0106b42:	01 d0                	add    %edx,%eax
c0106b44:	c1 e0 02             	shl    $0x2,%eax
c0106b47:	01 c8                	add    %ecx,%eax
c0106b49:	83 c0 04             	add    $0x4,%eax
c0106b4c:	8b 08                	mov    (%eax),%ecx
c0106b4e:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106b51:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106b54:	89 d0                	mov    %edx,%eax
c0106b56:	c1 e0 02             	shl    $0x2,%eax
c0106b59:	01 d0                	add    %edx,%eax
c0106b5b:	c1 e0 02             	shl    $0x2,%eax
c0106b5e:	01 d8                	add    %ebx,%eax
c0106b60:	83 c0 0c             	add    $0xc,%eax
c0106b63:	8b 00                	mov    (%eax),%eax
c0106b65:	01 c8                	add    %ecx,%eax
c0106b67:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106b6a:	a1 44 05 11 c0       	mov    0xc0110544,%eax
c0106b6f:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0106b72:	73 08                	jae    c0106b7c <phy_pages_init+0x152>
c0106b74:	a1 44 05 11 c0       	mov    0xc0110544,%eax
c0106b79:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b7c:	81 7d e4 00 00 00 38 	cmpl   $0x38000000,-0x1c(%ebp)
c0106b83:	76 07                	jbe    c0106b8c <phy_pages_init+0x162>
c0106b85:	c7 45 e4 00 00 00 38 	movl   $0x38000000,-0x1c(%ebp)
c0106b8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b8f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b92:	eb 14                	jmp    c0106ba8 <phy_pages_init+0x17e>
c0106b94:	a1 40 05 11 c0       	mov    0xc0110540,%eax
c0106b99:	83 c0 01             	add    $0x1,%eax
c0106b9c:	a3 40 05 11 c0       	mov    %eax,0xc0110540
c0106ba1:	81 45 e0 00 10 00 00 	addl   $0x1000,-0x20(%ebp)
c0106ba8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106bab:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c0106bae:	72 e4                	jb     c0106b94 <phy_pages_init+0x16a>
c0106bb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106bb3:	a3 48 05 11 c0       	mov    %eax,0xc0110548
c0106bb8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0106bbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0106bbf:	8b 00                	mov    (%eax),%eax
c0106bc1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0106bc4:	0f 87 53 ff ff ff    	ja     c0106b1d <phy_pages_init+0xf3>
c0106bca:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106bcf:	89 04 24             	mov    %eax,(%esp)
c0106bd2:	e8 fc 00 00 00       	call   c0106cd3 <page_to_addr>
c0106bd7:	8b 15 44 05 11 c0    	mov    0xc0110544,%edx
c0106bdd:	39 d0                	cmp    %edx,%eax
c0106bdf:	74 0c                	je     c0106bed <phy_pages_init+0x1c3>
c0106be1:	c7 04 24 a0 a2 10 c0 	movl   $0xc010a2a0,(%esp)
c0106be8:	e8 d5 07 00 00       	call   c01073c2 <panic>
c0106bed:	a1 48 05 11 c0       	mov    0xc0110548,%eax
c0106bf2:	8d 98 00 f0 ff ff    	lea    -0x1000(%eax),%ebx
c0106bf8:	8b 0d 88 92 10 c0    	mov    0xc0109288,%ecx
c0106bfe:	8b 15 40 05 11 c0    	mov    0xc0110540,%edx
c0106c04:	89 d0                	mov    %edx,%eax
c0106c06:	c1 e0 02             	shl    $0x2,%eax
c0106c09:	01 d0                	add    %edx,%eax
c0106c0b:	c1 e0 02             	shl    $0x2,%eax
c0106c0e:	83 e8 14             	sub    $0x14,%eax
c0106c11:	01 c8                	add    %ecx,%eax
c0106c13:	89 04 24             	mov    %eax,(%esp)
c0106c16:	e8 b8 00 00 00       	call   c0106cd3 <page_to_addr>
c0106c1b:	39 c3                	cmp    %eax,%ebx
c0106c1d:	74 0c                	je     c0106c2b <phy_pages_init+0x201>
c0106c1f:	c7 04 24 cc a2 10 c0 	movl   $0xc010a2cc,(%esp)
c0106c26:	e8 97 07 00 00       	call   c01073c2 <panic>
c0106c2b:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106c30:	89 04 24             	mov    %eax,(%esp)
c0106c33:	e8 9b 00 00 00       	call   c0106cd3 <page_to_addr>
c0106c38:	89 04 24             	mov    %eax,(%esp)
c0106c3b:	e8 4c 00 00 00       	call   c0106c8c <addr_to_page>
c0106c40:	8b 15 88 92 10 c0    	mov    0xc0109288,%edx
c0106c46:	39 d0                	cmp    %edx,%eax
c0106c48:	74 0c                	je     c0106c56 <phy_pages_init+0x22c>
c0106c4a:	c7 04 24 f8 a2 10 c0 	movl   $0xc010a2f8,(%esp)
c0106c51:	e8 6c 07 00 00       	call   c01073c2 <panic>
c0106c56:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106c5b:	8d 58 14             	lea    0x14(%eax),%ebx
c0106c5e:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106c63:	83 c0 14             	add    $0x14,%eax
c0106c66:	89 04 24             	mov    %eax,(%esp)
c0106c69:	e8 65 00 00 00       	call   c0106cd3 <page_to_addr>
c0106c6e:	89 04 24             	mov    %eax,(%esp)
c0106c71:	e8 16 00 00 00       	call   c0106c8c <addr_to_page>
c0106c76:	39 c3                	cmp    %eax,%ebx
c0106c78:	74 0c                	je     c0106c86 <phy_pages_init+0x25c>
c0106c7a:	c7 04 24 f8 a2 10 c0 	movl   $0xc010a2f8,(%esp)
c0106c81:	e8 3c 07 00 00       	call   c01073c2 <panic>
c0106c86:	83 c4 34             	add    $0x34,%esp
c0106c89:	5b                   	pop    %ebx
c0106c8a:	5d                   	pop    %ebp
c0106c8b:	c3                   	ret    

c0106c8c <addr_to_page>:
c0106c8c:	55                   	push   %ebp
c0106c8d:	89 e5                	mov    %esp,%ebp
c0106c8f:	83 ec 18             	sub    $0x18,%esp
c0106c92:	a1 44 05 11 c0       	mov    0xc0110544,%eax
c0106c97:	85 c0                	test   %eax,%eax
c0106c99:	75 0c                	jne    c0106ca7 <addr_to_page+0x1b>
c0106c9b:	c7 04 24 20 a3 10 c0 	movl   $0xc010a320,(%esp)
c0106ca2:	e8 1b 07 00 00       	call   c01073c2 <panic>
c0106ca7:	8b 0d 88 92 10 c0    	mov    0xc0109288,%ecx
c0106cad:	8b 45 08             	mov    0x8(%ebp),%eax
c0106cb0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106cb5:	89 c2                	mov    %eax,%edx
c0106cb7:	a1 44 05 11 c0       	mov    0xc0110544,%eax
c0106cbc:	29 c2                	sub    %eax,%edx
c0106cbe:	89 d0                	mov    %edx,%eax
c0106cc0:	c1 e8 0c             	shr    $0xc,%eax
c0106cc3:	89 c2                	mov    %eax,%edx
c0106cc5:	89 d0                	mov    %edx,%eax
c0106cc7:	c1 e0 02             	shl    $0x2,%eax
c0106cca:	01 d0                	add    %edx,%eax
c0106ccc:	c1 e0 02             	shl    $0x2,%eax
c0106ccf:	01 c8                	add    %ecx,%eax
c0106cd1:	c9                   	leave  
c0106cd2:	c3                   	ret    

c0106cd3 <page_to_addr>:
c0106cd3:	55                   	push   %ebp
c0106cd4:	89 e5                	mov    %esp,%ebp
c0106cd6:	83 ec 18             	sub    $0x18,%esp
c0106cd9:	a1 44 05 11 c0       	mov    0xc0110544,%eax
c0106cde:	85 c0                	test   %eax,%eax
c0106ce0:	75 0c                	jne    c0106cee <page_to_addr+0x1b>
c0106ce2:	c7 04 24 20 a3 10 c0 	movl   $0xc010a320,(%esp)
c0106ce9:	e8 d4 06 00 00       	call   c01073c2 <panic>
c0106cee:	8b 55 08             	mov    0x8(%ebp),%edx
c0106cf1:	a1 88 92 10 c0       	mov    0xc0109288,%eax
c0106cf6:	29 c2                	sub    %eax,%edx
c0106cf8:	89 d0                	mov    %edx,%eax
c0106cfa:	c1 f8 02             	sar    $0x2,%eax
c0106cfd:	69 c0 cd cc cc cc    	imul   $0xcccccccd,%eax,%eax
c0106d03:	c1 e0 0c             	shl    $0xc,%eax
c0106d06:	89 c2                	mov    %eax,%edx
c0106d08:	a1 44 05 11 c0       	mov    0xc0110544,%eax
c0106d0d:	01 d0                	add    %edx,%eax
c0106d0f:	c9                   	leave  
c0106d10:	c3                   	ret    

c0106d11 <page_init>:
c0106d11:	55                   	push   %ebp
c0106d12:	89 e5                	mov    %esp,%ebp
c0106d14:	83 ec 18             	sub    $0x18,%esp
c0106d17:	a1 84 92 10 c0       	mov    0xc0109284,%eax
c0106d1c:	8b 40 04             	mov    0x4(%eax),%eax
c0106d1f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106d22:	89 54 24 04          	mov    %edx,0x4(%esp)
c0106d26:	8b 55 08             	mov    0x8(%ebp),%edx
c0106d29:	89 14 24             	mov    %edx,(%esp)
c0106d2c:	ff d0                	call   *%eax
c0106d2e:	c9                   	leave  
c0106d2f:	c3                   	ret    

c0106d30 <alloc_pages>:
c0106d30:	55                   	push   %ebp
c0106d31:	89 e5                	mov    %esp,%ebp
c0106d33:	83 ec 28             	sub    $0x28,%esp
c0106d36:	e8 49 fb ff ff       	call   c0106884 <__intr_store>
c0106d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106d3e:	a1 84 92 10 c0       	mov    0xc0109284,%eax
c0106d43:	8b 40 08             	mov    0x8(%eax),%eax
c0106d46:	8b 55 08             	mov    0x8(%ebp),%edx
c0106d49:	89 14 24             	mov    %edx,(%esp)
c0106d4c:	ff d0                	call   *%eax
c0106d4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d54:	89 04 24             	mov    %eax,(%esp)
c0106d57:	e8 4c fb ff ff       	call   c01068a8 <__intr_restore>
c0106d5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106d5f:	c9                   	leave  
c0106d60:	c3                   	ret    

c0106d61 <free_pages>:
c0106d61:	55                   	push   %ebp
c0106d62:	89 e5                	mov    %esp,%ebp
c0106d64:	83 ec 28             	sub    $0x28,%esp
c0106d67:	e8 18 fb ff ff       	call   c0106884 <__intr_store>
c0106d6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106d6f:	a1 84 92 10 c0       	mov    0xc0109284,%eax
c0106d74:	8b 40 0c             	mov    0xc(%eax),%eax
c0106d77:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106d7a:	89 54 24 04          	mov    %edx,0x4(%esp)
c0106d7e:	8b 55 08             	mov    0x8(%ebp),%edx
c0106d81:	89 14 24             	mov    %edx,(%esp)
c0106d84:	ff d0                	call   *%eax
c0106d86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d89:	89 04 24             	mov    %eax,(%esp)
c0106d8c:	e8 17 fb ff ff       	call   c01068a8 <__intr_restore>
c0106d91:	c9                   	leave  
c0106d92:	c3                   	ret    

c0106d93 <free_pages_count>:
c0106d93:	55                   	push   %ebp
c0106d94:	89 e5                	mov    %esp,%ebp
c0106d96:	83 ec 08             	sub    $0x8,%esp
c0106d99:	a1 84 92 10 c0       	mov    0xc0109284,%eax
c0106d9e:	8b 40 10             	mov    0x10(%eax),%eax
c0106da1:	ff d0                	call   *%eax
c0106da3:	c9                   	leave  
c0106da4:	c3                   	ret    

c0106da5 <gdt_set_gate>:
c0106da5:	55                   	push   %ebp
c0106da6:	89 e5                	mov    %esp,%ebp
c0106da8:	83 ec 08             	sub    $0x8,%esp
c0106dab:	8b 55 14             	mov    0x14(%ebp),%edx
c0106dae:	8b 45 18             	mov    0x18(%ebp),%eax
c0106db1:	88 55 fc             	mov    %dl,-0x4(%ebp)
c0106db4:	88 45 f8             	mov    %al,-0x8(%ebp)
c0106db7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106dba:	89 c2                	mov    %eax,%edx
c0106dbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0106dbf:	66 89 14 c5 52 05 11 	mov    %dx,-0x3feefaae(,%eax,8)
c0106dc6:	c0 
c0106dc7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106dca:	c1 e8 10             	shr    $0x10,%eax
c0106dcd:	89 c2                	mov    %eax,%edx
c0106dcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0106dd2:	88 14 c5 54 05 11 c0 	mov    %dl,-0x3feefaac(,%eax,8)
c0106dd9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ddc:	c1 e8 18             	shr    $0x18,%eax
c0106ddf:	89 c2                	mov    %eax,%edx
c0106de1:	8b 45 08             	mov    0x8(%ebp),%eax
c0106de4:	88 14 c5 57 05 11 c0 	mov    %dl,-0x3feefaa9(,%eax,8)
c0106deb:	8b 45 10             	mov    0x10(%ebp),%eax
c0106dee:	89 c2                	mov    %eax,%edx
c0106df0:	8b 45 08             	mov    0x8(%ebp),%eax
c0106df3:	66 89 14 c5 50 05 11 	mov    %dx,-0x3feefab0(,%eax,8)
c0106dfa:	c0 
c0106dfb:	8b 45 10             	mov    0x10(%ebp),%eax
c0106dfe:	c1 e8 10             	shr    $0x10,%eax
c0106e01:	83 e0 0f             	and    $0xf,%eax
c0106e04:	89 c2                	mov    %eax,%edx
c0106e06:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e09:	88 14 c5 56 05 11 c0 	mov    %dl,-0x3feefaaa(,%eax,8)
c0106e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e13:	0f b6 04 c5 56 05 11 	movzbl -0x3feefaaa(,%eax,8),%eax
c0106e1a:	c0 
c0106e1b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0106e1f:	83 e2 f0             	and    $0xfffffff0,%edx
c0106e22:	09 d0                	or     %edx,%eax
c0106e24:	89 c2                	mov    %eax,%edx
c0106e26:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e29:	88 14 c5 56 05 11 c0 	mov    %dl,-0x3feefaaa(,%eax,8)
c0106e30:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e33:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0106e37:	88 14 c5 55 05 11 c0 	mov    %dl,-0x3feefaab(,%eax,8)
c0106e3e:	c9                   	leave  
c0106e3f:	c3                   	ret    

c0106e40 <tss_set_gate>:
c0106e40:	55                   	push   %ebp
c0106e41:	89 e5                	mov    %esp,%ebp
c0106e43:	83 ec 28             	sub    $0x28,%esp
c0106e46:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106e49:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c0106e4d:	c7 45 fc 80 05 11 c0 	movl   $0xc0110580,-0x4(%ebp)
c0106e54:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e57:	83 c0 68             	add    $0x68,%eax
c0106e5a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106e5d:	c7 44 24 10 40 00 00 	movl   $0x40,0x10(%esp)
c0106e64:	00 
c0106e65:	c7 44 24 0c 89 00 00 	movl   $0x89,0xc(%esp)
c0106e6c:	00 
c0106e6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0106e70:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e74:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e77:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106e7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e7e:	89 04 24             	mov    %eax,(%esp)
c0106e81:	e8 1f ff ff ff       	call   c0106da5 <gdt_set_gate>
c0106e86:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0106e8a:	66 a3 88 05 11 c0    	mov    %ax,0xc0110588
c0106e90:	8b 45 10             	mov    0x10(%ebp),%eax
c0106e93:	a3 84 05 11 c0       	mov    %eax,0xc0110584
c0106e98:	66 c7 05 cc 05 11 c0 	movw   $0x1b,0xc01105cc
c0106e9f:	1b 00 
c0106ea1:	66 c7 05 d0 05 11 c0 	movw   $0x23,0xc01105d0
c0106ea8:	23 00 
c0106eaa:	66 c7 05 d4 05 11 c0 	movw   $0x23,0xc01105d4
c0106eb1:	23 00 
c0106eb3:	66 c7 05 c8 05 11 c0 	movw   $0x23,0xc01105c8
c0106eba:	23 00 
c0106ebc:	66 c7 05 d8 05 11 c0 	movw   $0x23,0xc01105d8
c0106ec3:	23 00 
c0106ec5:	66 c7 05 dc 05 11 c0 	movw   $0x23,0xc01105dc
c0106ecc:	23 00 
c0106ece:	c9                   	leave  
c0106ecf:	c3                   	ret    

c0106ed0 <gdt_init>:
c0106ed0:	55                   	push   %ebp
c0106ed1:	89 e5                	mov    %esp,%ebp
c0106ed3:	83 ec 28             	sub    $0x28,%esp
c0106ed6:	66 c7 05 e8 05 11 c0 	movw   $0x2f,0xc01105e8
c0106edd:	2f 00 
c0106edf:	b8 50 05 11 c0       	mov    $0xc0110550,%eax
c0106ee4:	a3 ea 05 11 c0       	mov    %eax,0xc01105ea
c0106ee9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
c0106ef0:	00 
c0106ef1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0106ef8:	00 
c0106ef9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0106f00:	00 
c0106f01:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106f08:	00 
c0106f09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0106f10:	e8 90 fe ff ff       	call   c0106da5 <gdt_set_gate>
c0106f15:	c7 44 24 10 c0 00 00 	movl   $0xc0,0x10(%esp)
c0106f1c:	00 
c0106f1d:	c7 44 24 0c 9a 00 00 	movl   $0x9a,0xc(%esp)
c0106f24:	00 
c0106f25:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
c0106f2c:	ff 
c0106f2d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106f34:	00 
c0106f35:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0106f3c:	e8 64 fe ff ff       	call   c0106da5 <gdt_set_gate>
c0106f41:	c7 44 24 10 c0 00 00 	movl   $0xc0,0x10(%esp)
c0106f48:	00 
c0106f49:	c7 44 24 0c 92 00 00 	movl   $0x92,0xc(%esp)
c0106f50:	00 
c0106f51:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
c0106f58:	ff 
c0106f59:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106f60:	00 
c0106f61:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c0106f68:	e8 38 fe ff ff       	call   c0106da5 <gdt_set_gate>
c0106f6d:	c7 44 24 10 c0 00 00 	movl   $0xc0,0x10(%esp)
c0106f74:	00 
c0106f75:	c7 44 24 0c fa 00 00 	movl   $0xfa,0xc(%esp)
c0106f7c:	00 
c0106f7d:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
c0106f84:	ff 
c0106f85:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106f8c:	00 
c0106f8d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0106f94:	e8 0c fe ff ff       	call   c0106da5 <gdt_set_gate>
c0106f99:	c7 44 24 10 c0 00 00 	movl   $0xc0,0x10(%esp)
c0106fa0:	00 
c0106fa1:	c7 44 24 0c f2 00 00 	movl   $0xf2,0xc(%esp)
c0106fa8:	00 
c0106fa9:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
c0106fb0:	ff 
c0106fb1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106fb8:	00 
c0106fb9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0106fc0:	e8 e0 fd ff ff       	call   c0106da5 <gdt_set_gate>
c0106fc5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0106fcc:	00 
c0106fcd:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0106fd4:	00 
c0106fd5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0106fdc:	e8 5f fe ff ff       	call   c0106e40 <tss_set_gate>
c0106fe1:	b8 e8 05 11 c0       	mov    $0xc01105e8,%eax
c0106fe6:	89 04 24             	mov    %eax,(%esp)
c0106fe9:	e8 12 b0 ff ff       	call   c0102000 <gdt_flush>
c0106fee:	e8 2a b0 ff ff       	call   c010201d <tss_flush>
c0106ff3:	c9                   	leave  
c0106ff4:	c3                   	ret    

c0106ff5 <switch_pgd>:
c0106ff5:	55                   	push   %ebp
c0106ff6:	89 e5                	mov    %esp,%ebp
c0106ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ffb:	0f 22 d8             	mov    %eax,%cr3
c0106ffe:	5d                   	pop    %ebp
c0106fff:	c3                   	ret    

c0107000 <tlb_reload_page>:
c0107000:	55                   	push   %ebp
c0107001:	89 e5                	mov    %esp,%ebp
c0107003:	8b 45 08             	mov    0x8(%ebp),%eax
c0107006:	0f 01 38             	invlpg (%eax)
c0107009:	5d                   	pop    %ebp
c010700a:	c3                   	ret    

c010700b <pa_to_ka>:
c010700b:	55                   	push   %ebp
c010700c:	89 e5                	mov    %esp,%ebp
c010700e:	8b 45 08             	mov    0x8(%ebp),%eax
c0107011:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0107016:	5d                   	pop    %ebp
c0107017:	c3                   	ret    

c0107018 <ka_to_pa>:
c0107018:	55                   	push   %ebp
c0107019:	89 e5                	mov    %esp,%ebp
c010701b:	8b 45 08             	mov    0x8(%ebp),%eax
c010701e:	05 00 00 00 40       	add    $0x40000000,%eax
c0107023:	5d                   	pop    %ebp
c0107024:	c3                   	ret    

c0107025 <vmm_init>:
c0107025:	55                   	push   %ebp
c0107026:	89 e5                	mov    %esp,%ebp
c0107028:	83 ec 38             	sub    $0x38,%esp
c010702b:	c7 44 24 04 12 67 10 	movl   $0xc0106712,0x4(%esp)
c0107032:	c0 
c0107033:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
c010703a:	e8 8e 08 00 00       	call   c01078cd <register_interrupt_handler>
c010703f:	a1 8c 92 10 c0       	mov    0xc010928c,%eax
c0107044:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107047:	c7 45 e8 00 03 00 00 	movl   $0x300,-0x18(%ebp)
c010704e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107051:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107054:	eb 28                	jmp    c010707e <vmm_init+0x59>
c0107056:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107059:	c1 e0 0c             	shl    $0xc,%eax
c010705c:	89 c2                	mov    %eax,%edx
c010705e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107061:	01 d0                	add    %edx,%eax
c0107063:	89 04 24             	mov    %eax,(%esp)
c0107066:	e8 ad ff ff ff       	call   c0107018 <ka_to_pa>
c010706b:	83 c8 03             	or     $0x3,%eax
c010706e:	89 c2                	mov    %eax,%edx
c0107070:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107073:	89 14 85 00 80 11 c0 	mov    %edx,-0x3fee8000(,%eax,4)
c010707a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010707e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107081:	05 e0 00 00 00       	add    $0xe0,%eax
c0107086:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0107089:	77 cb                	ja     c0107056 <vmm_init+0x31>
c010708b:	a1 8c 92 10 c0       	mov    0xc010928c,%eax
c0107090:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0107093:	c1 e2 0c             	shl    $0xc,%edx
c0107096:	01 d0                	add    %edx,%eax
c0107098:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010709b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01070a2:	eb 1e                	jmp    c01070c2 <vmm_init+0x9d>
c01070a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01070a7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01070ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01070b1:	01 d0                	add    %edx,%eax
c01070b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01070b6:	c1 e2 0c             	shl    $0xc,%edx
c01070b9:	83 ca 03             	or     $0x3,%edx
c01070bc:	89 10                	mov    %edx,(%eax)
c01070be:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01070c2:	81 7d f0 ff 7f 03 00 	cmpl   $0x37fff,-0x10(%ebp)
c01070c9:	76 d9                	jbe    c01070a4 <vmm_init+0x7f>
c01070cb:	c7 04 24 00 80 11 c0 	movl   $0xc0118000,(%esp)
c01070d2:	e8 41 ff ff ff       	call   c0107018 <ka_to_pa>
c01070d7:	89 04 24             	mov    %eax,(%esp)
c01070da:	e8 16 ff ff ff       	call   c0106ff5 <switch_pgd>
c01070df:	c9                   	leave  
c01070e0:	c3                   	ret    

c01070e1 <map>:
c01070e1:	55                   	push   %ebp
c01070e2:	89 e5                	mov    %esp,%ebp
c01070e4:	83 ec 28             	sub    $0x28,%esp
c01070e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01070ea:	c1 e8 16             	shr    $0x16,%eax
c01070ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01070f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01070f3:	c1 e8 0c             	shr    $0xc,%eax
c01070f6:	25 ff 03 00 00       	and    $0x3ff,%eax
c01070fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01070fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107101:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0107108:	8b 45 08             	mov    0x8(%ebp),%eax
c010710b:	01 d0                	add    %edx,%eax
c010710d:	8b 00                	mov    (%eax),%eax
c010710f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0107114:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107117:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010711b:	75 36                	jne    c0107153 <map+0x72>
c010711d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107124:	e8 07 fc ff ff       	call   c0106d30 <alloc_pages>
c0107129:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010712c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010712f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0107136:	8b 45 08             	mov    0x8(%ebp),%eax
c0107139:	01 d0                	add    %edx,%eax
c010713b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010713e:	83 ca 03             	or     $0x3,%edx
c0107141:	89 10                	mov    %edx,(%eax)
c0107143:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107146:	89 04 24             	mov    %eax,(%esp)
c0107149:	e8 bd fe ff ff       	call   c010700b <pa_to_ka>
c010714e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107151:	eb 0e                	jmp    c0107161 <map+0x80>
c0107153:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107156:	89 04 24             	mov    %eax,(%esp)
c0107159:	e8 ad fe ff ff       	call   c010700b <pa_to_ka>
c010715e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107161:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107164:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010716b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010716e:	01 c2                	add    %eax,%edx
c0107170:	8b 45 10             	mov    0x10(%ebp),%eax
c0107173:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0107178:	0b 45 14             	or     0x14(%ebp),%eax
c010717b:	89 02                	mov    %eax,(%edx)
c010717d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107180:	89 04 24             	mov    %eax,(%esp)
c0107183:	e8 78 fe ff ff       	call   c0107000 <tlb_reload_page>
c0107188:	c9                   	leave  
c0107189:	c3                   	ret    

c010718a <unmap>:
c010718a:	55                   	push   %ebp
c010718b:	89 e5                	mov    %esp,%ebp
c010718d:	83 ec 14             	sub    $0x14,%esp
c0107190:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107193:	c1 e8 16             	shr    $0x16,%eax
c0107196:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107199:	8b 45 0c             	mov    0xc(%ebp),%eax
c010719c:	c1 e8 0c             	shr    $0xc,%eax
c010719f:	25 ff 03 00 00       	and    $0x3ff,%eax
c01071a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01071a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01071aa:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01071b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01071b4:	01 d0                	add    %edx,%eax
c01071b6:	8b 00                	mov    (%eax),%eax
c01071b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01071bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01071c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01071c4:	75 02                	jne    c01071c8 <unmap+0x3e>
c01071c6:	eb 2e                	jmp    c01071f6 <unmap+0x6c>
c01071c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01071cb:	89 04 24             	mov    %eax,(%esp)
c01071ce:	e8 38 fe ff ff       	call   c010700b <pa_to_ka>
c01071d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01071d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01071d9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c01071e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01071e3:	01 d0                	add    %edx,%eax
c01071e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01071eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01071ee:	89 04 24             	mov    %eax,(%esp)
c01071f1:	e8 0a fe ff ff       	call   c0107000 <tlb_reload_page>
c01071f6:	c9                   	leave  
c01071f7:	c3                   	ret    

c01071f8 <get_mapping>:
c01071f8:	55                   	push   %ebp
c01071f9:	89 e5                	mov    %esp,%ebp
c01071fb:	83 ec 14             	sub    $0x14,%esp
c01071fe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107201:	c1 e8 16             	shr    $0x16,%eax
c0107204:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107207:	8b 45 0c             	mov    0xc(%ebp),%eax
c010720a:	c1 e8 0c             	shr    $0xc,%eax
c010720d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0107212:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0107215:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107218:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010721f:	8b 45 08             	mov    0x8(%ebp),%eax
c0107222:	01 d0                	add    %edx,%eax
c0107224:	8b 00                	mov    (%eax),%eax
c0107226:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010722b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010722e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0107232:	75 07                	jne    c010723b <get_mapping+0x43>
c0107234:	b8 00 00 00 00       	mov    $0x0,%eax
c0107239:	eb 52                	jmp    c010728d <get_mapping+0x95>
c010723b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010723e:	89 04 24             	mov    %eax,(%esp)
c0107241:	e8 c5 fd ff ff       	call   c010700b <pa_to_ka>
c0107246:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107249:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010724c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0107253:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107256:	01 d0                	add    %edx,%eax
c0107258:	8b 00                	mov    (%eax),%eax
c010725a:	85 c0                	test   %eax,%eax
c010725c:	74 2a                	je     c0107288 <get_mapping+0x90>
c010725e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0107262:	74 24                	je     c0107288 <get_mapping+0x90>
c0107264:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0107267:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c010726e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107271:	01 d0                	add    %edx,%eax
c0107273:	8b 00                	mov    (%eax),%eax
c0107275:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010727a:	89 c2                	mov    %eax,%edx
c010727c:	8b 45 10             	mov    0x10(%ebp),%eax
c010727f:	89 10                	mov    %edx,(%eax)
c0107281:	b8 01 00 00 00       	mov    $0x1,%eax
c0107286:	eb 05                	jmp    c010728d <get_mapping+0x95>
c0107288:	b8 00 00 00 00       	mov    $0x0,%eax
c010728d:	c9                   	leave  
c010728e:	c3                   	ret    

c010728f <cpu_hlt>:
c010728f:	55                   	push   %ebp
c0107290:	89 e5                	mov    %esp,%ebp
c0107292:	f4                   	hlt    
c0107293:	5d                   	pop    %ebp
c0107294:	c3                   	ret    

c0107295 <debug_init>:
c0107295:	55                   	push   %ebp
c0107296:	89 e5                	mov    %esp,%ebp
c0107298:	83 ec 18             	sub    $0x18,%esp
c010729b:	a1 00 90 11 c0       	mov    0xc0119000,%eax
c01072a0:	89 04 24             	mov    %eax,(%esp)
c01072a3:	e8 02 00 00 00       	call   c01072aa <elf_from_multiboot>
c01072a8:	c9                   	leave  
c01072a9:	c3                   	ret    

c01072aa <elf_from_multiboot>:
c01072aa:	55                   	push   %ebp
c01072ab:	89 e5                	mov    %esp,%ebp
c01072ad:	83 ec 28             	sub    $0x28,%esp
c01072b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01072b3:	8b 40 24             	mov    0x24(%eax),%eax
c01072b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01072b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01072bc:	8b 50 28             	mov    0x28(%eax),%edx
c01072bf:	89 d0                	mov    %edx,%eax
c01072c1:	c1 e0 02             	shl    $0x2,%eax
c01072c4:	01 d0                	add    %edx,%eax
c01072c6:	c1 e0 03             	shl    $0x3,%eax
c01072c9:	89 c2                	mov    %eax,%edx
c01072cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01072ce:	01 d0                	add    %edx,%eax
c01072d0:	8b 40 0c             	mov    0xc(%eax),%eax
c01072d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01072d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01072dd:	e9 cf 00 00 00       	jmp    c01073b1 <elf_from_multiboot+0x107>
c01072e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01072e5:	89 d0                	mov    %edx,%eax
c01072e7:	c1 e0 02             	shl    $0x2,%eax
c01072ea:	01 d0                	add    %edx,%eax
c01072ec:	c1 e0 03             	shl    $0x3,%eax
c01072ef:	89 c2                	mov    %eax,%edx
c01072f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01072f4:	01 d0                	add    %edx,%eax
c01072f6:	8b 10                	mov    (%eax),%edx
c01072f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072fb:	01 d0                	add    %edx,%eax
c01072fd:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0107302:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107305:	c7 44 24 04 4c a3 10 	movl   $0xc010a34c,0x4(%esp)
c010730c:	c0 
c010730d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107310:	89 04 24             	mov    %eax,(%esp)
c0107313:	e8 c2 d0 ff ff       	call   c01043da <strcmp>
c0107318:	85 c0                	test   %eax,%eax
c010731a:	75 3d                	jne    c0107359 <elf_from_multiboot+0xaf>
c010731c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010731f:	89 d0                	mov    %edx,%eax
c0107321:	c1 e0 02             	shl    $0x2,%eax
c0107324:	01 d0                	add    %edx,%eax
c0107326:	c1 e0 03             	shl    $0x3,%eax
c0107329:	89 c2                	mov    %eax,%edx
c010732b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010732e:	01 d0                	add    %edx,%eax
c0107330:	8b 40 0c             	mov    0xc(%eax),%eax
c0107333:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0107338:	a3 f8 05 11 c0       	mov    %eax,0xc01105f8
c010733d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0107340:	89 d0                	mov    %edx,%eax
c0107342:	c1 e0 02             	shl    $0x2,%eax
c0107345:	01 d0                	add    %edx,%eax
c0107347:	c1 e0 03             	shl    $0x3,%eax
c010734a:	89 c2                	mov    %eax,%edx
c010734c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010734f:	01 d0                	add    %edx,%eax
c0107351:	8b 40 14             	mov    0x14(%eax),%eax
c0107354:	a3 fc 05 11 c0       	mov    %eax,0xc01105fc
c0107359:	c7 44 24 04 54 a3 10 	movl   $0xc010a354,0x4(%esp)
c0107360:	c0 
c0107361:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107364:	89 04 24             	mov    %eax,(%esp)
c0107367:	e8 6e d0 ff ff       	call   c01043da <strcmp>
c010736c:	85 c0                	test   %eax,%eax
c010736e:	75 3d                	jne    c01073ad <elf_from_multiboot+0x103>
c0107370:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0107373:	89 d0                	mov    %edx,%eax
c0107375:	c1 e0 02             	shl    $0x2,%eax
c0107378:	01 d0                	add    %edx,%eax
c010737a:	c1 e0 03             	shl    $0x3,%eax
c010737d:	89 c2                	mov    %eax,%edx
c010737f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107382:	01 d0                	add    %edx,%eax
c0107384:	8b 40 0c             	mov    0xc(%eax),%eax
c0107387:	2d 00 00 00 40       	sub    $0x40000000,%eax
c010738c:	a3 f0 05 11 c0       	mov    %eax,0xc01105f0
c0107391:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0107394:	89 d0                	mov    %edx,%eax
c0107396:	c1 e0 02             	shl    $0x2,%eax
c0107399:	01 d0                	add    %edx,%eax
c010739b:	c1 e0 03             	shl    $0x3,%eax
c010739e:	89 c2                	mov    %eax,%edx
c01073a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01073a3:	01 d0                	add    %edx,%eax
c01073a5:	8b 40 14             	mov    0x14(%eax),%eax
c01073a8:	a3 f4 05 11 c0       	mov    %eax,0xc01105f4
c01073ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01073b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01073b4:	8b 40 1c             	mov    0x1c(%eax),%eax
c01073b7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01073ba:	0f 87 22 ff ff ff    	ja     c01072e2 <elf_from_multiboot+0x38>
c01073c0:	c9                   	leave  
c01073c1:	c3                   	ret    

c01073c2 <panic>:
c01073c2:	55                   	push   %ebp
c01073c3:	89 e5                	mov    %esp,%ebp
c01073c5:	83 ec 18             	sub    $0x18,%esp
c01073c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01073cb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01073cf:	c7 04 24 5c a3 10 c0 	movl   $0xc010a35c,(%esp)
c01073d6:	e8 cc e7 ff ff       	call   c0105ba7 <printk>
c01073db:	e8 13 00 00 00       	call   c01073f3 <print_stack_trace>
c01073e0:	c7 04 24 72 a3 10 c0 	movl   $0xc010a372,(%esp)
c01073e7:	e8 bb e7 ff ff       	call   c0105ba7 <printk>
c01073ec:	e8 9e fe ff ff       	call   c010728f <cpu_hlt>
c01073f1:	eb f9                	jmp    c01073ec <panic+0x2a>

c01073f3 <print_stack_trace>:
c01073f3:	55                   	push   %ebp
c01073f4:	89 e5                	mov    %esp,%ebp
c01073f6:	83 ec 28             	sub    $0x28,%esp
c01073f9:	89 e8                	mov    %ebp,%eax
c01073fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01073fe:	eb 3f                	jmp    c010743f <print_stack_trace+0x4c>
c0107400:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107403:	83 c0 04             	add    $0x4,%eax
c0107406:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107409:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010740c:	8b 00                	mov    (%eax),%eax
c010740e:	c7 44 24 04 f0 05 11 	movl   $0xc01105f0,0x4(%esp)
c0107415:	c0 
c0107416:	89 04 24             	mov    %eax,(%esp)
c0107419:	e8 29 00 00 00       	call   c0107447 <elf_lookup_symbol>
c010741e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0107421:	8b 12                	mov    (%edx),%edx
c0107423:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107427:	89 54 24 04          	mov    %edx,0x4(%esp)
c010742b:	c7 04 24 77 a3 10 c0 	movl   $0xc010a377,(%esp)
c0107432:	e8 70 e7 ff ff       	call   c0105ba7 <printk>
c0107437:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010743a:	8b 00                	mov    (%eax),%eax
c010743c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010743f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0107443:	75 bb                	jne    c0107400 <print_stack_trace+0xd>
c0107445:	c9                   	leave  
c0107446:	c3                   	ret    

c0107447 <elf_lookup_symbol>:
c0107447:	55                   	push   %ebp
c0107448:	89 e5                	mov    %esp,%ebp
c010744a:	83 ec 10             	sub    $0x10,%esp
c010744d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0107454:	eb 79                	jmp    c01074cf <elf_lookup_symbol+0x88>
c0107456:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107459:	8b 00                	mov    (%eax),%eax
c010745b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010745e:	c1 e2 04             	shl    $0x4,%edx
c0107461:	01 d0                	add    %edx,%eax
c0107463:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
c0107467:	0f b6 c0             	movzbl %al,%eax
c010746a:	83 e0 0f             	and    $0xf,%eax
c010746d:	83 f8 02             	cmp    $0x2,%eax
c0107470:	74 02                	je     c0107474 <elf_lookup_symbol+0x2d>
c0107472:	eb 57                	jmp    c01074cb <elf_lookup_symbol+0x84>
c0107474:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107477:	8b 00                	mov    (%eax),%eax
c0107479:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010747c:	c1 e2 04             	shl    $0x4,%edx
c010747f:	01 d0                	add    %edx,%eax
c0107481:	8b 40 04             	mov    0x4(%eax),%eax
c0107484:	3b 45 08             	cmp    0x8(%ebp),%eax
c0107487:	77 42                	ja     c01074cb <elf_lookup_symbol+0x84>
c0107489:	8b 45 0c             	mov    0xc(%ebp),%eax
c010748c:	8b 00                	mov    (%eax),%eax
c010748e:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0107491:	c1 e2 04             	shl    $0x4,%edx
c0107494:	01 d0                	add    %edx,%eax
c0107496:	8b 50 04             	mov    0x4(%eax),%edx
c0107499:	8b 45 0c             	mov    0xc(%ebp),%eax
c010749c:	8b 00                	mov    (%eax),%eax
c010749e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c01074a1:	c1 e1 04             	shl    $0x4,%ecx
c01074a4:	01 c8                	add    %ecx,%eax
c01074a6:	8b 40 08             	mov    0x8(%eax),%eax
c01074a9:	01 d0                	add    %edx,%eax
c01074ab:	3b 45 08             	cmp    0x8(%ebp),%eax
c01074ae:	76 1b                	jbe    c01074cb <elf_lookup_symbol+0x84>
c01074b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01074b3:	8b 40 08             	mov    0x8(%eax),%eax
c01074b6:	89 c2                	mov    %eax,%edx
c01074b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01074bb:	8b 00                	mov    (%eax),%eax
c01074bd:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c01074c0:	c1 e1 04             	shl    $0x4,%ecx
c01074c3:	01 c8                	add    %ecx,%eax
c01074c5:	8b 00                	mov    (%eax),%eax
c01074c7:	01 d0                	add    %edx,%eax
c01074c9:	eb 1b                	jmp    c01074e6 <elf_lookup_symbol+0x9f>
c01074cb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01074cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01074d2:	8b 40 04             	mov    0x4(%eax),%eax
c01074d5:	c1 e8 04             	shr    $0x4,%eax
c01074d8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c01074db:	0f 87 75 ff ff ff    	ja     c0107456 <elf_lookup_symbol+0xf>
c01074e1:	b8 00 00 00 00       	mov    $0x0,%eax
c01074e6:	c9                   	leave  
c01074e7:	c3                   	ret    

c01074e8 <print_cur_status>:
c01074e8:	55                   	push   %ebp
c01074e9:	89 e5                	mov    %esp,%ebp
c01074eb:	83 ec 28             	sub    $0x28,%esp
c01074ee:	8c 4d f6             	mov    %cs,-0xa(%ebp)
c01074f1:	8c 5d f4             	mov    %ds,-0xc(%ebp)
c01074f4:	8c 45 f2             	mov    %es,-0xe(%ebp)
c01074f7:	8c 55 f0             	mov    %ss,-0x10(%ebp)
c01074fa:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01074fe:	0f b7 c0             	movzwl %ax,%eax
c0107501:	83 e0 03             	and    $0x3,%eax
c0107504:	89 c2                	mov    %eax,%edx
c0107506:	a1 00 06 11 c0       	mov    0xc0110600,%eax
c010750b:	89 54 24 08          	mov    %edx,0x8(%esp)
c010750f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107513:	c7 04 24 85 a3 10 c0 	movl   $0xc010a385,(%esp)
c010751a:	e8 88 e6 ff ff       	call   c0105ba7 <printk>
c010751f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0107523:	0f b7 d0             	movzwl %ax,%edx
c0107526:	a1 00 06 11 c0       	mov    0xc0110600,%eax
c010752b:	89 54 24 08          	mov    %edx,0x8(%esp)
c010752f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107533:	c7 04 24 93 a3 10 c0 	movl   $0xc010a393,(%esp)
c010753a:	e8 68 e6 ff ff       	call   c0105ba7 <printk>
c010753f:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
c0107543:	0f b7 d0             	movzwl %ax,%edx
c0107546:	a1 00 06 11 c0       	mov    0xc0110600,%eax
c010754b:	89 54 24 08          	mov    %edx,0x8(%esp)
c010754f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107553:	c7 04 24 a1 a3 10 c0 	movl   $0xc010a3a1,(%esp)
c010755a:	e8 48 e6 ff ff       	call   c0105ba7 <printk>
c010755f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c0107563:	0f b7 d0             	movzwl %ax,%edx
c0107566:	a1 00 06 11 c0       	mov    0xc0110600,%eax
c010756b:	89 54 24 08          	mov    %edx,0x8(%esp)
c010756f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107573:	c7 04 24 af a3 10 c0 	movl   $0xc010a3af,(%esp)
c010757a:	e8 28 e6 ff ff       	call   c0105ba7 <printk>
c010757f:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
c0107583:	0f b7 d0             	movzwl %ax,%edx
c0107586:	a1 00 06 11 c0       	mov    0xc0110600,%eax
c010758b:	89 54 24 08          	mov    %edx,0x8(%esp)
c010758f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107593:	c7 04 24 bd a3 10 c0 	movl   $0xc010a3bd,(%esp)
c010759a:	e8 08 e6 ff ff       	call   c0105ba7 <printk>
c010759f:	a1 00 06 11 c0       	mov    0xc0110600,%eax
c01075a4:	83 c0 01             	add    $0x1,%eax
c01075a7:	a3 00 06 11 c0       	mov    %eax,0xc0110600
c01075ac:	c9                   	leave  
c01075ad:	c3                   	ret    

c01075ae <show_memory_map>:
c01075ae:	55                   	push   %ebp
c01075af:	89 e5                	mov    %esp,%ebp
c01075b1:	56                   	push   %esi
c01075b2:	53                   	push   %ebx
c01075b3:	83 ec 30             	sub    $0x30,%esp
c01075b6:	a1 00 90 11 c0       	mov    0xc0119000,%eax
c01075bb:	8b 40 30             	mov    0x30(%eax),%eax
c01075be:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01075c1:	a1 00 90 11 c0       	mov    0xc0119000,%eax
c01075c6:	8b 40 2c             	mov    0x2c(%eax),%eax
c01075c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01075cc:	c7 04 24 cb a3 10 c0 	movl   $0xc010a3cb,(%esp)
c01075d3:	e8 cf e5 ff ff       	call   c0105ba7 <printk>
c01075d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01075db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01075de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01075e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01075e4:	eb 42                	jmp    c0107628 <show_memory_map+0x7a>
c01075e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01075e9:	8b 70 14             	mov    0x14(%eax),%esi
c01075ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01075ef:	8b 58 0c             	mov    0xc(%eax),%ebx
c01075f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01075f5:	8b 48 10             	mov    0x10(%eax),%ecx
c01075f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01075fb:	8b 50 04             	mov    0x4(%eax),%edx
c01075fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107601:	8b 40 08             	mov    0x8(%eax),%eax
c0107604:	89 74 24 14          	mov    %esi,0x14(%esp)
c0107608:	89 5c 24 10          	mov    %ebx,0x10(%esp)
c010760c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
c0107610:	89 54 24 08          	mov    %edx,0x8(%esp)
c0107614:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107618:	c7 04 24 dc a3 10 c0 	movl   $0xc010a3dc,(%esp)
c010761f:	e8 83 e5 ff ff       	call   c0105ba7 <printk>
c0107624:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
c0107628:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010762b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010762e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0107631:	01 ca                	add    %ecx,%edx
c0107633:	39 d0                	cmp    %edx,%eax
c0107635:	72 af                	jb     c01075e6 <show_memory_map+0x38>
c0107637:	c7 04 24 12 a4 10 c0 	movl   $0xc010a412,(%esp)
c010763e:	e8 64 e5 ff ff       	call   c0105ba7 <printk>
c0107643:	83 c4 30             	add    $0x30,%esp
c0107646:	5b                   	pop    %ebx
c0107647:	5e                   	pop    %esi
c0107648:	5d                   	pop    %ebp
c0107649:	c3                   	ret    

c010764a <show_kernel_memory_map>:
c010764a:	55                   	push   %ebp
c010764b:	89 e5                	mov    %esp,%ebp
c010764d:	83 ec 18             	sub    $0x18,%esp
c0107650:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
c0107657:	00 
c0107658:	c7 04 24 14 a4 10 c0 	movl   $0xc010a414,(%esp)
c010765f:	e8 43 e5 ff ff       	call   c0105ba7 <printk>
c0107664:	c7 44 24 04 00 70 13 	movl   $0x137000,0x4(%esp)
c010766b:	00 
c010766c:	c7 04 24 34 a4 10 c0 	movl   $0xc010a434,(%esp)
c0107673:	e8 2f e5 ff ff       	call   c0105ba7 <printk>
c0107678:	c7 04 24 54 a4 10 c0 	movl   $0xc010a454,(%esp)
c010767f:	e8 23 e5 ff ff       	call   c0105ba7 <printk>
c0107684:	c7 44 24 08 00 10 10 	movl   $0x101000,0x8(%esp)
c010768b:	00 
c010768c:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
c0107693:	00 
c0107694:	c7 04 24 70 a4 10 c0 	movl   $0xc010a470,(%esp)
c010769b:	e8 07 e5 ff ff       	call   c0105ba7 <printk>
c01076a0:	c7 44 24 08 00 20 10 	movl   $0x102000,0x8(%esp)
c01076a7:	00 
c01076a8:	c7 44 24 04 00 10 10 	movl   $0x101000,0x4(%esp)
c01076af:	00 
c01076b0:	c7 04 24 94 a4 10 c0 	movl   $0xc010a494,(%esp)
c01076b7:	e8 eb e4 ff ff       	call   c0105ba7 <printk>
c01076bc:	c7 44 24 08 00 90 10 	movl   $0x109000,0x8(%esp)
c01076c3:	00 
c01076c4:	c7 44 24 04 00 20 10 	movl   $0x102000,0x4(%esp)
c01076cb:	00 
c01076cc:	c7 04 24 b8 a4 10 c0 	movl   $0xc010a4b8,(%esp)
c01076d3:	e8 cf e4 ff ff       	call   c0105ba7 <printk>
c01076d8:	c7 44 24 08 10 b0 11 	movl   $0x11b010,0x8(%esp)
c01076df:	00 
c01076e0:	c7 44 24 04 00 90 10 	movl   $0x109000,0x4(%esp)
c01076e7:	00 
c01076e8:	c7 04 24 dc a4 10 c0 	movl   $0xc010a4dc,(%esp)
c01076ef:	e8 b3 e4 ff ff       	call   c0105ba7 <printk>
c01076f4:	ba 00 70 13 00       	mov    $0x137000,%edx
c01076f9:	b8 00 00 10 00       	mov    $0x100000,%eax
c01076fe:	29 c2                	sub    %eax,%edx
c0107700:	89 d0                	mov    %edx,%eax
c0107702:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0107708:	85 c0                	test   %eax,%eax
c010770a:	0f 48 c2             	cmovs  %edx,%eax
c010770d:	c1 f8 0c             	sar    $0xc,%eax
c0107710:	89 c2                	mov    %eax,%edx
c0107712:	b9 00 70 13 00       	mov    $0x137000,%ecx
c0107717:	b8 00 00 10 00       	mov    $0x100000,%eax
c010771c:	29 c1                	sub    %eax,%ecx
c010771e:	89 c8                	mov    %ecx,%eax
c0107720:	8d 88 ff 03 00 00    	lea    0x3ff(%eax),%ecx
c0107726:	85 c0                	test   %eax,%eax
c0107728:	0f 48 c1             	cmovs  %ecx,%eax
c010772b:	c1 f8 0a             	sar    $0xa,%eax
c010772e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0107732:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107736:	c7 04 24 00 a5 10 c0 	movl   $0xc010a500,(%esp)
c010773d:	e8 65 e4 ff ff       	call   c0105ba7 <printk>
c0107742:	c9                   	leave  
c0107743:	c3                   	ret    

c0107744 <cpu_hlt>:
c0107744:	55                   	push   %ebp
c0107745:	89 e5                	mov    %esp,%ebp
c0107747:	f4                   	hlt    
c0107748:	5d                   	pop    %ebp
c0107749:	c3                   	ret    

c010774a <idt_init>:
c010774a:	55                   	push   %ebp
c010774b:	89 e5                	mov    %esp,%ebp
c010774d:	83 ec 28             	sub    $0x28,%esp
c0107750:	e8 2d 08 00 00       	call   c0107f82 <init_interrupt_chip>
c0107755:	66 c7 05 10 0e 11 c0 	movw   $0x7ff,0xc0110e10
c010775c:	ff 07 
c010775e:	b8 10 06 11 c0       	mov    $0xc0110610,%eax
c0107763:	a3 12 0e 11 c0       	mov    %eax,0xc0110e12
c0107768:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010776f:	eb 32                	jmp    c01077a3 <idt_init+0x59>
c0107771:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107774:	8b 04 85 a0 92 10 c0 	mov    -0x3fef6d60(,%eax,4),%eax
c010777b:	89 c2                	mov    %eax,%edx
c010777d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107780:	0f b6 c0             	movzbl %al,%eax
c0107783:	c7 44 24 0c 8e 00 00 	movl   $0x8e,0xc(%esp)
c010778a:	00 
c010778b:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
c0107792:	00 
c0107793:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107797:	89 04 24             	mov    %eax,(%esp)
c010779a:	e8 3e 00 00 00       	call   c01077dd <idt_set_gate>
c010779f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01077a3:	83 7d f4 2f          	cmpl   $0x2f,-0xc(%ebp)
c01077a7:	76 c8                	jbe    c0107771 <idt_init+0x27>
c01077a9:	b8 08 21 10 c0       	mov    $0xc0102108,%eax
c01077ae:	c7 44 24 0c ef 00 00 	movl   $0xef,0xc(%esp)
c01077b5:	00 
c01077b6:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
c01077bd:	00 
c01077be:	89 44 24 04          	mov    %eax,0x4(%esp)
c01077c2:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
c01077c9:	e8 0f 00 00 00       	call   c01077dd <idt_set_gate>
c01077ce:	b8 10 0e 11 c0       	mov    $0xc0110e10,%eax
c01077d3:	89 04 24             	mov    %eax,(%esp)
c01077d6:	e8 55 a8 ff ff       	call   c0102030 <idt_flush>
c01077db:	c9                   	leave  
c01077dc:	c3                   	ret    

c01077dd <idt_set_gate>:
c01077dd:	55                   	push   %ebp
c01077de:	89 e5                	mov    %esp,%ebp
c01077e0:	83 ec 0c             	sub    $0xc,%esp
c01077e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01077e6:	8b 55 10             	mov    0x10(%ebp),%edx
c01077e9:	8b 45 14             	mov    0x14(%ebp),%eax
c01077ec:	88 4d fc             	mov    %cl,-0x4(%ebp)
c01077ef:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
c01077f3:	88 45 f4             	mov    %al,-0xc(%ebp)
c01077f6:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c01077fa:	8b 55 0c             	mov    0xc(%ebp),%edx
c01077fd:	66 89 14 c5 10 06 11 	mov    %dx,-0x3feef9f0(,%eax,8)
c0107804:	c0 
c0107805:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0107809:	8b 55 0c             	mov    0xc(%ebp),%edx
c010780c:	c1 ea 10             	shr    $0x10,%edx
c010780f:	66 89 14 c5 16 06 11 	mov    %dx,-0x3feef9ea(,%eax,8)
c0107816:	c0 
c0107817:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c010781b:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
c010781f:	66 89 14 c5 12 06 11 	mov    %dx,-0x3feef9ee(,%eax,8)
c0107826:	c0 
c0107827:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c010782b:	c6 04 c5 14 06 11 c0 	movb   $0x0,-0x3feef9ec(,%eax,8)
c0107832:	00 
c0107833:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0107837:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
c010783b:	88 14 c5 15 06 11 c0 	mov    %dl,-0x3feef9eb(,%eax,8)
c0107842:	c9                   	leave  
c0107843:	c3                   	ret    

c0107844 <intrname>:
c0107844:	55                   	push   %ebp
c0107845:	89 e5                	mov    %esp,%ebp
c0107847:	83 7d 08 13          	cmpl   $0x13,0x8(%ebp)
c010784b:	77 0c                	ja     c0107859 <intrname+0x15>
c010784d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107850:	8b 04 85 c0 a6 10 c0 	mov    -0x3fef5940(,%eax,4),%eax
c0107857:	eb 05                	jmp    c010785e <intrname+0x1a>
c0107859:	b8 40 a5 10 c0       	mov    $0xc010a540,%eax
c010785e:	5d                   	pop    %ebp
c010785f:	c3                   	ret    

c0107860 <isr_handler>:
c0107860:	55                   	push   %ebp
c0107861:	89 e5                	mov    %esp,%ebp
c0107863:	83 ec 28             	sub    $0x28,%esp
c0107866:	8b 45 08             	mov    0x8(%ebp),%eax
c0107869:	8b 40 24             	mov    0x24(%eax),%eax
c010786c:	8b 04 85 18 0e 11 c0 	mov    -0x3feef1e8(,%eax,4),%eax
c0107873:	85 c0                	test   %eax,%eax
c0107875:	74 17                	je     c010788e <isr_handler+0x2e>
c0107877:	8b 45 08             	mov    0x8(%ebp),%eax
c010787a:	8b 40 24             	mov    0x24(%eax),%eax
c010787d:	8b 04 85 18 0e 11 c0 	mov    -0x3feef1e8(,%eax,4),%eax
c0107884:	8b 55 08             	mov    0x8(%ebp),%edx
c0107887:	89 14 24             	mov    %edx,(%esp)
c010788a:	ff d0                	call   *%eax
c010788c:	eb 3d                	jmp    c01078cb <isr_handler+0x6b>
c010788e:	8b 45 08             	mov    0x8(%ebp),%eax
c0107891:	8b 40 24             	mov    0x24(%eax),%eax
c0107894:	89 04 24             	mov    %eax,(%esp)
c0107897:	e8 a8 ff ff ff       	call   c0107844 <intrname>
c010789c:	8b 55 08             	mov    0x8(%ebp),%edx
c010789f:	8b 52 24             	mov    0x24(%edx),%edx
c01078a2:	89 44 24 10          	mov    %eax,0x10(%esp)
c01078a6:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01078aa:	c7 44 24 08 4f a5 10 	movl   $0xc010a54f,0x8(%esp)
c01078b1:	c0 
c01078b2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01078b9:	00 
c01078ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01078c1:	e8 23 e3 ff ff       	call   c0105be9 <cprintk>
c01078c6:	e8 79 fe ff ff       	call   c0107744 <cpu_hlt>
c01078cb:	c9                   	leave  
c01078cc:	c3                   	ret    

c01078cd <register_interrupt_handler>:
c01078cd:	55                   	push   %ebp
c01078ce:	89 e5                	mov    %esp,%ebp
c01078d0:	83 ec 04             	sub    $0x4,%esp
c01078d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01078d6:	88 45 fc             	mov    %al,-0x4(%ebp)
c01078d9:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c01078dd:	8b 55 0c             	mov    0xc(%ebp),%edx
c01078e0:	89 14 85 18 0e 11 c0 	mov    %edx,-0x3feef1e8(,%eax,4)
c01078e7:	c9                   	leave  
c01078e8:	c3                   	ret    

c01078e9 <irq_handler>:
c01078e9:	55                   	push   %ebp
c01078ea:	89 e5                	mov    %esp,%ebp
c01078ec:	83 ec 18             	sub    $0x18,%esp
c01078ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01078f2:	8b 40 24             	mov    0x24(%eax),%eax
c01078f5:	89 04 24             	mov    %eax,(%esp)
c01078f8:	e8 55 07 00 00       	call   c0108052 <clear_interrupt_chip>
c01078fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0107900:	8b 40 24             	mov    0x24(%eax),%eax
c0107903:	8b 04 85 18 0e 11 c0 	mov    -0x3feef1e8(,%eax,4),%eax
c010790a:	85 c0                	test   %eax,%eax
c010790c:	74 15                	je     c0107923 <irq_handler+0x3a>
c010790e:	8b 45 08             	mov    0x8(%ebp),%eax
c0107911:	8b 40 24             	mov    0x24(%eax),%eax
c0107914:	8b 04 85 18 0e 11 c0 	mov    -0x3feef1e8(,%eax,4),%eax
c010791b:	8b 55 08             	mov    0x8(%ebp),%edx
c010791e:	89 14 24             	mov    %edx,(%esp)
c0107921:	ff d0                	call   *%eax
c0107923:	c9                   	leave  
c0107924:	c3                   	ret    

c0107925 <outb>:
c0107925:	55                   	push   %ebp
c0107926:	89 e5                	mov    %esp,%ebp
c0107928:	83 ec 08             	sub    $0x8,%esp
c010792b:	8b 55 08             	mov    0x8(%ebp),%edx
c010792e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107931:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c0107935:	88 45 f8             	mov    %al,-0x8(%ebp)
c0107938:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c010793c:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0107940:	ee                   	out    %al,(%dx)
c0107941:	c9                   	leave  
c0107942:	c3                   	ret    

c0107943 <enable_intr>:
c0107943:	55                   	push   %ebp
c0107944:	89 e5                	mov    %esp,%ebp
c0107946:	fb                   	sti    
c0107947:	5d                   	pop    %ebp
c0107948:	c3                   	ret    

c0107949 <disable_intr>:
c0107949:	55                   	push   %ebp
c010794a:	89 e5                	mov    %esp,%ebp
c010794c:	fa                   	cli    
c010794d:	5d                   	pop    %ebp
c010794e:	c3                   	ret    

c010794f <read_eflags>:
c010794f:	55                   	push   %ebp
c0107950:	89 e5                	mov    %esp,%ebp
c0107952:	83 ec 10             	sub    $0x10,%esp
c0107955:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010795c:	9c                   	pushf  
c010795d:	58                   	pop    %eax
c010795e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107961:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107964:	c9                   	leave  
c0107965:	c3                   	ret    

c0107966 <__intr_store>:
c0107966:	55                   	push   %ebp
c0107967:	89 e5                	mov    %esp,%ebp
c0107969:	e8 e1 ff ff ff       	call   c010794f <read_eflags>
c010796e:	25 00 02 00 00       	and    $0x200,%eax
c0107973:	85 c0                	test   %eax,%eax
c0107975:	74 0c                	je     c0107983 <__intr_store+0x1d>
c0107977:	e8 cd ff ff ff       	call   c0107949 <disable_intr>
c010797c:	b8 01 00 00 00       	mov    $0x1,%eax
c0107981:	eb 05                	jmp    c0107988 <__intr_store+0x22>
c0107983:	b8 00 00 00 00       	mov    $0x0,%eax
c0107988:	5d                   	pop    %ebp
c0107989:	c3                   	ret    

c010798a <__intr_restore>:
c010798a:	55                   	push   %ebp
c010798b:	89 e5                	mov    %esp,%ebp
c010798d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0107991:	74 05                	je     c0107998 <__intr_restore+0xe>
c0107993:	e8 ab ff ff ff       	call   c0107943 <enable_intr>
c0107998:	5d                   	pop    %ebp
c0107999:	c3                   	ret    

c010799a <console_init>:
c010799a:	55                   	push   %ebp
c010799b:	89 e5                	mov    %esp,%ebp
c010799d:	83 ec 18             	sub    $0x18,%esp
c01079a0:	e8 1e 00 00 00       	call   c01079c3 <console_clear>
c01079a5:	c7 44 24 08 10 a7 10 	movl   $0xc010a710,0x8(%esp)
c01079ac:	c0 
c01079ad:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c01079b4:	00 
c01079b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01079bc:	e8 28 e2 ff ff       	call   c0105be9 <cprintk>
c01079c1:	c9                   	leave  
c01079c2:	c3                   	ret    

c01079c3 <console_clear>:
c01079c3:	55                   	push   %ebp
c01079c4:	89 e5                	mov    %esp,%ebp
c01079c6:	83 ec 18             	sub    $0x18,%esp
c01079c9:	c6 45 ef 0f          	movb   $0xf,-0x11(%ebp)
c01079cd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c01079d1:	c1 e0 08             	shl    $0x8,%eax
c01079d4:	83 c8 20             	or     $0x20,%eax
c01079d7:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c01079db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01079e2:	eb 17                	jmp    c01079fb <console_clear+0x38>
c01079e4:	a1 a0 96 10 c0       	mov    0xc01096a0,%eax
c01079e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01079ec:	01 d2                	add    %edx,%edx
c01079ee:	01 c2                	add    %eax,%edx
c01079f0:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c01079f4:	66 89 02             	mov    %ax,(%edx)
c01079f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01079fb:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
c0107a02:	76 e0                	jbe    c01079e4 <console_clear+0x21>
c0107a04:	66 c7 05 20 12 11 c0 	movw   $0x0,0xc0111220
c0107a0b:	00 00 
c0107a0d:	66 c7 05 22 12 11 c0 	movw   $0x0,0xc0111222
c0107a14:	00 00 
c0107a16:	e8 42 00 00 00       	call   c0107a5d <move_cursor>
c0107a1b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0107a22:	eb 13                	jmp    c0107a37 <console_clear+0x74>
c0107a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107a27:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0107a2b:	66 89 94 00 40 12 11 	mov    %dx,-0x3feeedc0(%eax,%eax,1)
c0107a32:	c0 
c0107a33:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0107a37:	81 7d f0 ff 27 00 00 	cmpl   $0x27ff,-0x10(%ebp)
c0107a3e:	76 e4                	jbe    c0107a24 <console_clear+0x61>
c0107a40:	66 c7 05 40 62 11 c0 	movw   $0x0,0xc0116240
c0107a47:	00 00 
c0107a49:	66 c7 05 42 62 11 c0 	movw   $0x0,0xc0116242
c0107a50:	00 00 
c0107a52:	66 c7 05 44 62 11 c0 	movw   $0x0,0xc0116244
c0107a59:	00 00 
c0107a5b:	c9                   	leave  
c0107a5c:	c3                   	ret    

c0107a5d <move_cursor>:
c0107a5d:	55                   	push   %ebp
c0107a5e:	89 e5                	mov    %esp,%ebp
c0107a60:	83 ec 18             	sub    $0x18,%esp
c0107a63:	0f b7 15 22 12 11 c0 	movzwl 0xc0111222,%edx
c0107a6a:	89 d0                	mov    %edx,%eax
c0107a6c:	c1 e0 02             	shl    $0x2,%eax
c0107a6f:	01 d0                	add    %edx,%eax
c0107a71:	c1 e0 04             	shl    $0x4,%eax
c0107a74:	89 c2                	mov    %eax,%edx
c0107a76:	0f b7 05 20 12 11 c0 	movzwl 0xc0111220,%eax
c0107a7d:	01 d0                	add    %edx,%eax
c0107a7f:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
c0107a83:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
c0107a8a:	00 
c0107a8b:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
c0107a92:	e8 8e fe ff ff       	call   c0107925 <outb>
c0107a97:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
c0107a9b:	66 c1 e8 08          	shr    $0x8,%ax
c0107a9f:	0f b6 c0             	movzbl %al,%eax
c0107aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107aa6:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
c0107aad:	e8 73 fe ff ff       	call   c0107925 <outb>
c0107ab2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
c0107ab9:	00 
c0107aba:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
c0107ac1:	e8 5f fe ff ff       	call   c0107925 <outb>
c0107ac6:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
c0107aca:	0f b6 c0             	movzbl %al,%eax
c0107acd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107ad1:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
c0107ad8:	e8 48 fe ff ff       	call   c0107925 <outb>
c0107add:	c9                   	leave  
c0107ade:	c3                   	ret    

c0107adf <scroll_buffer>:
c0107adf:	55                   	push   %ebp
c0107ae0:	89 e5                	mov    %esp,%ebp
c0107ae2:	83 ec 10             	sub    $0x10,%esp
c0107ae5:	c6 45 f7 0f          	movb   $0xf,-0x9(%ebp)
c0107ae9:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0107aed:	c1 e0 08             	shl    $0x8,%eax
c0107af0:	83 c8 20             	or     $0x20,%eax
c0107af3:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
c0107af7:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107afe:	66 83 f8 7f          	cmp    $0x7f,%ax
c0107b02:	75 64                	jne    c0107b68 <scroll_buffer+0x89>
c0107b04:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0107b0b:	eb 1d                	jmp    c0107b2a <scroll_buffer+0x4b>
c0107b0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107b10:	83 c0 50             	add    $0x50,%eax
c0107b13:	0f b7 94 00 40 12 11 	movzwl -0x3feeedc0(%eax,%eax,1),%edx
c0107b1a:	c0 
c0107b1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107b1e:	66 89 94 00 40 12 11 	mov    %dx,-0x3feeedc0(%eax,%eax,1)
c0107b25:	c0 
c0107b26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0107b2a:	81 7d fc af 27 00 00 	cmpl   $0x27af,-0x4(%ebp)
c0107b31:	76 da                	jbe    c0107b0d <scroll_buffer+0x2e>
c0107b33:	c7 45 f8 b0 27 00 00 	movl   $0x27b0,-0x8(%ebp)
c0107b3a:	eb 13                	jmp    c0107b4f <scroll_buffer+0x70>
c0107b3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0107b3f:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0107b43:	66 89 94 00 40 12 11 	mov    %dx,-0x3feeedc0(%eax,%eax,1)
c0107b4a:	c0 
c0107b4b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0107b4f:	81 7d f8 ff 27 00 00 	cmpl   $0x27ff,-0x8(%ebp)
c0107b56:	76 e4                	jbe    c0107b3c <scroll_buffer+0x5d>
c0107b58:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107b5f:	83 e8 01             	sub    $0x1,%eax
c0107b62:	66 a3 42 62 11 c0    	mov    %ax,0xc0116242
c0107b68:	c9                   	leave  
c0107b69:	c3                   	ret    

c0107b6a <console_putc_color>:
c0107b6a:	55                   	push   %ebp
c0107b6b:	89 e5                	mov    %esp,%ebp
c0107b6d:	83 ec 14             	sub    $0x14,%esp
c0107b70:	8b 45 08             	mov    0x8(%ebp),%eax
c0107b73:	88 45 ec             	mov    %al,-0x14(%ebp)
c0107b76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107b79:	88 45 ff             	mov    %al,-0x1(%ebp)
c0107b7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0107b7f:	88 45 fe             	mov    %al,-0x2(%ebp)
c0107b82:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0107b86:	c1 e0 04             	shl    $0x4,%eax
c0107b89:	0f b6 55 fe          	movzbl -0x2(%ebp),%edx
c0107b8d:	83 e2 0f             	and    $0xf,%edx
c0107b90:	09 d0                	or     %edx,%eax
c0107b92:	88 45 fd             	mov    %al,-0x3(%ebp)
c0107b95:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
c0107b99:	c1 e0 08             	shl    $0x8,%eax
c0107b9c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
c0107ba0:	80 7d ec 08          	cmpb   $0x8,-0x14(%ebp)
c0107ba4:	75 21                	jne    c0107bc7 <console_putc_color+0x5d>
c0107ba6:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107bad:	66 85 c0             	test   %ax,%ax
c0107bb0:	74 15                	je     c0107bc7 <console_putc_color+0x5d>
c0107bb2:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107bb9:	83 e8 01             	sub    $0x1,%eax
c0107bbc:	66 a3 40 62 11 c0    	mov    %ax,0xc0116240
c0107bc2:	e9 98 00 00 00       	jmp    c0107c5f <console_putc_color+0xf5>
c0107bc7:	80 7d ec 09          	cmpb   $0x9,-0x14(%ebp)
c0107bcb:	75 15                	jne    c0107be2 <console_putc_color+0x78>
c0107bcd:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107bd4:	83 c0 08             	add    $0x8,%eax
c0107bd7:	83 e0 f8             	and    $0xfffffff8,%eax
c0107bda:	66 a3 40 62 11 c0    	mov    %ax,0xc0116240
c0107be0:	eb 7d                	jmp    c0107c5f <console_putc_color+0xf5>
c0107be2:	80 7d ec 0d          	cmpb   $0xd,-0x14(%ebp)
c0107be6:	75 0b                	jne    c0107bf3 <console_putc_color+0x89>
c0107be8:	66 c7 05 40 62 11 c0 	movw   $0x0,0xc0116240
c0107bef:	00 00 
c0107bf1:	eb 6c                	jmp    c0107c5f <console_putc_color+0xf5>
c0107bf3:	80 7d ec 0a          	cmpb   $0xa,-0x14(%ebp)
c0107bf7:	75 1b                	jne    c0107c14 <console_putc_color+0xaa>
c0107bf9:	66 c7 05 40 62 11 c0 	movw   $0x0,0xc0116240
c0107c00:	00 00 
c0107c02:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107c09:	83 c0 01             	add    $0x1,%eax
c0107c0c:	66 a3 42 62 11 c0    	mov    %ax,0xc0116242
c0107c12:	eb 4b                	jmp    c0107c5f <console_putc_color+0xf5>
c0107c14:	80 7d ec 1f          	cmpb   $0x1f,-0x14(%ebp)
c0107c18:	7e 45                	jle    c0107c5f <console_putc_color+0xf5>
c0107c1a:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107c21:	0f b7 d0             	movzwl %ax,%edx
c0107c24:	89 d0                	mov    %edx,%eax
c0107c26:	c1 e0 02             	shl    $0x2,%eax
c0107c29:	01 d0                	add    %edx,%eax
c0107c2b:	c1 e0 04             	shl    $0x4,%eax
c0107c2e:	89 c2                	mov    %eax,%edx
c0107c30:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107c37:	0f b7 c0             	movzwl %ax,%eax
c0107c3a:	01 c2                	add    %eax,%edx
c0107c3c:	66 0f be 4d ec       	movsbw -0x14(%ebp),%cx
c0107c41:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
c0107c45:	09 c8                	or     %ecx,%eax
c0107c47:	66 89 84 12 40 12 11 	mov    %ax,-0x3feeedc0(%edx,%edx,1)
c0107c4e:	c0 
c0107c4f:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107c56:	83 c0 01             	add    $0x1,%eax
c0107c59:	66 a3 40 62 11 c0    	mov    %ax,0xc0116240
c0107c5f:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107c66:	66 83 f8 50          	cmp    $0x50,%ax
c0107c6a:	75 19                	jne    c0107c85 <console_putc_color+0x11b>
c0107c6c:	66 c7 05 40 62 11 c0 	movw   $0x0,0xc0116240
c0107c73:	00 00 
c0107c75:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107c7c:	83 c0 01             	add    $0x1,%eax
c0107c7f:	66 a3 42 62 11 c0    	mov    %ax,0xc0116242
c0107c85:	e8 55 fe ff ff       	call   c0107adf <scroll_buffer>
c0107c8a:	c9                   	leave  
c0107c8b:	c3                   	ret    

c0107c8c <console_write>:
c0107c8c:	55                   	push   %ebp
c0107c8d:	89 e5                	mov    %esp,%ebp
c0107c8f:	83 ec 28             	sub    $0x28,%esp
c0107c92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107c99:	e8 c8 fc ff ff       	call   c0107966 <__intr_store>
c0107c9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107ca1:	eb 27                	jmp    c0107cca <console_write+0x3e>
c0107ca3:	8b 45 08             	mov    0x8(%ebp),%eax
c0107ca6:	8d 50 01             	lea    0x1(%eax),%edx
c0107ca9:	89 55 08             	mov    %edx,0x8(%ebp)
c0107cac:	0f b6 00             	movzbl (%eax),%eax
c0107caf:	0f be c0             	movsbl %al,%eax
c0107cb2:	c7 44 24 08 0f 00 00 	movl   $0xf,0x8(%esp)
c0107cb9:	00 
c0107cba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107cc1:	00 
c0107cc2:	89 04 24             	mov    %eax,(%esp)
c0107cc5:	e8 a0 fe ff ff       	call   c0107b6a <console_putc_color>
c0107cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0107ccd:	0f b6 00             	movzbl (%eax),%eax
c0107cd0:	84 c0                	test   %al,%al
c0107cd2:	75 cf                	jne    c0107ca3 <console_write+0x17>
c0107cd4:	e8 3c 01 00 00       	call   c0107e15 <_flush_console_current>
c0107cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107cdc:	89 04 24             	mov    %eax,(%esp)
c0107cdf:	e8 a6 fc ff ff       	call   c010798a <__intr_restore>
c0107ce4:	c9                   	leave  
c0107ce5:	c3                   	ret    

c0107ce6 <console_write_color>:
c0107ce6:	55                   	push   %ebp
c0107ce7:	89 e5                	mov    %esp,%ebp
c0107ce9:	83 ec 28             	sub    $0x28,%esp
c0107cec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107cf3:	e8 6e fc ff ff       	call   c0107966 <__intr_store>
c0107cf8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107cfb:	eb 25                	jmp    c0107d22 <console_write_color+0x3c>
c0107cfd:	8b 45 08             	mov    0x8(%ebp),%eax
c0107d00:	8d 50 01             	lea    0x1(%eax),%edx
c0107d03:	89 55 08             	mov    %edx,0x8(%ebp)
c0107d06:	0f b6 00             	movzbl (%eax),%eax
c0107d09:	0f be c0             	movsbl %al,%eax
c0107d0c:	8b 55 10             	mov    0x10(%ebp),%edx
c0107d0f:	89 54 24 08          	mov    %edx,0x8(%esp)
c0107d13:	8b 55 0c             	mov    0xc(%ebp),%edx
c0107d16:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107d1a:	89 04 24             	mov    %eax,(%esp)
c0107d1d:	e8 48 fe ff ff       	call   c0107b6a <console_putc_color>
c0107d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0107d25:	0f b6 00             	movzbl (%eax),%eax
c0107d28:	84 c0                	test   %al,%al
c0107d2a:	75 d1                	jne    c0107cfd <console_write_color+0x17>
c0107d2c:	e8 e4 00 00 00       	call   c0107e15 <_flush_console_current>
c0107d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d34:	89 04 24             	mov    %eax,(%esp)
c0107d37:	e8 4e fc ff ff       	call   c010798a <__intr_restore>
c0107d3c:	c9                   	leave  
c0107d3d:	c3                   	ret    

c0107d3e <_flush_console>:
c0107d3e:	55                   	push   %ebp
c0107d3f:	89 e5                	mov    %esp,%ebp
c0107d41:	83 ec 10             	sub    $0x10,%esp
c0107d44:	c6 45 f7 0f          	movb   $0xf,-0x9(%ebp)
c0107d48:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0107d4c:	c1 e0 08             	shl    $0x8,%eax
c0107d4f:	83 c8 20             	or     $0x20,%eax
c0107d52:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
c0107d56:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107d5c:	66 c7 45 f0 00 00    	movw   $0x0,-0x10(%ebp)
c0107d62:	0f b7 05 44 62 11 c0 	movzwl 0xc0116244,%eax
c0107d69:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
c0107d6d:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107d74:	83 c0 01             	add    $0x1,%eax
c0107d77:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
c0107d7b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0107d82:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0107d86:	89 d0                	mov    %edx,%eax
c0107d88:	c1 e0 02             	shl    $0x2,%eax
c0107d8b:	01 d0                	add    %edx,%eax
c0107d8d:	c1 e0 04             	shl    $0x4,%eax
c0107d90:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0107d93:	eb 22                	jmp    c0107db7 <_flush_console+0x79>
c0107d95:	a1 a0 96 10 c0       	mov    0xc01096a0,%eax
c0107d9a:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0107d9d:	01 d2                	add    %edx,%edx
c0107d9f:	01 c2                	add    %eax,%edx
c0107da1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0107da4:	0f b7 84 00 40 12 11 	movzwl -0x3feeedc0(%eax,%eax,1),%eax
c0107dab:	c0 
c0107dac:	66 89 02             	mov    %ax,(%edx)
c0107daf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0107db3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0107db7:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
c0107dbb:	89 d0                	mov    %edx,%eax
c0107dbd:	c1 e0 02             	shl    $0x2,%eax
c0107dc0:	01 d0                	add    %edx,%eax
c0107dc2:	c1 e0 04             	shl    $0x4,%eax
c0107dc5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0107dc8:	77 cb                	ja     c0107d95 <_flush_console+0x57>
c0107dca:	eb 17                	jmp    c0107de3 <_flush_console+0xa5>
c0107dcc:	a1 a0 96 10 c0       	mov    0xc01096a0,%eax
c0107dd1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0107dd4:	01 d2                	add    %edx,%edx
c0107dd6:	01 c2                	add    %eax,%edx
c0107dd8:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
c0107ddc:	66 89 02             	mov    %ax,(%edx)
c0107ddf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0107de3:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%ebp)
c0107dea:	76 e0                	jbe    c0107dcc <_flush_console+0x8e>
c0107dec:	0f b7 05 40 62 11 c0 	movzwl 0xc0116240,%eax
c0107df3:	66 a3 20 12 11 c0    	mov    %ax,0xc0111220
c0107df9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c0107dfd:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
c0107e01:	29 c2                	sub    %eax,%edx
c0107e03:	89 d0                	mov    %edx,%eax
c0107e05:	83 e8 01             	sub    $0x1,%eax
c0107e08:	66 a3 22 12 11 c0    	mov    %ax,0xc0111222
c0107e0e:	e8 4a fc ff ff       	call   c0107a5d <move_cursor>
c0107e13:	c9                   	leave  
c0107e14:	c3                   	ret    

c0107e15 <_flush_console_current>:
c0107e15:	55                   	push   %ebp
c0107e16:	89 e5                	mov    %esp,%ebp
c0107e18:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107e1f:	66 83 f8 17          	cmp    $0x17,%ax
c0107e23:	76 12                	jbe    c0107e37 <_flush_console_current+0x22>
c0107e25:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107e2c:	83 e8 18             	sub    $0x18,%eax
c0107e2f:	66 a3 44 62 11 c0    	mov    %ax,0xc0116244
c0107e35:	eb 09                	jmp    c0107e40 <_flush_console_current+0x2b>
c0107e37:	66 c7 05 44 62 11 c0 	movw   $0x0,0xc0116244
c0107e3e:	00 00 
c0107e40:	e8 f9 fe ff ff       	call   c0107d3e <_flush_console>
c0107e45:	5d                   	pop    %ebp
c0107e46:	c3                   	ret    

c0107e47 <console_view_up>:
c0107e47:	55                   	push   %ebp
c0107e48:	89 e5                	mov    %esp,%ebp
c0107e4a:	83 ec 04             	sub    $0x4,%esp
c0107e4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107e50:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0107e54:	0f b7 05 44 62 11 c0 	movzwl 0xc0116244,%eax
c0107e5b:	66 3b 45 fc          	cmp    -0x4(%ebp),%ax
c0107e5f:	72 13                	jb     c0107e74 <console_view_up+0x2d>
c0107e61:	0f b7 05 44 62 11 c0 	movzwl 0xc0116244,%eax
c0107e68:	66 2b 45 fc          	sub    -0x4(%ebp),%ax
c0107e6c:	66 a3 44 62 11 c0    	mov    %ax,0xc0116244
c0107e72:	eb 09                	jmp    c0107e7d <console_view_up+0x36>
c0107e74:	66 c7 05 44 62 11 c0 	movw   $0x0,0xc0116244
c0107e7b:	00 00 
c0107e7d:	e8 bc fe ff ff       	call   c0107d3e <_flush_console>
c0107e82:	c9                   	leave  
c0107e83:	c3                   	ret    

c0107e84 <console_view_down>:
c0107e84:	55                   	push   %ebp
c0107e85:	89 e5                	mov    %esp,%ebp
c0107e87:	83 ec 04             	sub    $0x4,%esp
c0107e8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0107e8d:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0107e91:	0f b7 05 44 62 11 c0 	movzwl 0xc0116244,%eax
c0107e98:	0f b7 d0             	movzwl %ax,%edx
c0107e9b:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0107e9f:	01 c2                	add    %eax,%edx
c0107ea1:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107ea8:	0f b7 c0             	movzwl %ax,%eax
c0107eab:	39 c2                	cmp    %eax,%edx
c0107ead:	7d 15                	jge    c0107ec4 <console_view_down+0x40>
c0107eaf:	0f b7 15 44 62 11 c0 	movzwl 0xc0116244,%edx
c0107eb6:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0107eba:	01 d0                	add    %edx,%eax
c0107ebc:	66 a3 44 62 11 c0    	mov    %ax,0xc0116244
c0107ec2:	eb 0d                	jmp    c0107ed1 <console_view_down+0x4d>
c0107ec4:	0f b7 05 42 62 11 c0 	movzwl 0xc0116242,%eax
c0107ecb:	66 a3 44 62 11 c0    	mov    %ax,0xc0116244
c0107ed1:	e8 68 fe ff ff       	call   c0107d3e <_flush_console>
c0107ed6:	c9                   	leave  
c0107ed7:	c3                   	ret    

c0107ed8 <outb>:
c0107ed8:	55                   	push   %ebp
c0107ed9:	89 e5                	mov    %esp,%ebp
c0107edb:	83 ec 08             	sub    $0x8,%esp
c0107ede:	8b 55 08             	mov    0x8(%ebp),%edx
c0107ee1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107ee4:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c0107ee8:	88 45 f8             	mov    %al,-0x8(%ebp)
c0107eeb:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c0107eef:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0107ef3:	ee                   	out    %al,(%dx)
c0107ef4:	c9                   	leave  
c0107ef5:	c3                   	ret    

c0107ef6 <clock_init>:
c0107ef6:	55                   	push   %ebp
c0107ef7:	89 e5                	mov    %esp,%ebp
c0107ef9:	83 ec 28             	sub    $0x28,%esp
c0107efc:	c7 44 24 04 67 63 10 	movl   $0xc0106367,0x4(%esp)
c0107f03:	c0 
c0107f04:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0107f0b:	e8 bd f9 ff ff       	call   c01078cd <register_interrupt_handler>
c0107f10:	c7 45 f4 9b 2e 00 00 	movl   $0x2e9b,-0xc(%ebp)
c0107f17:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
c0107f1e:	00 
c0107f1f:	c7 04 24 43 00 00 00 	movl   $0x43,(%esp)
c0107f26:	e8 ad ff ff ff       	call   c0107ed8 <outb>
c0107f2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f2e:	88 45 f3             	mov    %al,-0xd(%ebp)
c0107f31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f34:	c1 e8 08             	shr    $0x8,%eax
c0107f37:	88 45 f2             	mov    %al,-0xe(%ebp)
c0107f3a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0107f3e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107f42:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
c0107f49:	e8 8a ff ff ff       	call   c0107ed8 <outb>
c0107f4e:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
c0107f52:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107f56:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
c0107f5d:	e8 76 ff ff ff       	call   c0107ed8 <outb>
c0107f62:	c9                   	leave  
c0107f63:	c3                   	ret    

c0107f64 <outb>:
c0107f64:	55                   	push   %ebp
c0107f65:	89 e5                	mov    %esp,%ebp
c0107f67:	83 ec 08             	sub    $0x8,%esp
c0107f6a:	8b 55 08             	mov    0x8(%ebp),%edx
c0107f6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107f70:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c0107f74:	88 45 f8             	mov    %al,-0x8(%ebp)
c0107f77:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c0107f7b:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0107f7f:	ee                   	out    %al,(%dx)
c0107f80:	c9                   	leave  
c0107f81:	c3                   	ret    

c0107f82 <init_interrupt_chip>:
c0107f82:	55                   	push   %ebp
c0107f83:	89 e5                	mov    %esp,%ebp
c0107f85:	83 ec 08             	sub    $0x8,%esp
c0107f88:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0107f8f:	00 
c0107f90:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0107f97:	e8 c8 ff ff ff       	call   c0107f64 <outb>
c0107f9c:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
c0107fa3:	00 
c0107fa4:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
c0107fab:	e8 b4 ff ff ff       	call   c0107f64 <outb>
c0107fb0:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c0107fb7:	00 
c0107fb8:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
c0107fbf:	e8 a0 ff ff ff       	call   c0107f64 <outb>
c0107fc4:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
c0107fcb:	00 
c0107fcc:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
c0107fd3:	e8 8c ff ff ff       	call   c0107f64 <outb>
c0107fd8:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0107fdf:	00 
c0107fe0:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
c0107fe7:	e8 78 ff ff ff       	call   c0107f64 <outb>
c0107fec:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c0107ff3:	00 
c0107ff4:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
c0107ffb:	e8 64 ff ff ff       	call   c0107f64 <outb>
c0108000:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0108007:	00 
c0108008:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
c010800f:	e8 50 ff ff ff       	call   c0107f64 <outb>
c0108014:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010801b:	00 
c010801c:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
c0108023:	e8 3c ff ff ff       	call   c0107f64 <outb>
c0108028:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010802f:	00 
c0108030:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
c0108037:	e8 28 ff ff ff       	call   c0107f64 <outb>
c010803c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0108043:	00 
c0108044:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
c010804b:	e8 14 ff ff ff       	call   c0107f64 <outb>
c0108050:	c9                   	leave  
c0108051:	c3                   	ret    

c0108052 <clear_interrupt_chip>:
c0108052:	55                   	push   %ebp
c0108053:	89 e5                	mov    %esp,%ebp
c0108055:	83 ec 08             	sub    $0x8,%esp
c0108058:	83 7d 08 27          	cmpl   $0x27,0x8(%ebp)
c010805c:	76 14                	jbe    c0108072 <clear_interrupt_chip+0x20>
c010805e:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c0108065:	00 
c0108066:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
c010806d:	e8 f2 fe ff ff       	call   c0107f64 <outb>
c0108072:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
c0108079:	00 
c010807a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0108081:	e8 de fe ff ff       	call   c0107f64 <outb>
c0108086:	c9                   	leave  
c0108087:	c3                   	ret    

c0108088 <arch_init>:
c0108088:	55                   	push   %ebp
c0108089:	89 e5                	mov    %esp,%ebp
c010808b:	83 ec 08             	sub    $0x8,%esp
c010808e:	e8 3d ee ff ff       	call   c0106ed0 <gdt_init>
c0108093:	e8 b2 f6 ff ff       	call   c010774a <idt_init>
c0108098:	e8 59 fe ff ff       	call   c0107ef6 <clock_init>
c010809d:	e8 f8 f8 ff ff       	call   c010799a <console_init>
c01080a2:	c9                   	leave  
c01080a3:	c3                   	ret    

c01080a4 <enable_intr>:
c01080a4:	55                   	push   %ebp
c01080a5:	89 e5                	mov    %esp,%ebp
c01080a7:	fb                   	sti    
c01080a8:	5d                   	pop    %ebp
c01080a9:	c3                   	ret    

c01080aa <disable_intr>:
c01080aa:	55                   	push   %ebp
c01080ab:	89 e5                	mov    %esp,%ebp
c01080ad:	fa                   	cli    
c01080ae:	5d                   	pop    %ebp
c01080af:	c3                   	ret    

c01080b0 <read_eflags>:
c01080b0:	55                   	push   %ebp
c01080b1:	89 e5                	mov    %esp,%ebp
c01080b3:	83 ec 10             	sub    $0x10,%esp
c01080b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01080bd:	9c                   	pushf  
c01080be:	58                   	pop    %eax
c01080bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01080c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01080c5:	c9                   	leave  
c01080c6:	c3                   	ret    

c01080c7 <INIT_LIST_HEAD>:
c01080c7:	55                   	push   %ebp
c01080c8:	89 e5                	mov    %esp,%ebp
c01080ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01080cd:	8b 55 08             	mov    0x8(%ebp),%edx
c01080d0:	89 10                	mov    %edx,(%eax)
c01080d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01080d5:	8b 55 08             	mov    0x8(%ebp),%edx
c01080d8:	89 50 04             	mov    %edx,0x4(%eax)
c01080db:	5d                   	pop    %ebp
c01080dc:	c3                   	ret    

c01080dd <__list_add>:
c01080dd:	55                   	push   %ebp
c01080de:	89 e5                	mov    %esp,%ebp
c01080e0:	8b 45 10             	mov    0x10(%ebp),%eax
c01080e3:	8b 55 08             	mov    0x8(%ebp),%edx
c01080e6:	89 50 04             	mov    %edx,0x4(%eax)
c01080e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01080ec:	8b 55 10             	mov    0x10(%ebp),%edx
c01080ef:	89 10                	mov    %edx,(%eax)
c01080f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01080f4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01080f7:	89 50 04             	mov    %edx,0x4(%eax)
c01080fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01080fd:	8b 55 08             	mov    0x8(%ebp),%edx
c0108100:	89 10                	mov    %edx,(%eax)
c0108102:	5d                   	pop    %ebp
c0108103:	c3                   	ret    

c0108104 <list_add>:
c0108104:	55                   	push   %ebp
c0108105:	89 e5                	mov    %esp,%ebp
c0108107:	83 ec 0c             	sub    $0xc,%esp
c010810a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010810d:	8b 00                	mov    (%eax),%eax
c010810f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0108113:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108116:	89 44 24 04          	mov    %eax,0x4(%esp)
c010811a:	8b 45 08             	mov    0x8(%ebp),%eax
c010811d:	89 04 24             	mov    %eax,(%esp)
c0108120:	e8 b8 ff ff ff       	call   c01080dd <__list_add>
c0108125:	c9                   	leave  
c0108126:	c3                   	ret    

c0108127 <pa_to_ka>:
c0108127:	55                   	push   %ebp
c0108128:	89 e5                	mov    %esp,%ebp
c010812a:	8b 45 08             	mov    0x8(%ebp),%eax
c010812d:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0108132:	5d                   	pop    %ebp
c0108133:	c3                   	ret    

c0108134 <ka_to_pa>:
c0108134:	55                   	push   %ebp
c0108135:	89 e5                	mov    %esp,%ebp
c0108137:	8b 45 08             	mov    0x8(%ebp),%eax
c010813a:	05 00 00 00 40       	add    $0x40000000,%eax
c010813f:	5d                   	pop    %ebp
c0108140:	c3                   	ret    

c0108141 <__intr_store>:
c0108141:	55                   	push   %ebp
c0108142:	89 e5                	mov    %esp,%ebp
c0108144:	e8 67 ff ff ff       	call   c01080b0 <read_eflags>
c0108149:	25 00 02 00 00       	and    $0x200,%eax
c010814e:	85 c0                	test   %eax,%eax
c0108150:	74 0c                	je     c010815e <__intr_store+0x1d>
c0108152:	e8 53 ff ff ff       	call   c01080aa <disable_intr>
c0108157:	b8 01 00 00 00       	mov    $0x1,%eax
c010815c:	eb 05                	jmp    c0108163 <__intr_store+0x22>
c010815e:	b8 00 00 00 00       	mov    $0x0,%eax
c0108163:	5d                   	pop    %ebp
c0108164:	c3                   	ret    

c0108165 <__intr_restore>:
c0108165:	55                   	push   %ebp
c0108166:	89 e5                	mov    %esp,%ebp
c0108168:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010816c:	74 05                	je     c0108173 <__intr_restore+0xe>
c010816e:	e8 31 ff ff ff       	call   c01080a4 <enable_intr>
c0108173:	5d                   	pop    %ebp
c0108174:	c3                   	ret    

c0108175 <alloc_pid>:
c0108175:	55                   	push   %ebp
c0108176:	89 e5                	mov    %esp,%ebp
c0108178:	53                   	push   %ebx
c0108179:	83 ec 10             	sub    $0x10,%esp
c010817c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0108183:	eb 75                	jmp    c01081fa <alloc_pid+0x85>
c0108185:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0108188:	8b 04 85 80 62 11 c0 	mov    -0x3fee9d80(,%eax,4),%eax
c010818f:	83 f8 ff             	cmp    $0xffffffff,%eax
c0108192:	75 02                	jne    c0108196 <alloc_pid+0x21>
c0108194:	eb 60                	jmp    c01081f6 <alloc_pid+0x81>
c0108196:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010819d:	eb 51                	jmp    c01081f0 <alloc_pid+0x7b>
c010819f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01081a2:	8b 14 85 80 62 11 c0 	mov    -0x3fee9d80(,%eax,4),%edx
c01081a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01081ac:	89 c1                	mov    %eax,%ecx
c01081ae:	d3 ea                	shr    %cl,%edx
c01081b0:	89 d0                	mov    %edx,%eax
c01081b2:	83 e0 01             	and    $0x1,%eax
c01081b5:	85 c0                	test   %eax,%eax
c01081b7:	75 33                	jne    c01081ec <alloc_pid+0x77>
c01081b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01081bc:	8b 14 85 80 62 11 c0 	mov    -0x3fee9d80(,%eax,4),%edx
c01081c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01081c6:	bb 01 00 00 00       	mov    $0x1,%ebx
c01081cb:	89 c1                	mov    %eax,%ecx
c01081cd:	d3 e3                	shl    %cl,%ebx
c01081cf:	89 d8                	mov    %ebx,%eax
c01081d1:	09 c2                	or     %eax,%edx
c01081d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01081d6:	89 14 85 80 62 11 c0 	mov    %edx,-0x3fee9d80(,%eax,4)
c01081dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01081e0:	c1 e0 05             	shl    $0x5,%eax
c01081e3:	89 c2                	mov    %eax,%edx
c01081e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01081e8:	01 d0                	add    %edx,%eax
c01081ea:	eb 1c                	jmp    c0108208 <alloc_pid+0x93>
c01081ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01081f0:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
c01081f4:	7e a9                	jle    c010819f <alloc_pid+0x2a>
c01081f6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01081fa:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%ebp)
c0108201:	7e 82                	jle    c0108185 <alloc_pid+0x10>
c0108203:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0108208:	83 c4 10             	add    $0x10,%esp
c010820b:	5b                   	pop    %ebx
c010820c:	5d                   	pop    %ebp
c010820d:	c3                   	ret    

c010820e <free_pid>:
c010820e:	55                   	push   %ebp
c010820f:	89 e5                	mov    %esp,%ebp
c0108211:	56                   	push   %esi
c0108212:	53                   	push   %ebx
c0108213:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0108217:	78 09                	js     c0108222 <free_pid+0x14>
c0108219:	81 7d 08 00 20 00 00 	cmpl   $0x2000,0x8(%ebp)
c0108220:	7e 02                	jle    c0108224 <free_pid+0x16>
c0108222:	eb 3d                	jmp    c0108261 <free_pid+0x53>
c0108224:	8b 45 08             	mov    0x8(%ebp),%eax
c0108227:	8d 50 1f             	lea    0x1f(%eax),%edx
c010822a:	85 c0                	test   %eax,%eax
c010822c:	0f 48 c2             	cmovs  %edx,%eax
c010822f:	c1 f8 05             	sar    $0x5,%eax
c0108232:	8b 1c 85 80 62 11 c0 	mov    -0x3fee9d80(,%eax,4),%ebx
c0108239:	8b 55 08             	mov    0x8(%ebp),%edx
c010823c:	89 d1                	mov    %edx,%ecx
c010823e:	c1 f9 1f             	sar    $0x1f,%ecx
c0108241:	c1 e9 1b             	shr    $0x1b,%ecx
c0108244:	01 ca                	add    %ecx,%edx
c0108246:	83 e2 1f             	and    $0x1f,%edx
c0108249:	29 ca                	sub    %ecx,%edx
c010824b:	be 01 00 00 00       	mov    $0x1,%esi
c0108250:	89 d1                	mov    %edx,%ecx
c0108252:	d3 e6                	shl    %cl,%esi
c0108254:	89 f2                	mov    %esi,%edx
c0108256:	f7 d2                	not    %edx
c0108258:	21 da                	and    %ebx,%edx
c010825a:	89 14 85 80 62 11 c0 	mov    %edx,-0x3fee9d80(,%eax,4)
c0108261:	5b                   	pop    %ebx
c0108262:	5e                   	pop    %esi
c0108263:	5d                   	pop    %ebp
c0108264:	c3                   	ret    

c0108265 <task_init>:
c0108265:	55                   	push   %ebp
c0108266:	89 e5                	mov    %esp,%ebp
c0108268:	83 ec 28             	sub    $0x28,%esp
c010826b:	c7 04 24 08 b0 11 c0 	movl   $0xc011b008,(%esp)
c0108272:	e8 50 fe ff ff       	call   c01080c7 <INIT_LIST_HEAD>
c0108277:	c7 45 f4 00 a0 11 c0 	movl   $0xc011a000,-0xc(%ebp)
c010827e:	c7 44 24 04 70 01 00 	movl   $0x170,0x4(%esp)
c0108285:	00 
c0108286:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108289:	89 04 24             	mov    %eax,(%esp)
c010828c:	e8 27 c1 ff ff       	call   c01043b8 <bzero>
c0108291:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108294:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010829a:	a1 a4 96 10 c0       	mov    0xc01096a4,%eax
c010829f:	89 c2                	mov    %eax,%edx
c01082a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082a4:	89 50 04             	mov    %edx,0x4(%eax)
c01082a7:	e8 c9 fe ff ff       	call   c0108175 <alloc_pid>
c01082ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01082af:	89 42 08             	mov    %eax,0x8(%edx)
c01082b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082b5:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
c01082bc:	c7 44 24 04 2b a7 10 	movl   $0xc010a72b,0x4(%esp)
c01082c3:	c0 
c01082c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082c7:	89 04 24             	mov    %eax,(%esp)
c01082ca:	e8 59 01 00 00       	call   c0108428 <set_proc_name>
c01082cf:	a1 60 62 11 c0       	mov    0xc0116260,%eax
c01082d4:	83 c0 01             	add    $0x1,%eax
c01082d7:	a3 60 62 11 c0       	mov    %eax,0xc0116260
c01082dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082df:	05 68 01 00 00       	add    $0x168,%eax
c01082e4:	c7 44 24 04 08 b0 11 	movl   $0xc011b008,0x4(%esp)
c01082eb:	c0 
c01082ec:	89 04 24             	mov    %eax,(%esp)
c01082ef:	e8 10 fe ff ff       	call   c0108104 <list_add>
c01082f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082f7:	a3 04 b0 11 c0       	mov    %eax,0xc011b004
c01082fc:	c7 44 24 04 39 88 10 	movl   $0xc0108839,0x4(%esp)
c0108303:	c0 
c0108304:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
c010830b:	e8 bd f5 ff ff       	call   c01078cd <register_interrupt_handler>
c0108310:	c9                   	leave  
c0108311:	c3                   	ret    

c0108312 <kernel_thread>:
c0108312:	55                   	push   %ebp
c0108313:	89 e5                	mov    %esp,%ebp
c0108315:	83 ec 58             	sub    $0x58,%esp
c0108318:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c010831f:	00 
c0108320:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0108323:	89 04 24             	mov    %eax,(%esp)
c0108326:	e8 8d c0 ff ff       	call   c01043b8 <bzero>
c010832b:	66 c7 45 e8 08 00    	movw   $0x8,-0x18(%ebp)
c0108331:	66 c7 45 b8 10 00    	movw   $0x10,-0x48(%ebp)
c0108337:	66 c7 45 f4 10 00    	movw   $0x10,-0xc(%ebp)
c010833d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108340:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0108343:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108346:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108349:	b8 d0 21 10 c0       	mov    $0xc01021d0,%eax
c010834e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108351:	8b 45 10             	mov    0x10(%ebp),%eax
c0108354:	80 cc 01             	or     $0x1,%ah
c0108357:	89 c2                	mov    %eax,%edx
c0108359:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010835c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108360:	89 14 24             	mov    %edx,(%esp)
c0108363:	e8 4f 02 00 00       	call   c01085b7 <do_fork>
c0108368:	c9                   	leave  
c0108369:	c3                   	ret    

c010836a <task_run>:
c010836a:	55                   	push   %ebp
c010836b:	89 e5                	mov    %esp,%ebp
c010836d:	83 ec 28             	sub    $0x28,%esp
c0108370:	e8 55 00 00 00       	call   c01083ca <get_current>
c0108375:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108378:	74 4e                	je     c01083c8 <task_run+0x5e>
c010837a:	e8 4b 00 00 00       	call   c01083ca <get_current>
c010837f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108382:	8b 45 08             	mov    0x8(%ebp),%eax
c0108385:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108388:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010838f:	e8 ad fd ff ff       	call   c0108141 <__intr_store>
c0108394:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108397:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010839b:	75 08                	jne    c01083a5 <task_run+0x3b>
c010839d:	8b 45 08             	mov    0x8(%ebp),%eax
c01083a0:	8b 40 30             	mov    0x30(%eax),%eax
c01083a3:	85 c0                	test   %eax,%eax
c01083a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083a8:	8d 50 38             	lea    0x38(%eax),%edx
c01083ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01083ae:	83 c0 38             	add    $0x38,%eax
c01083b1:	89 54 24 04          	mov    %edx,0x4(%esp)
c01083b5:	89 04 24             	mov    %eax,(%esp)
c01083b8:	e8 23 9e ff ff       	call   c01021e0 <switch_to>
c01083bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01083c0:	89 04 24             	mov    %eax,(%esp)
c01083c3:	e8 9d fd ff ff       	call   c0108165 <__intr_restore>
c01083c8:	c9                   	leave  
c01083c9:	c3                   	ret    

c01083ca <get_current>:
c01083ca:	55                   	push   %ebp
c01083cb:	89 e5                	mov    %esp,%ebp
c01083cd:	89 e0                	mov    %esp,%eax
c01083cf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01083d4:	5d                   	pop    %ebp
c01083d5:	c3                   	ret    

c01083d6 <find_task>:
c01083d6:	55                   	push   %ebp
c01083d7:	89 e5                	mov    %esp,%ebp
c01083d9:	83 ec 10             	sub    $0x10,%esp
c01083dc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01083e0:	7e 3f                	jle    c0108421 <find_task+0x4b>
c01083e2:	81 7d 08 ff 1f 00 00 	cmpl   $0x1fff,0x8(%ebp)
c01083e9:	7f 36                	jg     c0108421 <find_task+0x4b>
c01083eb:	a1 08 b0 11 c0       	mov    0xc011b008,%eax
c01083f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01083f3:	eb 23                	jmp    c0108418 <find_task+0x42>
c01083f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01083f8:	2d 68 01 00 00       	sub    $0x168,%eax
c01083fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0108400:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0108403:	8b 40 08             	mov    0x8(%eax),%eax
c0108406:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108409:	75 05                	jne    c0108410 <find_task+0x3a>
c010840b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010840e:	eb 16                	jmp    c0108426 <find_task+0x50>
c0108410:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108413:	8b 00                	mov    (%eax),%eax
c0108415:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0108418:	81 7d fc 08 b0 11 c0 	cmpl   $0xc011b008,-0x4(%ebp)
c010841f:	75 d4                	jne    c01083f5 <find_task+0x1f>
c0108421:	b8 00 00 00 00       	mov    $0x0,%eax
c0108426:	c9                   	leave  
c0108427:	c3                   	ret    

c0108428 <set_proc_name>:
c0108428:	55                   	push   %ebp
c0108429:	89 e5                	mov    %esp,%ebp
c010842b:	83 ec 18             	sub    $0x18,%esp
c010842e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108431:	83 c0 0c             	add    $0xc,%eax
c0108434:	c7 44 24 04 15 00 00 	movl   $0x15,0x4(%esp)
c010843b:	00 
c010843c:	89 04 24             	mov    %eax,(%esp)
c010843f:	e8 74 bf ff ff       	call   c01043b8 <bzero>
c0108444:	8b 45 08             	mov    0x8(%ebp),%eax
c0108447:	8d 50 0c             	lea    0xc(%eax),%edx
c010844a:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
c0108451:	00 
c0108452:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108455:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108459:	89 14 24             	mov    %edx,(%esp)
c010845c:	e8 14 c0 ff ff       	call   c0104475 <strncpy>
c0108461:	c9                   	leave  
c0108462:	c3                   	ret    

c0108463 <alloc_task_struct>:
c0108463:	55                   	push   %ebp
c0108464:	89 e5                	mov    %esp,%ebp
c0108466:	83 ec 28             	sub    $0x28,%esp
c0108469:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0108470:	e8 bb e8 ff ff       	call   c0106d30 <alloc_pages>
c0108475:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108478:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010847c:	75 0c                	jne    c010848a <alloc_task_struct+0x27>
c010847e:	c7 04 24 30 a7 10 c0 	movl   $0xc010a730,(%esp)
c0108485:	e8 38 ef ff ff       	call   c01073c2 <panic>
c010848a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010848d:	89 04 24             	mov    %eax,(%esp)
c0108490:	e8 92 fc ff ff       	call   c0108127 <pa_to_ka>
c0108495:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108498:	c7 44 24 04 70 01 00 	movl   $0x170,0x4(%esp)
c010849f:	00 
c01084a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084a3:	89 04 24             	mov    %eax,(%esp)
c01084a6:	e8 0d bf ff ff       	call   c01043b8 <bzero>
c01084ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084ae:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01084b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084b7:	05 f8 0f 00 00       	add    $0xff8,%eax
c01084bc:	89 c2                	mov    %eax,%edx
c01084be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084c1:	89 50 04             	mov    %edx,0x4(%eax)
c01084c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084c7:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
c01084ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084d1:	c9                   	leave  
c01084d2:	c3                   	ret    

c01084d3 <copy_mm>:
c01084d3:	55                   	push   %ebp
c01084d4:	89 e5                	mov    %esp,%ebp
c01084d6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01084da:	75 0d                	jne    c01084e9 <copy_mm+0x16>
c01084dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01084e0:	75 07                	jne    c01084e9 <copy_mm+0x16>
c01084e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01084e7:	eb 05                	jmp    c01084ee <copy_mm+0x1b>
c01084e9:	b8 00 00 00 00       	mov    $0x0,%eax
c01084ee:	5d                   	pop    %ebp
c01084ef:	c3                   	ret    

c01084f0 <copy_thread>:
c01084f0:	55                   	push   %ebp
c01084f1:	89 e5                	mov    %esp,%ebp
c01084f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01084f6:	8b 40 04             	mov    0x4(%eax),%eax
c01084f9:	83 e8 40             	sub    $0x40,%eax
c01084fc:	89 c2                	mov    %eax,%edx
c01084fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0108501:	89 50 34             	mov    %edx,0x34(%eax)
c0108504:	8b 45 08             	mov    0x8(%ebp),%eax
c0108507:	8b 40 34             	mov    0x34(%eax),%eax
c010850a:	8b 55 0c             	mov    0xc(%ebp),%edx
c010850d:	8b 0a                	mov    (%edx),%ecx
c010850f:	89 08                	mov    %ecx,(%eax)
c0108511:	8b 4a 04             	mov    0x4(%edx),%ecx
c0108514:	89 48 04             	mov    %ecx,0x4(%eax)
c0108517:	8b 4a 08             	mov    0x8(%edx),%ecx
c010851a:	89 48 08             	mov    %ecx,0x8(%eax)
c010851d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0108520:	89 48 0c             	mov    %ecx,0xc(%eax)
c0108523:	8b 4a 10             	mov    0x10(%edx),%ecx
c0108526:	89 48 10             	mov    %ecx,0x10(%eax)
c0108529:	8b 4a 14             	mov    0x14(%edx),%ecx
c010852c:	89 48 14             	mov    %ecx,0x14(%eax)
c010852f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0108532:	89 48 18             	mov    %ecx,0x18(%eax)
c0108535:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0108538:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010853b:	8b 4a 20             	mov    0x20(%edx),%ecx
c010853e:	89 48 20             	mov    %ecx,0x20(%eax)
c0108541:	8b 4a 24             	mov    0x24(%edx),%ecx
c0108544:	89 48 24             	mov    %ecx,0x24(%eax)
c0108547:	8b 4a 28             	mov    0x28(%edx),%ecx
c010854a:	89 48 28             	mov    %ecx,0x28(%eax)
c010854d:	8b 4a 2c             	mov    0x2c(%edx),%ecx
c0108550:	89 48 2c             	mov    %ecx,0x2c(%eax)
c0108553:	8b 4a 30             	mov    0x30(%edx),%ecx
c0108556:	89 48 30             	mov    %ecx,0x30(%eax)
c0108559:	8b 4a 34             	mov    0x34(%edx),%ecx
c010855c:	89 48 34             	mov    %ecx,0x34(%eax)
c010855f:	8b 4a 38             	mov    0x38(%edx),%ecx
c0108562:	89 48 38             	mov    %ecx,0x38(%eax)
c0108565:	8b 52 3c             	mov    0x3c(%edx),%edx
c0108568:	89 50 3c             	mov    %edx,0x3c(%eax)
c010856b:	8b 45 08             	mov    0x8(%ebp),%eax
c010856e:	8b 40 34             	mov    0x34(%eax),%eax
c0108571:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
c0108578:	8b 45 08             	mov    0x8(%ebp),%eax
c010857b:	8b 40 34             	mov    0x34(%eax),%eax
c010857e:	8b 55 08             	mov    0x8(%ebp),%edx
c0108581:	8b 52 04             	mov    0x4(%edx),%edx
c0108584:	89 50 38             	mov    %edx,0x38(%eax)
c0108587:	8b 45 08             	mov    0x8(%ebp),%eax
c010858a:	8b 40 34             	mov    0x34(%eax),%eax
c010858d:	8b 55 08             	mov    0x8(%ebp),%edx
c0108590:	8b 52 34             	mov    0x34(%edx),%edx
c0108593:	8b 52 34             	mov    0x34(%edx),%edx
c0108596:	80 ce 02             	or     $0x2,%dh
c0108599:	89 50 34             	mov    %edx,0x34(%eax)
c010859c:	ba b9 21 10 c0       	mov    $0xc01021b9,%edx
c01085a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01085a4:	89 50 38             	mov    %edx,0x38(%eax)
c01085a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01085aa:	8b 40 34             	mov    0x34(%eax),%eax
c01085ad:	89 c2                	mov    %eax,%edx
c01085af:	8b 45 08             	mov    0x8(%ebp),%eax
c01085b2:	89 50 3c             	mov    %edx,0x3c(%eax)
c01085b5:	5d                   	pop    %ebp
c01085b6:	c3                   	ret    

c01085b7 <do_fork>:
c01085b7:	55                   	push   %ebp
c01085b8:	89 e5                	mov    %esp,%ebp
c01085ba:	83 ec 28             	sub    $0x28,%esp
c01085bd:	a1 60 62 11 c0       	mov    0xc0116260,%eax
c01085c2:	3d ff 0f 00 00       	cmp    $0xfff,%eax
c01085c7:	7e 0a                	jle    c01085d3 <do_fork+0x1c>
c01085c9:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
c01085ce:	e9 bd 00 00 00       	jmp    c0108690 <do_fork+0xd9>
c01085d3:	e8 8b fe ff ff       	call   c0108463 <alloc_task_struct>
c01085d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01085df:	75 0a                	jne    c01085eb <do_fork+0x34>
c01085e1:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
c01085e6:	e9 a5 00 00 00       	jmp    c0108690 <do_fork+0xd9>
c01085eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01085ee:	89 44 24 04          	mov    %eax,0x4(%esp)
c01085f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01085f5:	89 04 24             	mov    %eax,(%esp)
c01085f8:	e8 d6 fe ff ff       	call   c01084d3 <copy_mm>
c01085fd:	85 c0                	test   %eax,%eax
c01085ff:	74 22                	je     c0108623 <do_fork+0x6c>
c0108601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108604:	89 04 24             	mov    %eax,(%esp)
c0108607:	e8 28 fb ff ff       	call   c0108134 <ka_to_pa>
c010860c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0108613:	00 
c0108614:	89 04 24             	mov    %eax,(%esp)
c0108617:	e8 45 e7 ff ff       	call   c0106d61 <free_pages>
c010861c:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
c0108621:	eb 6d                	jmp    c0108690 <do_fork+0xd9>
c0108623:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108626:	89 44 24 04          	mov    %eax,0x4(%esp)
c010862a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010862d:	89 04 24             	mov    %eax,(%esp)
c0108630:	e8 bb fe ff ff       	call   c01084f0 <copy_thread>
c0108635:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010863c:	e8 00 fb ff ff       	call   c0108141 <__intr_store>
c0108641:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108644:	e8 2c fb ff ff       	call   c0108175 <alloc_pid>
c0108649:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010864c:	89 42 08             	mov    %eax,0x8(%edx)
c010864f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108652:	05 68 01 00 00       	add    $0x168,%eax
c0108657:	c7 44 24 04 08 b0 11 	movl   $0xc011b008,0x4(%esp)
c010865e:	c0 
c010865f:	89 04 24             	mov    %eax,(%esp)
c0108662:	e8 9d fa ff ff       	call   c0108104 <list_add>
c0108667:	a1 60 62 11 c0       	mov    0xc0116260,%eax
c010866c:	83 c0 01             	add    $0x1,%eax
c010866f:	a3 60 62 11 c0       	mov    %eax,0xc0116260
c0108674:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108677:	89 04 24             	mov    %eax,(%esp)
c010867a:	e8 e6 fa ff ff       	call   c0108165 <__intr_restore>
c010867f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108682:	89 04 24             	mov    %eax,(%esp)
c0108685:	e8 cc dd ff ff       	call   c0106456 <wakeup_task>
c010868a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010868d:	8b 40 08             	mov    0x8(%eax),%eax
c0108690:	c9                   	leave  
c0108691:	c3                   	ret    

c0108692 <do_exit>:
c0108692:	55                   	push   %ebp
c0108693:	89 e5                	mov    %esp,%ebp
c0108695:	83 ec 28             	sub    $0x28,%esp
c0108698:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010869f:	e8 9d fa ff ff       	call   c0108141 <__intr_store>
c01086a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01086a7:	e8 1e fd ff ff       	call   c01083ca <get_current>
c01086ac:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
c01086b2:	e8 13 fd ff ff       	call   c01083ca <get_current>
c01086b7:	8b 55 08             	mov    0x8(%ebp),%edx
c01086ba:	89 50 5c             	mov    %edx,0x5c(%eax)
c01086bd:	e8 08 fd ff ff       	call   c01083ca <get_current>
c01086c2:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
c01086c9:	a1 60 62 11 c0       	mov    0xc0116260,%eax
c01086ce:	83 e8 01             	sub    $0x1,%eax
c01086d1:	a3 60 62 11 c0       	mov    %eax,0xc0116260
c01086d6:	e8 ef fc ff ff       	call   c01083ca <get_current>
c01086db:	8b 40 08             	mov    0x8(%eax),%eax
c01086de:	89 04 24             	mov    %eax,(%esp)
c01086e1:	e8 28 fb ff ff       	call   c010820e <free_pid>
c01086e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01086e9:	89 04 24             	mov    %eax,(%esp)
c01086ec:	e8 74 fa ff ff       	call   c0108165 <__intr_restore>
c01086f1:	e8 02 00 00 00       	call   c01086f8 <cpu_idle>
c01086f6:	c9                   	leave  
c01086f7:	c3                   	ret    

c01086f8 <cpu_idle>:
c01086f8:	55                   	push   %ebp
c01086f9:	89 e5                	mov    %esp,%ebp
c01086fb:	83 ec 08             	sub    $0x8,%esp
c01086fe:	e8 c7 fc ff ff       	call   c01083ca <get_current>
c0108703:	8b 40 28             	mov    0x28(%eax),%eax
c0108706:	85 c0                	test   %eax,%eax
c0108708:	74 05                	je     c010870f <cpu_idle+0x17>
c010870a:	e8 65 dc ff ff       	call   c0106374 <schedule>
c010870f:	c9                   	leave  
c0108710:	c3                   	ret    

c0108711 <sys_test>:
c0108711:	55                   	push   %ebp
c0108712:	89 e5                	mov    %esp,%ebp
c0108714:	83 ec 28             	sub    $0x28,%esp
c0108717:	8b 45 08             	mov    0x8(%ebp),%eax
c010871a:	8b 00                	mov    (%eax),%eax
c010871c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010871f:	c7 44 24 08 49 a7 10 	movl   $0xc010a749,0x8(%esp)
c0108726:	c0 
c0108727:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
c010872e:	00 
c010872f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0108736:	e8 ae d4 ff ff       	call   c0105be9 <cprintk>
c010873b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010873e:	c9                   	leave  
c010873f:	c3                   	ret    

c0108740 <sys_exit>:
c0108740:	55                   	push   %ebp
c0108741:	89 e5                	mov    %esp,%ebp
c0108743:	83 ec 10             	sub    $0x10,%esp
c0108746:	8b 45 08             	mov    0x8(%ebp),%eax
c0108749:	8b 00                	mov    (%eax),%eax
c010874b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010874e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108751:	c9                   	leave  
c0108752:	c3                   	ret    

c0108753 <sys_fork>:
c0108753:	55                   	push   %ebp
c0108754:	89 e5                	mov    %esp,%ebp
c0108756:	83 ec 10             	sub    $0x10,%esp
c0108759:	8b 45 08             	mov    0x8(%ebp),%eax
c010875c:	8b 00                	mov    (%eax),%eax
c010875e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0108761:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108764:	c9                   	leave  
c0108765:	c3                   	ret    

c0108766 <sys_read>:
c0108766:	55                   	push   %ebp
c0108767:	89 e5                	mov    %esp,%ebp
c0108769:	83 ec 28             	sub    $0x28,%esp
c010876c:	8b 45 08             	mov    0x8(%ebp),%eax
c010876f:	8b 00                	mov    (%eax),%eax
c0108771:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108774:	8b 45 08             	mov    0x8(%ebp),%eax
c0108777:	83 c0 04             	add    $0x4,%eax
c010877a:	8b 00                	mov    (%eax),%eax
c010877c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010877f:	8b 45 08             	mov    0x8(%ebp),%eax
c0108782:	8b 40 08             	mov    0x8(%eax),%eax
c0108785:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108788:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010878b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010878f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108792:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108796:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108799:	89 04 24             	mov    %eax,(%esp)
c010879c:	e8 fe b6 ff ff       	call   c0103e9f <vfs_read>
c01087a1:	c9                   	leave  
c01087a2:	c3                   	ret    

c01087a3 <sys_write>:
c01087a3:	55                   	push   %ebp
c01087a4:	89 e5                	mov    %esp,%ebp
c01087a6:	83 ec 28             	sub    $0x28,%esp
c01087a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01087ac:	8b 00                	mov    (%eax),%eax
c01087ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01087b4:	83 c0 04             	add    $0x4,%eax
c01087b7:	8b 00                	mov    (%eax),%eax
c01087b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01087bf:	8b 40 08             	mov    0x8(%eax),%eax
c01087c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01087cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087cf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01087d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087d6:	89 04 24             	mov    %eax,(%esp)
c01087d9:	e8 dc b6 ff ff       	call   c0103eba <vfs_write>
c01087de:	c9                   	leave  
c01087df:	c3                   	ret    

c01087e0 <sys_open>:
c01087e0:	55                   	push   %ebp
c01087e1:	89 e5                	mov    %esp,%ebp
c01087e3:	83 ec 28             	sub    $0x28,%esp
c01087e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01087e9:	8b 00                	mov    (%eax),%eax
c01087eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01087f1:	8b 40 04             	mov    0x4(%eax),%eax
c01087f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087fa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01087fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108801:	89 04 24             	mov    %eax,(%esp)
c0108804:	e8 71 b6 ff ff       	call   c0103e7a <vfs_open>
c0108809:	c9                   	leave  
c010880a:	c3                   	ret    

c010880b <sys_close>:
c010880b:	55                   	push   %ebp
c010880c:	89 e5                	mov    %esp,%ebp
c010880e:	83 ec 28             	sub    $0x28,%esp
c0108811:	8b 45 08             	mov    0x8(%ebp),%eax
c0108814:	8b 00                	mov    (%eax),%eax
c0108816:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108819:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010881c:	89 04 24             	mov    %eax,(%esp)
c010881f:	e8 73 b6 ff ff       	call   c0103e97 <vfs_close>
c0108824:	c9                   	leave  
c0108825:	c3                   	ret    

c0108826 <sys_getpid>:
c0108826:	55                   	push   %ebp
c0108827:	89 e5                	mov    %esp,%ebp
c0108829:	83 ec 10             	sub    $0x10,%esp
c010882c:	8b 45 08             	mov    0x8(%ebp),%eax
c010882f:	8b 00                	mov    (%eax),%eax
c0108831:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0108834:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108837:	c9                   	leave  
c0108838:	c3                   	ret    

c0108839 <syscall_handler>:
c0108839:	55                   	push   %ebp
c010883a:	89 e5                	mov    %esp,%ebp
c010883c:	83 ec 38             	sub    $0x38,%esp
c010883f:	8b 45 08             	mov    0x8(%ebp),%eax
c0108842:	8b 40 20             	mov    0x20(%eax),%eax
c0108845:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108848:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010884c:	78 5b                	js     c01088a9 <syscall_handler+0x70>
c010884e:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0108852:	7f 55                	jg     c01088a9 <syscall_handler+0x70>
c0108854:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108857:	8b 04 85 c0 96 10 c0 	mov    -0x3fef6940(,%eax,4),%eax
c010885e:	85 c0                	test   %eax,%eax
c0108860:	74 47                	je     c01088a9 <syscall_handler+0x70>
c0108862:	8b 45 08             	mov    0x8(%ebp),%eax
c0108865:	8b 40 14             	mov    0x14(%eax),%eax
c0108868:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010886b:	8b 45 08             	mov    0x8(%ebp),%eax
c010886e:	8b 40 1c             	mov    0x1c(%eax),%eax
c0108871:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108874:	8b 45 08             	mov    0x8(%ebp),%eax
c0108877:	8b 40 18             	mov    0x18(%eax),%eax
c010887a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010887d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108880:	8b 40 08             	mov    0x8(%eax),%eax
c0108883:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108886:	8b 45 08             	mov    0x8(%ebp),%eax
c0108889:	8b 40 04             	mov    0x4(%eax),%eax
c010888c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010888f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108892:	8b 04 85 c0 96 10 c0 	mov    -0x3fef6940(,%eax,4),%eax
c0108899:	8d 55 e0             	lea    -0x20(%ebp),%edx
c010889c:	89 14 24             	mov    %edx,(%esp)
c010889f:	ff d0                	call   *%eax
c01088a1:	89 c2                	mov    %eax,%edx
c01088a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01088a6:	89 50 20             	mov    %edx,0x20(%eax)
c01088a9:	c9                   	leave  
c01088aa:	c3                   	ret    
c01088ab:	66 90                	xchg   %ax,%ax
c01088ad:	66 90                	xchg   %ax,%ax
c01088af:	66 90                	xchg   %ax,%ax
c01088b1:	66 90                	xchg   %ax,%ax
c01088b3:	66 90                	xchg   %ax,%ax
c01088b5:	66 90                	xchg   %ax,%ax
c01088b7:	66 90                	xchg   %ax,%ax
c01088b9:	66 90                	xchg   %ax,%ax
c01088bb:	66 90                	xchg   %ax,%ax
c01088bd:	66 90                	xchg   %ax,%ax
c01088bf:	66 90                	xchg   %ax,%ax
c01088c1:	66 90                	xchg   %ax,%ax
c01088c3:	66 90                	xchg   %ax,%ax
c01088c5:	66 90                	xchg   %ax,%ax
c01088c7:	66 90                	xchg   %ax,%ax
c01088c9:	66 90                	xchg   %ax,%ax
c01088cb:	66 90                	xchg   %ax,%ax
c01088cd:	66 90                	xchg   %ax,%ax
c01088cf:	66 90                	xchg   %ax,%ax
c01088d1:	66 90                	xchg   %ax,%ax
c01088d3:	66 90                	xchg   %ax,%ax
c01088d5:	66 90                	xchg   %ax,%ax
c01088d7:	66 90                	xchg   %ax,%ax
c01088d9:	66 90                	xchg   %ax,%ax
c01088db:	66 90                	xchg   %ax,%ax
c01088dd:	66 90                	xchg   %ax,%ax
c01088df:	66 90                	xchg   %ax,%ax
c01088e1:	66 90                	xchg   %ax,%ax
c01088e3:	66 90                	xchg   %ax,%ax
c01088e5:	66 90                	xchg   %ax,%ax
c01088e7:	66 90                	xchg   %ax,%ax
c01088e9:	66 90                	xchg   %ax,%ax
c01088eb:	66 90                	xchg   %ax,%ax
c01088ed:	66 90                	xchg   %ax,%ax
c01088ef:	66 90                	xchg   %ax,%ax
c01088f1:	66 90                	xchg   %ax,%ax
c01088f3:	66 90                	xchg   %ax,%ax
c01088f5:	66 90                	xchg   %ax,%ax
c01088f7:	66 90                	xchg   %ax,%ax
c01088f9:	66 90                	xchg   %ax,%ax
c01088fb:	66 90                	xchg   %ax,%ax
c01088fd:	66 90                	xchg   %ax,%ax
c01088ff:	66 90                	xchg   %ax,%ax
c0108901:	66 90                	xchg   %ax,%ax
c0108903:	66 90                	xchg   %ax,%ax
c0108905:	66 90                	xchg   %ax,%ax
c0108907:	66 90                	xchg   %ax,%ax
c0108909:	66 90                	xchg   %ax,%ax
c010890b:	66 90                	xchg   %ax,%ax
c010890d:	66 90                	xchg   %ax,%ax
c010890f:	66 90                	xchg   %ax,%ax
c0108911:	66 90                	xchg   %ax,%ax
c0108913:	66 90                	xchg   %ax,%ax
c0108915:	66 90                	xchg   %ax,%ax
c0108917:	66 90                	xchg   %ax,%ax
c0108919:	66 90                	xchg   %ax,%ax
c010891b:	66 90                	xchg   %ax,%ax
c010891d:	66 90                	xchg   %ax,%ax
c010891f:	66 90                	xchg   %ax,%ax
c0108921:	66 90                	xchg   %ax,%ax
c0108923:	66 90                	xchg   %ax,%ax
c0108925:	66 90                	xchg   %ax,%ax
c0108927:	66 90                	xchg   %ax,%ax
c0108929:	66 90                	xchg   %ax,%ax
c010892b:	66 90                	xchg   %ax,%ax
c010892d:	66 90                	xchg   %ax,%ax
c010892f:	66 90                	xchg   %ax,%ax
c0108931:	66 90                	xchg   %ax,%ax
c0108933:	66 90                	xchg   %ax,%ax
c0108935:	66 90                	xchg   %ax,%ax
c0108937:	66 90                	xchg   %ax,%ax
c0108939:	66 90                	xchg   %ax,%ax
c010893b:	66 90                	xchg   %ax,%ax
c010893d:	66 90                	xchg   %ax,%ax
c010893f:	66 90                	xchg   %ax,%ax
c0108941:	66 90                	xchg   %ax,%ax
c0108943:	66 90                	xchg   %ax,%ax
c0108945:	66 90                	xchg   %ax,%ax
c0108947:	66 90                	xchg   %ax,%ax
c0108949:	66 90                	xchg   %ax,%ax
c010894b:	66 90                	xchg   %ax,%ax
c010894d:	66 90                	xchg   %ax,%ax
c010894f:	66 90                	xchg   %ax,%ax
c0108951:	66 90                	xchg   %ax,%ax
c0108953:	66 90                	xchg   %ax,%ax
c0108955:	66 90                	xchg   %ax,%ax
c0108957:	66 90                	xchg   %ax,%ax
c0108959:	66 90                	xchg   %ax,%ax
c010895b:	66 90                	xchg   %ax,%ax
c010895d:	66 90                	xchg   %ax,%ax
c010895f:	66 90                	xchg   %ax,%ax
c0108961:	66 90                	xchg   %ax,%ax
c0108963:	66 90                	xchg   %ax,%ax
c0108965:	66 90                	xchg   %ax,%ax
c0108967:	66 90                	xchg   %ax,%ax
c0108969:	66 90                	xchg   %ax,%ax
c010896b:	66 90                	xchg   %ax,%ax
c010896d:	66 90                	xchg   %ax,%ax
c010896f:	66 90                	xchg   %ax,%ax
c0108971:	66 90                	xchg   %ax,%ax
c0108973:	66 90                	xchg   %ax,%ax
c0108975:	66 90                	xchg   %ax,%ax
c0108977:	66 90                	xchg   %ax,%ax
c0108979:	66 90                	xchg   %ax,%ax
c010897b:	66 90                	xchg   %ax,%ax
c010897d:	66 90                	xchg   %ax,%ax
c010897f:	66 90                	xchg   %ax,%ax
c0108981:	66 90                	xchg   %ax,%ax
c0108983:	66 90                	xchg   %ax,%ax
c0108985:	66 90                	xchg   %ax,%ax
c0108987:	66 90                	xchg   %ax,%ax
c0108989:	66 90                	xchg   %ax,%ax
c010898b:	66 90                	xchg   %ax,%ax
c010898d:	66 90                	xchg   %ax,%ax
c010898f:	66 90                	xchg   %ax,%ax
c0108991:	66 90                	xchg   %ax,%ax
c0108993:	66 90                	xchg   %ax,%ax
c0108995:	66 90                	xchg   %ax,%ax
c0108997:	66 90                	xchg   %ax,%ax
c0108999:	66 90                	xchg   %ax,%ax
c010899b:	66 90                	xchg   %ax,%ax
c010899d:	66 90                	xchg   %ax,%ax
c010899f:	66 90                	xchg   %ax,%ax
c01089a1:	66 90                	xchg   %ax,%ax
c01089a3:	66 90                	xchg   %ax,%ax
c01089a5:	66 90                	xchg   %ax,%ax
c01089a7:	66 90                	xchg   %ax,%ax
c01089a9:	66 90                	xchg   %ax,%ax
c01089ab:	66 90                	xchg   %ax,%ax
c01089ad:	66 90                	xchg   %ax,%ax
c01089af:	66 90                	xchg   %ax,%ax
c01089b1:	66 90                	xchg   %ax,%ax
c01089b3:	66 90                	xchg   %ax,%ax
c01089b5:	66 90                	xchg   %ax,%ax
c01089b7:	66 90                	xchg   %ax,%ax
c01089b9:	66 90                	xchg   %ax,%ax
c01089bb:	66 90                	xchg   %ax,%ax
c01089bd:	66 90                	xchg   %ax,%ax
c01089bf:	66 90                	xchg   %ax,%ax
c01089c1:	66 90                	xchg   %ax,%ax
c01089c3:	66 90                	xchg   %ax,%ax
c01089c5:	66 90                	xchg   %ax,%ax
c01089c7:	66 90                	xchg   %ax,%ax
c01089c9:	66 90                	xchg   %ax,%ax
c01089cb:	66 90                	xchg   %ax,%ax
c01089cd:	66 90                	xchg   %ax,%ax
c01089cf:	66 90                	xchg   %ax,%ax
c01089d1:	66 90                	xchg   %ax,%ax
c01089d3:	66 90                	xchg   %ax,%ax
c01089d5:	66 90                	xchg   %ax,%ax
c01089d7:	66 90                	xchg   %ax,%ax
c01089d9:	66 90                	xchg   %ax,%ax
c01089db:	66 90                	xchg   %ax,%ax
c01089dd:	66 90                	xchg   %ax,%ax
c01089df:	66 90                	xchg   %ax,%ax
c01089e1:	66 90                	xchg   %ax,%ax
c01089e3:	66 90                	xchg   %ax,%ax
c01089e5:	66 90                	xchg   %ax,%ax
c01089e7:	66 90                	xchg   %ax,%ax
c01089e9:	66 90                	xchg   %ax,%ax
c01089eb:	66 90                	xchg   %ax,%ax
c01089ed:	66 90                	xchg   %ax,%ax
c01089ef:	66 90                	xchg   %ax,%ax
c01089f1:	66 90                	xchg   %ax,%ax
c01089f3:	66 90                	xchg   %ax,%ax
c01089f5:	66 90                	xchg   %ax,%ax
c01089f7:	66 90                	xchg   %ax,%ax
c01089f9:	66 90                	xchg   %ax,%ax
c01089fb:	66 90                	xchg   %ax,%ax
c01089fd:	66 90                	xchg   %ax,%ax
c01089ff:	66 90                	xchg   %ax,%ax
c0108a01:	66 90                	xchg   %ax,%ax
c0108a03:	66 90                	xchg   %ax,%ax
c0108a05:	66 90                	xchg   %ax,%ax
c0108a07:	66 90                	xchg   %ax,%ax
c0108a09:	66 90                	xchg   %ax,%ax
c0108a0b:	66 90                	xchg   %ax,%ax
c0108a0d:	66 90                	xchg   %ax,%ax
c0108a0f:	66 90                	xchg   %ax,%ax
c0108a11:	66 90                	xchg   %ax,%ax
c0108a13:	66 90                	xchg   %ax,%ax
c0108a15:	66 90                	xchg   %ax,%ax
c0108a17:	66 90                	xchg   %ax,%ax
c0108a19:	66 90                	xchg   %ax,%ax
c0108a1b:	66 90                	xchg   %ax,%ax
c0108a1d:	66 90                	xchg   %ax,%ax
c0108a1f:	66 90                	xchg   %ax,%ax
c0108a21:	66 90                	xchg   %ax,%ax
c0108a23:	66 90                	xchg   %ax,%ax
c0108a25:	66 90                	xchg   %ax,%ax
c0108a27:	66 90                	xchg   %ax,%ax
c0108a29:	66 90                	xchg   %ax,%ax
c0108a2b:	66 90                	xchg   %ax,%ax
c0108a2d:	66 90                	xchg   %ax,%ax
c0108a2f:	66 90                	xchg   %ax,%ax
c0108a31:	66 90                	xchg   %ax,%ax
c0108a33:	66 90                	xchg   %ax,%ax
c0108a35:	66 90                	xchg   %ax,%ax
c0108a37:	66 90                	xchg   %ax,%ax
c0108a39:	66 90                	xchg   %ax,%ax
c0108a3b:	66 90                	xchg   %ax,%ax
c0108a3d:	66 90                	xchg   %ax,%ax
c0108a3f:	66 90                	xchg   %ax,%ax
c0108a41:	66 90                	xchg   %ax,%ax
c0108a43:	66 90                	xchg   %ax,%ax
c0108a45:	66 90                	xchg   %ax,%ax
c0108a47:	66 90                	xchg   %ax,%ax
c0108a49:	66 90                	xchg   %ax,%ax
c0108a4b:	66 90                	xchg   %ax,%ax
c0108a4d:	66 90                	xchg   %ax,%ax
c0108a4f:	66 90                	xchg   %ax,%ax
c0108a51:	66 90                	xchg   %ax,%ax
c0108a53:	66 90                	xchg   %ax,%ax
c0108a55:	66 90                	xchg   %ax,%ax
c0108a57:	66 90                	xchg   %ax,%ax
c0108a59:	66 90                	xchg   %ax,%ax
c0108a5b:	66 90                	xchg   %ax,%ax
c0108a5d:	66 90                	xchg   %ax,%ax
c0108a5f:	66 90                	xchg   %ax,%ax
c0108a61:	66 90                	xchg   %ax,%ax
c0108a63:	66 90                	xchg   %ax,%ax
c0108a65:	66 90                	xchg   %ax,%ax
c0108a67:	66 90                	xchg   %ax,%ax
c0108a69:	66 90                	xchg   %ax,%ax
c0108a6b:	66 90                	xchg   %ax,%ax
c0108a6d:	66 90                	xchg   %ax,%ax
c0108a6f:	66 90                	xchg   %ax,%ax
c0108a71:	66 90                	xchg   %ax,%ax
c0108a73:	66 90                	xchg   %ax,%ax
c0108a75:	66 90                	xchg   %ax,%ax
c0108a77:	66 90                	xchg   %ax,%ax
c0108a79:	66 90                	xchg   %ax,%ax
c0108a7b:	66 90                	xchg   %ax,%ax
c0108a7d:	66 90                	xchg   %ax,%ax
c0108a7f:	66 90                	xchg   %ax,%ax
c0108a81:	66 90                	xchg   %ax,%ax
c0108a83:	66 90                	xchg   %ax,%ax
c0108a85:	66 90                	xchg   %ax,%ax
c0108a87:	66 90                	xchg   %ax,%ax
c0108a89:	66 90                	xchg   %ax,%ax
c0108a8b:	66 90                	xchg   %ax,%ax
c0108a8d:	66 90                	xchg   %ax,%ax
c0108a8f:	66 90                	xchg   %ax,%ax
c0108a91:	66 90                	xchg   %ax,%ax
c0108a93:	66 90                	xchg   %ax,%ax
c0108a95:	66 90                	xchg   %ax,%ax
c0108a97:	66 90                	xchg   %ax,%ax
c0108a99:	66 90                	xchg   %ax,%ax
c0108a9b:	66 90                	xchg   %ax,%ax
c0108a9d:	66 90                	xchg   %ax,%ax
c0108a9f:	66 90                	xchg   %ax,%ax
c0108aa1:	66 90                	xchg   %ax,%ax
c0108aa3:	66 90                	xchg   %ax,%ax
c0108aa5:	66 90                	xchg   %ax,%ax
c0108aa7:	66 90                	xchg   %ax,%ax
c0108aa9:	66 90                	xchg   %ax,%ax
c0108aab:	66 90                	xchg   %ax,%ax
c0108aad:	66 90                	xchg   %ax,%ax
c0108aaf:	66 90                	xchg   %ax,%ax
c0108ab1:	66 90                	xchg   %ax,%ax
c0108ab3:	66 90                	xchg   %ax,%ax
c0108ab5:	66 90                	xchg   %ax,%ax
c0108ab7:	66 90                	xchg   %ax,%ax
c0108ab9:	66 90                	xchg   %ax,%ax
c0108abb:	66 90                	xchg   %ax,%ax
c0108abd:	66 90                	xchg   %ax,%ax
c0108abf:	66 90                	xchg   %ax,%ax
c0108ac1:	66 90                	xchg   %ax,%ax
c0108ac3:	66 90                	xchg   %ax,%ax
c0108ac5:	66 90                	xchg   %ax,%ax
c0108ac7:	66 90                	xchg   %ax,%ax
c0108ac9:	66 90                	xchg   %ax,%ax
c0108acb:	66 90                	xchg   %ax,%ax
c0108acd:	66 90                	xchg   %ax,%ax
c0108acf:	66 90                	xchg   %ax,%ax
c0108ad1:	66 90                	xchg   %ax,%ax
c0108ad3:	66 90                	xchg   %ax,%ax
c0108ad5:	66 90                	xchg   %ax,%ax
c0108ad7:	66 90                	xchg   %ax,%ax
c0108ad9:	66 90                	xchg   %ax,%ax
c0108adb:	66 90                	xchg   %ax,%ax
c0108add:	66 90                	xchg   %ax,%ax
c0108adf:	66 90                	xchg   %ax,%ax
c0108ae1:	66 90                	xchg   %ax,%ax
c0108ae3:	66 90                	xchg   %ax,%ax
c0108ae5:	66 90                	xchg   %ax,%ax
c0108ae7:	66 90                	xchg   %ax,%ax
c0108ae9:	66 90                	xchg   %ax,%ax
c0108aeb:	66 90                	xchg   %ax,%ax
c0108aed:	66 90                	xchg   %ax,%ax
c0108aef:	66 90                	xchg   %ax,%ax
c0108af1:	66 90                	xchg   %ax,%ax
c0108af3:	66 90                	xchg   %ax,%ax
c0108af5:	66 90                	xchg   %ax,%ax
c0108af7:	66 90                	xchg   %ax,%ax
c0108af9:	66 90                	xchg   %ax,%ax
c0108afb:	66 90                	xchg   %ax,%ax
c0108afd:	66 90                	xchg   %ax,%ax
c0108aff:	66 90                	xchg   %ax,%ax
c0108b01:	66 90                	xchg   %ax,%ax
c0108b03:	66 90                	xchg   %ax,%ax
c0108b05:	66 90                	xchg   %ax,%ax
c0108b07:	66 90                	xchg   %ax,%ax
c0108b09:	66 90                	xchg   %ax,%ax
c0108b0b:	66 90                	xchg   %ax,%ax
c0108b0d:	66 90                	xchg   %ax,%ax
c0108b0f:	66 90                	xchg   %ax,%ax
c0108b11:	66 90                	xchg   %ax,%ax
c0108b13:	66 90                	xchg   %ax,%ax
c0108b15:	66 90                	xchg   %ax,%ax
c0108b17:	66 90                	xchg   %ax,%ax
c0108b19:	66 90                	xchg   %ax,%ax
c0108b1b:	66 90                	xchg   %ax,%ax
c0108b1d:	66 90                	xchg   %ax,%ax
c0108b1f:	66 90                	xchg   %ax,%ax
c0108b21:	66 90                	xchg   %ax,%ax
c0108b23:	66 90                	xchg   %ax,%ax
c0108b25:	66 90                	xchg   %ax,%ax
c0108b27:	66 90                	xchg   %ax,%ax
c0108b29:	66 90                	xchg   %ax,%ax
c0108b2b:	66 90                	xchg   %ax,%ax
c0108b2d:	66 90                	xchg   %ax,%ax
c0108b2f:	66 90                	xchg   %ax,%ax
c0108b31:	66 90                	xchg   %ax,%ax
c0108b33:	66 90                	xchg   %ax,%ax
c0108b35:	66 90                	xchg   %ax,%ax
c0108b37:	66 90                	xchg   %ax,%ax
c0108b39:	66 90                	xchg   %ax,%ax
c0108b3b:	66 90                	xchg   %ax,%ax
c0108b3d:	66 90                	xchg   %ax,%ax
c0108b3f:	66 90                	xchg   %ax,%ax
c0108b41:	66 90                	xchg   %ax,%ax
c0108b43:	66 90                	xchg   %ax,%ax
c0108b45:	66 90                	xchg   %ax,%ax
c0108b47:	66 90                	xchg   %ax,%ax
c0108b49:	66 90                	xchg   %ax,%ax
c0108b4b:	66 90                	xchg   %ax,%ax
c0108b4d:	66 90                	xchg   %ax,%ax
c0108b4f:	66 90                	xchg   %ax,%ax
c0108b51:	66 90                	xchg   %ax,%ax
c0108b53:	66 90                	xchg   %ax,%ax
c0108b55:	66 90                	xchg   %ax,%ax
c0108b57:	66 90                	xchg   %ax,%ax
c0108b59:	66 90                	xchg   %ax,%ax
c0108b5b:	66 90                	xchg   %ax,%ax
c0108b5d:	66 90                	xchg   %ax,%ax
c0108b5f:	66 90                	xchg   %ax,%ax
c0108b61:	66 90                	xchg   %ax,%ax
c0108b63:	66 90                	xchg   %ax,%ax
c0108b65:	66 90                	xchg   %ax,%ax
c0108b67:	66 90                	xchg   %ax,%ax
c0108b69:	66 90                	xchg   %ax,%ax
c0108b6b:	66 90                	xchg   %ax,%ax
c0108b6d:	66 90                	xchg   %ax,%ax
c0108b6f:	66 90                	xchg   %ax,%ax
c0108b71:	66 90                	xchg   %ax,%ax
c0108b73:	66 90                	xchg   %ax,%ax
c0108b75:	66 90                	xchg   %ax,%ax
c0108b77:	66 90                	xchg   %ax,%ax
c0108b79:	66 90                	xchg   %ax,%ax
c0108b7b:	66 90                	xchg   %ax,%ax
c0108b7d:	66 90                	xchg   %ax,%ax
c0108b7f:	66 90                	xchg   %ax,%ax
c0108b81:	66 90                	xchg   %ax,%ax
c0108b83:	66 90                	xchg   %ax,%ax
c0108b85:	66 90                	xchg   %ax,%ax
c0108b87:	66 90                	xchg   %ax,%ax
c0108b89:	66 90                	xchg   %ax,%ax
c0108b8b:	66 90                	xchg   %ax,%ax
c0108b8d:	66 90                	xchg   %ax,%ax
c0108b8f:	66 90                	xchg   %ax,%ax
c0108b91:	66 90                	xchg   %ax,%ax
c0108b93:	66 90                	xchg   %ax,%ax
c0108b95:	66 90                	xchg   %ax,%ax
c0108b97:	66 90                	xchg   %ax,%ax
c0108b99:	66 90                	xchg   %ax,%ax
c0108b9b:	66 90                	xchg   %ax,%ax
c0108b9d:	66 90                	xchg   %ax,%ax
c0108b9f:	66 90                	xchg   %ax,%ax
c0108ba1:	66 90                	xchg   %ax,%ax
c0108ba3:	66 90                	xchg   %ax,%ax
c0108ba5:	66 90                	xchg   %ax,%ax
c0108ba7:	66 90                	xchg   %ax,%ax
c0108ba9:	66 90                	xchg   %ax,%ax
c0108bab:	66 90                	xchg   %ax,%ax
c0108bad:	66 90                	xchg   %ax,%ax
c0108baf:	66 90                	xchg   %ax,%ax
c0108bb1:	66 90                	xchg   %ax,%ax
c0108bb3:	66 90                	xchg   %ax,%ax
c0108bb5:	66 90                	xchg   %ax,%ax
c0108bb7:	66 90                	xchg   %ax,%ax
c0108bb9:	66 90                	xchg   %ax,%ax
c0108bbb:	66 90                	xchg   %ax,%ax
c0108bbd:	66 90                	xchg   %ax,%ax
c0108bbf:	66 90                	xchg   %ax,%ax
c0108bc1:	66 90                	xchg   %ax,%ax
c0108bc3:	66 90                	xchg   %ax,%ax
c0108bc5:	66 90                	xchg   %ax,%ax
c0108bc7:	66 90                	xchg   %ax,%ax
c0108bc9:	66 90                	xchg   %ax,%ax
c0108bcb:	66 90                	xchg   %ax,%ax
c0108bcd:	66 90                	xchg   %ax,%ax
c0108bcf:	66 90                	xchg   %ax,%ax
c0108bd1:	66 90                	xchg   %ax,%ax
c0108bd3:	66 90                	xchg   %ax,%ax
c0108bd5:	66 90                	xchg   %ax,%ax
c0108bd7:	66 90                	xchg   %ax,%ax
c0108bd9:	66 90                	xchg   %ax,%ax
c0108bdb:	66 90                	xchg   %ax,%ax
c0108bdd:	66 90                	xchg   %ax,%ax
c0108bdf:	66 90                	xchg   %ax,%ax
c0108be1:	66 90                	xchg   %ax,%ax
c0108be3:	66 90                	xchg   %ax,%ax
c0108be5:	66 90                	xchg   %ax,%ax
c0108be7:	66 90                	xchg   %ax,%ax
c0108be9:	66 90                	xchg   %ax,%ax
c0108beb:	66 90                	xchg   %ax,%ax
c0108bed:	66 90                	xchg   %ax,%ax
c0108bef:	66 90                	xchg   %ax,%ax
c0108bf1:	66 90                	xchg   %ax,%ax
c0108bf3:	66 90                	xchg   %ax,%ax
c0108bf5:	66 90                	xchg   %ax,%ax
c0108bf7:	66 90                	xchg   %ax,%ax
c0108bf9:	66 90                	xchg   %ax,%ax
c0108bfb:	66 90                	xchg   %ax,%ax
c0108bfd:	66 90                	xchg   %ax,%ax
c0108bff:	66 90                	xchg   %ax,%ax
c0108c01:	66 90                	xchg   %ax,%ax
c0108c03:	66 90                	xchg   %ax,%ax
c0108c05:	66 90                	xchg   %ax,%ax
c0108c07:	66 90                	xchg   %ax,%ax
c0108c09:	66 90                	xchg   %ax,%ax
c0108c0b:	66 90                	xchg   %ax,%ax
c0108c0d:	66 90                	xchg   %ax,%ax
c0108c0f:	66 90                	xchg   %ax,%ax
c0108c11:	66 90                	xchg   %ax,%ax
c0108c13:	66 90                	xchg   %ax,%ax
c0108c15:	66 90                	xchg   %ax,%ax
c0108c17:	66 90                	xchg   %ax,%ax
c0108c19:	66 90                	xchg   %ax,%ax
c0108c1b:	66 90                	xchg   %ax,%ax
c0108c1d:	66 90                	xchg   %ax,%ax
c0108c1f:	66 90                	xchg   %ax,%ax
c0108c21:	66 90                	xchg   %ax,%ax
c0108c23:	66 90                	xchg   %ax,%ax
c0108c25:	66 90                	xchg   %ax,%ax
c0108c27:	66 90                	xchg   %ax,%ax
c0108c29:	66 90                	xchg   %ax,%ax
c0108c2b:	66 90                	xchg   %ax,%ax
c0108c2d:	66 90                	xchg   %ax,%ax
c0108c2f:	66 90                	xchg   %ax,%ax
c0108c31:	66 90                	xchg   %ax,%ax
c0108c33:	66 90                	xchg   %ax,%ax
c0108c35:	66 90                	xchg   %ax,%ax
c0108c37:	66 90                	xchg   %ax,%ax
c0108c39:	66 90                	xchg   %ax,%ax
c0108c3b:	66 90                	xchg   %ax,%ax
c0108c3d:	66 90                	xchg   %ax,%ax
c0108c3f:	66 90                	xchg   %ax,%ax
c0108c41:	66 90                	xchg   %ax,%ax
c0108c43:	66 90                	xchg   %ax,%ax
c0108c45:	66 90                	xchg   %ax,%ax
c0108c47:	66 90                	xchg   %ax,%ax
c0108c49:	66 90                	xchg   %ax,%ax
c0108c4b:	66 90                	xchg   %ax,%ax
c0108c4d:	66 90                	xchg   %ax,%ax
c0108c4f:	66 90                	xchg   %ax,%ax
c0108c51:	66 90                	xchg   %ax,%ax
c0108c53:	66 90                	xchg   %ax,%ax
c0108c55:	66 90                	xchg   %ax,%ax
c0108c57:	66 90                	xchg   %ax,%ax
c0108c59:	66 90                	xchg   %ax,%ax
c0108c5b:	66 90                	xchg   %ax,%ax
c0108c5d:	66 90                	xchg   %ax,%ax
c0108c5f:	66 90                	xchg   %ax,%ax
c0108c61:	66 90                	xchg   %ax,%ax
c0108c63:	66 90                	xchg   %ax,%ax
c0108c65:	66 90                	xchg   %ax,%ax
c0108c67:	66 90                	xchg   %ax,%ax
c0108c69:	66 90                	xchg   %ax,%ax
c0108c6b:	66 90                	xchg   %ax,%ax
c0108c6d:	66 90                	xchg   %ax,%ax
c0108c6f:	66 90                	xchg   %ax,%ax
c0108c71:	66 90                	xchg   %ax,%ax
c0108c73:	66 90                	xchg   %ax,%ax
c0108c75:	66 90                	xchg   %ax,%ax
c0108c77:	66 90                	xchg   %ax,%ax
c0108c79:	66 90                	xchg   %ax,%ax
c0108c7b:	66 90                	xchg   %ax,%ax
c0108c7d:	66 90                	xchg   %ax,%ax
c0108c7f:	66 90                	xchg   %ax,%ax
c0108c81:	66 90                	xchg   %ax,%ax
c0108c83:	66 90                	xchg   %ax,%ax
c0108c85:	66 90                	xchg   %ax,%ax
c0108c87:	66 90                	xchg   %ax,%ax
c0108c89:	66 90                	xchg   %ax,%ax
c0108c8b:	66 90                	xchg   %ax,%ax
c0108c8d:	66 90                	xchg   %ax,%ax
c0108c8f:	66 90                	xchg   %ax,%ax
c0108c91:	66 90                	xchg   %ax,%ax
c0108c93:	66 90                	xchg   %ax,%ax
c0108c95:	66 90                	xchg   %ax,%ax
c0108c97:	66 90                	xchg   %ax,%ax
c0108c99:	66 90                	xchg   %ax,%ax
c0108c9b:	66 90                	xchg   %ax,%ax
c0108c9d:	66 90                	xchg   %ax,%ax
c0108c9f:	66 90                	xchg   %ax,%ax
c0108ca1:	66 90                	xchg   %ax,%ax
c0108ca3:	66 90                	xchg   %ax,%ax
c0108ca5:	66 90                	xchg   %ax,%ax
c0108ca7:	66 90                	xchg   %ax,%ax
c0108ca9:	66 90                	xchg   %ax,%ax
c0108cab:	66 90                	xchg   %ax,%ax
c0108cad:	66 90                	xchg   %ax,%ax
c0108caf:	66 90                	xchg   %ax,%ax
c0108cb1:	66 90                	xchg   %ax,%ax
c0108cb3:	66 90                	xchg   %ax,%ax
c0108cb5:	66 90                	xchg   %ax,%ax
c0108cb7:	66 90                	xchg   %ax,%ax
c0108cb9:	66 90                	xchg   %ax,%ax
c0108cbb:	66 90                	xchg   %ax,%ax
c0108cbd:	66 90                	xchg   %ax,%ax
c0108cbf:	66 90                	xchg   %ax,%ax
c0108cc1:	66 90                	xchg   %ax,%ax
c0108cc3:	66 90                	xchg   %ax,%ax
c0108cc5:	66 90                	xchg   %ax,%ax
c0108cc7:	66 90                	xchg   %ax,%ax
c0108cc9:	66 90                	xchg   %ax,%ax
c0108ccb:	66 90                	xchg   %ax,%ax
c0108ccd:	66 90                	xchg   %ax,%ax
c0108ccf:	66 90                	xchg   %ax,%ax
c0108cd1:	66 90                	xchg   %ax,%ax
c0108cd3:	66 90                	xchg   %ax,%ax
c0108cd5:	66 90                	xchg   %ax,%ax
c0108cd7:	66 90                	xchg   %ax,%ax
c0108cd9:	66 90                	xchg   %ax,%ax
c0108cdb:	66 90                	xchg   %ax,%ax
c0108cdd:	66 90                	xchg   %ax,%ax
c0108cdf:	66 90                	xchg   %ax,%ax
c0108ce1:	66 90                	xchg   %ax,%ax
c0108ce3:	66 90                	xchg   %ax,%ax
c0108ce5:	66 90                	xchg   %ax,%ax
c0108ce7:	66 90                	xchg   %ax,%ax
c0108ce9:	66 90                	xchg   %ax,%ax
c0108ceb:	66 90                	xchg   %ax,%ax
c0108ced:	66 90                	xchg   %ax,%ax
c0108cef:	66 90                	xchg   %ax,%ax
c0108cf1:	66 90                	xchg   %ax,%ax
c0108cf3:	66 90                	xchg   %ax,%ax
c0108cf5:	66 90                	xchg   %ax,%ax
c0108cf7:	66 90                	xchg   %ax,%ax
c0108cf9:	66 90                	xchg   %ax,%ax
c0108cfb:	66 90                	xchg   %ax,%ax
c0108cfd:	66 90                	xchg   %ax,%ax
c0108cff:	66 90                	xchg   %ax,%ax
c0108d01:	66 90                	xchg   %ax,%ax
c0108d03:	66 90                	xchg   %ax,%ax
c0108d05:	66 90                	xchg   %ax,%ax
c0108d07:	66 90                	xchg   %ax,%ax
c0108d09:	66 90                	xchg   %ax,%ax
c0108d0b:	66 90                	xchg   %ax,%ax
c0108d0d:	66 90                	xchg   %ax,%ax
c0108d0f:	66 90                	xchg   %ax,%ax
c0108d11:	66 90                	xchg   %ax,%ax
c0108d13:	66 90                	xchg   %ax,%ax
c0108d15:	66 90                	xchg   %ax,%ax
c0108d17:	66 90                	xchg   %ax,%ax
c0108d19:	66 90                	xchg   %ax,%ax
c0108d1b:	66 90                	xchg   %ax,%ax
c0108d1d:	66 90                	xchg   %ax,%ax
c0108d1f:	66 90                	xchg   %ax,%ax
c0108d21:	66 90                	xchg   %ax,%ax
c0108d23:	66 90                	xchg   %ax,%ax
c0108d25:	66 90                	xchg   %ax,%ax
c0108d27:	66 90                	xchg   %ax,%ax
c0108d29:	66 90                	xchg   %ax,%ax
c0108d2b:	66 90                	xchg   %ax,%ax
c0108d2d:	66 90                	xchg   %ax,%ax
c0108d2f:	66 90                	xchg   %ax,%ax
c0108d31:	66 90                	xchg   %ax,%ax
c0108d33:	66 90                	xchg   %ax,%ax
c0108d35:	66 90                	xchg   %ax,%ax
c0108d37:	66 90                	xchg   %ax,%ax
c0108d39:	66 90                	xchg   %ax,%ax
c0108d3b:	66 90                	xchg   %ax,%ax
c0108d3d:	66 90                	xchg   %ax,%ax
c0108d3f:	66 90                	xchg   %ax,%ax
c0108d41:	66 90                	xchg   %ax,%ax
c0108d43:	66 90                	xchg   %ax,%ax
c0108d45:	66 90                	xchg   %ax,%ax
c0108d47:	66 90                	xchg   %ax,%ax
c0108d49:	66 90                	xchg   %ax,%ax
c0108d4b:	66 90                	xchg   %ax,%ax
c0108d4d:	66 90                	xchg   %ax,%ax
c0108d4f:	66 90                	xchg   %ax,%ax
c0108d51:	66 90                	xchg   %ax,%ax
c0108d53:	66 90                	xchg   %ax,%ax
c0108d55:	66 90                	xchg   %ax,%ax
c0108d57:	66 90                	xchg   %ax,%ax
c0108d59:	66 90                	xchg   %ax,%ax
c0108d5b:	66 90                	xchg   %ax,%ax
c0108d5d:	66 90                	xchg   %ax,%ax
c0108d5f:	66 90                	xchg   %ax,%ax
c0108d61:	66 90                	xchg   %ax,%ax
c0108d63:	66 90                	xchg   %ax,%ax
c0108d65:	66 90                	xchg   %ax,%ax
c0108d67:	66 90                	xchg   %ax,%ax
c0108d69:	66 90                	xchg   %ax,%ax
c0108d6b:	66 90                	xchg   %ax,%ax
c0108d6d:	66 90                	xchg   %ax,%ax
c0108d6f:	66 90                	xchg   %ax,%ax
c0108d71:	66 90                	xchg   %ax,%ax
c0108d73:	66 90                	xchg   %ax,%ax
c0108d75:	66 90                	xchg   %ax,%ax
c0108d77:	66 90                	xchg   %ax,%ax
c0108d79:	66 90                	xchg   %ax,%ax
c0108d7b:	66 90                	xchg   %ax,%ax
c0108d7d:	66 90                	xchg   %ax,%ax
c0108d7f:	66 90                	xchg   %ax,%ax
c0108d81:	66 90                	xchg   %ax,%ax
c0108d83:	66 90                	xchg   %ax,%ax
c0108d85:	66 90                	xchg   %ax,%ax
c0108d87:	66 90                	xchg   %ax,%ax
c0108d89:	66 90                	xchg   %ax,%ax
c0108d8b:	66 90                	xchg   %ax,%ax
c0108d8d:	66 90                	xchg   %ax,%ax
c0108d8f:	66 90                	xchg   %ax,%ax
c0108d91:	66 90                	xchg   %ax,%ax
c0108d93:	66 90                	xchg   %ax,%ax
c0108d95:	66 90                	xchg   %ax,%ax
c0108d97:	66 90                	xchg   %ax,%ax
c0108d99:	66 90                	xchg   %ax,%ax
c0108d9b:	66 90                	xchg   %ax,%ax
c0108d9d:	66 90                	xchg   %ax,%ax
c0108d9f:	66 90                	xchg   %ax,%ax
c0108da1:	66 90                	xchg   %ax,%ax
c0108da3:	66 90                	xchg   %ax,%ax
c0108da5:	66 90                	xchg   %ax,%ax
c0108da7:	66 90                	xchg   %ax,%ax
c0108da9:	66 90                	xchg   %ax,%ax
c0108dab:	66 90                	xchg   %ax,%ax
c0108dad:	66 90                	xchg   %ax,%ax
c0108daf:	66 90                	xchg   %ax,%ax
c0108db1:	66 90                	xchg   %ax,%ax
c0108db3:	66 90                	xchg   %ax,%ax
c0108db5:	66 90                	xchg   %ax,%ax
c0108db7:	66 90                	xchg   %ax,%ax
c0108db9:	66 90                	xchg   %ax,%ax
c0108dbb:	66 90                	xchg   %ax,%ax
c0108dbd:	66 90                	xchg   %ax,%ax
c0108dbf:	66 90                	xchg   %ax,%ax
c0108dc1:	66 90                	xchg   %ax,%ax
c0108dc3:	66 90                	xchg   %ax,%ax
c0108dc5:	66 90                	xchg   %ax,%ax
c0108dc7:	66 90                	xchg   %ax,%ax
c0108dc9:	66 90                	xchg   %ax,%ax
c0108dcb:	66 90                	xchg   %ax,%ax
c0108dcd:	66 90                	xchg   %ax,%ax
c0108dcf:	66 90                	xchg   %ax,%ax
c0108dd1:	66 90                	xchg   %ax,%ax
c0108dd3:	66 90                	xchg   %ax,%ax
c0108dd5:	66 90                	xchg   %ax,%ax
c0108dd7:	66 90                	xchg   %ax,%ax
c0108dd9:	66 90                	xchg   %ax,%ax
c0108ddb:	66 90                	xchg   %ax,%ax
c0108ddd:	66 90                	xchg   %ax,%ax
c0108ddf:	66 90                	xchg   %ax,%ax
c0108de1:	66 90                	xchg   %ax,%ax
c0108de3:	66 90                	xchg   %ax,%ax
c0108de5:	66 90                	xchg   %ax,%ax
c0108de7:	66 90                	xchg   %ax,%ax
c0108de9:	66 90                	xchg   %ax,%ax
c0108deb:	66 90                	xchg   %ax,%ax
c0108ded:	66 90                	xchg   %ax,%ax
c0108def:	66 90                	xchg   %ax,%ax
c0108df1:	66 90                	xchg   %ax,%ax
c0108df3:	66 90                	xchg   %ax,%ax
c0108df5:	66 90                	xchg   %ax,%ax
c0108df7:	66 90                	xchg   %ax,%ax
c0108df9:	66 90                	xchg   %ax,%ax
c0108dfb:	66 90                	xchg   %ax,%ax
c0108dfd:	66 90                	xchg   %ax,%ax
c0108dff:	66 90                	xchg   %ax,%ax
c0108e01:	66 90                	xchg   %ax,%ax
c0108e03:	66 90                	xchg   %ax,%ax
c0108e05:	66 90                	xchg   %ax,%ax
c0108e07:	66 90                	xchg   %ax,%ax
c0108e09:	66 90                	xchg   %ax,%ax
c0108e0b:	66 90                	xchg   %ax,%ax
c0108e0d:	66 90                	xchg   %ax,%ax
c0108e0f:	66 90                	xchg   %ax,%ax
c0108e11:	66 90                	xchg   %ax,%ax
c0108e13:	66 90                	xchg   %ax,%ax
c0108e15:	66 90                	xchg   %ax,%ax
c0108e17:	66 90                	xchg   %ax,%ax
c0108e19:	66 90                	xchg   %ax,%ax
c0108e1b:	66 90                	xchg   %ax,%ax
c0108e1d:	66 90                	xchg   %ax,%ax
c0108e1f:	66 90                	xchg   %ax,%ax
c0108e21:	66 90                	xchg   %ax,%ax
c0108e23:	66 90                	xchg   %ax,%ax
c0108e25:	66 90                	xchg   %ax,%ax
c0108e27:	66 90                	xchg   %ax,%ax
c0108e29:	66 90                	xchg   %ax,%ax
c0108e2b:	66 90                	xchg   %ax,%ax
c0108e2d:	66 90                	xchg   %ax,%ax
c0108e2f:	66 90                	xchg   %ax,%ax
c0108e31:	66 90                	xchg   %ax,%ax
c0108e33:	66 90                	xchg   %ax,%ax
c0108e35:	66 90                	xchg   %ax,%ax
c0108e37:	66 90                	xchg   %ax,%ax
c0108e39:	66 90                	xchg   %ax,%ax
c0108e3b:	66 90                	xchg   %ax,%ax
c0108e3d:	66 90                	xchg   %ax,%ax
c0108e3f:	66 90                	xchg   %ax,%ax
c0108e41:	66 90                	xchg   %ax,%ax
c0108e43:	66 90                	xchg   %ax,%ax
c0108e45:	66 90                	xchg   %ax,%ax
c0108e47:	66 90                	xchg   %ax,%ax
c0108e49:	66 90                	xchg   %ax,%ax
c0108e4b:	66 90                	xchg   %ax,%ax
c0108e4d:	66 90                	xchg   %ax,%ax
c0108e4f:	66 90                	xchg   %ax,%ax
c0108e51:	66 90                	xchg   %ax,%ax
c0108e53:	66 90                	xchg   %ax,%ax
c0108e55:	66 90                	xchg   %ax,%ax
c0108e57:	66 90                	xchg   %ax,%ax
c0108e59:	66 90                	xchg   %ax,%ax
c0108e5b:	66 90                	xchg   %ax,%ax
c0108e5d:	66 90                	xchg   %ax,%ax
c0108e5f:	66 90                	xchg   %ax,%ax
c0108e61:	66 90                	xchg   %ax,%ax
c0108e63:	66 90                	xchg   %ax,%ax
c0108e65:	66 90                	xchg   %ax,%ax
c0108e67:	66 90                	xchg   %ax,%ax
c0108e69:	66 90                	xchg   %ax,%ax
c0108e6b:	66 90                	xchg   %ax,%ax
c0108e6d:	66 90                	xchg   %ax,%ax
c0108e6f:	66 90                	xchg   %ax,%ax
c0108e71:	66 90                	xchg   %ax,%ax
c0108e73:	66 90                	xchg   %ax,%ax
c0108e75:	66 90                	xchg   %ax,%ax
c0108e77:	66 90                	xchg   %ax,%ax
c0108e79:	66 90                	xchg   %ax,%ax
c0108e7b:	66 90                	xchg   %ax,%ax
c0108e7d:	66 90                	xchg   %ax,%ax
c0108e7f:	66 90                	xchg   %ax,%ax
c0108e81:	66 90                	xchg   %ax,%ax
c0108e83:	66 90                	xchg   %ax,%ax
c0108e85:	66 90                	xchg   %ax,%ax
c0108e87:	66 90                	xchg   %ax,%ax
c0108e89:	66 90                	xchg   %ax,%ax
c0108e8b:	66 90                	xchg   %ax,%ax
c0108e8d:	66 90                	xchg   %ax,%ax
c0108e8f:	66 90                	xchg   %ax,%ax
c0108e91:	66 90                	xchg   %ax,%ax
c0108e93:	66 90                	xchg   %ax,%ax
c0108e95:	66 90                	xchg   %ax,%ax
c0108e97:	66 90                	xchg   %ax,%ax
c0108e99:	66 90                	xchg   %ax,%ax
c0108e9b:	66 90                	xchg   %ax,%ax
c0108e9d:	66 90                	xchg   %ax,%ax
c0108e9f:	66 90                	xchg   %ax,%ax
c0108ea1:	66 90                	xchg   %ax,%ax
c0108ea3:	66 90                	xchg   %ax,%ax
c0108ea5:	66 90                	xchg   %ax,%ax
c0108ea7:	66 90                	xchg   %ax,%ax
c0108ea9:	66 90                	xchg   %ax,%ax
c0108eab:	66 90                	xchg   %ax,%ax
c0108ead:	66 90                	xchg   %ax,%ax
c0108eaf:	66 90                	xchg   %ax,%ax
c0108eb1:	66 90                	xchg   %ax,%ax
c0108eb3:	66 90                	xchg   %ax,%ax
c0108eb5:	66 90                	xchg   %ax,%ax
c0108eb7:	66 90                	xchg   %ax,%ax
c0108eb9:	66 90                	xchg   %ax,%ax
c0108ebb:	66 90                	xchg   %ax,%ax
c0108ebd:	66 90                	xchg   %ax,%ax
c0108ebf:	66 90                	xchg   %ax,%ax
c0108ec1:	66 90                	xchg   %ax,%ax
c0108ec3:	66 90                	xchg   %ax,%ax
c0108ec5:	66 90                	xchg   %ax,%ax
c0108ec7:	66 90                	xchg   %ax,%ax
c0108ec9:	66 90                	xchg   %ax,%ax
c0108ecb:	66 90                	xchg   %ax,%ax
c0108ecd:	66 90                	xchg   %ax,%ax
c0108ecf:	66 90                	xchg   %ax,%ax
c0108ed1:	66 90                	xchg   %ax,%ax
c0108ed3:	66 90                	xchg   %ax,%ax
c0108ed5:	66 90                	xchg   %ax,%ax
c0108ed7:	66 90                	xchg   %ax,%ax
c0108ed9:	66 90                	xchg   %ax,%ax
c0108edb:	66 90                	xchg   %ax,%ax
c0108edd:	66 90                	xchg   %ax,%ax
c0108edf:	66 90                	xchg   %ax,%ax
c0108ee1:	66 90                	xchg   %ax,%ax
c0108ee3:	66 90                	xchg   %ax,%ax
c0108ee5:	66 90                	xchg   %ax,%ax
c0108ee7:	66 90                	xchg   %ax,%ax
c0108ee9:	66 90                	xchg   %ax,%ax
c0108eeb:	66 90                	xchg   %ax,%ax
c0108eed:	66 90                	xchg   %ax,%ax
c0108eef:	66 90                	xchg   %ax,%ax
c0108ef1:	66 90                	xchg   %ax,%ax
c0108ef3:	66 90                	xchg   %ax,%ax
c0108ef5:	66 90                	xchg   %ax,%ax
c0108ef7:	66 90                	xchg   %ax,%ax
c0108ef9:	66 90                	xchg   %ax,%ax
c0108efb:	66 90                	xchg   %ax,%ax
c0108efd:	66 90                	xchg   %ax,%ax
c0108eff:	66 90                	xchg   %ax,%ax
c0108f01:	66 90                	xchg   %ax,%ax
c0108f03:	66 90                	xchg   %ax,%ax
c0108f05:	66 90                	xchg   %ax,%ax
c0108f07:	66 90                	xchg   %ax,%ax
c0108f09:	66 90                	xchg   %ax,%ax
c0108f0b:	66 90                	xchg   %ax,%ax
c0108f0d:	66 90                	xchg   %ax,%ax
c0108f0f:	66 90                	xchg   %ax,%ax
c0108f11:	66 90                	xchg   %ax,%ax
c0108f13:	66 90                	xchg   %ax,%ax
c0108f15:	66 90                	xchg   %ax,%ax
c0108f17:	66 90                	xchg   %ax,%ax
c0108f19:	66 90                	xchg   %ax,%ax
c0108f1b:	66 90                	xchg   %ax,%ax
c0108f1d:	66 90                	xchg   %ax,%ax
c0108f1f:	66 90                	xchg   %ax,%ax
c0108f21:	66 90                	xchg   %ax,%ax
c0108f23:	66 90                	xchg   %ax,%ax
c0108f25:	66 90                	xchg   %ax,%ax
c0108f27:	66 90                	xchg   %ax,%ax
c0108f29:	66 90                	xchg   %ax,%ax
c0108f2b:	66 90                	xchg   %ax,%ax
c0108f2d:	66 90                	xchg   %ax,%ax
c0108f2f:	66 90                	xchg   %ax,%ax
c0108f31:	66 90                	xchg   %ax,%ax
c0108f33:	66 90                	xchg   %ax,%ax
c0108f35:	66 90                	xchg   %ax,%ax
c0108f37:	66 90                	xchg   %ax,%ax
c0108f39:	66 90                	xchg   %ax,%ax
c0108f3b:	66 90                	xchg   %ax,%ax
c0108f3d:	66 90                	xchg   %ax,%ax
c0108f3f:	66 90                	xchg   %ax,%ax
c0108f41:	66 90                	xchg   %ax,%ax
c0108f43:	66 90                	xchg   %ax,%ax
c0108f45:	66 90                	xchg   %ax,%ax
c0108f47:	66 90                	xchg   %ax,%ax
c0108f49:	66 90                	xchg   %ax,%ax
c0108f4b:	66 90                	xchg   %ax,%ax
c0108f4d:	66 90                	xchg   %ax,%ax
c0108f4f:	66 90                	xchg   %ax,%ax
c0108f51:	66 90                	xchg   %ax,%ax
c0108f53:	66 90                	xchg   %ax,%ax
c0108f55:	66 90                	xchg   %ax,%ax
c0108f57:	66 90                	xchg   %ax,%ax
c0108f59:	66 90                	xchg   %ax,%ax
c0108f5b:	66 90                	xchg   %ax,%ax
c0108f5d:	66 90                	xchg   %ax,%ax
c0108f5f:	66 90                	xchg   %ax,%ax
c0108f61:	66 90                	xchg   %ax,%ax
c0108f63:	66 90                	xchg   %ax,%ax
c0108f65:	66 90                	xchg   %ax,%ax
c0108f67:	66 90                	xchg   %ax,%ax
c0108f69:	66 90                	xchg   %ax,%ax
c0108f6b:	66 90                	xchg   %ax,%ax
c0108f6d:	66 90                	xchg   %ax,%ax
c0108f6f:	66 90                	xchg   %ax,%ax
c0108f71:	66 90                	xchg   %ax,%ax
c0108f73:	66 90                	xchg   %ax,%ax
c0108f75:	66 90                	xchg   %ax,%ax
c0108f77:	66 90                	xchg   %ax,%ax
c0108f79:	66 90                	xchg   %ax,%ax
c0108f7b:	66 90                	xchg   %ax,%ax
c0108f7d:	66 90                	xchg   %ax,%ax
c0108f7f:	66 90                	xchg   %ax,%ax
c0108f81:	66 90                	xchg   %ax,%ax
c0108f83:	66 90                	xchg   %ax,%ax
c0108f85:	66 90                	xchg   %ax,%ax
c0108f87:	66 90                	xchg   %ax,%ax
c0108f89:	66 90                	xchg   %ax,%ax
c0108f8b:	66 90                	xchg   %ax,%ax
c0108f8d:	66 90                	xchg   %ax,%ax
c0108f8f:	66 90                	xchg   %ax,%ax
c0108f91:	66 90                	xchg   %ax,%ax
c0108f93:	66 90                	xchg   %ax,%ax
c0108f95:	66 90                	xchg   %ax,%ax
c0108f97:	66 90                	xchg   %ax,%ax
c0108f99:	66 90                	xchg   %ax,%ax
c0108f9b:	66 90                	xchg   %ax,%ax
c0108f9d:	66 90                	xchg   %ax,%ax
c0108f9f:	66 90                	xchg   %ax,%ax
c0108fa1:	66 90                	xchg   %ax,%ax
c0108fa3:	66 90                	xchg   %ax,%ax
c0108fa5:	66 90                	xchg   %ax,%ax
c0108fa7:	66 90                	xchg   %ax,%ax
c0108fa9:	66 90                	xchg   %ax,%ax
c0108fab:	66 90                	xchg   %ax,%ax
c0108fad:	66 90                	xchg   %ax,%ax
c0108faf:	66 90                	xchg   %ax,%ax
c0108fb1:	66 90                	xchg   %ax,%ax
c0108fb3:	66 90                	xchg   %ax,%ax
c0108fb5:	66 90                	xchg   %ax,%ax
c0108fb7:	66 90                	xchg   %ax,%ax
c0108fb9:	66 90                	xchg   %ax,%ax
c0108fbb:	66 90                	xchg   %ax,%ax
c0108fbd:	66 90                	xchg   %ax,%ax
c0108fbf:	66 90                	xchg   %ax,%ax
c0108fc1:	66 90                	xchg   %ax,%ax
c0108fc3:	66 90                	xchg   %ax,%ax
c0108fc5:	66 90                	xchg   %ax,%ax
c0108fc7:	66 90                	xchg   %ax,%ax
c0108fc9:	66 90                	xchg   %ax,%ax
c0108fcb:	66 90                	xchg   %ax,%ax
c0108fcd:	66 90                	xchg   %ax,%ax
c0108fcf:	66 90                	xchg   %ax,%ax
c0108fd1:	66 90                	xchg   %ax,%ax
c0108fd3:	66 90                	xchg   %ax,%ax
c0108fd5:	66 90                	xchg   %ax,%ax
c0108fd7:	66 90                	xchg   %ax,%ax
c0108fd9:	66 90                	xchg   %ax,%ax
c0108fdb:	66 90                	xchg   %ax,%ax
c0108fdd:	66 90                	xchg   %ax,%ax
c0108fdf:	66 90                	xchg   %ax,%ax
c0108fe1:	66 90                	xchg   %ax,%ax
c0108fe3:	66 90                	xchg   %ax,%ax
c0108fe5:	66 90                	xchg   %ax,%ax
c0108fe7:	66 90                	xchg   %ax,%ax
c0108fe9:	66 90                	xchg   %ax,%ax
c0108feb:	66 90                	xchg   %ax,%ax
c0108fed:	66 90                	xchg   %ax,%ax
c0108fef:	66 90                	xchg   %ax,%ax
c0108ff1:	66 90                	xchg   %ax,%ax
c0108ff3:	66 90                	xchg   %ax,%ax
c0108ff5:	66 90                	xchg   %ax,%ax
c0108ff7:	66 90                	xchg   %ax,%ax
c0108ff9:	66 90                	xchg   %ax,%ax
c0108ffb:	66 90                	xchg   %ax,%ax
c0108ffd:	66 90                	xchg   %ax,%ax
c0108fff:	90                   	nop
