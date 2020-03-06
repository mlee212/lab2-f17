
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 30 2e 10 80       	mov    $0x80102e30,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 00 70 10 80       	push   $0x80107000
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 45 41 00 00       	call   801041a0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 07 70 10 80       	push   $0x80107007
80100097:	50                   	push   %eax
80100098:	e8 f3 3f 00 00       	call   80104090 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 b7 41 00 00       	call   801042a0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 59 42 00 00       	call   801043c0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 5e 3f 00 00       	call   801040d0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 3d 1f 00 00       	call   801020c0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 0e 70 10 80       	push   $0x8010700e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 bd 3f 00 00       	call   80104170 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 f7 1e 00 00       	jmp    801020c0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 1f 70 10 80       	push   $0x8010701f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 7c 3f 00 00       	call   80104170 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 2c 3f 00 00       	call   80104130 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 90 40 00 00       	call   801042a0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 5f 41 00 00       	jmp    801043c0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 26 70 10 80       	push   $0x80107026
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 9b 14 00 00       	call   80101720 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 0f 40 00 00       	call   801042a0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002a6:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 a0 ff 10 80       	push   $0x8010ffa0
801002bd:	e8 6e 3a 00 00       	call   80103d30 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 79 34 00 00       	call   80103750 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 d5 40 00 00       	call   801043c0 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 4d 13 00 00       	call   80101640 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 75 40 00 00       	call   801043c0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 ed 12 00 00       	call   80101640 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 32 23 00 00       	call   801026c0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 2d 70 10 80       	push   $0x8010702d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 1b 7a 10 80 	movl   $0x80107a1b,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 03 3e 00 00       	call   801041c0 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 41 70 10 80       	push   $0x80107041
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 71 56 00 00       	call   80105a90 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 b8 55 00 00       	call   80105a90 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 ac 55 00 00       	call   80105a90 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 a0 55 00 00       	call   80105a90 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 a7 3f 00 00       	call   801044c0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 e2 3e 00 00       	call   80104410 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 45 70 10 80       	push   $0x80107045
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 70 70 10 80 	movzbl -0x7fef8f90(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 0c 11 00 00       	call   80101720 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 80 3c 00 00       	call   801042a0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 74 3d 00 00       	call   801043c0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 eb 0f 00 00       	call   80101640 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 ae 3c 00 00       	call   801043c0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 58 70 10 80       	mov    $0x80107058,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 d3 3a 00 00       	call   801042a0 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 5f 70 10 80       	push   $0x8010705f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 98 3a 00 00       	call   801042a0 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100836:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 53 3b 00 00       	call   801043c0 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
          wakeup(&input.r);
801008f1:	68 a0 ff 10 80       	push   $0x8010ffa0
801008f6:	e8 e5 35 00 00       	call   80103ee0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100934:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 54 36 00 00       	jmp    80103fd0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 68 70 10 80       	push   $0x80107068
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 eb 37 00 00       	call   801041a0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bb:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009c2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009cc:	02 10 80 
  cons.locking = 1;
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009d9:	e8 92 18 00 00       	call   80102270 <ioapicenable>
}
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009fc:	e8 4f 2d 00 00       	call   80103750 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 14 21 00 00       	call   80102b20 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 79 14 00 00       	call   80101e90 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 06 02 00 00    	je     80100c28 <exec+0x238>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 13 0c 00 00       	call   80101640 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 e2 0e 00 00       	call   80101920 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 81 0e 00 00       	call   801018d0 <iunlockput>
    end_op();
80100a4f:	e8 3c 21 00 00       	call   80102b90 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a74:	e8 a7 61 00 00       	call   80106c20 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 53 0e 00 00       	call   80101920 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
      continue;
    if(ph.memsz < ph.filesz)
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 67 5f 00 00       	call   80106a70 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 71 5e 00 00       	call   801069b0 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 42 60 00 00       	call   80106ba0 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 61 0d 00 00       	call   801018d0 <iunlockput>
  end_op();
80100b6f:	e8 1c 20 00 00       	call   80102b90 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  //sz = PGROUNDUP(sz);
  if(allocuvm(pgdir, PGROUNDDOWN(STACKBASE), STACKBASE) == 0)
80100b74:	83 c4 0c             	add    $0xc,%esp
80100b77:	68 ff ff ff 7f       	push   $0x7fffffff
80100b7c:	68 00 f0 ff 7f       	push   $0x7ffff000
80100b81:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b87:	e8 e4 5e 00 00       	call   80106a70 <allocuvm>
80100b8c:	83 c4 10             	add    $0x10,%esp
80100b8f:	85 c0                	test   %eax,%eax
80100b91:	74 7a                	je     80100c0d <exec+0x21d>
    goto bad;
  //clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = STACKBASE;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100b93:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b96:	31 f6                	xor    %esi,%esi
80100b98:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
80100b9d:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100ba3:	8b 00                	mov    (%eax),%eax
80100ba5:	85 c0                	test   %eax,%eax
80100ba7:	0f 84 9a 00 00 00    	je     80100c47 <exec+0x257>
80100bad:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100bb3:	eb 22                	jmp    80100bd7 <exec+0x1e7>
80100bb5:	8d 76 00             	lea    0x0(%esi),%esi
80100bb8:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100bbb:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
    goto bad;
  //clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = STACKBASE;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bc2:	83 c6 01             	add    $0x1,%esi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100bc5:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  //clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = STACKBASE;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bcb:	8b 04 b0             	mov    (%eax,%esi,4),%eax
80100bce:	85 c0                	test   %eax,%eax
80100bd0:	74 75                	je     80100c47 <exec+0x257>
    if(argc >= MAXARG)
80100bd2:	83 fe 20             	cmp    $0x20,%esi
80100bd5:	74 36                	je     80100c0d <exec+0x21d>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bd7:	83 ec 0c             	sub    $0xc,%esp
80100bda:	50                   	push   %eax
80100bdb:	e8 70 3a 00 00       	call   80104650 <strlen>
80100be0:	f7 d0                	not    %eax
80100be2:	01 d8                	add    %ebx,%eax
80100be4:	83 e0 fc             	and    $0xfffffffc,%eax
80100be7:	89 c3                	mov    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100be9:	58                   	pop    %eax
80100bea:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bed:	ff 34 b0             	pushl  (%eax,%esi,4)
80100bf0:	e8 5b 3a 00 00       	call   80104650 <strlen>
80100bf5:	83 c0 01             	add    $0x1,%eax
80100bf8:	50                   	push   %eax
80100bf9:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bfc:	ff 34 b0             	pushl  (%eax,%esi,4)
80100bff:	53                   	push   %ebx
80100c00:	57                   	push   %edi
80100c01:	e8 ca 62 00 00       	call   80106ed0 <copyout>
80100c06:	83 c4 20             	add    $0x20,%esp
80100c09:	85 c0                	test   %eax,%eax
80100c0b:	79 ab                	jns    80100bb8 <exec+0x1c8>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100c0d:	83 ec 0c             	sub    $0xc,%esp
80100c10:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c16:	e8 85 5f 00 00       	call   80106ba0 <freevm>
80100c1b:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100c1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c23:	e9 34 fe ff ff       	jmp    80100a5c <exec+0x6c>
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100c28:	e8 63 1f 00 00       	call   80102b90 <end_op>
    cprintf("exec: fail\n");
80100c2d:	83 ec 0c             	sub    $0xc,%esp
80100c30:	68 81 70 10 80       	push   $0x80107081
80100c35:	e8 26 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100c3a:	83 c4 10             	add    $0x10,%esp
80100c3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c42:	e9 15 fe ff ff       	jmp    80100a5c <exec+0x6c>
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c47:	8d 04 b5 04 00 00 00 	lea    0x4(,%esi,4),%eax
80100c4e:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c50:	c7 84 b5 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%esi,4)
80100c57:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c5b:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c62:	ff ff ff 
  ustack[1] = argc;
80100c65:	89 b5 5c ff ff ff    	mov    %esi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c6b:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c6d:	83 c0 0c             	add    $0xc,%eax
80100c70:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c72:	50                   	push   %eax
80100c73:	52                   	push   %edx
80100c74:	53                   	push   %ebx
80100c75:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c7b:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c81:	e8 4a 62 00 00       	call   80106ed0 <copyout>
80100c86:	83 c4 10             	add    $0x10,%esp
80100c89:	85 c0                	test   %eax,%eax
80100c8b:	78 80                	js     80100c0d <exec+0x21d>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100c8d:	8b 45 08             	mov    0x8(%ebp),%eax
80100c90:	0f b6 10             	movzbl (%eax),%edx
80100c93:	84 d2                	test   %dl,%dl
80100c95:	74 1c                	je     80100cb3 <exec+0x2c3>
80100c97:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100c9a:	83 c0 01             	add    $0x1,%eax
80100c9d:	8d 76 00             	lea    0x0(%esi),%esi
    if(*s == '/')
      last = s+1;
80100ca0:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ca3:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100ca6:	0f 44 c8             	cmove  %eax,%ecx
80100ca9:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cac:	84 d2                	test   %dl,%dl
80100cae:	75 f0                	jne    80100ca0 <exec+0x2b0>
80100cb0:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cb3:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cb9:	83 ec 04             	sub    $0x4,%esp
80100cbc:	6a 10                	push   $0x10
80100cbe:	ff 75 08             	pushl  0x8(%ebp)
80100cc1:	89 f8                	mov    %edi,%eax
80100cc3:	83 c0 6c             	add    $0x6c,%eax
80100cc6:	50                   	push   %eax
80100cc7:	e8 44 39 00 00       	call   80104610 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100ccc:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100cd2:	8b 77 04             	mov    0x4(%edi),%esi
  curproc->pgdir = pgdir;
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100cd5:	8b 47 18             	mov    0x18(%edi),%eax
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100cd8:	89 4f 04             	mov    %ecx,0x4(%edi)
  curproc->sz = sz;
80100cdb:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
80100ce1:	89 0f                	mov    %ecx,(%edi)
  curproc->tf->eip = elf.entry;  // main
80100ce3:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100ce9:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100cec:	8b 47 18             	mov    0x18(%edi),%eax
80100cef:	89 58 44             	mov    %ebx,0x44(%eax)
  curproc->pages = 1;
80100cf2:	c7 47 7c 01 00 00 00 	movl   $0x1,0x7c(%edi)
  switchuvm(curproc);
80100cf9:	89 3c 24             	mov    %edi,(%esp)
80100cfc:	e8 1f 5b 00 00       	call   80106820 <switchuvm>
  freevm(oldpgdir);
80100d01:	89 34 24             	mov    %esi,(%esp)
80100d04:	e8 97 5e 00 00       	call   80106ba0 <freevm>
  return 0;
80100d09:	83 c4 10             	add    $0x10,%esp
80100d0c:	31 c0                	xor    %eax,%eax
80100d0e:	e9 49 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d13:	66 90                	xchg   %ax,%ax
80100d15:	66 90                	xchg   %ax,%ax
80100d17:	66 90                	xchg   %ax,%ax
80100d19:	66 90                	xchg   %ax,%ax
80100d1b:	66 90                	xchg   %ax,%ax
80100d1d:	66 90                	xchg   %ax,%ax
80100d1f:	90                   	nop

80100d20 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d20:	55                   	push   %ebp
80100d21:	89 e5                	mov    %esp,%ebp
80100d23:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d26:	68 8d 70 10 80       	push   $0x8010708d
80100d2b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d30:	e8 6b 34 00 00       	call   801041a0 <initlock>
}
80100d35:	83 c4 10             	add    $0x10,%esp
80100d38:	c9                   	leave  
80100d39:	c3                   	ret    
80100d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d40 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d44:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d49:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d4c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d51:	e8 4a 35 00 00       	call   801042a0 <acquire>
80100d56:	83 c4 10             	add    $0x10,%esp
80100d59:	eb 10                	jmp    80100d6b <filealloc+0x2b>
80100d5b:	90                   	nop
80100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d60:	83 c3 18             	add    $0x18,%ebx
80100d63:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d69:	74 25                	je     80100d90 <filealloc+0x50>
    if(f->ref == 0){
80100d6b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d6e:	85 c0                	test   %eax,%eax
80100d70:	75 ee                	jne    80100d60 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d72:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100d75:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100d7c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d81:	e8 3a 36 00 00       	call   801043c0 <release>
      return f;
80100d86:	89 d8                	mov    %ebx,%eax
80100d88:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100d8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d8e:	c9                   	leave  
80100d8f:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100d90:	83 ec 0c             	sub    $0xc,%esp
80100d93:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d98:	e8 23 36 00 00       	call   801043c0 <release>
  return 0;
80100d9d:	83 c4 10             	add    $0x10,%esp
80100da0:	31 c0                	xor    %eax,%eax
}
80100da2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100da5:	c9                   	leave  
80100da6:	c3                   	ret    
80100da7:	89 f6                	mov    %esi,%esi
80100da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100db0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100db0:	55                   	push   %ebp
80100db1:	89 e5                	mov    %esp,%ebp
80100db3:	53                   	push   %ebx
80100db4:	83 ec 10             	sub    $0x10,%esp
80100db7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dba:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dbf:	e8 dc 34 00 00       	call   801042a0 <acquire>
  if(f->ref < 1)
80100dc4:	8b 43 04             	mov    0x4(%ebx),%eax
80100dc7:	83 c4 10             	add    $0x10,%esp
80100dca:	85 c0                	test   %eax,%eax
80100dcc:	7e 1a                	jle    80100de8 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dce:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100dd1:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100dd4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100dd7:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ddc:	e8 df 35 00 00       	call   801043c0 <release>
  return f;
}
80100de1:	89 d8                	mov    %ebx,%eax
80100de3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de6:	c9                   	leave  
80100de7:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100de8:	83 ec 0c             	sub    $0xc,%esp
80100deb:	68 94 70 10 80       	push   $0x80107094
80100df0:	e8 7b f5 ff ff       	call   80100370 <panic>
80100df5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e00 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e00:	55                   	push   %ebp
80100e01:	89 e5                	mov    %esp,%ebp
80100e03:	57                   	push   %edi
80100e04:	56                   	push   %esi
80100e05:	53                   	push   %ebx
80100e06:	83 ec 28             	sub    $0x28,%esp
80100e09:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e0c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e11:	e8 8a 34 00 00       	call   801042a0 <acquire>
  if(f->ref < 1)
80100e16:	8b 47 04             	mov    0x4(%edi),%eax
80100e19:	83 c4 10             	add    $0x10,%esp
80100e1c:	85 c0                	test   %eax,%eax
80100e1e:	0f 8e 9b 00 00 00    	jle    80100ebf <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e24:	83 e8 01             	sub    $0x1,%eax
80100e27:	85 c0                	test   %eax,%eax
80100e29:	89 47 04             	mov    %eax,0x4(%edi)
80100e2c:	74 1a                	je     80100e48 <fileclose+0x48>
    release(&ftable.lock);
80100e2e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e38:	5b                   	pop    %ebx
80100e39:	5e                   	pop    %esi
80100e3a:	5f                   	pop    %edi
80100e3b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e3c:	e9 7f 35 00 00       	jmp    801043c0 <release>
80100e41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e48:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e4c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e4e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e51:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e54:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e5a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e5d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e60:	68 c0 ff 10 80       	push   $0x8010ffc0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e65:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e68:	e8 53 35 00 00       	call   801043c0 <release>

  if(ff.type == FD_PIPE)
80100e6d:	83 c4 10             	add    $0x10,%esp
80100e70:	83 fb 01             	cmp    $0x1,%ebx
80100e73:	74 13                	je     80100e88 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e75:	83 fb 02             	cmp    $0x2,%ebx
80100e78:	74 26                	je     80100ea0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e7d:	5b                   	pop    %ebx
80100e7e:	5e                   	pop    %esi
80100e7f:	5f                   	pop    %edi
80100e80:	5d                   	pop    %ebp
80100e81:	c3                   	ret    
80100e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100e88:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100e8c:	83 ec 08             	sub    $0x8,%esp
80100e8f:	53                   	push   %ebx
80100e90:	56                   	push   %esi
80100e91:	e8 2a 24 00 00       	call   801032c0 <pipeclose>
80100e96:	83 c4 10             	add    $0x10,%esp
80100e99:	eb df                	jmp    80100e7a <fileclose+0x7a>
80100e9b:	90                   	nop
80100e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ea0:	e8 7b 1c 00 00       	call   80102b20 <begin_op>
    iput(ff.ip);
80100ea5:	83 ec 0c             	sub    $0xc,%esp
80100ea8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eab:	e8 c0 08 00 00       	call   80101770 <iput>
    end_op();
80100eb0:	83 c4 10             	add    $0x10,%esp
  }
}
80100eb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb6:	5b                   	pop    %ebx
80100eb7:	5e                   	pop    %esi
80100eb8:	5f                   	pop    %edi
80100eb9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eba:	e9 d1 1c 00 00       	jmp    80102b90 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100ebf:	83 ec 0c             	sub    $0xc,%esp
80100ec2:	68 9c 70 10 80       	push   $0x8010709c
80100ec7:	e8 a4 f4 ff ff       	call   80100370 <panic>
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ed0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ed0:	55                   	push   %ebp
80100ed1:	89 e5                	mov    %esp,%ebp
80100ed3:	53                   	push   %ebx
80100ed4:	83 ec 04             	sub    $0x4,%esp
80100ed7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100eda:	83 3b 02             	cmpl   $0x2,(%ebx)
80100edd:	75 31                	jne    80100f10 <filestat+0x40>
    ilock(f->ip);
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	ff 73 10             	pushl  0x10(%ebx)
80100ee5:	e8 56 07 00 00       	call   80101640 <ilock>
    stati(f->ip, st);
80100eea:	58                   	pop    %eax
80100eeb:	5a                   	pop    %edx
80100eec:	ff 75 0c             	pushl  0xc(%ebp)
80100eef:	ff 73 10             	pushl  0x10(%ebx)
80100ef2:	e8 f9 09 00 00       	call   801018f0 <stati>
    iunlock(f->ip);
80100ef7:	59                   	pop    %ecx
80100ef8:	ff 73 10             	pushl  0x10(%ebx)
80100efb:	e8 20 08 00 00       	call   80101720 <iunlock>
    return 0;
80100f00:	83 c4 10             	add    $0x10,%esp
80100f03:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f05:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f08:	c9                   	leave  
80100f09:	c3                   	ret    
80100f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f18:	c9                   	leave  
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f20 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f20:	55                   	push   %ebp
80100f21:	89 e5                	mov    %esp,%ebp
80100f23:	57                   	push   %edi
80100f24:	56                   	push   %esi
80100f25:	53                   	push   %ebx
80100f26:	83 ec 0c             	sub    $0xc,%esp
80100f29:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f2f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f32:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f36:	74 60                	je     80100f98 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f38:	8b 03                	mov    (%ebx),%eax
80100f3a:	83 f8 01             	cmp    $0x1,%eax
80100f3d:	74 41                	je     80100f80 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f3f:	83 f8 02             	cmp    $0x2,%eax
80100f42:	75 5b                	jne    80100f9f <fileread+0x7f>
    ilock(f->ip);
80100f44:	83 ec 0c             	sub    $0xc,%esp
80100f47:	ff 73 10             	pushl  0x10(%ebx)
80100f4a:	e8 f1 06 00 00       	call   80101640 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f4f:	57                   	push   %edi
80100f50:	ff 73 14             	pushl  0x14(%ebx)
80100f53:	56                   	push   %esi
80100f54:	ff 73 10             	pushl  0x10(%ebx)
80100f57:	e8 c4 09 00 00       	call   80101920 <readi>
80100f5c:	83 c4 20             	add    $0x20,%esp
80100f5f:	85 c0                	test   %eax,%eax
80100f61:	89 c6                	mov    %eax,%esi
80100f63:	7e 03                	jle    80100f68 <fileread+0x48>
      f->off += r;
80100f65:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f68:	83 ec 0c             	sub    $0xc,%esp
80100f6b:	ff 73 10             	pushl  0x10(%ebx)
80100f6e:	e8 ad 07 00 00       	call   80101720 <iunlock>
    return r;
80100f73:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f76:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f7b:	5b                   	pop    %ebx
80100f7c:	5e                   	pop    %esi
80100f7d:	5f                   	pop    %edi
80100f7e:	5d                   	pop    %ebp
80100f7f:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100f80:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f83:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f89:	5b                   	pop    %ebx
80100f8a:	5e                   	pop    %esi
80100f8b:	5f                   	pop    %edi
80100f8c:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100f8d:	e9 ce 24 00 00       	jmp    80103460 <piperead>
80100f92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100f98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f9d:	eb d9                	jmp    80100f78 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100f9f:	83 ec 0c             	sub    $0xc,%esp
80100fa2:	68 a6 70 10 80       	push   $0x801070a6
80100fa7:	e8 c4 f3 ff ff       	call   80100370 <panic>
80100fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fb0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fb0:	55                   	push   %ebp
80100fb1:	89 e5                	mov    %esp,%ebp
80100fb3:	57                   	push   %edi
80100fb4:	56                   	push   %esi
80100fb5:	53                   	push   %ebx
80100fb6:	83 ec 1c             	sub    $0x1c,%esp
80100fb9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fbf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fc3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fc6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fc9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fcc:	0f 84 aa 00 00 00    	je     8010107c <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80100fd2:	8b 06                	mov    (%esi),%eax
80100fd4:	83 f8 01             	cmp    $0x1,%eax
80100fd7:	0f 84 c2 00 00 00    	je     8010109f <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100fdd:	83 f8 02             	cmp    $0x2,%eax
80100fe0:	0f 85 d8 00 00 00    	jne    801010be <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80100fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100fe9:	31 ff                	xor    %edi,%edi
80100feb:	85 c0                	test   %eax,%eax
80100fed:	7f 34                	jg     80101023 <filewrite+0x73>
80100fef:	e9 9c 00 00 00       	jmp    80101090 <filewrite+0xe0>
80100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80100ff8:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
80100ffb:	83 ec 0c             	sub    $0xc,%esp
80100ffe:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101001:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101004:	e8 17 07 00 00       	call   80101720 <iunlock>
      end_op();
80101009:	e8 82 1b 00 00       	call   80102b90 <end_op>
8010100e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101011:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101014:	39 d8                	cmp    %ebx,%eax
80101016:	0f 85 95 00 00 00    	jne    801010b1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010101c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010101e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101021:	7e 6d                	jle    80101090 <filewrite+0xe0>
      int n1 = n - i;
80101023:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101026:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010102b:	29 fb                	sub    %edi,%ebx
8010102d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101033:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101036:	e8 e5 1a 00 00       	call   80102b20 <begin_op>
      ilock(f->ip);
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
80101041:	e8 fa 05 00 00       	call   80101640 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101046:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101049:	53                   	push   %ebx
8010104a:	ff 76 14             	pushl  0x14(%esi)
8010104d:	01 f8                	add    %edi,%eax
8010104f:	50                   	push   %eax
80101050:	ff 76 10             	pushl  0x10(%esi)
80101053:	e8 c8 09 00 00       	call   80101a20 <writei>
80101058:	83 c4 20             	add    $0x20,%esp
8010105b:	85 c0                	test   %eax,%eax
8010105d:	7f 99                	jg     80100ff8 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010105f:	83 ec 0c             	sub    $0xc,%esp
80101062:	ff 76 10             	pushl  0x10(%esi)
80101065:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101068:	e8 b3 06 00 00       	call   80101720 <iunlock>
      end_op();
8010106d:	e8 1e 1b 00 00       	call   80102b90 <end_op>

      if(r < 0)
80101072:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101075:	83 c4 10             	add    $0x10,%esp
80101078:	85 c0                	test   %eax,%eax
8010107a:	74 98                	je     80101014 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010107c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
8010107f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
80101084:	5b                   	pop    %ebx
80101085:	5e                   	pop    %esi
80101086:	5f                   	pop    %edi
80101087:	5d                   	pop    %ebp
80101088:	c3                   	ret    
80101089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
80101090:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101093:	75 e7                	jne    8010107c <filewrite+0xcc>
  }
  panic("filewrite");
}
80101095:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101098:	89 f8                	mov    %edi,%eax
8010109a:	5b                   	pop    %ebx
8010109b:	5e                   	pop    %esi
8010109c:	5f                   	pop    %edi
8010109d:	5d                   	pop    %ebp
8010109e:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
8010109f:	8b 46 0c             	mov    0xc(%esi),%eax
801010a2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010a8:	5b                   	pop    %ebx
801010a9:	5e                   	pop    %esi
801010aa:	5f                   	pop    %edi
801010ab:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010ac:	e9 af 22 00 00       	jmp    80103360 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010b1:	83 ec 0c             	sub    $0xc,%esp
801010b4:	68 af 70 10 80       	push   $0x801070af
801010b9:	e8 b2 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010be:	83 ec 0c             	sub    $0xc,%esp
801010c1:	68 b5 70 10 80       	push   $0x801070b5
801010c6:	e8 a5 f2 ff ff       	call   80100370 <panic>
801010cb:	66 90                	xchg   %ax,%ax
801010cd:	66 90                	xchg   %ax,%ax
801010cf:	90                   	nop

801010d0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010d0:	55                   	push   %ebp
801010d1:	89 e5                	mov    %esp,%ebp
801010d3:	57                   	push   %edi
801010d4:	56                   	push   %esi
801010d5:	53                   	push   %ebx
801010d6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010d9:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010df:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010e2:	85 c9                	test   %ecx,%ecx
801010e4:	0f 84 85 00 00 00    	je     8010116f <balloc+0x9f>
801010ea:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
801010f1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801010f4:	83 ec 08             	sub    $0x8,%esp
801010f7:	89 f0                	mov    %esi,%eax
801010f9:	c1 f8 0c             	sar    $0xc,%eax
801010fc:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101102:	50                   	push   %eax
80101103:	ff 75 d8             	pushl  -0x28(%ebp)
80101106:	e8 c5 ef ff ff       	call   801000d0 <bread>
8010110b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010110e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101113:	83 c4 10             	add    $0x10,%esp
80101116:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101119:	31 c0                	xor    %eax,%eax
8010111b:	eb 2d                	jmp    8010114a <balloc+0x7a>
8010111d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101120:	89 c1                	mov    %eax,%ecx
80101122:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101127:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010112a:	83 e1 07             	and    $0x7,%ecx
8010112d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010112f:	89 c1                	mov    %eax,%ecx
80101131:	c1 f9 03             	sar    $0x3,%ecx
80101134:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101139:	85 d7                	test   %edx,%edi
8010113b:	74 43                	je     80101180 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010113d:	83 c0 01             	add    $0x1,%eax
80101140:	83 c6 01             	add    $0x1,%esi
80101143:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101148:	74 05                	je     8010114f <balloc+0x7f>
8010114a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010114d:	72 d1                	jb     80101120 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010114f:	83 ec 0c             	sub    $0xc,%esp
80101152:	ff 75 e4             	pushl  -0x1c(%ebp)
80101155:	e8 86 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010115a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101161:	83 c4 10             	add    $0x10,%esp
80101164:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101167:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
8010116d:	77 82                	ja     801010f1 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	68 bf 70 10 80       	push   $0x801070bf
80101177:	e8 f4 f1 ff ff       	call   80100370 <panic>
8010117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
80101180:	09 fa                	or     %edi,%edx
80101182:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101185:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
80101188:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
8010118c:	57                   	push   %edi
8010118d:	e8 6e 1b 00 00       	call   80102d00 <log_write>
        brelse(bp);
80101192:	89 3c 24             	mov    %edi,(%esp)
80101195:	e8 46 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
8010119a:	58                   	pop    %eax
8010119b:	5a                   	pop    %edx
8010119c:	56                   	push   %esi
8010119d:	ff 75 d8             	pushl  -0x28(%ebp)
801011a0:	e8 2b ef ff ff       	call   801000d0 <bread>
801011a5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011a7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011aa:	83 c4 0c             	add    $0xc,%esp
801011ad:	68 00 02 00 00       	push   $0x200
801011b2:	6a 00                	push   $0x0
801011b4:	50                   	push   %eax
801011b5:	e8 56 32 00 00       	call   80104410 <memset>
  log_write(bp);
801011ba:	89 1c 24             	mov    %ebx,(%esp)
801011bd:	e8 3e 1b 00 00       	call   80102d00 <log_write>
  brelse(bp);
801011c2:	89 1c 24             	mov    %ebx,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011cd:	89 f0                	mov    %esi,%eax
801011cf:	5b                   	pop    %ebx
801011d0:	5e                   	pop    %esi
801011d1:	5f                   	pop    %edi
801011d2:	5d                   	pop    %ebp
801011d3:	c3                   	ret    
801011d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801011e0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801011e0:	55                   	push   %ebp
801011e1:	89 e5                	mov    %esp,%ebp
801011e3:	57                   	push   %edi
801011e4:	56                   	push   %esi
801011e5:	53                   	push   %ebx
801011e6:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
801011e8:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801011ea:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801011ef:	83 ec 28             	sub    $0x28,%esp
801011f2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
801011f5:	68 e0 09 11 80       	push   $0x801109e0
801011fa:	e8 a1 30 00 00       	call   801042a0 <acquire>
801011ff:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101202:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101205:	eb 1b                	jmp    80101222 <iget+0x42>
80101207:	89 f6                	mov    %esi,%esi
80101209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101210:	85 f6                	test   %esi,%esi
80101212:	74 44                	je     80101258 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101214:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010121a:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101220:	74 4e                	je     80101270 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101222:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101225:	85 c9                	test   %ecx,%ecx
80101227:	7e e7                	jle    80101210 <iget+0x30>
80101229:	39 3b                	cmp    %edi,(%ebx)
8010122b:	75 e3                	jne    80101210 <iget+0x30>
8010122d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101230:	75 de                	jne    80101210 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101232:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101235:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101238:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010123a:	68 e0 09 11 80       	push   $0x801109e0

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010123f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101242:	e8 79 31 00 00       	call   801043c0 <release>
      return ip;
80101247:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010124a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010124d:	89 f0                	mov    %esi,%eax
8010124f:	5b                   	pop    %ebx
80101250:	5e                   	pop    %esi
80101251:	5f                   	pop    %edi
80101252:	5d                   	pop    %ebp
80101253:	c3                   	ret    
80101254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101258:	85 c9                	test   %ecx,%ecx
8010125a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010125d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101263:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101269:	75 b7                	jne    80101222 <iget+0x42>
8010126b:	90                   	nop
8010126c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101270:	85 f6                	test   %esi,%esi
80101272:	74 2d                	je     801012a1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
80101274:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101277:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101279:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010127c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101283:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010128a:	68 e0 09 11 80       	push   $0x801109e0
8010128f:	e8 2c 31 00 00       	call   801043c0 <release>

  return ip;
80101294:	83 c4 10             	add    $0x10,%esp
}
80101297:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010129a:	89 f0                	mov    %esi,%eax
8010129c:	5b                   	pop    %ebx
8010129d:	5e                   	pop    %esi
8010129e:	5f                   	pop    %edi
8010129f:	5d                   	pop    %ebp
801012a0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012a1:	83 ec 0c             	sub    $0xc,%esp
801012a4:	68 d5 70 10 80       	push   $0x801070d5
801012a9:	e8 c2 f0 ff ff       	call   80100370 <panic>
801012ae:	66 90                	xchg   %ax,%ax

801012b0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012b0:	55                   	push   %ebp
801012b1:	89 e5                	mov    %esp,%ebp
801012b3:	57                   	push   %edi
801012b4:	56                   	push   %esi
801012b5:	53                   	push   %ebx
801012b6:	89 c6                	mov    %eax,%esi
801012b8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012bb:	83 fa 0b             	cmp    $0xb,%edx
801012be:	77 18                	ja     801012d8 <bmap+0x28>
801012c0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
801012c3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012c6:	85 c0                	test   %eax,%eax
801012c8:	74 76                	je     80101340 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012cd:	5b                   	pop    %ebx
801012ce:	5e                   	pop    %esi
801012cf:	5f                   	pop    %edi
801012d0:	5d                   	pop    %ebp
801012d1:	c3                   	ret    
801012d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801012d8:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
801012db:	83 fb 7f             	cmp    $0x7f,%ebx
801012de:	0f 87 83 00 00 00    	ja     80101367 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
801012e4:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801012ea:	85 c0                	test   %eax,%eax
801012ec:	74 6a                	je     80101358 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801012ee:	83 ec 08             	sub    $0x8,%esp
801012f1:	50                   	push   %eax
801012f2:	ff 36                	pushl  (%esi)
801012f4:	e8 d7 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801012f9:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801012fd:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101300:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101302:	8b 1a                	mov    (%edx),%ebx
80101304:	85 db                	test   %ebx,%ebx
80101306:	75 1d                	jne    80101325 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101308:	8b 06                	mov    (%esi),%eax
8010130a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010130d:	e8 be fd ff ff       	call   801010d0 <balloc>
80101312:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101315:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101318:	89 c3                	mov    %eax,%ebx
8010131a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010131c:	57                   	push   %edi
8010131d:	e8 de 19 00 00       	call   80102d00 <log_write>
80101322:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101325:	83 ec 0c             	sub    $0xc,%esp
80101328:	57                   	push   %edi
80101329:	e8 b2 ee ff ff       	call   801001e0 <brelse>
8010132e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101331:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101334:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101336:	5b                   	pop    %ebx
80101337:	5e                   	pop    %esi
80101338:	5f                   	pop    %edi
80101339:	5d                   	pop    %ebp
8010133a:	c3                   	ret    
8010133b:	90                   	nop
8010133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101340:	8b 06                	mov    (%esi),%eax
80101342:	e8 89 fd ff ff       	call   801010d0 <balloc>
80101347:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010134a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010134d:	5b                   	pop    %ebx
8010134e:	5e                   	pop    %esi
8010134f:	5f                   	pop    %edi
80101350:	5d                   	pop    %ebp
80101351:	c3                   	ret    
80101352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101358:	8b 06                	mov    (%esi),%eax
8010135a:	e8 71 fd ff ff       	call   801010d0 <balloc>
8010135f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101365:	eb 87                	jmp    801012ee <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101367:	83 ec 0c             	sub    $0xc,%esp
8010136a:	68 e5 70 10 80       	push   $0x801070e5
8010136f:	e8 fc ef ff ff       	call   80100370 <panic>
80101374:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010137a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101380 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101380:	55                   	push   %ebp
80101381:	89 e5                	mov    %esp,%ebp
80101383:	56                   	push   %esi
80101384:	53                   	push   %ebx
80101385:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
80101388:	83 ec 08             	sub    $0x8,%esp
8010138b:	6a 01                	push   $0x1
8010138d:	ff 75 08             	pushl  0x8(%ebp)
80101390:	e8 3b ed ff ff       	call   801000d0 <bread>
80101395:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101397:	8d 40 5c             	lea    0x5c(%eax),%eax
8010139a:	83 c4 0c             	add    $0xc,%esp
8010139d:	6a 1c                	push   $0x1c
8010139f:	50                   	push   %eax
801013a0:	56                   	push   %esi
801013a1:	e8 1a 31 00 00       	call   801044c0 <memmove>
  brelse(bp);
801013a6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013a9:	83 c4 10             	add    $0x10,%esp
}
801013ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013af:	5b                   	pop    %ebx
801013b0:	5e                   	pop    %esi
801013b1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013b2:	e9 29 ee ff ff       	jmp    801001e0 <brelse>
801013b7:	89 f6                	mov    %esi,%esi
801013b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013c0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013c0:	55                   	push   %ebp
801013c1:	89 e5                	mov    %esp,%ebp
801013c3:	56                   	push   %esi
801013c4:	53                   	push   %ebx
801013c5:	89 d3                	mov    %edx,%ebx
801013c7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013c9:	83 ec 08             	sub    $0x8,%esp
801013cc:	68 c0 09 11 80       	push   $0x801109c0
801013d1:	50                   	push   %eax
801013d2:	e8 a9 ff ff ff       	call   80101380 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013d7:	58                   	pop    %eax
801013d8:	5a                   	pop    %edx
801013d9:	89 da                	mov    %ebx,%edx
801013db:	c1 ea 0c             	shr    $0xc,%edx
801013de:	03 15 d8 09 11 80    	add    0x801109d8,%edx
801013e4:	52                   	push   %edx
801013e5:	56                   	push   %esi
801013e6:	e8 e5 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
801013eb:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
801013ed:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
801013f3:	ba 01 00 00 00       	mov    $0x1,%edx
801013f8:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
801013fb:	c1 fb 03             	sar    $0x3,%ebx
801013fe:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101401:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101403:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101408:	85 d1                	test   %edx,%ecx
8010140a:	74 27                	je     80101433 <bfree+0x73>
8010140c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010140e:	f7 d2                	not    %edx
80101410:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101412:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101415:	21 d0                	and    %edx,%eax
80101417:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010141b:	56                   	push   %esi
8010141c:	e8 df 18 00 00       	call   80102d00 <log_write>
  brelse(bp);
80101421:	89 34 24             	mov    %esi,(%esp)
80101424:	e8 b7 ed ff ff       	call   801001e0 <brelse>
}
80101429:	83 c4 10             	add    $0x10,%esp
8010142c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010142f:	5b                   	pop    %ebx
80101430:	5e                   	pop    %esi
80101431:	5d                   	pop    %ebp
80101432:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101433:	83 ec 0c             	sub    $0xc,%esp
80101436:	68 f8 70 10 80       	push   $0x801070f8
8010143b:	e8 30 ef ff ff       	call   80100370 <panic>

80101440 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101440:	55                   	push   %ebp
80101441:	89 e5                	mov    %esp,%ebp
80101443:	53                   	push   %ebx
80101444:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101449:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010144c:	68 0b 71 10 80       	push   $0x8010710b
80101451:	68 e0 09 11 80       	push   $0x801109e0
80101456:	e8 45 2d 00 00       	call   801041a0 <initlock>
8010145b:	83 c4 10             	add    $0x10,%esp
8010145e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101460:	83 ec 08             	sub    $0x8,%esp
80101463:	68 12 71 10 80       	push   $0x80107112
80101468:	53                   	push   %ebx
80101469:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010146f:	e8 1c 2c 00 00       	call   80104090 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101474:	83 c4 10             	add    $0x10,%esp
80101477:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
8010147d:	75 e1                	jne    80101460 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
8010147f:	83 ec 08             	sub    $0x8,%esp
80101482:	68 c0 09 11 80       	push   $0x801109c0
80101487:	ff 75 08             	pushl  0x8(%ebp)
8010148a:	e8 f1 fe ff ff       	call   80101380 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010148f:	ff 35 d8 09 11 80    	pushl  0x801109d8
80101495:	ff 35 d4 09 11 80    	pushl  0x801109d4
8010149b:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014a1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014a7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014ad:	ff 35 c4 09 11 80    	pushl  0x801109c4
801014b3:	ff 35 c0 09 11 80    	pushl  0x801109c0
801014b9:	68 78 71 10 80       	push   $0x80107178
801014be:	e8 9d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014c3:	83 c4 30             	add    $0x30,%esp
801014c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014c9:	c9                   	leave  
801014ca:	c3                   	ret    
801014cb:	90                   	nop
801014cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014d0 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
801014d0:	55                   	push   %ebp
801014d1:	89 e5                	mov    %esp,%ebp
801014d3:	57                   	push   %edi
801014d4:	56                   	push   %esi
801014d5:	53                   	push   %ebx
801014d6:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801014d9:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
801014e0:	8b 45 0c             	mov    0xc(%ebp),%eax
801014e3:	8b 75 08             	mov    0x8(%ebp),%esi
801014e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801014e9:	0f 86 91 00 00 00    	jbe    80101580 <ialloc+0xb0>
801014ef:	bb 01 00 00 00       	mov    $0x1,%ebx
801014f4:	eb 21                	jmp    80101517 <ialloc+0x47>
801014f6:	8d 76 00             	lea    0x0(%esi),%esi
801014f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101500:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101503:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101506:	57                   	push   %edi
80101507:	e8 d4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010150c:	83 c4 10             	add    $0x10,%esp
8010150f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101515:	76 69                	jbe    80101580 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101517:	89 d8                	mov    %ebx,%eax
80101519:	83 ec 08             	sub    $0x8,%esp
8010151c:	c1 e8 03             	shr    $0x3,%eax
8010151f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101525:	50                   	push   %eax
80101526:	56                   	push   %esi
80101527:	e8 a4 eb ff ff       	call   801000d0 <bread>
8010152c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010152e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101530:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101533:	83 e0 07             	and    $0x7,%eax
80101536:	c1 e0 06             	shl    $0x6,%eax
80101539:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010153d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101541:	75 bd                	jne    80101500 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101543:	83 ec 04             	sub    $0x4,%esp
80101546:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101549:	6a 40                	push   $0x40
8010154b:	6a 00                	push   $0x0
8010154d:	51                   	push   %ecx
8010154e:	e8 bd 2e 00 00       	call   80104410 <memset>
      dip->type = type;
80101553:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101557:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010155a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010155d:	89 3c 24             	mov    %edi,(%esp)
80101560:	e8 9b 17 00 00       	call   80102d00 <log_write>
      brelse(bp);
80101565:	89 3c 24             	mov    %edi,(%esp)
80101568:	e8 73 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010156d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101570:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
80101573:	89 da                	mov    %ebx,%edx
80101575:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101577:	5b                   	pop    %ebx
80101578:	5e                   	pop    %esi
80101579:	5f                   	pop    %edi
8010157a:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
8010157b:	e9 60 fc ff ff       	jmp    801011e0 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
80101580:	83 ec 0c             	sub    $0xc,%esp
80101583:	68 18 71 10 80       	push   $0x80107118
80101588:	e8 e3 ed ff ff       	call   80100370 <panic>
8010158d:	8d 76 00             	lea    0x0(%esi),%esi

80101590 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
80101590:	55                   	push   %ebp
80101591:	89 e5                	mov    %esp,%ebp
80101593:	56                   	push   %esi
80101594:	53                   	push   %ebx
80101595:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101598:	83 ec 08             	sub    $0x8,%esp
8010159b:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010159e:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015a1:	c1 e8 03             	shr    $0x3,%eax
801015a4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015aa:	50                   	push   %eax
801015ab:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ae:	e8 1d eb ff ff       	call   801000d0 <bread>
801015b3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015b5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015b8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015bc:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015bf:	83 e0 07             	and    $0x7,%eax
801015c2:	c1 e0 06             	shl    $0x6,%eax
801015c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015c9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015cc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015d0:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
801015d3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
801015d7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015db:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801015df:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801015e3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
801015e7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801015ea:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ed:	6a 34                	push   $0x34
801015ef:	53                   	push   %ebx
801015f0:	50                   	push   %eax
801015f1:	e8 ca 2e 00 00       	call   801044c0 <memmove>
  log_write(bp);
801015f6:	89 34 24             	mov    %esi,(%esp)
801015f9:	e8 02 17 00 00       	call   80102d00 <log_write>
  brelse(bp);
801015fe:	89 75 08             	mov    %esi,0x8(%ebp)
80101601:	83 c4 10             	add    $0x10,%esp
}
80101604:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101607:	5b                   	pop    %ebx
80101608:	5e                   	pop    %esi
80101609:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010160a:	e9 d1 eb ff ff       	jmp    801001e0 <brelse>
8010160f:	90                   	nop

80101610 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	53                   	push   %ebx
80101614:	83 ec 10             	sub    $0x10,%esp
80101617:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010161a:	68 e0 09 11 80       	push   $0x801109e0
8010161f:	e8 7c 2c 00 00       	call   801042a0 <acquire>
  ip->ref++;
80101624:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101628:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010162f:	e8 8c 2d 00 00       	call   801043c0 <release>
  return ip;
}
80101634:	89 d8                	mov    %ebx,%eax
80101636:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101639:	c9                   	leave  
8010163a:	c3                   	ret    
8010163b:	90                   	nop
8010163c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101640 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	56                   	push   %esi
80101644:	53                   	push   %ebx
80101645:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101648:	85 db                	test   %ebx,%ebx
8010164a:	0f 84 b7 00 00 00    	je     80101707 <ilock+0xc7>
80101650:	8b 53 08             	mov    0x8(%ebx),%edx
80101653:	85 d2                	test   %edx,%edx
80101655:	0f 8e ac 00 00 00    	jle    80101707 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
8010165b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010165e:	83 ec 0c             	sub    $0xc,%esp
80101661:	50                   	push   %eax
80101662:	e8 69 2a 00 00       	call   801040d0 <acquiresleep>

  if(ip->valid == 0){
80101667:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010166a:	83 c4 10             	add    $0x10,%esp
8010166d:	85 c0                	test   %eax,%eax
8010166f:	74 0f                	je     80101680 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
80101671:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101674:	5b                   	pop    %ebx
80101675:	5e                   	pop    %esi
80101676:	5d                   	pop    %ebp
80101677:	c3                   	ret    
80101678:	90                   	nop
80101679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101680:	8b 43 04             	mov    0x4(%ebx),%eax
80101683:	83 ec 08             	sub    $0x8,%esp
80101686:	c1 e8 03             	shr    $0x3,%eax
80101689:	03 05 d4 09 11 80    	add    0x801109d4,%eax
8010168f:	50                   	push   %eax
80101690:	ff 33                	pushl  (%ebx)
80101692:	e8 39 ea ff ff       	call   801000d0 <bread>
80101697:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101699:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010169c:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010169f:	83 e0 07             	and    $0x7,%eax
801016a2:	c1 e0 06             	shl    $0x6,%eax
801016a5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016a9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ac:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016af:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016b3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016b7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016bb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016bf:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016c3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016c7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016cb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016ce:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016d1:	6a 34                	push   $0x34
801016d3:	50                   	push   %eax
801016d4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016d7:	50                   	push   %eax
801016d8:	e8 e3 2d 00 00       	call   801044c0 <memmove>
    brelse(bp);
801016dd:	89 34 24             	mov    %esi,(%esp)
801016e0:	e8 fb ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
801016e5:	83 c4 10             	add    $0x10,%esp
801016e8:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
801016ed:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
801016f4:	0f 85 77 ff ff ff    	jne    80101671 <ilock+0x31>
      panic("ilock: no type");
801016fa:	83 ec 0c             	sub    $0xc,%esp
801016fd:	68 30 71 10 80       	push   $0x80107130
80101702:	e8 69 ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101707:	83 ec 0c             	sub    $0xc,%esp
8010170a:	68 2a 71 10 80       	push   $0x8010712a
8010170f:	e8 5c ec ff ff       	call   80100370 <panic>
80101714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010171a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101720 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101720:	55                   	push   %ebp
80101721:	89 e5                	mov    %esp,%ebp
80101723:	56                   	push   %esi
80101724:	53                   	push   %ebx
80101725:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101728:	85 db                	test   %ebx,%ebx
8010172a:	74 28                	je     80101754 <iunlock+0x34>
8010172c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010172f:	83 ec 0c             	sub    $0xc,%esp
80101732:	56                   	push   %esi
80101733:	e8 38 2a 00 00       	call   80104170 <holdingsleep>
80101738:	83 c4 10             	add    $0x10,%esp
8010173b:	85 c0                	test   %eax,%eax
8010173d:	74 15                	je     80101754 <iunlock+0x34>
8010173f:	8b 43 08             	mov    0x8(%ebx),%eax
80101742:	85 c0                	test   %eax,%eax
80101744:	7e 0e                	jle    80101754 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101746:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101749:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010174c:	5b                   	pop    %ebx
8010174d:	5e                   	pop    %esi
8010174e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010174f:	e9 dc 29 00 00       	jmp    80104130 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101754:	83 ec 0c             	sub    $0xc,%esp
80101757:	68 3f 71 10 80       	push   $0x8010713f
8010175c:	e8 0f ec ff ff       	call   80100370 <panic>
80101761:	eb 0d                	jmp    80101770 <iput>
80101763:	90                   	nop
80101764:	90                   	nop
80101765:	90                   	nop
80101766:	90                   	nop
80101767:	90                   	nop
80101768:	90                   	nop
80101769:	90                   	nop
8010176a:	90                   	nop
8010176b:	90                   	nop
8010176c:	90                   	nop
8010176d:	90                   	nop
8010176e:	90                   	nop
8010176f:	90                   	nop

80101770 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	57                   	push   %edi
80101774:	56                   	push   %esi
80101775:	53                   	push   %ebx
80101776:	83 ec 28             	sub    $0x28,%esp
80101779:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
8010177c:	8d 7e 0c             	lea    0xc(%esi),%edi
8010177f:	57                   	push   %edi
80101780:	e8 4b 29 00 00       	call   801040d0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101785:	8b 56 4c             	mov    0x4c(%esi),%edx
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 d2                	test   %edx,%edx
8010178d:	74 07                	je     80101796 <iput+0x26>
8010178f:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80101794:	74 32                	je     801017c8 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
80101796:	83 ec 0c             	sub    $0xc,%esp
80101799:	57                   	push   %edi
8010179a:	e8 91 29 00 00       	call   80104130 <releasesleep>

  acquire(&icache.lock);
8010179f:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017a6:	e8 f5 2a 00 00       	call   801042a0 <acquire>
  ip->ref--;
801017ab:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017af:	83 c4 10             	add    $0x10,%esp
801017b2:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
}
801017b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017bc:	5b                   	pop    %ebx
801017bd:	5e                   	pop    %esi
801017be:	5f                   	pop    %edi
801017bf:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
801017c0:	e9 fb 2b 00 00       	jmp    801043c0 <release>
801017c5:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
801017c8:	83 ec 0c             	sub    $0xc,%esp
801017cb:	68 e0 09 11 80       	push   $0x801109e0
801017d0:	e8 cb 2a 00 00       	call   801042a0 <acquire>
    int r = ip->ref;
801017d5:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
801017d8:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017df:	e8 dc 2b 00 00       	call   801043c0 <release>
    if(r == 1){
801017e4:	83 c4 10             	add    $0x10,%esp
801017e7:	83 fb 01             	cmp    $0x1,%ebx
801017ea:	75 aa                	jne    80101796 <iput+0x26>
801017ec:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
801017f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801017f5:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017f8:	89 cf                	mov    %ecx,%edi
801017fa:	eb 0b                	jmp    80101807 <iput+0x97>
801017fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101800:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101803:	39 fb                	cmp    %edi,%ebx
80101805:	74 19                	je     80101820 <iput+0xb0>
    if(ip->addrs[i]){
80101807:	8b 13                	mov    (%ebx),%edx
80101809:	85 d2                	test   %edx,%edx
8010180b:	74 f3                	je     80101800 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010180d:	8b 06                	mov    (%esi),%eax
8010180f:	e8 ac fb ff ff       	call   801013c0 <bfree>
      ip->addrs[i] = 0;
80101814:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010181a:	eb e4                	jmp    80101800 <iput+0x90>
8010181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101820:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101826:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101829:	85 c0                	test   %eax,%eax
8010182b:	75 33                	jne    80101860 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010182d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101830:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101837:	56                   	push   %esi
80101838:	e8 53 fd ff ff       	call   80101590 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010183d:	31 c0                	xor    %eax,%eax
8010183f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101843:	89 34 24             	mov    %esi,(%esp)
80101846:	e8 45 fd ff ff       	call   80101590 <iupdate>
      ip->valid = 0;
8010184b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101852:	83 c4 10             	add    $0x10,%esp
80101855:	e9 3c ff ff ff       	jmp    80101796 <iput+0x26>
8010185a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101860:	83 ec 08             	sub    $0x8,%esp
80101863:	50                   	push   %eax
80101864:	ff 36                	pushl  (%esi)
80101866:	e8 65 e8 ff ff       	call   801000d0 <bread>
8010186b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101871:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101874:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101877:	8d 58 5c             	lea    0x5c(%eax),%ebx
8010187a:	83 c4 10             	add    $0x10,%esp
8010187d:	89 cf                	mov    %ecx,%edi
8010187f:	eb 0e                	jmp    8010188f <iput+0x11f>
80101881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101888:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
8010188b:	39 fb                	cmp    %edi,%ebx
8010188d:	74 0f                	je     8010189e <iput+0x12e>
      if(a[j])
8010188f:	8b 13                	mov    (%ebx),%edx
80101891:	85 d2                	test   %edx,%edx
80101893:	74 f3                	je     80101888 <iput+0x118>
        bfree(ip->dev, a[j]);
80101895:	8b 06                	mov    (%esi),%eax
80101897:	e8 24 fb ff ff       	call   801013c0 <bfree>
8010189c:	eb ea                	jmp    80101888 <iput+0x118>
    }
    brelse(bp);
8010189e:	83 ec 0c             	sub    $0xc,%esp
801018a1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018a4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018a7:	e8 34 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018ac:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018b2:	8b 06                	mov    (%esi),%eax
801018b4:	e8 07 fb ff ff       	call   801013c0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018b9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018c0:	00 00 00 
801018c3:	83 c4 10             	add    $0x10,%esp
801018c6:	e9 62 ff ff ff       	jmp    8010182d <iput+0xbd>
801018cb:	90                   	nop
801018cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018d0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801018d0:	55                   	push   %ebp
801018d1:	89 e5                	mov    %esp,%ebp
801018d3:	53                   	push   %ebx
801018d4:	83 ec 10             	sub    $0x10,%esp
801018d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018da:	53                   	push   %ebx
801018db:	e8 40 fe ff ff       	call   80101720 <iunlock>
  iput(ip);
801018e0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018e3:	83 c4 10             	add    $0x10,%esp
}
801018e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018e9:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
801018ea:	e9 81 fe ff ff       	jmp    80101770 <iput>
801018ef:	90                   	nop

801018f0 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	8b 55 08             	mov    0x8(%ebp),%edx
801018f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801018f9:	8b 0a                	mov    (%edx),%ecx
801018fb:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801018fe:	8b 4a 04             	mov    0x4(%edx),%ecx
80101901:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101904:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101908:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010190b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010190f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101913:	8b 52 58             	mov    0x58(%edx),%edx
80101916:	89 50 10             	mov    %edx,0x10(%eax)
}
80101919:	5d                   	pop    %ebp
8010191a:	c3                   	ret    
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	57                   	push   %edi
80101924:	56                   	push   %esi
80101925:	53                   	push   %ebx
80101926:	83 ec 1c             	sub    $0x1c,%esp
80101929:	8b 45 08             	mov    0x8(%ebp),%eax
8010192c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010192f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101932:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101937:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010193a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010193d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101940:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101943:	0f 84 a7 00 00 00    	je     801019f0 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101949:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010194c:	8b 40 58             	mov    0x58(%eax),%eax
8010194f:	39 f0                	cmp    %esi,%eax
80101951:	0f 82 c1 00 00 00    	jb     80101a18 <readi+0xf8>
80101957:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010195a:	89 fa                	mov    %edi,%edx
8010195c:	01 f2                	add    %esi,%edx
8010195e:	0f 82 b4 00 00 00    	jb     80101a18 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101964:	89 c1                	mov    %eax,%ecx
80101966:	29 f1                	sub    %esi,%ecx
80101968:	39 d0                	cmp    %edx,%eax
8010196a:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010196d:	31 ff                	xor    %edi,%edi
8010196f:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101971:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101974:	74 6d                	je     801019e3 <readi+0xc3>
80101976:	8d 76 00             	lea    0x0(%esi),%esi
80101979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101980:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101983:	89 f2                	mov    %esi,%edx
80101985:	c1 ea 09             	shr    $0x9,%edx
80101988:	89 d8                	mov    %ebx,%eax
8010198a:	e8 21 f9 ff ff       	call   801012b0 <bmap>
8010198f:	83 ec 08             	sub    $0x8,%esp
80101992:	50                   	push   %eax
80101993:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
80101995:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010199a:	e8 31 e7 ff ff       	call   801000d0 <bread>
8010199f:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019a4:	89 f1                	mov    %esi,%ecx
801019a6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019ac:	83 c4 0c             	add    $0xc,%esp
    memmove(dst, bp->data + off%BSIZE, m);
801019af:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019b2:	29 cb                	sub    %ecx,%ebx
801019b4:	29 f8                	sub    %edi,%eax
801019b6:	39 c3                	cmp    %eax,%ebx
801019b8:	0f 47 d8             	cmova  %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019bb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019bf:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c0:	01 df                	add    %ebx,%edi
801019c2:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
801019c4:	50                   	push   %eax
801019c5:	ff 75 e0             	pushl  -0x20(%ebp)
801019c8:	e8 f3 2a 00 00       	call   801044c0 <memmove>
    brelse(bp);
801019cd:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019d0:	89 14 24             	mov    %edx,(%esp)
801019d3:	e8 08 e8 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019d8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019db:	83 c4 10             	add    $0x10,%esp
801019de:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019e1:	77 9d                	ja     80101980 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
801019e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801019e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019e9:	5b                   	pop    %ebx
801019ea:	5e                   	pop    %esi
801019eb:	5f                   	pop    %edi
801019ec:	5d                   	pop    %ebp
801019ed:	c3                   	ret    
801019ee:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801019f0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019f4:	66 83 f8 09          	cmp    $0x9,%ax
801019f8:	77 1e                	ja     80101a18 <readi+0xf8>
801019fa:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a01:	85 c0                	test   %eax,%eax
80101a03:	74 13                	je     80101a18 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a05:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a0b:	5b                   	pop    %ebx
80101a0c:	5e                   	pop    %esi
80101a0d:	5f                   	pop    %edi
80101a0e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a0f:	ff e0                	jmp    *%eax
80101a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a1d:	eb c7                	jmp    801019e6 <readi+0xc6>
80101a1f:	90                   	nop

80101a20 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a20:	55                   	push   %ebp
80101a21:	89 e5                	mov    %esp,%ebp
80101a23:	57                   	push   %edi
80101a24:	56                   	push   %esi
80101a25:	53                   	push   %ebx
80101a26:	83 ec 1c             	sub    $0x1c,%esp
80101a29:	8b 45 08             	mov    0x8(%ebp),%eax
80101a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a2f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a32:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a37:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a3a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a3d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a40:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a43:	0f 84 b7 00 00 00    	je     80101b00 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a49:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a4c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a4f:	0f 82 eb 00 00 00    	jb     80101b40 <writei+0x120>
80101a55:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a58:	89 f8                	mov    %edi,%eax
80101a5a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a5c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a61:	0f 87 d9 00 00 00    	ja     80101b40 <writei+0x120>
80101a67:	39 c6                	cmp    %eax,%esi
80101a69:	0f 87 d1 00 00 00    	ja     80101b40 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a6f:	85 ff                	test   %edi,%edi
80101a71:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a78:	74 78                	je     80101af2 <writei+0xd2>
80101a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a80:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a83:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a85:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a8a:	c1 ea 09             	shr    $0x9,%edx
80101a8d:	89 f8                	mov    %edi,%eax
80101a8f:	e8 1c f8 ff ff       	call   801012b0 <bmap>
80101a94:	83 ec 08             	sub    $0x8,%esp
80101a97:	50                   	push   %eax
80101a98:	ff 37                	pushl  (%edi)
80101a9a:	e8 31 e6 ff ff       	call   801000d0 <bread>
80101a9f:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101aa1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101aa4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101aa7:	89 f1                	mov    %esi,%ecx
80101aa9:	83 c4 0c             	add    $0xc,%esp
80101aac:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ab2:	29 cb                	sub    %ecx,%ebx
80101ab4:	39 c3                	cmp    %eax,%ebx
80101ab6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ab9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101abd:	53                   	push   %ebx
80101abe:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ac1:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ac3:	50                   	push   %eax
80101ac4:	e8 f7 29 00 00       	call   801044c0 <memmove>
    log_write(bp);
80101ac9:	89 3c 24             	mov    %edi,(%esp)
80101acc:	e8 2f 12 00 00       	call   80102d00 <log_write>
    brelse(bp);
80101ad1:	89 3c 24             	mov    %edi,(%esp)
80101ad4:	e8 07 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ad9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101adc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101adf:	83 c4 10             	add    $0x10,%esp
80101ae2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ae5:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101ae8:	77 96                	ja     80101a80 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101aea:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101aed:	3b 70 58             	cmp    0x58(%eax),%esi
80101af0:	77 36                	ja     80101b28 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101af2:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101af5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101af8:	5b                   	pop    %ebx
80101af9:	5e                   	pop    %esi
80101afa:	5f                   	pop    %edi
80101afb:	5d                   	pop    %ebp
80101afc:	c3                   	ret    
80101afd:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b00:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b04:	66 83 f8 09          	cmp    $0x9,%ax
80101b08:	77 36                	ja     80101b40 <writei+0x120>
80101b0a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b11:	85 c0                	test   %eax,%eax
80101b13:	74 2b                	je     80101b40 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b15:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b1b:	5b                   	pop    %ebx
80101b1c:	5e                   	pop    %esi
80101b1d:	5f                   	pop    %edi
80101b1e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b1f:	ff e0                	jmp    *%eax
80101b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b28:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b2b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b2e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b31:	50                   	push   %eax
80101b32:	e8 59 fa ff ff       	call   80101590 <iupdate>
80101b37:	83 c4 10             	add    $0x10,%esp
80101b3a:	eb b6                	jmp    80101af2 <writei+0xd2>
80101b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b45:	eb ae                	jmp    80101af5 <writei+0xd5>
80101b47:	89 f6                	mov    %esi,%esi
80101b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b50 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b50:	55                   	push   %ebp
80101b51:	89 e5                	mov    %esp,%ebp
80101b53:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b56:	6a 0e                	push   $0xe
80101b58:	ff 75 0c             	pushl  0xc(%ebp)
80101b5b:	ff 75 08             	pushl  0x8(%ebp)
80101b5e:	e8 dd 29 00 00       	call   80104540 <strncmp>
}
80101b63:	c9                   	leave  
80101b64:	c3                   	ret    
80101b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	57                   	push   %edi
80101b74:	56                   	push   %esi
80101b75:	53                   	push   %ebx
80101b76:	83 ec 1c             	sub    $0x1c,%esp
80101b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101b7c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b81:	0f 85 80 00 00 00    	jne    80101c07 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101b87:	8b 53 58             	mov    0x58(%ebx),%edx
80101b8a:	31 ff                	xor    %edi,%edi
80101b8c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b8f:	85 d2                	test   %edx,%edx
80101b91:	75 0d                	jne    80101ba0 <dirlookup+0x30>
80101b93:	eb 5b                	jmp    80101bf0 <dirlookup+0x80>
80101b95:	8d 76 00             	lea    0x0(%esi),%esi
80101b98:	83 c7 10             	add    $0x10,%edi
80101b9b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b9e:	76 50                	jbe    80101bf0 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ba0:	6a 10                	push   $0x10
80101ba2:	57                   	push   %edi
80101ba3:	56                   	push   %esi
80101ba4:	53                   	push   %ebx
80101ba5:	e8 76 fd ff ff       	call   80101920 <readi>
80101baa:	83 c4 10             	add    $0x10,%esp
80101bad:	83 f8 10             	cmp    $0x10,%eax
80101bb0:	75 48                	jne    80101bfa <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101bb2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bb7:	74 df                	je     80101b98 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bb9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bbc:	83 ec 04             	sub    $0x4,%esp
80101bbf:	6a 0e                	push   $0xe
80101bc1:	50                   	push   %eax
80101bc2:	ff 75 0c             	pushl  0xc(%ebp)
80101bc5:	e8 76 29 00 00       	call   80104540 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	85 c0                	test   %eax,%eax
80101bcf:	75 c7                	jne    80101b98 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101bd1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bd4:	85 c0                	test   %eax,%eax
80101bd6:	74 05                	je     80101bdd <dirlookup+0x6d>
        *poff = off;
80101bd8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bdb:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101bdd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101be1:	8b 03                	mov    (%ebx),%eax
80101be3:	e8 f8 f5 ff ff       	call   801011e0 <iget>
    }
  }

  return 0;
}
80101be8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101beb:	5b                   	pop    %ebx
80101bec:	5e                   	pop    %esi
80101bed:	5f                   	pop    %edi
80101bee:	5d                   	pop    %ebp
80101bef:	c3                   	ret    
80101bf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101bf3:	31 c0                	xor    %eax,%eax
}
80101bf5:	5b                   	pop    %ebx
80101bf6:	5e                   	pop    %esi
80101bf7:	5f                   	pop    %edi
80101bf8:	5d                   	pop    %ebp
80101bf9:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101bfa:	83 ec 0c             	sub    $0xc,%esp
80101bfd:	68 59 71 10 80       	push   $0x80107159
80101c02:	e8 69 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c07:	83 ec 0c             	sub    $0xc,%esp
80101c0a:	68 47 71 10 80       	push   $0x80107147
80101c0f:	e8 5c e7 ff ff       	call   80100370 <panic>
80101c14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c20 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c20:	55                   	push   %ebp
80101c21:	89 e5                	mov    %esp,%ebp
80101c23:	57                   	push   %edi
80101c24:	56                   	push   %esi
80101c25:	53                   	push   %ebx
80101c26:	89 cf                	mov    %ecx,%edi
80101c28:	89 c3                	mov    %eax,%ebx
80101c2a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c2d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c30:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c33:	0f 84 53 01 00 00    	je     80101d8c <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c39:	e8 12 1b 00 00       	call   80103750 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c3e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c41:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c44:	68 e0 09 11 80       	push   $0x801109e0
80101c49:	e8 52 26 00 00       	call   801042a0 <acquire>
  ip->ref++;
80101c4e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c52:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101c59:	e8 62 27 00 00       	call   801043c0 <release>
80101c5e:	83 c4 10             	add    $0x10,%esp
80101c61:	eb 08                	jmp    80101c6b <namex+0x4b>
80101c63:	90                   	nop
80101c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c68:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c6b:	0f b6 03             	movzbl (%ebx),%eax
80101c6e:	3c 2f                	cmp    $0x2f,%al
80101c70:	74 f6                	je     80101c68 <namex+0x48>
    path++;
  if(*path == 0)
80101c72:	84 c0                	test   %al,%al
80101c74:	0f 84 e3 00 00 00    	je     80101d5d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c7a:	0f b6 03             	movzbl (%ebx),%eax
80101c7d:	89 da                	mov    %ebx,%edx
80101c7f:	84 c0                	test   %al,%al
80101c81:	0f 84 ac 00 00 00    	je     80101d33 <namex+0x113>
80101c87:	3c 2f                	cmp    $0x2f,%al
80101c89:	75 09                	jne    80101c94 <namex+0x74>
80101c8b:	e9 a3 00 00 00       	jmp    80101d33 <namex+0x113>
80101c90:	84 c0                	test   %al,%al
80101c92:	74 0a                	je     80101c9e <namex+0x7e>
    path++;
80101c94:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c97:	0f b6 02             	movzbl (%edx),%eax
80101c9a:	3c 2f                	cmp    $0x2f,%al
80101c9c:	75 f2                	jne    80101c90 <namex+0x70>
80101c9e:	89 d1                	mov    %edx,%ecx
80101ca0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101ca2:	83 f9 0d             	cmp    $0xd,%ecx
80101ca5:	0f 8e 8d 00 00 00    	jle    80101d38 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cab:	83 ec 04             	sub    $0x4,%esp
80101cae:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cb1:	6a 0e                	push   $0xe
80101cb3:	53                   	push   %ebx
80101cb4:	57                   	push   %edi
80101cb5:	e8 06 28 00 00       	call   801044c0 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101cbd:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cc0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cc2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cc5:	75 11                	jne    80101cd8 <namex+0xb8>
80101cc7:	89 f6                	mov    %esi,%esi
80101cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101cd0:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cd3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cd6:	74 f8                	je     80101cd0 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101cd8:	83 ec 0c             	sub    $0xc,%esp
80101cdb:	56                   	push   %esi
80101cdc:	e8 5f f9 ff ff       	call   80101640 <ilock>
    if(ip->type != T_DIR){
80101ce1:	83 c4 10             	add    $0x10,%esp
80101ce4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101ce9:	0f 85 7f 00 00 00    	jne    80101d6e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101cef:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101cf2:	85 d2                	test   %edx,%edx
80101cf4:	74 09                	je     80101cff <namex+0xdf>
80101cf6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101cf9:	0f 84 a3 00 00 00    	je     80101da2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101cff:	83 ec 04             	sub    $0x4,%esp
80101d02:	6a 00                	push   $0x0
80101d04:	57                   	push   %edi
80101d05:	56                   	push   %esi
80101d06:	e8 65 fe ff ff       	call   80101b70 <dirlookup>
80101d0b:	83 c4 10             	add    $0x10,%esp
80101d0e:	85 c0                	test   %eax,%eax
80101d10:	74 5c                	je     80101d6e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d12:	83 ec 0c             	sub    $0xc,%esp
80101d15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d18:	56                   	push   %esi
80101d19:	e8 02 fa ff ff       	call   80101720 <iunlock>
  iput(ip);
80101d1e:	89 34 24             	mov    %esi,(%esp)
80101d21:	e8 4a fa ff ff       	call   80101770 <iput>
80101d26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d29:	83 c4 10             	add    $0x10,%esp
80101d2c:	89 c6                	mov    %eax,%esi
80101d2e:	e9 38 ff ff ff       	jmp    80101c6b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d33:	31 c9                	xor    %ecx,%ecx
80101d35:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d38:	83 ec 04             	sub    $0x4,%esp
80101d3b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d3e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d41:	51                   	push   %ecx
80101d42:	53                   	push   %ebx
80101d43:	57                   	push   %edi
80101d44:	e8 77 27 00 00       	call   801044c0 <memmove>
    name[len] = 0;
80101d49:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d4f:	83 c4 10             	add    $0x10,%esp
80101d52:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d56:	89 d3                	mov    %edx,%ebx
80101d58:	e9 65 ff ff ff       	jmp    80101cc2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d60:	85 c0                	test   %eax,%eax
80101d62:	75 54                	jne    80101db8 <namex+0x198>
80101d64:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101d66:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d69:	5b                   	pop    %ebx
80101d6a:	5e                   	pop    %esi
80101d6b:	5f                   	pop    %edi
80101d6c:	5d                   	pop    %ebp
80101d6d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d6e:	83 ec 0c             	sub    $0xc,%esp
80101d71:	56                   	push   %esi
80101d72:	e8 a9 f9 ff ff       	call   80101720 <iunlock>
  iput(ip);
80101d77:	89 34 24             	mov    %esi,(%esp)
80101d7a:	e8 f1 f9 ff ff       	call   80101770 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d7f:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101d82:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d85:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101d87:	5b                   	pop    %ebx
80101d88:	5e                   	pop    %esi
80101d89:	5f                   	pop    %edi
80101d8a:	5d                   	pop    %ebp
80101d8b:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101d8c:	ba 01 00 00 00       	mov    $0x1,%edx
80101d91:	b8 01 00 00 00       	mov    $0x1,%eax
80101d96:	e8 45 f4 ff ff       	call   801011e0 <iget>
80101d9b:	89 c6                	mov    %eax,%esi
80101d9d:	e9 c9 fe ff ff       	jmp    80101c6b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101da2:	83 ec 0c             	sub    $0xc,%esp
80101da5:	56                   	push   %esi
80101da6:	e8 75 f9 ff ff       	call   80101720 <iunlock>
      return ip;
80101dab:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dae:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101db1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db3:	5b                   	pop    %ebx
80101db4:	5e                   	pop    %esi
80101db5:	5f                   	pop    %edi
80101db6:	5d                   	pop    %ebp
80101db7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101db8:	83 ec 0c             	sub    $0xc,%esp
80101dbb:	56                   	push   %esi
80101dbc:	e8 af f9 ff ff       	call   80101770 <iput>
    return 0;
80101dc1:	83 c4 10             	add    $0x10,%esp
80101dc4:	31 c0                	xor    %eax,%eax
80101dc6:	eb 9e                	jmp    80101d66 <namex+0x146>
80101dc8:	90                   	nop
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101dd0 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101dd0:	55                   	push   %ebp
80101dd1:	89 e5                	mov    %esp,%ebp
80101dd3:	57                   	push   %edi
80101dd4:	56                   	push   %esi
80101dd5:	53                   	push   %ebx
80101dd6:	83 ec 20             	sub    $0x20,%esp
80101dd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101ddc:	6a 00                	push   $0x0
80101dde:	ff 75 0c             	pushl  0xc(%ebp)
80101de1:	53                   	push   %ebx
80101de2:	e8 89 fd ff ff       	call   80101b70 <dirlookup>
80101de7:	83 c4 10             	add    $0x10,%esp
80101dea:	85 c0                	test   %eax,%eax
80101dec:	75 67                	jne    80101e55 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101dee:	8b 7b 58             	mov    0x58(%ebx),%edi
80101df1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101df4:	85 ff                	test   %edi,%edi
80101df6:	74 29                	je     80101e21 <dirlink+0x51>
80101df8:	31 ff                	xor    %edi,%edi
80101dfa:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101dfd:	eb 09                	jmp    80101e08 <dirlink+0x38>
80101dff:	90                   	nop
80101e00:	83 c7 10             	add    $0x10,%edi
80101e03:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e06:	76 19                	jbe    80101e21 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e08:	6a 10                	push   $0x10
80101e0a:	57                   	push   %edi
80101e0b:	56                   	push   %esi
80101e0c:	53                   	push   %ebx
80101e0d:	e8 0e fb ff ff       	call   80101920 <readi>
80101e12:	83 c4 10             	add    $0x10,%esp
80101e15:	83 f8 10             	cmp    $0x10,%eax
80101e18:	75 4e                	jne    80101e68 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e1f:	75 df                	jne    80101e00 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e21:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e24:	83 ec 04             	sub    $0x4,%esp
80101e27:	6a 0e                	push   $0xe
80101e29:	ff 75 0c             	pushl  0xc(%ebp)
80101e2c:	50                   	push   %eax
80101e2d:	e8 7e 27 00 00       	call   801045b0 <strncpy>
  de.inum = inum;
80101e32:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e35:	6a 10                	push   $0x10
80101e37:	57                   	push   %edi
80101e38:	56                   	push   %esi
80101e39:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e3a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e3e:	e8 dd fb ff ff       	call   80101a20 <writei>
80101e43:	83 c4 20             	add    $0x20,%esp
80101e46:	83 f8 10             	cmp    $0x10,%eax
80101e49:	75 2a                	jne    80101e75 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e4b:	31 c0                	xor    %eax,%eax
}
80101e4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e50:	5b                   	pop    %ebx
80101e51:	5e                   	pop    %esi
80101e52:	5f                   	pop    %edi
80101e53:	5d                   	pop    %ebp
80101e54:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e55:	83 ec 0c             	sub    $0xc,%esp
80101e58:	50                   	push   %eax
80101e59:	e8 12 f9 ff ff       	call   80101770 <iput>
    return -1;
80101e5e:	83 c4 10             	add    $0x10,%esp
80101e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e66:	eb e5                	jmp    80101e4d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e68:	83 ec 0c             	sub    $0xc,%esp
80101e6b:	68 68 71 10 80       	push   $0x80107168
80101e70:	e8 fb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	68 86 77 10 80       	push   $0x80107786
80101e7d:	e8 ee e4 ff ff       	call   80100370 <panic>
80101e82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e90 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101e90:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e91:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101e93:	89 e5                	mov    %esp,%ebp
80101e95:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e98:	8b 45 08             	mov    0x8(%ebp),%eax
80101e9b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e9e:	e8 7d fd ff ff       	call   80101c20 <namex>
}
80101ea3:	c9                   	leave  
80101ea4:	c3                   	ret    
80101ea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101eb0:	55                   	push   %ebp
  return namex(path, 1, name);
80101eb1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101eb6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101eb8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101ebb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101ebe:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101ebf:	e9 5c fd ff ff       	jmp    80101c20 <namex>
80101ec4:	66 90                	xchg   %ax,%ax
80101ec6:	66 90                	xchg   %ax,%ax
80101ec8:	66 90                	xchg   %ax,%ax
80101eca:	66 90                	xchg   %ax,%ax
80101ecc:	66 90                	xchg   %ax,%ax
80101ece:	66 90                	xchg   %ax,%ax

80101ed0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ed0:	55                   	push   %ebp
  if(b == 0)
80101ed1:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ed3:	89 e5                	mov    %esp,%ebp
80101ed5:	56                   	push   %esi
80101ed6:	53                   	push   %ebx
  if(b == 0)
80101ed7:	0f 84 ad 00 00 00    	je     80101f8a <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101edd:	8b 58 08             	mov    0x8(%eax),%ebx
80101ee0:	89 c1                	mov    %eax,%ecx
80101ee2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ee8:	0f 87 8f 00 00 00    	ja     80101f7d <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101eee:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ef3:	90                   	nop
80101ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101ef9:	83 e0 c0             	and    $0xffffffc0,%eax
80101efc:	3c 40                	cmp    $0x40,%al
80101efe:	75 f8                	jne    80101ef8 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f00:	31 f6                	xor    %esi,%esi
80101f02:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f07:	89 f0                	mov    %esi,%eax
80101f09:	ee                   	out    %al,(%dx)
80101f0a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f0f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f14:	ee                   	out    %al,(%dx)
80101f15:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f1a:	89 d8                	mov    %ebx,%eax
80101f1c:	ee                   	out    %al,(%dx)
80101f1d:	89 d8                	mov    %ebx,%eax
80101f1f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f24:	c1 f8 08             	sar    $0x8,%eax
80101f27:	ee                   	out    %al,(%dx)
80101f28:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f2d:	89 f0                	mov    %esi,%eax
80101f2f:	ee                   	out    %al,(%dx)
80101f30:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f34:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f39:	83 e0 01             	and    $0x1,%eax
80101f3c:	c1 e0 04             	shl    $0x4,%eax
80101f3f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f42:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f43:	f6 01 04             	testb  $0x4,(%ecx)
80101f46:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f4b:	75 13                	jne    80101f60 <idestart+0x90>
80101f4d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f52:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f53:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f56:	5b                   	pop    %ebx
80101f57:	5e                   	pop    %esi
80101f58:	5d                   	pop    %ebp
80101f59:	c3                   	ret    
80101f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f60:	b8 30 00 00 00       	mov    $0x30,%eax
80101f65:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f66:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f6b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f6e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f73:	fc                   	cld    
80101f74:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f76:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f79:	5b                   	pop    %ebx
80101f7a:	5e                   	pop    %esi
80101f7b:	5d                   	pop    %ebp
80101f7c:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101f7d:	83 ec 0c             	sub    $0xc,%esp
80101f80:	68 d4 71 10 80       	push   $0x801071d4
80101f85:	e8 e6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101f8a:	83 ec 0c             	sub    $0xc,%esp
80101f8d:	68 cb 71 10 80       	push   $0x801071cb
80101f92:	e8 d9 e3 ff ff       	call   80100370 <panic>
80101f97:	89 f6                	mov    %esi,%esi
80101f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fa0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fa0:	55                   	push   %ebp
80101fa1:	89 e5                	mov    %esp,%ebp
80101fa3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fa6:	68 e6 71 10 80       	push   $0x801071e6
80101fab:	68 80 a5 10 80       	push   $0x8010a580
80101fb0:	e8 eb 21 00 00       	call   801041a0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fb5:	58                   	pop    %eax
80101fb6:	a1 00 2d 11 80       	mov    0x80112d00,%eax
80101fbb:	5a                   	pop    %edx
80101fbc:	83 e8 01             	sub    $0x1,%eax
80101fbf:	50                   	push   %eax
80101fc0:	6a 0e                	push   $0xe
80101fc2:	e8 a9 02 00 00       	call   80102270 <ioapicenable>
80101fc7:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fca:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fcf:	90                   	nop
80101fd0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fd1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fd4:	3c 40                	cmp    $0x40,%al
80101fd6:	75 f8                	jne    80101fd0 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fd8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fdd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101fe2:	ee                   	out    %al,(%dx)
80101fe3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fe8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fed:	eb 06                	jmp    80101ff5 <ideinit+0x55>
80101fef:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80101ff0:	83 e9 01             	sub    $0x1,%ecx
80101ff3:	74 0f                	je     80102004 <ideinit+0x64>
80101ff5:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80101ff6:	84 c0                	test   %al,%al
80101ff8:	74 f6                	je     80101ff0 <ideinit+0x50>
      havedisk1 = 1;
80101ffa:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102001:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102004:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102009:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010200e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010200f:	c9                   	leave  
80102010:	c3                   	ret    
80102011:	eb 0d                	jmp    80102020 <ideintr>
80102013:	90                   	nop
80102014:	90                   	nop
80102015:	90                   	nop
80102016:	90                   	nop
80102017:	90                   	nop
80102018:	90                   	nop
80102019:	90                   	nop
8010201a:	90                   	nop
8010201b:	90                   	nop
8010201c:	90                   	nop
8010201d:	90                   	nop
8010201e:	90                   	nop
8010201f:	90                   	nop

80102020 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102020:	55                   	push   %ebp
80102021:	89 e5                	mov    %esp,%ebp
80102023:	57                   	push   %edi
80102024:	56                   	push   %esi
80102025:	53                   	push   %ebx
80102026:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102029:	68 80 a5 10 80       	push   $0x8010a580
8010202e:	e8 6d 22 00 00       	call   801042a0 <acquire>

  if((b = idequeue) == 0){
80102033:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102039:	83 c4 10             	add    $0x10,%esp
8010203c:	85 db                	test   %ebx,%ebx
8010203e:	74 34                	je     80102074 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102040:	8b 43 58             	mov    0x58(%ebx),%eax
80102043:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102048:	8b 33                	mov    (%ebx),%esi
8010204a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102050:	74 3e                	je     80102090 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102052:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102055:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102058:	83 ce 02             	or     $0x2,%esi
8010205b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010205d:	53                   	push   %ebx
8010205e:	e8 7d 1e 00 00       	call   80103ee0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102063:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102068:	83 c4 10             	add    $0x10,%esp
8010206b:	85 c0                	test   %eax,%eax
8010206d:	74 05                	je     80102074 <ideintr+0x54>
    idestart(idequeue);
8010206f:	e8 5c fe ff ff       	call   80101ed0 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
80102074:	83 ec 0c             	sub    $0xc,%esp
80102077:	68 80 a5 10 80       	push   $0x8010a580
8010207c:	e8 3f 23 00 00       	call   801043c0 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
80102081:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102084:	5b                   	pop    %ebx
80102085:	5e                   	pop    %esi
80102086:	5f                   	pop    %edi
80102087:	5d                   	pop    %ebp
80102088:	c3                   	ret    
80102089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102090:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102095:	8d 76 00             	lea    0x0(%esi),%esi
80102098:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102099:	89 c1                	mov    %eax,%ecx
8010209b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010209e:	80 f9 40             	cmp    $0x40,%cl
801020a1:	75 f5                	jne    80102098 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020a3:	a8 21                	test   $0x21,%al
801020a5:	75 ab                	jne    80102052 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020a7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020aa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020af:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020b4:	fc                   	cld    
801020b5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020b7:	8b 33                	mov    (%ebx),%esi
801020b9:	eb 97                	jmp    80102052 <ideintr+0x32>
801020bb:	90                   	nop
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	53                   	push   %ebx
801020c4:	83 ec 10             	sub    $0x10,%esp
801020c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020ca:	8d 43 0c             	lea    0xc(%ebx),%eax
801020cd:	50                   	push   %eax
801020ce:	e8 9d 20 00 00       	call   80104170 <holdingsleep>
801020d3:	83 c4 10             	add    $0x10,%esp
801020d6:	85 c0                	test   %eax,%eax
801020d8:	0f 84 ad 00 00 00    	je     8010218b <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801020de:	8b 03                	mov    (%ebx),%eax
801020e0:	83 e0 06             	and    $0x6,%eax
801020e3:	83 f8 02             	cmp    $0x2,%eax
801020e6:	0f 84 b9 00 00 00    	je     801021a5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801020ec:	8b 53 04             	mov    0x4(%ebx),%edx
801020ef:	85 d2                	test   %edx,%edx
801020f1:	74 0d                	je     80102100 <iderw+0x40>
801020f3:	a1 60 a5 10 80       	mov    0x8010a560,%eax
801020f8:	85 c0                	test   %eax,%eax
801020fa:	0f 84 98 00 00 00    	je     80102198 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102100:	83 ec 0c             	sub    $0xc,%esp
80102103:	68 80 a5 10 80       	push   $0x8010a580
80102108:	e8 93 21 00 00       	call   801042a0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010210d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102113:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102116:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010211d:	85 d2                	test   %edx,%edx
8010211f:	75 09                	jne    8010212a <iderw+0x6a>
80102121:	eb 58                	jmp    8010217b <iderw+0xbb>
80102123:	90                   	nop
80102124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102128:	89 c2                	mov    %eax,%edx
8010212a:	8b 42 58             	mov    0x58(%edx),%eax
8010212d:	85 c0                	test   %eax,%eax
8010212f:	75 f7                	jne    80102128 <iderw+0x68>
80102131:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102134:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102136:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010213c:	74 44                	je     80102182 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010213e:	8b 03                	mov    (%ebx),%eax
80102140:	83 e0 06             	and    $0x6,%eax
80102143:	83 f8 02             	cmp    $0x2,%eax
80102146:	74 23                	je     8010216b <iderw+0xab>
80102148:	90                   	nop
80102149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102150:	83 ec 08             	sub    $0x8,%esp
80102153:	68 80 a5 10 80       	push   $0x8010a580
80102158:	53                   	push   %ebx
80102159:	e8 d2 1b 00 00       	call   80103d30 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 c4 10             	add    $0x10,%esp
80102163:	83 e0 06             	and    $0x6,%eax
80102166:	83 f8 02             	cmp    $0x2,%eax
80102169:	75 e5                	jne    80102150 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
8010216b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
80102172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102175:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
80102176:	e9 45 22 00 00       	jmp    801043c0 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010217b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102180:	eb b2                	jmp    80102134 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
80102182:	89 d8                	mov    %ebx,%eax
80102184:	e8 47 fd ff ff       	call   80101ed0 <idestart>
80102189:	eb b3                	jmp    8010213e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
8010218b:	83 ec 0c             	sub    $0xc,%esp
8010218e:	68 ea 71 10 80       	push   $0x801071ea
80102193:	e8 d8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 15 72 10 80       	push   $0x80107215
801021a0:	e8 cb e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 00 72 10 80       	push   $0x80107200
801021ad:	e8 be e1 ff ff       	call   80100370 <panic>
801021b2:	66 90                	xchg   %ax,%ax
801021b4:	66 90                	xchg   %ax,%ax
801021b6:	66 90                	xchg   %ax,%ax
801021b8:	66 90                	xchg   %ax,%ax
801021ba:	66 90                	xchg   %ax,%ax
801021bc:	66 90                	xchg   %ax,%ax
801021be:	66 90                	xchg   %ax,%ax

801021c0 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021c0:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
801021c1:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
801021c8:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021cb:	89 e5                	mov    %esp,%ebp
801021cd:	56                   	push   %esi
801021ce:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801021cf:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021d6:	00 00 00 
  return ioapic->data;
801021d9:	8b 15 34 26 11 80    	mov    0x80112634,%edx
801021df:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801021e2:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
801021e8:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801021ee:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801021f5:	89 f0                	mov    %esi,%eax
801021f7:	c1 e8 10             	shr    $0x10,%eax
801021fa:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
801021fd:	8b 41 10             	mov    0x10(%ecx),%eax
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
80102200:	c1 e8 18             	shr    $0x18,%eax
80102203:	39 d0                	cmp    %edx,%eax
80102205:	74 16                	je     8010221d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102207:	83 ec 0c             	sub    $0xc,%esp
8010220a:	68 34 72 10 80       	push   $0x80107234
8010220f:	e8 4c e4 ff ff       	call   80100660 <cprintf>
80102214:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010221a:	83 c4 10             	add    $0x10,%esp
8010221d:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102220:	ba 10 00 00 00       	mov    $0x10,%edx
80102225:	b8 20 00 00 00       	mov    $0x20,%eax
8010222a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102230:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102232:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102238:	89 c3                	mov    %eax,%ebx
8010223a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102240:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102243:	89 59 10             	mov    %ebx,0x10(%ecx)
80102246:	8d 5a 01             	lea    0x1(%edx),%ebx
80102249:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010224c:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010224e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102250:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102256:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010225d:	75 d1                	jne    80102230 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010225f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102262:	5b                   	pop    %ebx
80102263:	5e                   	pop    %esi
80102264:	5d                   	pop    %ebp
80102265:	c3                   	ret    
80102266:	8d 76 00             	lea    0x0(%esi),%esi
80102269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102270 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102270:	55                   	push   %ebp
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102271:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  }
}

void
ioapicenable(int irq, int cpunum)
{
80102277:	89 e5                	mov    %esp,%ebp
80102279:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010227c:	8d 50 20             	lea    0x20(%eax),%edx
8010227f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102283:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102285:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010228b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010228e:	89 51 10             	mov    %edx,0x10(%ecx)
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102291:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102294:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102296:	a1 34 26 11 80       	mov    0x80112634,%eax
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010229b:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
8010229e:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022a1:	5d                   	pop    %ebp
801022a2:	c3                   	ret    
801022a3:	66 90                	xchg   %ax,%ax
801022a5:	66 90                	xchg   %ax,%ax
801022a7:	66 90                	xchg   %ax,%ax
801022a9:	66 90                	xchg   %ax,%ax
801022ab:	66 90                	xchg   %ax,%ax
801022ad:	66 90                	xchg   %ax,%ax
801022af:	90                   	nop

801022b0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022b0:	55                   	push   %ebp
801022b1:	89 e5                	mov    %esp,%ebp
801022b3:	53                   	push   %ebx
801022b4:	83 ec 04             	sub    $0x4,%esp
801022b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022ba:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022c0:	75 70                	jne    80102332 <kfree+0x82>
801022c2:	81 fb f4 58 11 80    	cmp    $0x801158f4,%ebx
801022c8:	72 68                	jb     80102332 <kfree+0x82>
801022ca:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022d0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022d5:	77 5b                	ja     80102332 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801022d7:	83 ec 04             	sub    $0x4,%esp
801022da:	68 00 10 00 00       	push   $0x1000
801022df:	6a 01                	push   $0x1
801022e1:	53                   	push   %ebx
801022e2:	e8 29 21 00 00       	call   80104410 <memset>

  if(kmem.use_lock)
801022e7:	8b 15 74 26 11 80    	mov    0x80112674,%edx
801022ed:	83 c4 10             	add    $0x10,%esp
801022f0:	85 d2                	test   %edx,%edx
801022f2:	75 2c                	jne    80102320 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
801022f4:	a1 78 26 11 80       	mov    0x80112678,%eax
801022f9:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
801022fb:	a1 74 26 11 80       	mov    0x80112674,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102300:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
  if(kmem.use_lock)
80102306:	85 c0                	test   %eax,%eax
80102308:	75 06                	jne    80102310 <kfree+0x60>
    release(&kmem.lock);
}
8010230a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010230d:	c9                   	leave  
8010230e:	c3                   	ret    
8010230f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102310:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
}
80102317:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010231a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010231b:	e9 a0 20 00 00       	jmp    801043c0 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102320:	83 ec 0c             	sub    $0xc,%esp
80102323:	68 40 26 11 80       	push   $0x80112640
80102328:	e8 73 1f 00 00       	call   801042a0 <acquire>
8010232d:	83 c4 10             	add    $0x10,%esp
80102330:	eb c2                	jmp    801022f4 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102332:	83 ec 0c             	sub    $0xc,%esp
80102335:	68 66 72 10 80       	push   $0x80107266
8010233a:	e8 31 e0 ff ff       	call   80100370 <panic>
8010233f:	90                   	nop

80102340 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102340:	55                   	push   %ebp
80102341:	89 e5                	mov    %esp,%ebp
80102343:	56                   	push   %esi
80102344:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102345:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102348:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010234b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102351:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102357:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010235d:	39 de                	cmp    %ebx,%esi
8010235f:	72 23                	jb     80102384 <freerange+0x44>
80102361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102368:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010236e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102371:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102377:	50                   	push   %eax
80102378:	e8 33 ff ff ff       	call   801022b0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010237d:	83 c4 10             	add    $0x10,%esp
80102380:	39 f3                	cmp    %esi,%ebx
80102382:	76 e4                	jbe    80102368 <freerange+0x28>
    kfree(p);
}
80102384:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102387:	5b                   	pop    %ebx
80102388:	5e                   	pop    %esi
80102389:	5d                   	pop    %ebp
8010238a:	c3                   	ret    
8010238b:	90                   	nop
8010238c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102390 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
80102390:	55                   	push   %ebp
80102391:	89 e5                	mov    %esp,%ebp
80102393:	56                   	push   %esi
80102394:	53                   	push   %ebx
80102395:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102398:	83 ec 08             	sub    $0x8,%esp
8010239b:	68 6c 72 10 80       	push   $0x8010726c
801023a0:	68 40 26 11 80       	push   $0x80112640
801023a5:	e8 f6 1d 00 00       	call   801041a0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023aa:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023ad:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801023b0:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
801023b7:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ba:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023c6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cc:	39 de                	cmp    %ebx,%esi
801023ce:	72 1c                	jb     801023ec <kinit1+0x5c>
    kfree(p);
801023d0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023d6:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023d9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023df:	50                   	push   %eax
801023e0:	e8 cb fe ff ff       	call   801022b0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023e5:	83 c4 10             	add    $0x10,%esp
801023e8:	39 de                	cmp    %ebx,%esi
801023ea:	73 e4                	jae    801023d0 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
801023ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023ef:	5b                   	pop    %ebx
801023f0:	5e                   	pop    %esi
801023f1:	5d                   	pop    %ebp
801023f2:	c3                   	ret    
801023f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801023f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102400 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102405:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102408:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010240b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102411:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102417:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010241d:	39 de                	cmp    %ebx,%esi
8010241f:	72 23                	jb     80102444 <kinit2+0x44>
80102421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102428:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010242e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102431:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102437:	50                   	push   %eax
80102438:	e8 73 fe ff ff       	call   801022b0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010243d:	83 c4 10             	add    $0x10,%esp
80102440:	39 de                	cmp    %ebx,%esi
80102442:	73 e4                	jae    80102428 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
80102444:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010244b:	00 00 00 
}
8010244e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102451:	5b                   	pop    %ebx
80102452:	5e                   	pop    %esi
80102453:	5d                   	pop    %ebp
80102454:	c3                   	ret    
80102455:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102460 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102460:	55                   	push   %ebp
80102461:	89 e5                	mov    %esp,%ebp
80102463:	53                   	push   %ebx
80102464:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102467:	a1 74 26 11 80       	mov    0x80112674,%eax
8010246c:	85 c0                	test   %eax,%eax
8010246e:	75 30                	jne    801024a0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102470:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
80102476:	85 db                	test   %ebx,%ebx
80102478:	74 1c                	je     80102496 <kalloc+0x36>
    kmem.freelist = r->next;
8010247a:	8b 13                	mov    (%ebx),%edx
8010247c:	89 15 78 26 11 80    	mov    %edx,0x80112678
  if(kmem.use_lock)
80102482:	85 c0                	test   %eax,%eax
80102484:	74 10                	je     80102496 <kalloc+0x36>
    release(&kmem.lock);
80102486:	83 ec 0c             	sub    $0xc,%esp
80102489:	68 40 26 11 80       	push   $0x80112640
8010248e:	e8 2d 1f 00 00       	call   801043c0 <release>
80102493:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
80102496:	89 d8                	mov    %ebx,%eax
80102498:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010249b:	c9                   	leave  
8010249c:	c3                   	ret    
8010249d:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024a0:	83 ec 0c             	sub    $0xc,%esp
801024a3:	68 40 26 11 80       	push   $0x80112640
801024a8:	e8 f3 1d 00 00       	call   801042a0 <acquire>
  r = kmem.freelist;
801024ad:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
801024b3:	83 c4 10             	add    $0x10,%esp
801024b6:	a1 74 26 11 80       	mov    0x80112674,%eax
801024bb:	85 db                	test   %ebx,%ebx
801024bd:	75 bb                	jne    8010247a <kalloc+0x1a>
801024bf:	eb c1                	jmp    80102482 <kalloc+0x22>
801024c1:	66 90                	xchg   %ax,%ax
801024c3:	66 90                	xchg   %ax,%ax
801024c5:	66 90                	xchg   %ax,%ax
801024c7:	66 90                	xchg   %ax,%ax
801024c9:	66 90                	xchg   %ax,%ax
801024cb:	66 90                	xchg   %ax,%ax
801024cd:	66 90                	xchg   %ax,%ax
801024cf:	90                   	nop

801024d0 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
801024d0:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801024d1:	ba 64 00 00 00       	mov    $0x64,%edx
801024d6:	89 e5                	mov    %esp,%ebp
801024d8:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801024d9:	a8 01                	test   $0x1,%al
801024db:	0f 84 af 00 00 00    	je     80102590 <kbdgetc+0xc0>
801024e1:	ba 60 00 00 00       	mov    $0x60,%edx
801024e6:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
801024e7:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
801024ea:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801024f0:	74 7e                	je     80102570 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801024f2:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801024f4:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801024fa:	79 24                	jns    80102520 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801024fc:	f6 c1 40             	test   $0x40,%cl
801024ff:	75 05                	jne    80102506 <kbdgetc+0x36>
80102501:	89 c2                	mov    %eax,%edx
80102503:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
80102506:	0f b6 82 a0 73 10 80 	movzbl -0x7fef8c60(%edx),%eax
8010250d:	83 c8 40             	or     $0x40,%eax
80102510:	0f b6 c0             	movzbl %al,%eax
80102513:	f7 d0                	not    %eax
80102515:	21 c8                	and    %ecx,%eax
80102517:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010251c:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010251e:	5d                   	pop    %ebp
8010251f:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102520:	f6 c1 40             	test   $0x40,%cl
80102523:	74 09                	je     8010252e <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102525:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102528:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010252b:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010252e:	0f b6 82 a0 73 10 80 	movzbl -0x7fef8c60(%edx),%eax
80102535:	09 c1                	or     %eax,%ecx
80102537:	0f b6 82 a0 72 10 80 	movzbl -0x7fef8d60(%edx),%eax
8010253e:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102540:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102542:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
80102548:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010254b:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010254e:	8b 04 85 80 72 10 80 	mov    -0x7fef8d80(,%eax,4),%eax
80102555:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
80102559:	74 c3                	je     8010251e <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
8010255b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010255e:	83 fa 19             	cmp    $0x19,%edx
80102561:	77 1d                	ja     80102580 <kbdgetc+0xb0>
      c += 'A' - 'a';
80102563:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102566:	5d                   	pop    %ebp
80102567:	c3                   	ret    
80102568:	90                   	nop
80102569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
80102570:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
80102572:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102579:	5d                   	pop    %ebp
8010257a:	c3                   	ret    
8010257b:	90                   	nop
8010257c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
80102580:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
80102583:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
80102586:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
80102587:	83 f9 19             	cmp    $0x19,%ecx
8010258a:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
8010258d:	c3                   	ret    
8010258e:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
80102590:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102595:	5d                   	pop    %ebp
80102596:	c3                   	ret    
80102597:	89 f6                	mov    %esi,%esi
80102599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025a0 <kbdintr>:

void
kbdintr(void)
{
801025a0:	55                   	push   %ebp
801025a1:	89 e5                	mov    %esp,%ebp
801025a3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801025a6:	68 d0 24 10 80       	push   $0x801024d0
801025ab:	e8 40 e2 ff ff       	call   801007f0 <consoleintr>
}
801025b0:	83 c4 10             	add    $0x10,%esp
801025b3:	c9                   	leave  
801025b4:	c3                   	ret    
801025b5:	66 90                	xchg   %ax,%ax
801025b7:	66 90                	xchg   %ax,%ax
801025b9:	66 90                	xchg   %ax,%ax
801025bb:	66 90                	xchg   %ax,%ax
801025bd:	66 90                	xchg   %ax,%ax
801025bf:	90                   	nop

801025c0 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
801025c0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(void)
{
801025c5:	55                   	push   %ebp
801025c6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801025c8:	85 c0                	test   %eax,%eax
801025ca:	0f 84 c8 00 00 00    	je     80102698 <lapicinit+0xd8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801025d0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025d7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801025da:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801025dd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801025e4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801025e7:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801025ea:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801025f1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801025f4:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801025f7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801025fe:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102601:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102604:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010260b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010260e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102611:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102618:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010261b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010261e:	8b 50 30             	mov    0x30(%eax),%edx
80102621:	c1 ea 10             	shr    $0x10,%edx
80102624:	80 fa 03             	cmp    $0x3,%dl
80102627:	77 77                	ja     801026a0 <lapicinit+0xe0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102629:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102630:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102633:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102636:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010263d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102640:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102643:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010264a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010264d:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102650:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102657:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010265a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010265d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102664:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102667:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010266a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102671:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102674:	8b 50 20             	mov    0x20(%eax),%edx
80102677:	89 f6                	mov    %esi,%esi
80102679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102680:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102686:	80 e6 10             	and    $0x10,%dh
80102689:	75 f5                	jne    80102680 <lapicinit+0xc0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010268b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102692:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102695:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102698:	5d                   	pop    %ebp
80102699:	c3                   	ret    
8010269a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026a0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026a7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026aa:	8b 50 20             	mov    0x20(%eax),%edx
801026ad:	e9 77 ff ff ff       	jmp    80102629 <lapicinit+0x69>
801026b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026c0 <lapicid>:
}

int
lapicid(void)
{
  if (!lapic)
801026c0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapicw(TPR, 0);
}

int
lapicid(void)
{
801026c5:	55                   	push   %ebp
801026c6:	89 e5                	mov    %esp,%ebp
  if (!lapic)
801026c8:	85 c0                	test   %eax,%eax
801026ca:	74 0c                	je     801026d8 <lapicid+0x18>
    return 0;
  return lapic[ID] >> 24;
801026cc:	8b 40 20             	mov    0x20(%eax),%eax
}
801026cf:	5d                   	pop    %ebp
int
lapicid(void)
{
  if (!lapic)
    return 0;
  return lapic[ID] >> 24;
801026d0:	c1 e8 18             	shr    $0x18,%eax
}
801026d3:	c3                   	ret    
801026d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

int
lapicid(void)
{
  if (!lapic)
    return 0;
801026d8:	31 c0                	xor    %eax,%eax
  return lapic[ID] >> 24;
}
801026da:	5d                   	pop    %ebp
801026db:	c3                   	ret    
801026dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801026e0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801026e0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
801026e5:	55                   	push   %ebp
801026e6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801026e8:	85 c0                	test   %eax,%eax
801026ea:	74 0d                	je     801026f9 <lapiceoi+0x19>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ec:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026f3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f6:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
801026f9:	5d                   	pop    %ebp
801026fa:	c3                   	ret    
801026fb:	90                   	nop
801026fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102700 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102700:	55                   	push   %ebp
80102701:	89 e5                	mov    %esp,%ebp
}
80102703:	5d                   	pop    %ebp
80102704:	c3                   	ret    
80102705:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102710 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102710:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102711:	ba 70 00 00 00       	mov    $0x70,%edx
80102716:	b8 0f 00 00 00       	mov    $0xf,%eax
8010271b:	89 e5                	mov    %esp,%ebp
8010271d:	53                   	push   %ebx
8010271e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102721:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102724:	ee                   	out    %al,(%dx)
80102725:	ba 71 00 00 00       	mov    $0x71,%edx
8010272a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010272f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102730:	31 c0                	xor    %eax,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102732:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102735:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010273b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010273d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102740:	c1 e8 04             	shr    $0x4,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102743:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102745:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102748:	66 a3 69 04 00 80    	mov    %ax,0x80000469

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010274e:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102753:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102759:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010275c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102763:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102766:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102769:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102770:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102773:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102776:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010277c:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010277f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102785:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102788:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010278e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102791:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102797:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
8010279a:	5b                   	pop    %ebx
8010279b:	5d                   	pop    %ebp
8010279c:	c3                   	ret    
8010279d:	8d 76 00             	lea    0x0(%esi),%esi

801027a0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801027a0:	55                   	push   %ebp
801027a1:	ba 70 00 00 00       	mov    $0x70,%edx
801027a6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027ab:	89 e5                	mov    %esp,%ebp
801027ad:	57                   	push   %edi
801027ae:	56                   	push   %esi
801027af:	53                   	push   %ebx
801027b0:	83 ec 4c             	sub    $0x4c,%esp
801027b3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027b4:	ba 71 00 00 00       	mov    $0x71,%edx
801027b9:	ec                   	in     (%dx),%al
801027ba:	83 e0 04             	and    $0x4,%eax
801027bd:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027c0:	31 db                	xor    %ebx,%ebx
801027c2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027c5:	bf 70 00 00 00       	mov    $0x70,%edi
801027ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801027d0:	89 d8                	mov    %ebx,%eax
801027d2:	89 fa                	mov    %edi,%edx
801027d4:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027d5:	b9 71 00 00 00       	mov    $0x71,%ecx
801027da:	89 ca                	mov    %ecx,%edx
801027dc:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
801027dd:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027e0:	89 fa                	mov    %edi,%edx
801027e2:	89 45 b8             	mov    %eax,-0x48(%ebp)
801027e5:	b8 02 00 00 00       	mov    $0x2,%eax
801027ea:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027eb:	89 ca                	mov    %ecx,%edx
801027ed:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801027ee:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027f1:	89 fa                	mov    %edi,%edx
801027f3:	89 45 bc             	mov    %eax,-0x44(%ebp)
801027f6:	b8 04 00 00 00       	mov    $0x4,%eax
801027fb:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027fc:	89 ca                	mov    %ecx,%edx
801027fe:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801027ff:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102802:	89 fa                	mov    %edi,%edx
80102804:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102807:	b8 07 00 00 00       	mov    $0x7,%eax
8010280c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010280d:	89 ca                	mov    %ecx,%edx
8010280f:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102810:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102813:	89 fa                	mov    %edi,%edx
80102815:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102818:	b8 08 00 00 00       	mov    $0x8,%eax
8010281d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010281e:	89 ca                	mov    %ecx,%edx
80102820:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102821:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102824:	89 fa                	mov    %edi,%edx
80102826:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102829:	b8 09 00 00 00       	mov    $0x9,%eax
8010282e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010282f:	89 ca                	mov    %ecx,%edx
80102831:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102832:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102835:	89 fa                	mov    %edi,%edx
80102837:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010283a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010283f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102840:	89 ca                	mov    %ecx,%edx
80102842:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102843:	84 c0                	test   %al,%al
80102845:	78 89                	js     801027d0 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102847:	89 d8                	mov    %ebx,%eax
80102849:	89 fa                	mov    %edi,%edx
8010284b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010284c:	89 ca                	mov    %ecx,%edx
8010284e:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010284f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102852:	89 fa                	mov    %edi,%edx
80102854:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102857:	b8 02 00 00 00       	mov    $0x2,%eax
8010285c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010285d:	89 ca                	mov    %ecx,%edx
8010285f:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102860:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102863:	89 fa                	mov    %edi,%edx
80102865:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102868:	b8 04 00 00 00       	mov    $0x4,%eax
8010286d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010286e:	89 ca                	mov    %ecx,%edx
80102870:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
80102871:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102874:	89 fa                	mov    %edi,%edx
80102876:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102879:	b8 07 00 00 00       	mov    $0x7,%eax
8010287e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287f:	89 ca                	mov    %ecx,%edx
80102881:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102882:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102885:	89 fa                	mov    %edi,%edx
80102887:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010288a:	b8 08 00 00 00       	mov    $0x8,%eax
8010288f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102890:	89 ca                	mov    %ecx,%edx
80102892:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102893:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102896:	89 fa                	mov    %edi,%edx
80102898:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010289b:	b8 09 00 00 00       	mov    $0x9,%eax
801028a0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028a1:	89 ca                	mov    %ecx,%edx
801028a3:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
801028a4:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028a7:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
801028aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028ad:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028b0:	6a 18                	push   $0x18
801028b2:	56                   	push   %esi
801028b3:	50                   	push   %eax
801028b4:	e8 a7 1b 00 00       	call   80104460 <memcmp>
801028b9:	83 c4 10             	add    $0x10,%esp
801028bc:	85 c0                	test   %eax,%eax
801028be:	0f 85 0c ff ff ff    	jne    801027d0 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
801028c4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028c8:	75 78                	jne    80102942 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801028ca:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028cd:	89 c2                	mov    %eax,%edx
801028cf:	83 e0 0f             	and    $0xf,%eax
801028d2:	c1 ea 04             	shr    $0x4,%edx
801028d5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028d8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028db:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801028de:	8b 45 bc             	mov    -0x44(%ebp),%eax
801028e1:	89 c2                	mov    %eax,%edx
801028e3:	83 e0 0f             	and    $0xf,%eax
801028e6:	c1 ea 04             	shr    $0x4,%edx
801028e9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028ec:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028ef:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801028f2:	8b 45 c0             	mov    -0x40(%ebp),%eax
801028f5:	89 c2                	mov    %eax,%edx
801028f7:	83 e0 0f             	and    $0xf,%eax
801028fa:	c1 ea 04             	shr    $0x4,%edx
801028fd:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102900:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102903:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102906:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102909:	89 c2                	mov    %eax,%edx
8010290b:	83 e0 0f             	and    $0xf,%eax
8010290e:	c1 ea 04             	shr    $0x4,%edx
80102911:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102914:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102917:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010291a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010291d:	89 c2                	mov    %eax,%edx
8010291f:	83 e0 0f             	and    $0xf,%eax
80102922:	c1 ea 04             	shr    $0x4,%edx
80102925:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102928:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010292b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010292e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102931:	89 c2                	mov    %eax,%edx
80102933:	83 e0 0f             	and    $0xf,%eax
80102936:	c1 ea 04             	shr    $0x4,%edx
80102939:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010293c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010293f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102942:	8b 75 08             	mov    0x8(%ebp),%esi
80102945:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102948:	89 06                	mov    %eax,(%esi)
8010294a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010294d:	89 46 04             	mov    %eax,0x4(%esi)
80102950:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102953:	89 46 08             	mov    %eax,0x8(%esi)
80102956:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102959:	89 46 0c             	mov    %eax,0xc(%esi)
8010295c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010295f:	89 46 10             	mov    %eax,0x10(%esi)
80102962:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102965:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102968:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
8010296f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102972:	5b                   	pop    %ebx
80102973:	5e                   	pop    %esi
80102974:	5f                   	pop    %edi
80102975:	5d                   	pop    %ebp
80102976:	c3                   	ret    
80102977:	66 90                	xchg   %ax,%ax
80102979:	66 90                	xchg   %ax,%ax
8010297b:	66 90                	xchg   %ax,%ax
8010297d:	66 90                	xchg   %ax,%ax
8010297f:	90                   	nop

80102980 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102980:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102986:	85 c9                	test   %ecx,%ecx
80102988:	0f 8e 85 00 00 00    	jle    80102a13 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
8010298e:	55                   	push   %ebp
8010298f:	89 e5                	mov    %esp,%ebp
80102991:	57                   	push   %edi
80102992:	56                   	push   %esi
80102993:	53                   	push   %ebx
80102994:	31 db                	xor    %ebx,%ebx
80102996:	83 ec 0c             	sub    $0xc,%esp
80102999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029a0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029a5:	83 ec 08             	sub    $0x8,%esp
801029a8:	01 d8                	add    %ebx,%eax
801029aa:	83 c0 01             	add    $0x1,%eax
801029ad:	50                   	push   %eax
801029ae:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029b4:	e8 17 d7 ff ff       	call   801000d0 <bread>
801029b9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029bb:	58                   	pop    %eax
801029bc:	5a                   	pop    %edx
801029bd:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
801029c4:	ff 35 c4 26 11 80    	pushl  0x801126c4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029ca:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029cd:	e8 fe d6 ff ff       	call   801000d0 <bread>
801029d2:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801029d4:	8d 47 5c             	lea    0x5c(%edi),%eax
801029d7:	83 c4 0c             	add    $0xc,%esp
801029da:	68 00 02 00 00       	push   $0x200
801029df:	50                   	push   %eax
801029e0:	8d 46 5c             	lea    0x5c(%esi),%eax
801029e3:	50                   	push   %eax
801029e4:	e8 d7 1a 00 00       	call   801044c0 <memmove>
    bwrite(dbuf);  // write dst to disk
801029e9:	89 34 24             	mov    %esi,(%esp)
801029ec:	e8 af d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
801029f1:	89 3c 24             	mov    %edi,(%esp)
801029f4:	e8 e7 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
801029f9:	89 34 24             	mov    %esi,(%esp)
801029fc:	e8 df d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a01:	83 c4 10             	add    $0x10,%esp
80102a04:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a0a:	7f 94                	jg     801029a0 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a0f:	5b                   	pop    %ebx
80102a10:	5e                   	pop    %esi
80102a11:	5f                   	pop    %edi
80102a12:	5d                   	pop    %ebp
80102a13:	f3 c3                	repz ret 
80102a15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a20 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a20:	55                   	push   %ebp
80102a21:	89 e5                	mov    %esp,%ebp
80102a23:	53                   	push   %ebx
80102a24:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a27:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102a2d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a33:	e8 98 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a38:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102a3e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102a41:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a43:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a45:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102a48:	7e 1f                	jle    80102a69 <write_head+0x49>
80102a4a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a51:	31 d2                	xor    %edx,%edx
80102a53:	90                   	nop
80102a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102a58:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102a5e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a62:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a65:	39 c2                	cmp    %eax,%edx
80102a67:	75 ef                	jne    80102a58 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102a69:	83 ec 0c             	sub    $0xc,%esp
80102a6c:	53                   	push   %ebx
80102a6d:	e8 2e d7 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102a72:	89 1c 24             	mov    %ebx,(%esp)
80102a75:	e8 66 d7 ff ff       	call   801001e0 <brelse>
}
80102a7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a7d:	c9                   	leave  
80102a7e:	c3                   	ret    
80102a7f:	90                   	nop

80102a80 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102a80:	55                   	push   %ebp
80102a81:	89 e5                	mov    %esp,%ebp
80102a83:	53                   	push   %ebx
80102a84:	83 ec 2c             	sub    $0x2c,%esp
80102a87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102a8a:	68 a0 74 10 80       	push   $0x801074a0
80102a8f:	68 80 26 11 80       	push   $0x80112680
80102a94:	e8 07 17 00 00       	call   801041a0 <initlock>
  readsb(dev, &sb);
80102a99:	58                   	pop    %eax
80102a9a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102a9d:	5a                   	pop    %edx
80102a9e:	50                   	push   %eax
80102a9f:	53                   	push   %ebx
80102aa0:	e8 db e8 ff ff       	call   80101380 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102aa5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102aa8:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102aab:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102aac:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ab2:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ab8:	a3 b4 26 11 80       	mov    %eax,0x801126b4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102abd:	5a                   	pop    %edx
80102abe:	50                   	push   %eax
80102abf:	53                   	push   %ebx
80102ac0:	e8 0b d6 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102ac5:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102ac8:	83 c4 10             	add    $0x10,%esp
80102acb:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102acd:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
  for (i = 0; i < log.lh.n; i++) {
80102ad3:	7e 1c                	jle    80102af1 <initlog+0x71>
80102ad5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102adc:	31 d2                	xor    %edx,%edx
80102ade:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102ae0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102ae4:	83 c2 04             	add    $0x4,%edx
80102ae7:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102aed:	39 da                	cmp    %ebx,%edx
80102aef:	75 ef                	jne    80102ae0 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102af1:	83 ec 0c             	sub    $0xc,%esp
80102af4:	50                   	push   %eax
80102af5:	e8 e6 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102afa:	e8 81 fe ff ff       	call   80102980 <install_trans>
  log.lh.n = 0;
80102aff:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b06:	00 00 00 
  write_head(); // clear the log
80102b09:	e8 12 ff ff ff       	call   80102a20 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b11:	c9                   	leave  
80102b12:	c3                   	ret    
80102b13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b20 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b20:	55                   	push   %ebp
80102b21:	89 e5                	mov    %esp,%ebp
80102b23:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102b26:	68 80 26 11 80       	push   $0x80112680
80102b2b:	e8 70 17 00 00       	call   801042a0 <acquire>
80102b30:	83 c4 10             	add    $0x10,%esp
80102b33:	eb 18                	jmp    80102b4d <begin_op+0x2d>
80102b35:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b38:	83 ec 08             	sub    $0x8,%esp
80102b3b:	68 80 26 11 80       	push   $0x80112680
80102b40:	68 80 26 11 80       	push   $0x80112680
80102b45:	e8 e6 11 00 00       	call   80103d30 <sleep>
80102b4a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102b4d:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102b52:	85 c0                	test   %eax,%eax
80102b54:	75 e2                	jne    80102b38 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102b56:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102b5b:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102b61:	83 c0 01             	add    $0x1,%eax
80102b64:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b67:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b6a:	83 fa 1e             	cmp    $0x1e,%edx
80102b6d:	7f c9                	jg     80102b38 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102b6f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102b72:	a3 bc 26 11 80       	mov    %eax,0x801126bc
      release(&log.lock);
80102b77:	68 80 26 11 80       	push   $0x80112680
80102b7c:	e8 3f 18 00 00       	call   801043c0 <release>
      break;
    }
  }
}
80102b81:	83 c4 10             	add    $0x10,%esp
80102b84:	c9                   	leave  
80102b85:	c3                   	ret    
80102b86:	8d 76 00             	lea    0x0(%esi),%esi
80102b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b90 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	57                   	push   %edi
80102b94:	56                   	push   %esi
80102b95:	53                   	push   %ebx
80102b96:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102b99:	68 80 26 11 80       	push   $0x80112680
80102b9e:	e8 fd 16 00 00       	call   801042a0 <acquire>
  log.outstanding -= 1;
80102ba3:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  if(log.committing)
80102ba8:	8b 1d c0 26 11 80    	mov    0x801126c0,%ebx
80102bae:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102bb1:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102bb4:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102bb6:	a3 bc 26 11 80       	mov    %eax,0x801126bc
  if(log.committing)
80102bbb:	0f 85 23 01 00 00    	jne    80102ce4 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102bc1:	85 c0                	test   %eax,%eax
80102bc3:	0f 85 f7 00 00 00    	jne    80102cc0 <end_op+0x130>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102bc9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102bcc:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102bd3:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102bd6:	31 db                	xor    %ebx,%ebx
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102bd8:	68 80 26 11 80       	push   $0x80112680
80102bdd:	e8 de 17 00 00       	call   801043c0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102be2:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102be8:	83 c4 10             	add    $0x10,%esp
80102beb:	85 c9                	test   %ecx,%ecx
80102bed:	0f 8e 8a 00 00 00    	jle    80102c7d <end_op+0xed>
80102bf3:	90                   	nop
80102bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102bf8:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102bfd:	83 ec 08             	sub    $0x8,%esp
80102c00:	01 d8                	add    %ebx,%eax
80102c02:	83 c0 01             	add    $0x1,%eax
80102c05:	50                   	push   %eax
80102c06:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c0c:	e8 bf d4 ff ff       	call   801000d0 <bread>
80102c11:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c13:	58                   	pop    %eax
80102c14:	5a                   	pop    %edx
80102c15:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102c1c:	ff 35 c4 26 11 80    	pushl  0x801126c4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c22:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c25:	e8 a6 d4 ff ff       	call   801000d0 <bread>
80102c2a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c2c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c2f:	83 c4 0c             	add    $0xc,%esp
80102c32:	68 00 02 00 00       	push   $0x200
80102c37:	50                   	push   %eax
80102c38:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c3b:	50                   	push   %eax
80102c3c:	e8 7f 18 00 00       	call   801044c0 <memmove>
    bwrite(to);  // write the log
80102c41:	89 34 24             	mov    %esi,(%esp)
80102c44:	e8 57 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c49:	89 3c 24             	mov    %edi,(%esp)
80102c4c:	e8 8f d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102c51:	89 34 24             	mov    %esi,(%esp)
80102c54:	e8 87 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c59:	83 c4 10             	add    $0x10,%esp
80102c5c:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102c62:	7c 94                	jl     80102bf8 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102c64:	e8 b7 fd ff ff       	call   80102a20 <write_head>
    install_trans(); // Now install writes to home locations
80102c69:	e8 12 fd ff ff       	call   80102980 <install_trans>
    log.lh.n = 0;
80102c6e:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102c75:	00 00 00 
    write_head();    // Erase the transaction from the log
80102c78:	e8 a3 fd ff ff       	call   80102a20 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102c7d:	83 ec 0c             	sub    $0xc,%esp
80102c80:	68 80 26 11 80       	push   $0x80112680
80102c85:	e8 16 16 00 00       	call   801042a0 <acquire>
    log.committing = 0;
    wakeup(&log);
80102c8a:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102c91:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102c98:	00 00 00 
    wakeup(&log);
80102c9b:	e8 40 12 00 00       	call   80103ee0 <wakeup>
    release(&log.lock);
80102ca0:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102ca7:	e8 14 17 00 00       	call   801043c0 <release>
80102cac:	83 c4 10             	add    $0x10,%esp
  }
}
80102caf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cb2:	5b                   	pop    %ebx
80102cb3:	5e                   	pop    %esi
80102cb4:	5f                   	pop    %edi
80102cb5:	5d                   	pop    %ebp
80102cb6:	c3                   	ret    
80102cb7:	89 f6                	mov    %esi,%esi
80102cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
80102cc0:	83 ec 0c             	sub    $0xc,%esp
80102cc3:	68 80 26 11 80       	push   $0x80112680
80102cc8:	e8 13 12 00 00       	call   80103ee0 <wakeup>
  }
  release(&log.lock);
80102ccd:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cd4:	e8 e7 16 00 00       	call   801043c0 <release>
80102cd9:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102cdc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cdf:	5b                   	pop    %ebx
80102ce0:	5e                   	pop    %esi
80102ce1:	5f                   	pop    %edi
80102ce2:	5d                   	pop    %ebp
80102ce3:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102ce4:	83 ec 0c             	sub    $0xc,%esp
80102ce7:	68 a4 74 10 80       	push   $0x801074a4
80102cec:	e8 7f d6 ff ff       	call   80100370 <panic>
80102cf1:	eb 0d                	jmp    80102d00 <log_write>
80102cf3:	90                   	nop
80102cf4:	90                   	nop
80102cf5:	90                   	nop
80102cf6:	90                   	nop
80102cf7:	90                   	nop
80102cf8:	90                   	nop
80102cf9:	90                   	nop
80102cfa:	90                   	nop
80102cfb:	90                   	nop
80102cfc:	90                   	nop
80102cfd:	90                   	nop
80102cfe:	90                   	nop
80102cff:	90                   	nop

80102d00 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d00:	55                   	push   %ebp
80102d01:	89 e5                	mov    %esp,%ebp
80102d03:	53                   	push   %ebx
80102d04:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d07:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d10:	83 fa 1d             	cmp    $0x1d,%edx
80102d13:	0f 8f 97 00 00 00    	jg     80102db0 <log_write+0xb0>
80102d19:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d1e:	83 e8 01             	sub    $0x1,%eax
80102d21:	39 c2                	cmp    %eax,%edx
80102d23:	0f 8d 87 00 00 00    	jge    80102db0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d29:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d2e:	85 c0                	test   %eax,%eax
80102d30:	0f 8e 87 00 00 00    	jle    80102dbd <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d36:	83 ec 0c             	sub    $0xc,%esp
80102d39:	68 80 26 11 80       	push   $0x80112680
80102d3e:	e8 5d 15 00 00       	call   801042a0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d43:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d49:	83 c4 10             	add    $0x10,%esp
80102d4c:	83 fa 00             	cmp    $0x0,%edx
80102d4f:	7e 50                	jle    80102da1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d51:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d54:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d56:	3b 0d cc 26 11 80    	cmp    0x801126cc,%ecx
80102d5c:	75 0b                	jne    80102d69 <log_write+0x69>
80102d5e:	eb 38                	jmp    80102d98 <log_write+0x98>
80102d60:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d67:	74 2f                	je     80102d98 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d69:	83 c0 01             	add    $0x1,%eax
80102d6c:	39 d0                	cmp    %edx,%eax
80102d6e:	75 f0                	jne    80102d60 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102d70:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102d77:	83 c2 01             	add    $0x1,%edx
80102d7a:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
  b->flags |= B_DIRTY; // prevent eviction
80102d80:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102d83:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102d8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d8d:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102d8e:	e9 2d 16 00 00       	jmp    801043c0 <release>
80102d93:	90                   	nop
80102d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102d98:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102d9f:	eb df                	jmp    80102d80 <log_write+0x80>
80102da1:	8b 43 08             	mov    0x8(%ebx),%eax
80102da4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
  if (i == log.lh.n)
80102da9:	75 d5                	jne    80102d80 <log_write+0x80>
80102dab:	eb ca                	jmp    80102d77 <log_write+0x77>
80102dad:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102db0:	83 ec 0c             	sub    $0xc,%esp
80102db3:	68 b3 74 10 80       	push   $0x801074b3
80102db8:	e8 b3 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102dbd:	83 ec 0c             	sub    $0xc,%esp
80102dc0:	68 c9 74 10 80       	push   $0x801074c9
80102dc5:	e8 a6 d5 ff ff       	call   80100370 <panic>
80102dca:	66 90                	xchg   %ax,%ax
80102dcc:	66 90                	xchg   %ax,%ax
80102dce:	66 90                	xchg   %ax,%ax

80102dd0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102dd0:	55                   	push   %ebp
80102dd1:	89 e5                	mov    %esp,%ebp
80102dd3:	53                   	push   %ebx
80102dd4:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102dd7:	e8 54 09 00 00       	call   80103730 <cpuid>
80102ddc:	89 c3                	mov    %eax,%ebx
80102dde:	e8 4d 09 00 00       	call   80103730 <cpuid>
80102de3:	83 ec 04             	sub    $0x4,%esp
80102de6:	53                   	push   %ebx
80102de7:	50                   	push   %eax
80102de8:	68 e4 74 10 80       	push   $0x801074e4
80102ded:	e8 6e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102df2:	e8 69 28 00 00       	call   80105660 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102df7:	e8 b4 08 00 00       	call   801036b0 <mycpu>
80102dfc:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102dfe:	b8 01 00 00 00       	mov    $0x1,%eax
80102e03:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e0a:	e8 31 0c 00 00       	call   80103a40 <scheduler>
80102e0f:	90                   	nop

80102e10 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e10:	55                   	push   %ebp
80102e11:	89 e5                	mov    %esp,%ebp
80102e13:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e16:	e8 e5 39 00 00       	call   80106800 <switchkvm>
  seginit();
80102e1b:	e8 50 38 00 00       	call   80106670 <seginit>
  lapicinit();
80102e20:	e8 9b f7 ff ff       	call   801025c0 <lapicinit>
  mpmain();
80102e25:	e8 a6 ff ff ff       	call   80102dd0 <mpmain>
80102e2a:	66 90                	xchg   %ax,%ax
80102e2c:	66 90                	xchg   %ax,%ax
80102e2e:	66 90                	xchg   %ax,%ax

80102e30 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e34:	83 e4 f0             	and    $0xfffffff0,%esp
80102e37:	ff 71 fc             	pushl  -0x4(%ecx)
80102e3a:	55                   	push   %ebp
80102e3b:	89 e5                	mov    %esp,%ebp
80102e3d:	53                   	push   %ebx
80102e3e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e3f:	bb 80 27 11 80       	mov    $0x80112780,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e44:	83 ec 08             	sub    $0x8,%esp
80102e47:	68 00 00 40 80       	push   $0x80400000
80102e4c:	68 f4 58 11 80       	push   $0x801158f4
80102e51:	e8 3a f5 ff ff       	call   80102390 <kinit1>
  kvmalloc();      // kernel page table
80102e56:	e8 45 3e 00 00       	call   80106ca0 <kvmalloc>
  mpinit();        // detect other processors
80102e5b:	e8 70 01 00 00       	call   80102fd0 <mpinit>
  lapicinit();     // interrupt controller
80102e60:	e8 5b f7 ff ff       	call   801025c0 <lapicinit>
  seginit();       // segment descriptors
80102e65:	e8 06 38 00 00       	call   80106670 <seginit>
  picinit();       // disable pic
80102e6a:	e8 31 03 00 00       	call   801031a0 <picinit>
  ioapicinit();    // another interrupt controller
80102e6f:	e8 4c f3 ff ff       	call   801021c0 <ioapicinit>
  consoleinit();   // console hardware
80102e74:	e8 27 db ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102e79:	e8 52 2b 00 00       	call   801059d0 <uartinit>
  pinit();         // process table
80102e7e:	e8 0d 08 00 00       	call   80103690 <pinit>
  shminit();       // shared memory
80102e83:	e8 e8 40 00 00       	call   80106f70 <shminit>
  tvinit();        // trap vectors
80102e88:	e8 33 27 00 00       	call   801055c0 <tvinit>
  binit();         // buffer cache
80102e8d:	e8 ae d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102e92:	e8 89 de ff ff       	call   80100d20 <fileinit>
  ideinit();       // disk 
80102e97:	e8 04 f1 ff ff       	call   80101fa0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102e9c:	83 c4 0c             	add    $0xc,%esp
80102e9f:	68 8a 00 00 00       	push   $0x8a
80102ea4:	68 8c a4 10 80       	push   $0x8010a48c
80102ea9:	68 00 70 00 80       	push   $0x80007000
80102eae:	e8 0d 16 00 00       	call   801044c0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102eb3:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102eba:	00 00 00 
80102ebd:	83 c4 10             	add    $0x10,%esp
80102ec0:	05 80 27 11 80       	add    $0x80112780,%eax
80102ec5:	39 d8                	cmp    %ebx,%eax
80102ec7:	76 6a                	jbe    80102f33 <main+0x103>
80102ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102ed0:	e8 db 07 00 00       	call   801036b0 <mycpu>
80102ed5:	39 d8                	cmp    %ebx,%eax
80102ed7:	74 41                	je     80102f1a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102ed9:	e8 82 f5 ff ff       	call   80102460 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102ede:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102ee3:	c7 05 f8 6f 00 80 10 	movl   $0x80102e10,0x80006ff8
80102eea:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102eed:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102ef4:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102ef7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102efc:	0f b6 03             	movzbl (%ebx),%eax
80102eff:	83 ec 08             	sub    $0x8,%esp
80102f02:	68 00 70 00 00       	push   $0x7000
80102f07:	50                   	push   %eax
80102f08:	e8 03 f8 ff ff       	call   80102710 <lapicstartap>
80102f0d:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f10:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f16:	85 c0                	test   %eax,%eax
80102f18:	74 f6                	je     80102f10 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f1a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f21:	00 00 00 
80102f24:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f2a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f2f:	39 c3                	cmp    %eax,%ebx
80102f31:	72 9d                	jb     80102ed0 <main+0xa0>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f33:	83 ec 08             	sub    $0x8,%esp
80102f36:	68 00 00 00 8e       	push   $0x8e000000
80102f3b:	68 00 00 40 80       	push   $0x80400000
80102f40:	e8 bb f4 ff ff       	call   80102400 <kinit2>
  userinit();      // first user process
80102f45:	e8 36 08 00 00       	call   80103780 <userinit>
  mpmain();        // finish this processor's setup
80102f4a:	e8 81 fe ff ff       	call   80102dd0 <mpmain>
80102f4f:	90                   	nop

80102f50 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f50:	55                   	push   %ebp
80102f51:	89 e5                	mov    %esp,%ebp
80102f53:	57                   	push   %edi
80102f54:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f55:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f5b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102f5c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f5f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102f62:	39 de                	cmp    %ebx,%esi
80102f64:	73 48                	jae    80102fae <mpsearch1+0x5e>
80102f66:	8d 76 00             	lea    0x0(%esi),%esi
80102f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f70:	83 ec 04             	sub    $0x4,%esp
80102f73:	8d 7e 10             	lea    0x10(%esi),%edi
80102f76:	6a 04                	push   $0x4
80102f78:	68 f8 74 10 80       	push   $0x801074f8
80102f7d:	56                   	push   %esi
80102f7e:	e8 dd 14 00 00       	call   80104460 <memcmp>
80102f83:	83 c4 10             	add    $0x10,%esp
80102f86:	85 c0                	test   %eax,%eax
80102f88:	75 1e                	jne    80102fa8 <mpsearch1+0x58>
80102f8a:	8d 7e 10             	lea    0x10(%esi),%edi
80102f8d:	89 f2                	mov    %esi,%edx
80102f8f:	31 c9                	xor    %ecx,%ecx
80102f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102f98:	0f b6 02             	movzbl (%edx),%eax
80102f9b:	83 c2 01             	add    $0x1,%edx
80102f9e:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fa0:	39 fa                	cmp    %edi,%edx
80102fa2:	75 f4                	jne    80102f98 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fa4:	84 c9                	test   %cl,%cl
80102fa6:	74 10                	je     80102fb8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fa8:	39 fb                	cmp    %edi,%ebx
80102faa:	89 fe                	mov    %edi,%esi
80102fac:	77 c2                	ja     80102f70 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102fae:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102fb1:	31 c0                	xor    %eax,%eax
}
80102fb3:	5b                   	pop    %ebx
80102fb4:	5e                   	pop    %esi
80102fb5:	5f                   	pop    %edi
80102fb6:	5d                   	pop    %ebp
80102fb7:	c3                   	ret    
80102fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fbb:	89 f0                	mov    %esi,%eax
80102fbd:	5b                   	pop    %ebx
80102fbe:	5e                   	pop    %esi
80102fbf:	5f                   	pop    %edi
80102fc0:	5d                   	pop    %ebp
80102fc1:	c3                   	ret    
80102fc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102fd0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	57                   	push   %edi
80102fd4:	56                   	push   %esi
80102fd5:	53                   	push   %ebx
80102fd6:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102fd9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102fe0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102fe7:	c1 e0 08             	shl    $0x8,%eax
80102fea:	09 d0                	or     %edx,%eax
80102fec:	c1 e0 04             	shl    $0x4,%eax
80102fef:	85 c0                	test   %eax,%eax
80102ff1:	75 1b                	jne    8010300e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80102ff3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102ffa:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103001:	c1 e0 08             	shl    $0x8,%eax
80103004:	09 d0                	or     %edx,%eax
80103006:	c1 e0 0a             	shl    $0xa,%eax
80103009:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010300e:	ba 00 04 00 00       	mov    $0x400,%edx
80103013:	e8 38 ff ff ff       	call   80102f50 <mpsearch1>
80103018:	85 c0                	test   %eax,%eax
8010301a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010301d:	0f 84 37 01 00 00    	je     8010315a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103023:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103026:	8b 58 04             	mov    0x4(%eax),%ebx
80103029:	85 db                	test   %ebx,%ebx
8010302b:	0f 84 43 01 00 00    	je     80103174 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103031:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103037:	83 ec 04             	sub    $0x4,%esp
8010303a:	6a 04                	push   $0x4
8010303c:	68 fd 74 10 80       	push   $0x801074fd
80103041:	56                   	push   %esi
80103042:	e8 19 14 00 00       	call   80104460 <memcmp>
80103047:	83 c4 10             	add    $0x10,%esp
8010304a:	85 c0                	test   %eax,%eax
8010304c:	0f 85 22 01 00 00    	jne    80103174 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103052:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103059:	3c 01                	cmp    $0x1,%al
8010305b:	74 08                	je     80103065 <mpinit+0x95>
8010305d:	3c 04                	cmp    $0x4,%al
8010305f:	0f 85 0f 01 00 00    	jne    80103174 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103065:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010306c:	85 ff                	test   %edi,%edi
8010306e:	74 21                	je     80103091 <mpinit+0xc1>
80103070:	31 d2                	xor    %edx,%edx
80103072:	31 c0                	xor    %eax,%eax
80103074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103078:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010307f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103080:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80103083:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103085:	39 c7                	cmp    %eax,%edi
80103087:	75 ef                	jne    80103078 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103089:	84 d2                	test   %dl,%dl
8010308b:	0f 85 e3 00 00 00    	jne    80103174 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103091:	85 f6                	test   %esi,%esi
80103093:	0f 84 db 00 00 00    	je     80103174 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80103099:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
8010309f:	a3 7c 26 11 80       	mov    %eax,0x8011267c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030a4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030ab:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801030b1:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030b6:	01 d6                	add    %edx,%esi
801030b8:	90                   	nop
801030b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030c0:	39 c6                	cmp    %eax,%esi
801030c2:	76 23                	jbe    801030e7 <mpinit+0x117>
801030c4:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
801030c7:	80 fa 04             	cmp    $0x4,%dl
801030ca:	0f 87 c0 00 00 00    	ja     80103190 <mpinit+0x1c0>
801030d0:	ff 24 95 3c 75 10 80 	jmp    *-0x7fef8ac4(,%edx,4)
801030d7:	89 f6                	mov    %esi,%esi
801030d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801030e0:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030e3:	39 c6                	cmp    %eax,%esi
801030e5:	77 dd                	ja     801030c4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
801030e7:	85 db                	test   %ebx,%ebx
801030e9:	0f 84 92 00 00 00    	je     80103181 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
801030ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801030f2:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
801030f6:	74 15                	je     8010310d <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801030f8:	ba 22 00 00 00       	mov    $0x22,%edx
801030fd:	b8 70 00 00 00       	mov    $0x70,%eax
80103102:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103103:	ba 23 00 00 00       	mov    $0x23,%edx
80103108:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103109:	83 c8 01             	or     $0x1,%eax
8010310c:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010310d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103110:	5b                   	pop    %ebx
80103111:	5e                   	pop    %esi
80103112:	5f                   	pop    %edi
80103113:	5d                   	pop    %ebp
80103114:	c3                   	ret    
80103115:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103118:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010311e:	83 f9 07             	cmp    $0x7,%ecx
80103121:	7f 19                	jg     8010313c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103123:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103127:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010312d:	83 c1 01             	add    $0x1,%ecx
80103130:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103136:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010313c:	83 c0 14             	add    $0x14,%eax
      continue;
8010313f:	e9 7c ff ff ff       	jmp    801030c0 <mpinit+0xf0>
80103144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103148:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010314c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010314f:	88 15 60 27 11 80    	mov    %dl,0x80112760
      p += sizeof(struct mpioapic);
      continue;
80103155:	e9 66 ff ff ff       	jmp    801030c0 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010315a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010315f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103164:	e8 e7 fd ff ff       	call   80102f50 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103169:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010316b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010316e:	0f 85 af fe ff ff    	jne    80103023 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
80103174:	83 ec 0c             	sub    $0xc,%esp
80103177:	68 02 75 10 80       	push   $0x80107502
8010317c:	e8 ef d1 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
80103181:	83 ec 0c             	sub    $0xc,%esp
80103184:	68 1c 75 10 80       	push   $0x8010751c
80103189:	e8 e2 d1 ff ff       	call   80100370 <panic>
8010318e:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
80103190:	31 db                	xor    %ebx,%ebx
80103192:	e9 30 ff ff ff       	jmp    801030c7 <mpinit+0xf7>
80103197:	66 90                	xchg   %ax,%ax
80103199:	66 90                	xchg   %ax,%ax
8010319b:	66 90                	xchg   %ax,%ax
8010319d:	66 90                	xchg   %ax,%ax
8010319f:	90                   	nop

801031a0 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801031a0:	55                   	push   %ebp
801031a1:	ba 21 00 00 00       	mov    $0x21,%edx
801031a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031ab:	89 e5                	mov    %esp,%ebp
801031ad:	ee                   	out    %al,(%dx)
801031ae:	ba a1 00 00 00       	mov    $0xa1,%edx
801031b3:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801031b4:	5d                   	pop    %ebp
801031b5:	c3                   	ret    
801031b6:	66 90                	xchg   %ax,%ax
801031b8:	66 90                	xchg   %ax,%ax
801031ba:	66 90                	xchg   %ax,%ax
801031bc:	66 90                	xchg   %ax,%ax
801031be:	66 90                	xchg   %ax,%ax

801031c0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801031c0:	55                   	push   %ebp
801031c1:	89 e5                	mov    %esp,%ebp
801031c3:	57                   	push   %edi
801031c4:	56                   	push   %esi
801031c5:	53                   	push   %ebx
801031c6:	83 ec 0c             	sub    $0xc,%esp
801031c9:	8b 75 08             	mov    0x8(%ebp),%esi
801031cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801031cf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801031d5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801031db:	e8 60 db ff ff       	call   80100d40 <filealloc>
801031e0:	85 c0                	test   %eax,%eax
801031e2:	89 06                	mov    %eax,(%esi)
801031e4:	0f 84 a8 00 00 00    	je     80103292 <pipealloc+0xd2>
801031ea:	e8 51 db ff ff       	call   80100d40 <filealloc>
801031ef:	85 c0                	test   %eax,%eax
801031f1:	89 03                	mov    %eax,(%ebx)
801031f3:	0f 84 87 00 00 00    	je     80103280 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801031f9:	e8 62 f2 ff ff       	call   80102460 <kalloc>
801031fe:	85 c0                	test   %eax,%eax
80103200:	89 c7                	mov    %eax,%edi
80103202:	0f 84 b0 00 00 00    	je     801032b8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103208:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010320b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103212:	00 00 00 
  p->writeopen = 1;
80103215:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010321c:	00 00 00 
  p->nwrite = 0;
8010321f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103226:	00 00 00 
  p->nread = 0;
80103229:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103230:	00 00 00 
  initlock(&p->lock, "pipe");
80103233:	68 50 75 10 80       	push   $0x80107550
80103238:	50                   	push   %eax
80103239:	e8 62 0f 00 00       	call   801041a0 <initlock>
  (*f0)->type = FD_PIPE;
8010323e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103240:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103243:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103249:	8b 06                	mov    (%esi),%eax
8010324b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010324f:	8b 06                	mov    (%esi),%eax
80103251:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103255:	8b 06                	mov    (%esi),%eax
80103257:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010325a:	8b 03                	mov    (%ebx),%eax
8010325c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103262:	8b 03                	mov    (%ebx),%eax
80103264:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103268:	8b 03                	mov    (%ebx),%eax
8010326a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010326e:	8b 03                	mov    (%ebx),%eax
80103270:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103273:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103276:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103278:	5b                   	pop    %ebx
80103279:	5e                   	pop    %esi
8010327a:	5f                   	pop    %edi
8010327b:	5d                   	pop    %ebp
8010327c:	c3                   	ret    
8010327d:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103280:	8b 06                	mov    (%esi),%eax
80103282:	85 c0                	test   %eax,%eax
80103284:	74 1e                	je     801032a4 <pipealloc+0xe4>
    fileclose(*f0);
80103286:	83 ec 0c             	sub    $0xc,%esp
80103289:	50                   	push   %eax
8010328a:	e8 71 db ff ff       	call   80100e00 <fileclose>
8010328f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103292:	8b 03                	mov    (%ebx),%eax
80103294:	85 c0                	test   %eax,%eax
80103296:	74 0c                	je     801032a4 <pipealloc+0xe4>
    fileclose(*f1);
80103298:	83 ec 0c             	sub    $0xc,%esp
8010329b:	50                   	push   %eax
8010329c:	e8 5f db ff ff       	call   80100e00 <fileclose>
801032a1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801032a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032ac:	5b                   	pop    %ebx
801032ad:	5e                   	pop    %esi
801032ae:	5f                   	pop    %edi
801032af:	5d                   	pop    %ebp
801032b0:	c3                   	ret    
801032b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032b8:	8b 06                	mov    (%esi),%eax
801032ba:	85 c0                	test   %eax,%eax
801032bc:	75 c8                	jne    80103286 <pipealloc+0xc6>
801032be:	eb d2                	jmp    80103292 <pipealloc+0xd2>

801032c0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801032c0:	55                   	push   %ebp
801032c1:	89 e5                	mov    %esp,%ebp
801032c3:	56                   	push   %esi
801032c4:	53                   	push   %ebx
801032c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032c8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801032cb:	83 ec 0c             	sub    $0xc,%esp
801032ce:	53                   	push   %ebx
801032cf:	e8 cc 0f 00 00       	call   801042a0 <acquire>
  if(writable){
801032d4:	83 c4 10             	add    $0x10,%esp
801032d7:	85 f6                	test   %esi,%esi
801032d9:	74 45                	je     80103320 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801032db:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801032e1:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801032e4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801032eb:	00 00 00 
    wakeup(&p->nread);
801032ee:	50                   	push   %eax
801032ef:	e8 ec 0b 00 00       	call   80103ee0 <wakeup>
801032f4:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801032f7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801032fd:	85 d2                	test   %edx,%edx
801032ff:	75 0a                	jne    8010330b <pipeclose+0x4b>
80103301:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103307:	85 c0                	test   %eax,%eax
80103309:	74 35                	je     80103340 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010330b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010330e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103311:	5b                   	pop    %ebx
80103312:	5e                   	pop    %esi
80103313:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103314:	e9 a7 10 00 00       	jmp    801043c0 <release>
80103319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103320:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103326:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103329:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103330:	00 00 00 
    wakeup(&p->nwrite);
80103333:	50                   	push   %eax
80103334:	e8 a7 0b 00 00       	call   80103ee0 <wakeup>
80103339:	83 c4 10             	add    $0x10,%esp
8010333c:	eb b9                	jmp    801032f7 <pipeclose+0x37>
8010333e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103340:	83 ec 0c             	sub    $0xc,%esp
80103343:	53                   	push   %ebx
80103344:	e8 77 10 00 00       	call   801043c0 <release>
    kfree((char*)p);
80103349:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010334c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010334f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103352:	5b                   	pop    %ebx
80103353:	5e                   	pop    %esi
80103354:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103355:	e9 56 ef ff ff       	jmp    801022b0 <kfree>
8010335a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103360 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	57                   	push   %edi
80103364:	56                   	push   %esi
80103365:	53                   	push   %ebx
80103366:	83 ec 28             	sub    $0x28,%esp
80103369:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010336c:	53                   	push   %ebx
8010336d:	e8 2e 0f 00 00       	call   801042a0 <acquire>
  for(i = 0; i < n; i++){
80103372:	8b 45 10             	mov    0x10(%ebp),%eax
80103375:	83 c4 10             	add    $0x10,%esp
80103378:	85 c0                	test   %eax,%eax
8010337a:	0f 8e b9 00 00 00    	jle    80103439 <pipewrite+0xd9>
80103380:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103383:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103389:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010338f:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103395:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103398:	03 4d 10             	add    0x10(%ebp),%ecx
8010339b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010339e:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033a4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033aa:	39 d0                	cmp    %edx,%eax
801033ac:	74 38                	je     801033e6 <pipewrite+0x86>
801033ae:	eb 59                	jmp    80103409 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
801033b0:	e8 9b 03 00 00       	call   80103750 <myproc>
801033b5:	8b 48 24             	mov    0x24(%eax),%ecx
801033b8:	85 c9                	test   %ecx,%ecx
801033ba:	75 34                	jne    801033f0 <pipewrite+0x90>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033bc:	83 ec 0c             	sub    $0xc,%esp
801033bf:	57                   	push   %edi
801033c0:	e8 1b 0b 00 00       	call   80103ee0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033c5:	58                   	pop    %eax
801033c6:	5a                   	pop    %edx
801033c7:	53                   	push   %ebx
801033c8:	56                   	push   %esi
801033c9:	e8 62 09 00 00       	call   80103d30 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033ce:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801033d4:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801033da:	83 c4 10             	add    $0x10,%esp
801033dd:	05 00 02 00 00       	add    $0x200,%eax
801033e2:	39 c2                	cmp    %eax,%edx
801033e4:	75 2a                	jne    80103410 <pipewrite+0xb0>
      if(p->readopen == 0 || myproc()->killed){
801033e6:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801033ec:	85 c0                	test   %eax,%eax
801033ee:	75 c0                	jne    801033b0 <pipewrite+0x50>
        release(&p->lock);
801033f0:	83 ec 0c             	sub    $0xc,%esp
801033f3:	53                   	push   %ebx
801033f4:	e8 c7 0f 00 00       	call   801043c0 <release>
        return -1;
801033f9:	83 c4 10             	add    $0x10,%esp
801033fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103401:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103404:	5b                   	pop    %ebx
80103405:	5e                   	pop    %esi
80103406:	5f                   	pop    %edi
80103407:	5d                   	pop    %ebp
80103408:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103409:	89 c2                	mov    %eax,%edx
8010340b:	90                   	nop
8010340c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103410:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103413:	8d 42 01             	lea    0x1(%edx),%eax
80103416:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010341a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103420:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103426:	0f b6 09             	movzbl (%ecx),%ecx
80103429:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010342d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103430:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103433:	0f 85 65 ff ff ff    	jne    8010339e <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103439:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010343f:	83 ec 0c             	sub    $0xc,%esp
80103442:	50                   	push   %eax
80103443:	e8 98 0a 00 00       	call   80103ee0 <wakeup>
  release(&p->lock);
80103448:	89 1c 24             	mov    %ebx,(%esp)
8010344b:	e8 70 0f 00 00       	call   801043c0 <release>
  return n;
80103450:	83 c4 10             	add    $0x10,%esp
80103453:	8b 45 10             	mov    0x10(%ebp),%eax
80103456:	eb a9                	jmp    80103401 <pipewrite+0xa1>
80103458:	90                   	nop
80103459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103460 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103460:	55                   	push   %ebp
80103461:	89 e5                	mov    %esp,%ebp
80103463:	57                   	push   %edi
80103464:	56                   	push   %esi
80103465:	53                   	push   %ebx
80103466:	83 ec 18             	sub    $0x18,%esp
80103469:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010346c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010346f:	53                   	push   %ebx
80103470:	e8 2b 0e 00 00       	call   801042a0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103475:	83 c4 10             	add    $0x10,%esp
80103478:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010347e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80103484:	75 6a                	jne    801034f0 <piperead+0x90>
80103486:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
8010348c:	85 f6                	test   %esi,%esi
8010348e:	0f 84 cc 00 00 00    	je     80103560 <piperead+0x100>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103494:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010349a:	eb 2d                	jmp    801034c9 <piperead+0x69>
8010349c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034a0:	83 ec 08             	sub    $0x8,%esp
801034a3:	53                   	push   %ebx
801034a4:	56                   	push   %esi
801034a5:	e8 86 08 00 00       	call   80103d30 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034aa:	83 c4 10             	add    $0x10,%esp
801034ad:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034b3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034b9:	75 35                	jne    801034f0 <piperead+0x90>
801034bb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034c1:	85 d2                	test   %edx,%edx
801034c3:	0f 84 97 00 00 00    	je     80103560 <piperead+0x100>
    if(myproc()->killed){
801034c9:	e8 82 02 00 00       	call   80103750 <myproc>
801034ce:	8b 48 24             	mov    0x24(%eax),%ecx
801034d1:	85 c9                	test   %ecx,%ecx
801034d3:	74 cb                	je     801034a0 <piperead+0x40>
      release(&p->lock);
801034d5:	83 ec 0c             	sub    $0xc,%esp
801034d8:	53                   	push   %ebx
801034d9:	e8 e2 0e 00 00       	call   801043c0 <release>
      return -1;
801034de:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801034e1:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
      return -1;
801034e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801034e9:	5b                   	pop    %ebx
801034ea:	5e                   	pop    %esi
801034eb:	5f                   	pop    %edi
801034ec:	5d                   	pop    %ebp
801034ed:	c3                   	ret    
801034ee:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801034f0:	8b 45 10             	mov    0x10(%ebp),%eax
801034f3:	85 c0                	test   %eax,%eax
801034f5:	7e 69                	jle    80103560 <piperead+0x100>
    if(p->nread == p->nwrite)
801034f7:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034fd:	31 c9                	xor    %ecx,%ecx
801034ff:	eb 15                	jmp    80103516 <piperead+0xb6>
80103501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103508:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010350e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103514:	74 5a                	je     80103570 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103516:	8d 70 01             	lea    0x1(%eax),%esi
80103519:	25 ff 01 00 00       	and    $0x1ff,%eax
8010351e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103524:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103529:	88 04 0f             	mov    %al,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010352c:	83 c1 01             	add    $0x1,%ecx
8010352f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103532:	75 d4                	jne    80103508 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103534:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010353a:	83 ec 0c             	sub    $0xc,%esp
8010353d:	50                   	push   %eax
8010353e:	e8 9d 09 00 00       	call   80103ee0 <wakeup>
  release(&p->lock);
80103543:	89 1c 24             	mov    %ebx,(%esp)
80103546:	e8 75 0e 00 00       	call   801043c0 <release>
  return i;
8010354b:	8b 45 10             	mov    0x10(%ebp),%eax
8010354e:	83 c4 10             	add    $0x10,%esp
}
80103551:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103554:	5b                   	pop    %ebx
80103555:	5e                   	pop    %esi
80103556:	5f                   	pop    %edi
80103557:	5d                   	pop    %ebp
80103558:	c3                   	ret    
80103559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103560:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103567:	eb cb                	jmp    80103534 <piperead+0xd4>
80103569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103570:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103573:	eb bf                	jmp    80103534 <piperead+0xd4>
80103575:	66 90                	xchg   %ax,%ax
80103577:	66 90                	xchg   %ax,%ax
80103579:	66 90                	xchg   %ax,%ax
8010357b:	66 90                	xchg   %ax,%ax
8010357d:	66 90                	xchg   %ax,%ax
8010357f:	90                   	nop

80103580 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103580:	55                   	push   %ebp
80103581:	89 e5                	mov    %esp,%ebp
80103583:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103584:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103589:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010358c:	68 20 2d 11 80       	push   $0x80112d20
80103591:	e8 0a 0d 00 00       	call   801042a0 <acquire>
80103596:	83 c4 10             	add    $0x10,%esp
80103599:	eb 10                	jmp    801035ab <allocproc+0x2b>
8010359b:	90                   	nop
8010359c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035a0:	83 eb 80             	sub    $0xffffff80,%ebx
801035a3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801035a9:	74 75                	je     80103620 <allocproc+0xa0>
    if(p->state == UNUSED)
801035ab:	8b 43 0c             	mov    0xc(%ebx),%eax
801035ae:	85 c0                	test   %eax,%eax
801035b0:	75 ee                	jne    801035a0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035b2:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
801035b7:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801035ba:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
801035c1:	68 20 2d 11 80       	push   $0x80112d20
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035c6:	8d 50 01             	lea    0x1(%eax),%edx
801035c9:	89 43 10             	mov    %eax,0x10(%ebx)
801035cc:	89 15 04 a0 10 80    	mov    %edx,0x8010a004

  release(&ptable.lock);
801035d2:	e8 e9 0d 00 00       	call   801043c0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801035d7:	e8 84 ee ff ff       	call   80102460 <kalloc>
801035dc:	83 c4 10             	add    $0x10,%esp
801035df:	85 c0                	test   %eax,%eax
801035e1:	89 43 08             	mov    %eax,0x8(%ebx)
801035e4:	74 51                	je     80103637 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801035e6:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801035ec:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
801035ef:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801035f4:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
801035f7:	c7 40 14 b2 55 10 80 	movl   $0x801055b2,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801035fe:	6a 14                	push   $0x14
80103600:	6a 00                	push   $0x0
80103602:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103603:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103606:	e8 05 0e 00 00       	call   80104410 <memset>
  p->context->eip = (uint)forkret;
8010360b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010360e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103611:	c7 40 10 40 36 10 80 	movl   $0x80103640,0x10(%eax)

  return p;
80103618:	89 d8                	mov    %ebx,%eax
}
8010361a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010361d:	c9                   	leave  
8010361e:	c3                   	ret    
8010361f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103620:	83 ec 0c             	sub    $0xc,%esp
80103623:	68 20 2d 11 80       	push   $0x80112d20
80103628:	e8 93 0d 00 00       	call   801043c0 <release>
  return 0;
8010362d:	83 c4 10             	add    $0x10,%esp
80103630:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103632:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103635:	c9                   	leave  
80103636:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103637:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010363e:	eb da                	jmp    8010361a <allocproc+0x9a>

80103640 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103640:	55                   	push   %ebp
80103641:	89 e5                	mov    %esp,%ebp
80103643:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103646:	68 20 2d 11 80       	push   $0x80112d20
8010364b:	e8 70 0d 00 00       	call   801043c0 <release>

  if (first) {
80103650:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103655:	83 c4 10             	add    $0x10,%esp
80103658:	85 c0                	test   %eax,%eax
8010365a:	75 04                	jne    80103660 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010365c:	c9                   	leave  
8010365d:	c3                   	ret    
8010365e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103660:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103663:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010366a:	00 00 00 
    iinit(ROOTDEV);
8010366d:	6a 01                	push   $0x1
8010366f:	e8 cc dd ff ff       	call   80101440 <iinit>
    initlog(ROOTDEV);
80103674:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010367b:	e8 00 f4 ff ff       	call   80102a80 <initlog>
80103680:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103683:	c9                   	leave  
80103684:	c3                   	ret    
80103685:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103690 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103696:	68 55 75 10 80       	push   $0x80107555
8010369b:	68 20 2d 11 80       	push   $0x80112d20
801036a0:	e8 fb 0a 00 00       	call   801041a0 <initlock>
}
801036a5:	83 c4 10             	add    $0x10,%esp
801036a8:	c9                   	leave  
801036a9:	c3                   	ret    
801036aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801036b0 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
801036b0:	55                   	push   %ebp
801036b1:	89 e5                	mov    %esp,%ebp
801036b3:	56                   	push   %esi
801036b4:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801036b5:	9c                   	pushf  
801036b6:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
801036b7:	f6 c4 02             	test   $0x2,%ah
801036ba:	75 5b                	jne    80103717 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
801036bc:	e8 ff ef ff ff       	call   801026c0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801036c1:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801036c7:	85 f6                	test   %esi,%esi
801036c9:	7e 3f                	jle    8010370a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036cb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
801036d2:	39 d0                	cmp    %edx,%eax
801036d4:	74 30                	je     80103706 <mycpu+0x56>
801036d6:	b9 30 28 11 80       	mov    $0x80112830,%ecx
801036db:	31 d2                	xor    %edx,%edx
801036dd:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801036e0:	83 c2 01             	add    $0x1,%edx
801036e3:	39 f2                	cmp    %esi,%edx
801036e5:	74 23                	je     8010370a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036e7:	0f b6 19             	movzbl (%ecx),%ebx
801036ea:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801036f0:	39 d8                	cmp    %ebx,%eax
801036f2:	75 ec                	jne    801036e0 <mycpu+0x30>
      return &cpus[i];
801036f4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
801036fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801036fd:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
801036fe:	05 80 27 11 80       	add    $0x80112780,%eax
  }
  panic("unknown apicid\n");
}
80103703:	5e                   	pop    %esi
80103704:	5d                   	pop    %ebp
80103705:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103706:	31 d2                	xor    %edx,%edx
80103708:	eb ea                	jmp    801036f4 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010370a:	83 ec 0c             	sub    $0xc,%esp
8010370d:	68 5c 75 10 80       	push   $0x8010755c
80103712:	e8 59 cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103717:	83 ec 0c             	sub    $0xc,%esp
8010371a:	68 50 76 10 80       	push   $0x80107650
8010371f:	e8 4c cc ff ff       	call   80100370 <panic>
80103724:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010372a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103730 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103736:	e8 75 ff ff ff       	call   801036b0 <mycpu>
8010373b:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
80103740:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103741:	c1 f8 04             	sar    $0x4,%eax
80103744:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010374a:	c3                   	ret    
8010374b:	90                   	nop
8010374c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103750 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	53                   	push   %ebx
80103754:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
80103757:	e8 04 0b 00 00       	call   80104260 <pushcli>
  c = mycpu();
8010375c:	e8 4f ff ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103761:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103767:	e8 e4 0b 00 00       	call   80104350 <popcli>
  return p;
}
8010376c:	83 c4 04             	add    $0x4,%esp
8010376f:	89 d8                	mov    %ebx,%eax
80103771:	5b                   	pop    %ebx
80103772:	5d                   	pop    %ebp
80103773:	c3                   	ret    
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	53                   	push   %ebx
80103784:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103787:	e8 f4 fd ff ff       	call   80103580 <allocproc>
8010378c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010378e:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103793:	e8 88 34 00 00       	call   80106c20 <setupkvm>
80103798:	85 c0                	test   %eax,%eax
8010379a:	89 43 04             	mov    %eax,0x4(%ebx)
8010379d:	0f 84 e3 00 00 00    	je     80103886 <userinit+0x106>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037a3:	83 ec 04             	sub    $0x4,%esp
801037a6:	68 2c 00 00 00       	push   $0x2c
801037ab:	68 60 a4 10 80       	push   $0x8010a460
801037b0:	50                   	push   %eax
801037b1:	e8 7a 31 00 00       	call   80106930 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
801037b6:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
801037b9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037bf:	6a 4c                	push   $0x4c
801037c1:	6a 00                	push   $0x0
801037c3:	ff 73 18             	pushl  0x18(%ebx)
801037c6:	e8 45 0c 00 00       	call   80104410 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037cb:	8b 43 18             	mov    0x18(%ebx),%eax
801037ce:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037d3:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->eflags = FL_IF;
  p->tf->esp = STACKBASE;
  p->tf->ebp = STACKBASE;
  p->tf->eip = 0;  // beginning of initcode.S

  if (allocuvm(p->pgdir, PGROUNDDOWN(STACKBASE), STACKBASE) == 0) {
801037d8:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037db:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037df:	8b 43 18             	mov    0x18(%ebx),%eax
801037e2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801037e6:	8b 43 18             	mov    0x18(%ebx),%eax
801037e9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037ed:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801037f1:	8b 43 18             	mov    0x18(%ebx),%eax
801037f4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037f8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801037fc:	8b 43 18             	mov    0x18(%ebx),%eax
801037ff:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = STACKBASE;
80103806:	8b 43 18             	mov    0x18(%ebx),%eax
80103809:	c7 40 44 ff ff ff 7f 	movl   $0x7fffffff,0x44(%eax)
  p->tf->ebp = STACKBASE;
80103810:	8b 43 18             	mov    0x18(%ebx),%eax
80103813:	c7 40 08 ff ff ff 7f 	movl   $0x7fffffff,0x8(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
8010381a:	8b 43 18             	mov    0x18(%ebx),%eax
8010381d:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  if (allocuvm(p->pgdir, PGROUNDDOWN(STACKBASE), STACKBASE) == 0) {
80103824:	68 ff ff ff 7f       	push   $0x7fffffff
80103829:	68 00 f0 ff 7f       	push   $0x7ffff000
8010382e:	ff 73 04             	pushl  0x4(%ebx)
80103831:	e8 3a 32 00 00       	call   80106a70 <allocuvm>
80103836:	83 c4 10             	add    $0x10,%esp
80103839:	85 c0                	test   %eax,%eax
8010383b:	74 56                	je     80103893 <userinit+0x113>
     panic("Allocation failed proc.c");
  }

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010383d:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103840:	83 ec 04             	sub    $0x4,%esp
80103843:	6a 10                	push   $0x10
80103845:	68 9e 75 10 80       	push   $0x8010759e
8010384a:	50                   	push   %eax
8010384b:	e8 c0 0d 00 00       	call   80104610 <safestrcpy>
  p->cwd = namei("/");
80103850:	c7 04 24 a7 75 10 80 	movl   $0x801075a7,(%esp)
80103857:	e8 34 e6 ff ff       	call   80101e90 <namei>
8010385c:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
8010385f:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103866:	e8 35 0a 00 00       	call   801042a0 <acquire>

  p->state = RUNNABLE;
8010386b:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103872:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103879:	e8 42 0b 00 00       	call   801043c0 <release>
}
8010387e:	83 c4 10             	add    $0x10,%esp
80103881:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103884:	c9                   	leave  
80103885:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103886:	83 ec 0c             	sub    $0xc,%esp
80103889:	68 6c 75 10 80       	push   $0x8010756c
8010388e:	e8 dd ca ff ff       	call   80100370 <panic>
  p->tf->esp = STACKBASE;
  p->tf->ebp = STACKBASE;
  p->tf->eip = 0;  // beginning of initcode.S

  if (allocuvm(p->pgdir, PGROUNDDOWN(STACKBASE), STACKBASE) == 0) {
     panic("Allocation failed proc.c");
80103893:	83 ec 0c             	sub    $0xc,%esp
80103896:	68 85 75 10 80       	push   $0x80107585
8010389b:	e8 d0 ca ff ff       	call   80100370 <panic>

801038a0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	56                   	push   %esi
801038a4:	53                   	push   %ebx
801038a5:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801038a8:	e8 b3 09 00 00       	call   80104260 <pushcli>
  c = mycpu();
801038ad:	e8 fe fd ff ff       	call   801036b0 <mycpu>
  p = c->proc;
801038b2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038b8:	e8 93 0a 00 00       	call   80104350 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801038bd:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801038c0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038c2:	7e 34                	jle    801038f8 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038c4:	83 ec 04             	sub    $0x4,%esp
801038c7:	01 c6                	add    %eax,%esi
801038c9:	56                   	push   %esi
801038ca:	50                   	push   %eax
801038cb:	ff 73 04             	pushl  0x4(%ebx)
801038ce:	e8 9d 31 00 00       	call   80106a70 <allocuvm>
801038d3:	83 c4 10             	add    $0x10,%esp
801038d6:	85 c0                	test   %eax,%eax
801038d8:	74 36                	je     80103910 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801038da:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801038dd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038df:	53                   	push   %ebx
801038e0:	e8 3b 2f 00 00       	call   80106820 <switchuvm>
  return 0;
801038e5:	83 c4 10             	add    $0x10,%esp
801038e8:	31 c0                	xor    %eax,%eax
}
801038ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038ed:	5b                   	pop    %ebx
801038ee:	5e                   	pop    %esi
801038ef:	5d                   	pop    %ebp
801038f0:	c3                   	ret    
801038f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801038f8:	74 e0                	je     801038da <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038fa:	83 ec 04             	sub    $0x4,%esp
801038fd:	01 c6                	add    %eax,%esi
801038ff:	56                   	push   %esi
80103900:	50                   	push   %eax
80103901:	ff 73 04             	pushl  0x4(%ebx)
80103904:	e8 67 32 00 00       	call   80106b70 <deallocuvm>
80103909:	83 c4 10             	add    $0x10,%esp
8010390c:	85 c0                	test   %eax,%eax
8010390e:	75 ca                	jne    801038da <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103915:	eb d3                	jmp    801038ea <growproc+0x4a>
80103917:	89 f6                	mov    %esi,%esi
80103919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103920 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103920:	55                   	push   %ebp
80103921:	89 e5                	mov    %esp,%ebp
80103923:	57                   	push   %edi
80103924:	56                   	push   %esi
80103925:	53                   	push   %ebx
80103926:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103929:	e8 32 09 00 00       	call   80104260 <pushcli>
  c = mycpu();
8010392e:	e8 7d fd ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103933:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103939:	e8 12 0a 00 00       	call   80104350 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010393e:	e8 3d fc ff ff       	call   80103580 <allocproc>
80103943:	85 c0                	test   %eax,%eax
80103945:	89 c7                	mov    %eax,%edi
80103947:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010394a:	0f 84 b5 00 00 00    	je     80103a05 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc)) == 0){
80103950:	83 ec 0c             	sub    $0xc,%esp
80103953:	53                   	push   %ebx
80103954:	e8 97 33 00 00       	call   80106cf0 <copyuvm>
80103959:	83 c4 10             	add    $0x10,%esp
8010395c:	85 c0                	test   %eax,%eax
8010395e:	89 47 04             	mov    %eax,0x4(%edi)
80103961:	0f 84 a5 00 00 00    	je     80103a0c <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
80103967:	8b 03                	mov    (%ebx),%eax
80103969:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010396c:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
8010396e:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103971:	89 c8                	mov    %ecx,%eax
80103973:	8b 79 18             	mov    0x18(%ecx),%edi
80103976:	8b 73 18             	mov    0x18(%ebx),%esi
80103979:	b9 13 00 00 00       	mov    $0x13,%ecx
8010397e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103980:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103982:	8b 40 18             	mov    0x18(%eax),%eax
80103985:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
8010398c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103990:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103994:	85 c0                	test   %eax,%eax
80103996:	74 13                	je     801039ab <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103998:	83 ec 0c             	sub    $0xc,%esp
8010399b:	50                   	push   %eax
8010399c:	e8 0f d4 ff ff       	call   80100db0 <filedup>
801039a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039a4:	83 c4 10             	add    $0x10,%esp
801039a7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039ab:	83 c6 01             	add    $0x1,%esi
801039ae:	83 fe 10             	cmp    $0x10,%esi
801039b1:	75 dd                	jne    80103990 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039b3:	83 ec 0c             	sub    $0xc,%esp
801039b6:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039b9:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039bc:	e8 4f dc ff ff       	call   80101610 <idup>
801039c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039c4:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039c7:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ca:	8d 47 6c             	lea    0x6c(%edi),%eax
801039cd:	6a 10                	push   $0x10
801039cf:	53                   	push   %ebx
801039d0:	50                   	push   %eax
801039d1:	e8 3a 0c 00 00       	call   80104610 <safestrcpy>

  pid = np->pid;
801039d6:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
801039d9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039e0:	e8 bb 08 00 00       	call   801042a0 <acquire>

  np->state = RUNNABLE;
801039e5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
801039ec:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039f3:	e8 c8 09 00 00       	call   801043c0 <release>

  return pid;
801039f8:	83 c4 10             	add    $0x10,%esp
801039fb:	89 d8                	mov    %ebx,%eax
}
801039fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a00:	5b                   	pop    %ebx
80103a01:	5e                   	pop    %esi
80103a02:	5f                   	pop    %edi
80103a03:	5d                   	pop    %ebp
80103a04:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a0a:	eb f1                	jmp    801039fd <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc)) == 0){
    kfree(np->kstack);
80103a0c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a0f:	83 ec 0c             	sub    $0xc,%esp
80103a12:	ff 77 08             	pushl  0x8(%edi)
80103a15:	e8 96 e8 ff ff       	call   801022b0 <kfree>
    np->kstack = 0;
80103a1a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a21:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a28:	83 c4 10             	add    $0x10,%esp
80103a2b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a30:	eb cb                	jmp    801039fd <fork+0xdd>
80103a32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a40 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	57                   	push   %edi
80103a44:	56                   	push   %esi
80103a45:	53                   	push   %ebx
80103a46:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103a49:	e8 62 fc ff ff       	call   801036b0 <mycpu>
80103a4e:	8d 78 04             	lea    0x4(%eax),%edi
80103a51:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a53:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a5a:	00 00 00 
80103a5d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a60:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a61:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a64:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a69:	68 20 2d 11 80       	push   $0x80112d20
80103a6e:	e8 2d 08 00 00       	call   801042a0 <acquire>
80103a73:	83 c4 10             	add    $0x10,%esp
80103a76:	eb 13                	jmp    80103a8b <scheduler+0x4b>
80103a78:	90                   	nop
80103a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a80:	83 eb 80             	sub    $0xffffff80,%ebx
80103a83:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103a89:	74 45                	je     80103ad0 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103a8b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a8f:	75 ef                	jne    80103a80 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103a91:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103a94:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103a9a:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a9b:	83 eb 80             	sub    $0xffffff80,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103a9e:	e8 7d 2d 00 00       	call   80106820 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103aa3:	58                   	pop    %eax
80103aa4:	5a                   	pop    %edx
80103aa5:	ff 73 9c             	pushl  -0x64(%ebx)
80103aa8:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103aa9:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)

      swtch(&(c->scheduler), p->context);
80103ab0:	e8 b6 0b 00 00       	call   8010466b <swtch>
      switchkvm();
80103ab5:	e8 46 2d 00 00       	call   80106800 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103aba:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103abd:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ac3:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103aca:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103acd:	75 bc                	jne    80103a8b <scheduler+0x4b>
80103acf:	90                   	nop

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103ad0:	83 ec 0c             	sub    $0xc,%esp
80103ad3:	68 20 2d 11 80       	push   $0x80112d20
80103ad8:	e8 e3 08 00 00       	call   801043c0 <release>

  }
80103add:	83 c4 10             	add    $0x10,%esp
80103ae0:	e9 7b ff ff ff       	jmp    80103a60 <scheduler+0x20>
80103ae5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103af0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103af0:	55                   	push   %ebp
80103af1:	89 e5                	mov    %esp,%ebp
80103af3:	56                   	push   %esi
80103af4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103af5:	e8 66 07 00 00       	call   80104260 <pushcli>
  c = mycpu();
80103afa:	e8 b1 fb ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103aff:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b05:	e8 46 08 00 00       	call   80104350 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b0a:	83 ec 0c             	sub    $0xc,%esp
80103b0d:	68 20 2d 11 80       	push   $0x80112d20
80103b12:	e8 09 07 00 00       	call   80104220 <holding>
80103b17:	83 c4 10             	add    $0x10,%esp
80103b1a:	85 c0                	test   %eax,%eax
80103b1c:	74 4f                	je     80103b6d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b1e:	e8 8d fb ff ff       	call   801036b0 <mycpu>
80103b23:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b2a:	75 68                	jne    80103b94 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b2c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b30:	74 55                	je     80103b87 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b32:	9c                   	pushf  
80103b33:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b34:	f6 c4 02             	test   $0x2,%ah
80103b37:	75 41                	jne    80103b7a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b39:	e8 72 fb ff ff       	call   801036b0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b3e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b41:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b47:	e8 64 fb ff ff       	call   801036b0 <mycpu>
80103b4c:	83 ec 08             	sub    $0x8,%esp
80103b4f:	ff 70 04             	pushl  0x4(%eax)
80103b52:	53                   	push   %ebx
80103b53:	e8 13 0b 00 00       	call   8010466b <swtch>
  mycpu()->intena = intena;
80103b58:	e8 53 fb ff ff       	call   801036b0 <mycpu>
}
80103b5d:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103b60:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103b66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b69:	5b                   	pop    %ebx
80103b6a:	5e                   	pop    %esi
80103b6b:	5d                   	pop    %ebp
80103b6c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b6d:	83 ec 0c             	sub    $0xc,%esp
80103b70:	68 a9 75 10 80       	push   $0x801075a9
80103b75:	e8 f6 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b7a:	83 ec 0c             	sub    $0xc,%esp
80103b7d:	68 d5 75 10 80       	push   $0x801075d5
80103b82:	e8 e9 c7 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103b87:	83 ec 0c             	sub    $0xc,%esp
80103b8a:	68 c7 75 10 80       	push   $0x801075c7
80103b8f:	e8 dc c7 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103b94:	83 ec 0c             	sub    $0xc,%esp
80103b97:	68 bb 75 10 80       	push   $0x801075bb
80103b9c:	e8 cf c7 ff ff       	call   80100370 <panic>
80103ba1:	eb 0d                	jmp    80103bb0 <exit>
80103ba3:	90                   	nop
80103ba4:	90                   	nop
80103ba5:	90                   	nop
80103ba6:	90                   	nop
80103ba7:	90                   	nop
80103ba8:	90                   	nop
80103ba9:	90                   	nop
80103baa:	90                   	nop
80103bab:	90                   	nop
80103bac:	90                   	nop
80103bad:	90                   	nop
80103bae:	90                   	nop
80103baf:	90                   	nop

80103bb0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	57                   	push   %edi
80103bb4:	56                   	push   %esi
80103bb5:	53                   	push   %ebx
80103bb6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103bb9:	e8 a2 06 00 00       	call   80104260 <pushcli>
  c = mycpu();
80103bbe:	e8 ed fa ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103bc3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103bc9:	e8 82 07 00 00       	call   80104350 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103bce:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103bd4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bd7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bda:	0f 84 e7 00 00 00    	je     80103cc7 <exit+0x117>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103be0:	8b 03                	mov    (%ebx),%eax
80103be2:	85 c0                	test   %eax,%eax
80103be4:	74 12                	je     80103bf8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103be6:	83 ec 0c             	sub    $0xc,%esp
80103be9:	50                   	push   %eax
80103bea:	e8 11 d2 ff ff       	call   80100e00 <fileclose>
      curproc->ofile[fd] = 0;
80103bef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103bf5:	83 c4 10             	add    $0x10,%esp
80103bf8:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103bfb:	39 df                	cmp    %ebx,%edi
80103bfd:	75 e1                	jne    80103be0 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103bff:	e8 1c ef ff ff       	call   80102b20 <begin_op>
  iput(curproc->cwd);
80103c04:	83 ec 0c             	sub    $0xc,%esp
80103c07:	ff 76 68             	pushl  0x68(%esi)
80103c0a:	e8 61 db ff ff       	call   80101770 <iput>
  end_op();
80103c0f:	e8 7c ef ff ff       	call   80102b90 <end_op>
  curproc->cwd = 0;
80103c14:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c1b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c22:	e8 79 06 00 00       	call   801042a0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c27:	8b 56 14             	mov    0x14(%esi),%edx
80103c2a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c2d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c32:	eb 0e                	jmp    80103c42 <exit+0x92>
80103c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c38:	83 e8 80             	sub    $0xffffff80,%eax
80103c3b:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c40:	74 1c                	je     80103c5e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103c42:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c46:	75 f0                	jne    80103c38 <exit+0x88>
80103c48:	3b 50 20             	cmp    0x20(%eax),%edx
80103c4b:	75 eb                	jne    80103c38 <exit+0x88>
      p->state = RUNNABLE;
80103c4d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c54:	83 e8 80             	sub    $0xffffff80,%eax
80103c57:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c5c:	75 e4                	jne    80103c42 <exit+0x92>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c5e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103c64:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103c69:	eb 10                	jmp    80103c7b <exit+0xcb>
80103c6b:	90                   	nop
80103c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c70:	83 ea 80             	sub    $0xffffff80,%edx
80103c73:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103c79:	74 33                	je     80103cae <exit+0xfe>
    if(p->parent == curproc){
80103c7b:	39 72 14             	cmp    %esi,0x14(%edx)
80103c7e:	75 f0                	jne    80103c70 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103c80:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c84:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103c87:	75 e7                	jne    80103c70 <exit+0xc0>
80103c89:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c8e:	eb 0a                	jmp    80103c9a <exit+0xea>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c90:	83 e8 80             	sub    $0xffffff80,%eax
80103c93:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c98:	74 d6                	je     80103c70 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103c9a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c9e:	75 f0                	jne    80103c90 <exit+0xe0>
80103ca0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ca3:	75 eb                	jne    80103c90 <exit+0xe0>
      p->state = RUNNABLE;
80103ca5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cac:	eb e2                	jmp    80103c90 <exit+0xe0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103cae:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103cb5:	e8 36 fe ff ff       	call   80103af0 <sched>
  panic("zombie exit");
80103cba:	83 ec 0c             	sub    $0xc,%esp
80103cbd:	68 f6 75 10 80       	push   $0x801075f6
80103cc2:	e8 a9 c6 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103cc7:	83 ec 0c             	sub    $0xc,%esp
80103cca:	68 e9 75 10 80       	push   $0x801075e9
80103ccf:	e8 9c c6 ff ff       	call   80100370 <panic>
80103cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ce0 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	53                   	push   %ebx
80103ce4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ce7:	68 20 2d 11 80       	push   $0x80112d20
80103cec:	e8 af 05 00 00       	call   801042a0 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103cf1:	e8 6a 05 00 00       	call   80104260 <pushcli>
  c = mycpu();
80103cf6:	e8 b5 f9 ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103cfb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d01:	e8 4a 06 00 00       	call   80104350 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d06:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d0d:	e8 de fd ff ff       	call   80103af0 <sched>
  release(&ptable.lock);
80103d12:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d19:	e8 a2 06 00 00       	call   801043c0 <release>
}
80103d1e:	83 c4 10             	add    $0x10,%esp
80103d21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d24:	c9                   	leave  
80103d25:	c3                   	ret    
80103d26:	8d 76 00             	lea    0x0(%esi),%esi
80103d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d30 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	57                   	push   %edi
80103d34:	56                   	push   %esi
80103d35:	53                   	push   %ebx
80103d36:	83 ec 0c             	sub    $0xc,%esp
80103d39:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d3c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d3f:	e8 1c 05 00 00       	call   80104260 <pushcli>
  c = mycpu();
80103d44:	e8 67 f9 ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103d49:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d4f:	e8 fc 05 00 00       	call   80104350 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103d54:	85 db                	test   %ebx,%ebx
80103d56:	0f 84 87 00 00 00    	je     80103de3 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103d5c:	85 f6                	test   %esi,%esi
80103d5e:	74 76                	je     80103dd6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d60:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103d66:	74 50                	je     80103db8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d68:	83 ec 0c             	sub    $0xc,%esp
80103d6b:	68 20 2d 11 80       	push   $0x80112d20
80103d70:	e8 2b 05 00 00       	call   801042a0 <acquire>
    release(lk);
80103d75:	89 34 24             	mov    %esi,(%esp)
80103d78:	e8 43 06 00 00       	call   801043c0 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103d7d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103d80:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103d87:	e8 64 fd ff ff       	call   80103af0 <sched>

  // Tidy up.
  p->chan = 0;
80103d8c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103d93:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d9a:	e8 21 06 00 00       	call   801043c0 <release>
    acquire(lk);
80103d9f:	89 75 08             	mov    %esi,0x8(%ebp)
80103da2:	83 c4 10             	add    $0x10,%esp
  }
}
80103da5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103da8:	5b                   	pop    %ebx
80103da9:	5e                   	pop    %esi
80103daa:	5f                   	pop    %edi
80103dab:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103dac:	e9 ef 04 00 00       	jmp    801042a0 <acquire>
80103db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103db8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103dbb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103dc2:	e8 29 fd ff ff       	call   80103af0 <sched>

  // Tidy up.
  p->chan = 0;
80103dc7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dd1:	5b                   	pop    %ebx
80103dd2:	5e                   	pop    %esi
80103dd3:	5f                   	pop    %edi
80103dd4:	5d                   	pop    %ebp
80103dd5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103dd6:	83 ec 0c             	sub    $0xc,%esp
80103dd9:	68 08 76 10 80       	push   $0x80107608
80103dde:	e8 8d c5 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103de3:	83 ec 0c             	sub    $0xc,%esp
80103de6:	68 02 76 10 80       	push   $0x80107602
80103deb:	e8 80 c5 ff ff       	call   80100370 <panic>

80103df0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103df0:	55                   	push   %ebp
80103df1:	89 e5                	mov    %esp,%ebp
80103df3:	56                   	push   %esi
80103df4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103df5:	e8 66 04 00 00       	call   80104260 <pushcli>
  c = mycpu();
80103dfa:	e8 b1 f8 ff ff       	call   801036b0 <mycpu>
  p = c->proc;
80103dff:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e05:	e8 46 05 00 00       	call   80104350 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e0a:	83 ec 0c             	sub    $0xc,%esp
80103e0d:	68 20 2d 11 80       	push   $0x80112d20
80103e12:	e8 89 04 00 00       	call   801042a0 <acquire>
80103e17:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e1a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e1c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e21:	eb 10                	jmp    80103e33 <wait+0x43>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	83 eb 80             	sub    $0xffffff80,%ebx
80103e2b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e31:	74 1d                	je     80103e50 <wait+0x60>
      if(p->parent != curproc)
80103e33:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e36:	75 f0                	jne    80103e28 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e38:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e3c:	74 30                	je     80103e6e <wait+0x7e>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e3e:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103e41:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e46:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e4c:	75 e5                	jne    80103e33 <wait+0x43>
80103e4e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103e50:	85 c0                	test   %eax,%eax
80103e52:	74 70                	je     80103ec4 <wait+0xd4>
80103e54:	8b 46 24             	mov    0x24(%esi),%eax
80103e57:	85 c0                	test   %eax,%eax
80103e59:	75 69                	jne    80103ec4 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103e5b:	83 ec 08             	sub    $0x8,%esp
80103e5e:	68 20 2d 11 80       	push   $0x80112d20
80103e63:	56                   	push   %esi
80103e64:	e8 c7 fe ff ff       	call   80103d30 <sleep>
  }
80103e69:	83 c4 10             	add    $0x10,%esp
80103e6c:	eb ac                	jmp    80103e1a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e6e:	83 ec 0c             	sub    $0xc,%esp
80103e71:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e74:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e77:	e8 34 e4 ff ff       	call   801022b0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103e7c:	5a                   	pop    %edx
80103e7d:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103e80:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103e87:	e8 14 2d 00 00       	call   80106ba0 <freevm>
        p->pid = 0;
80103e8c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103e93:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103e9a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103e9e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ea5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103eac:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103eb3:	e8 08 05 00 00       	call   801043c0 <release>
        return pid;
80103eb8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ebb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ebe:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ec0:	5b                   	pop    %ebx
80103ec1:	5e                   	pop    %esi
80103ec2:	5d                   	pop    %ebp
80103ec3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103ec4:	83 ec 0c             	sub    $0xc,%esp
80103ec7:	68 20 2d 11 80       	push   $0x80112d20
80103ecc:	e8 ef 04 00 00       	call   801043c0 <release>
      return -1;
80103ed1:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103ed7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103edc:	5b                   	pop    %ebx
80103edd:	5e                   	pop    %esi
80103ede:	5d                   	pop    %ebp
80103edf:	c3                   	ret    

80103ee0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	53                   	push   %ebx
80103ee4:	83 ec 10             	sub    $0x10,%esp
80103ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103eea:	68 20 2d 11 80       	push   $0x80112d20
80103eef:	e8 ac 03 00 00       	call   801042a0 <acquire>
80103ef4:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ef7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103efc:	eb 0c                	jmp    80103f0a <wakeup+0x2a>
80103efe:	66 90                	xchg   %ax,%ax
80103f00:	83 e8 80             	sub    $0xffffff80,%eax
80103f03:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f08:	74 1c                	je     80103f26 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f0a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f0e:	75 f0                	jne    80103f00 <wakeup+0x20>
80103f10:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f13:	75 eb                	jne    80103f00 <wakeup+0x20>
      p->state = RUNNABLE;
80103f15:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f1c:	83 e8 80             	sub    $0xffffff80,%eax
80103f1f:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f24:	75 e4                	jne    80103f0a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f26:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103f2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f30:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f31:	e9 8a 04 00 00       	jmp    801043c0 <release>
80103f36:	8d 76 00             	lea    0x0(%esi),%esi
80103f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f40 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f4a:	68 20 2d 11 80       	push   $0x80112d20
80103f4f:	e8 4c 03 00 00       	call   801042a0 <acquire>
80103f54:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f57:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f5c:	eb 0c                	jmp    80103f6a <kill+0x2a>
80103f5e:	66 90                	xchg   %ax,%ax
80103f60:	83 e8 80             	sub    $0xffffff80,%eax
80103f63:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f68:	74 3e                	je     80103fa8 <kill+0x68>
    if(p->pid == pid){
80103f6a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f6d:	75 f1                	jne    80103f60 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f6f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103f73:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f7a:	74 1c                	je     80103f98 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103f7c:	83 ec 0c             	sub    $0xc,%esp
80103f7f:	68 20 2d 11 80       	push   $0x80112d20
80103f84:	e8 37 04 00 00       	call   801043c0 <release>
      return 0;
80103f89:	83 c4 10             	add    $0x10,%esp
80103f8c:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f91:	c9                   	leave  
80103f92:	c3                   	ret    
80103f93:	90                   	nop
80103f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103f98:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f9f:	eb db                	jmp    80103f7c <kill+0x3c>
80103fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103fa8:	83 ec 0c             	sub    $0xc,%esp
80103fab:	68 20 2d 11 80       	push   $0x80112d20
80103fb0:	e8 0b 04 00 00       	call   801043c0 <release>
  return -1;
80103fb5:	83 c4 10             	add    $0x10,%esp
80103fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103fbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc0:	c9                   	leave  
80103fc1:	c3                   	ret    
80103fc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fd0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	57                   	push   %edi
80103fd4:	56                   	push   %esi
80103fd5:	53                   	push   %ebx
80103fd6:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103fd9:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80103fde:	83 ec 3c             	sub    $0x3c,%esp
80103fe1:	eb 24                	jmp    80104007 <procdump+0x37>
80103fe3:	90                   	nop
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103fe8:	83 ec 0c             	sub    $0xc,%esp
80103feb:	68 1b 7a 10 80       	push   $0x80107a1b
80103ff0:	e8 6b c6 ff ff       	call   80100660 <cprintf>
80103ff5:	83 c4 10             	add    $0x10,%esp
80103ff8:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ffb:	81 fb c0 4d 11 80    	cmp    $0x80114dc0,%ebx
80104001:	0f 84 81 00 00 00    	je     80104088 <procdump+0xb8>
    if(p->state == UNUSED)
80104007:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010400a:	85 c0                	test   %eax,%eax
8010400c:	74 ea                	je     80103ff8 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010400e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104011:	ba 19 76 10 80       	mov    $0x80107619,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104016:	77 11                	ja     80104029 <procdump+0x59>
80104018:	8b 14 85 78 76 10 80 	mov    -0x7fef8988(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010401f:	b8 19 76 10 80       	mov    $0x80107619,%eax
80104024:	85 d2                	test   %edx,%edx
80104026:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104029:	53                   	push   %ebx
8010402a:	52                   	push   %edx
8010402b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010402e:	68 1d 76 10 80       	push   $0x8010761d
80104033:	e8 28 c6 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104038:	83 c4 10             	add    $0x10,%esp
8010403b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010403f:	75 a7                	jne    80103fe8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104041:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104044:	83 ec 08             	sub    $0x8,%esp
80104047:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010404a:	50                   	push   %eax
8010404b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010404e:	8b 40 0c             	mov    0xc(%eax),%eax
80104051:	83 c0 08             	add    $0x8,%eax
80104054:	50                   	push   %eax
80104055:	e8 66 01 00 00       	call   801041c0 <getcallerpcs>
8010405a:	83 c4 10             	add    $0x10,%esp
8010405d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104060:	8b 17                	mov    (%edi),%edx
80104062:	85 d2                	test   %edx,%edx
80104064:	74 82                	je     80103fe8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104066:	83 ec 08             	sub    $0x8,%esp
80104069:	83 c7 04             	add    $0x4,%edi
8010406c:	52                   	push   %edx
8010406d:	68 41 70 10 80       	push   $0x80107041
80104072:	e8 e9 c5 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104077:	83 c4 10             	add    $0x10,%esp
8010407a:	39 f7                	cmp    %esi,%edi
8010407c:	75 e2                	jne    80104060 <procdump+0x90>
8010407e:	e9 65 ff ff ff       	jmp    80103fe8 <procdump+0x18>
80104083:	90                   	nop
80104084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104088:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010408b:	5b                   	pop    %ebx
8010408c:	5e                   	pop    %esi
8010408d:	5f                   	pop    %edi
8010408e:	5d                   	pop    %ebp
8010408f:	c3                   	ret    

80104090 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	53                   	push   %ebx
80104094:	83 ec 0c             	sub    $0xc,%esp
80104097:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010409a:	68 90 76 10 80       	push   $0x80107690
8010409f:	8d 43 04             	lea    0x4(%ebx),%eax
801040a2:	50                   	push   %eax
801040a3:	e8 f8 00 00 00       	call   801041a0 <initlock>
  lk->name = name;
801040a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801040ab:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801040b1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801040b4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801040bb:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801040be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040c1:	c9                   	leave  
801040c2:	c3                   	ret    
801040c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801040c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040d0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	56                   	push   %esi
801040d4:	53                   	push   %ebx
801040d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801040d8:	83 ec 0c             	sub    $0xc,%esp
801040db:	8d 73 04             	lea    0x4(%ebx),%esi
801040de:	56                   	push   %esi
801040df:	e8 bc 01 00 00       	call   801042a0 <acquire>
  while (lk->locked) {
801040e4:	8b 13                	mov    (%ebx),%edx
801040e6:	83 c4 10             	add    $0x10,%esp
801040e9:	85 d2                	test   %edx,%edx
801040eb:	74 16                	je     80104103 <acquiresleep+0x33>
801040ed:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801040f0:	83 ec 08             	sub    $0x8,%esp
801040f3:	56                   	push   %esi
801040f4:	53                   	push   %ebx
801040f5:	e8 36 fc ff ff       	call   80103d30 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801040fa:	8b 03                	mov    (%ebx),%eax
801040fc:	83 c4 10             	add    $0x10,%esp
801040ff:	85 c0                	test   %eax,%eax
80104101:	75 ed                	jne    801040f0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104103:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104109:	e8 42 f6 ff ff       	call   80103750 <myproc>
8010410e:	8b 40 10             	mov    0x10(%eax),%eax
80104111:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104114:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104117:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010411a:	5b                   	pop    %ebx
8010411b:	5e                   	pop    %esi
8010411c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010411d:	e9 9e 02 00 00       	jmp    801043c0 <release>
80104122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104130 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	56                   	push   %esi
80104134:	53                   	push   %ebx
80104135:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104138:	83 ec 0c             	sub    $0xc,%esp
8010413b:	8d 73 04             	lea    0x4(%ebx),%esi
8010413e:	56                   	push   %esi
8010413f:	e8 5c 01 00 00       	call   801042a0 <acquire>
  lk->locked = 0;
80104144:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010414a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104151:	89 1c 24             	mov    %ebx,(%esp)
80104154:	e8 87 fd ff ff       	call   80103ee0 <wakeup>
  release(&lk->lk);
80104159:	89 75 08             	mov    %esi,0x8(%ebp)
8010415c:	83 c4 10             	add    $0x10,%esp
}
8010415f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104162:	5b                   	pop    %ebx
80104163:	5e                   	pop    %esi
80104164:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104165:	e9 56 02 00 00       	jmp    801043c0 <release>
8010416a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104170 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	56                   	push   %esi
80104174:	53                   	push   %ebx
80104175:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104178:	83 ec 0c             	sub    $0xc,%esp
8010417b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010417e:	53                   	push   %ebx
8010417f:	e8 1c 01 00 00       	call   801042a0 <acquire>
  r = lk->locked;
80104184:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104186:	89 1c 24             	mov    %ebx,(%esp)
80104189:	e8 32 02 00 00       	call   801043c0 <release>
  return r;
}
8010418e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104191:	89 f0                	mov    %esi,%eax
80104193:	5b                   	pop    %ebx
80104194:	5e                   	pop    %esi
80104195:	5d                   	pop    %ebp
80104196:	c3                   	ret    
80104197:	66 90                	xchg   %ax,%ax
80104199:	66 90                	xchg   %ax,%ax
8010419b:	66 90                	xchg   %ax,%ax
8010419d:	66 90                	xchg   %ax,%ax
8010419f:	90                   	nop

801041a0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801041a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801041a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801041af:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801041b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801041b9:	5d                   	pop    %ebp
801041ba:	c3                   	ret    
801041bb:	90                   	nop
801041bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041c0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801041c4:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801041c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801041ca:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801041cd:	31 c0                	xor    %eax,%eax
801041cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801041d0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801041d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801041dc:	77 1a                	ja     801041f8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801041de:	8b 5a 04             	mov    0x4(%edx),%ebx
801041e1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801041e4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801041e7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801041e9:	83 f8 0a             	cmp    $0xa,%eax
801041ec:	75 e2                	jne    801041d0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801041ee:	5b                   	pop    %ebx
801041ef:	5d                   	pop    %ebp
801041f0:	c3                   	ret    
801041f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801041f8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801041ff:	83 c0 01             	add    $0x1,%eax
80104202:	83 f8 0a             	cmp    $0xa,%eax
80104205:	74 e7                	je     801041ee <getcallerpcs+0x2e>
    pcs[i] = 0;
80104207:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010420e:	83 c0 01             	add    $0x1,%eax
80104211:	83 f8 0a             	cmp    $0xa,%eax
80104214:	75 e2                	jne    801041f8 <getcallerpcs+0x38>
80104216:	eb d6                	jmp    801041ee <getcallerpcs+0x2e>
80104218:	90                   	nop
80104219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104220 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	53                   	push   %ebx
80104224:	83 ec 04             	sub    $0x4,%esp
80104227:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
8010422a:	8b 02                	mov    (%edx),%eax
8010422c:	85 c0                	test   %eax,%eax
8010422e:	75 10                	jne    80104240 <holding+0x20>
}
80104230:	83 c4 04             	add    $0x4,%esp
80104233:	31 c0                	xor    %eax,%eax
80104235:	5b                   	pop    %ebx
80104236:	5d                   	pop    %ebp
80104237:	c3                   	ret    
80104238:	90                   	nop
80104239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104240:	8b 5a 08             	mov    0x8(%edx),%ebx
80104243:	e8 68 f4 ff ff       	call   801036b0 <mycpu>
80104248:	39 c3                	cmp    %eax,%ebx
8010424a:	0f 94 c0             	sete   %al
}
8010424d:	83 c4 04             	add    $0x4,%esp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104250:	0f b6 c0             	movzbl %al,%eax
}
80104253:	5b                   	pop    %ebx
80104254:	5d                   	pop    %ebp
80104255:	c3                   	ret    
80104256:	8d 76 00             	lea    0x0(%esi),%esi
80104259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104260 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	53                   	push   %ebx
80104264:	83 ec 04             	sub    $0x4,%esp
80104267:	9c                   	pushf  
80104268:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104269:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010426a:	e8 41 f4 ff ff       	call   801036b0 <mycpu>
8010426f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104275:	85 c0                	test   %eax,%eax
80104277:	75 11                	jne    8010428a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104279:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010427f:	e8 2c f4 ff ff       	call   801036b0 <mycpu>
80104284:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010428a:	e8 21 f4 ff ff       	call   801036b0 <mycpu>
8010428f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104296:	83 c4 04             	add    $0x4,%esp
80104299:	5b                   	pop    %ebx
8010429a:	5d                   	pop    %ebp
8010429b:	c3                   	ret    
8010429c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042a0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	56                   	push   %esi
801042a4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801042a5:	e8 b6 ff ff ff       	call   80104260 <pushcli>
  if(holding(lk))
801042aa:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801042ad:	8b 03                	mov    (%ebx),%eax
801042af:	85 c0                	test   %eax,%eax
801042b1:	75 7d                	jne    80104330 <acquire+0x90>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801042b3:	ba 01 00 00 00       	mov    $0x1,%edx
801042b8:	eb 09                	jmp    801042c3 <acquire+0x23>
801042ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042c3:	89 d0                	mov    %edx,%eax
801042c5:	f0 87 03             	lock xchg %eax,(%ebx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
801042c8:	85 c0                	test   %eax,%eax
801042ca:	75 f4                	jne    801042c0 <acquire+0x20>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
801042cc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
801042d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042d4:	e8 d7 f3 ff ff       	call   801036b0 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801042d9:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
801042db:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
801042de:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801042e1:	31 c0                	xor    %eax,%eax
801042e3:	90                   	nop
801042e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801042e8:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801042ee:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801042f4:	77 1a                	ja     80104310 <acquire+0x70>
      break;
    pcs[i] = ebp[1];     // saved %eip
801042f6:	8b 5a 04             	mov    0x4(%edx),%ebx
801042f9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801042fc:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801042ff:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104301:	83 f8 0a             	cmp    $0xa,%eax
80104304:	75 e2                	jne    801042e8 <acquire+0x48>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
80104306:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104309:	5b                   	pop    %ebx
8010430a:	5e                   	pop    %esi
8010430b:	5d                   	pop    %ebp
8010430c:	c3                   	ret    
8010430d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104310:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104317:	83 c0 01             	add    $0x1,%eax
8010431a:	83 f8 0a             	cmp    $0xa,%eax
8010431d:	74 e7                	je     80104306 <acquire+0x66>
    pcs[i] = 0;
8010431f:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104326:	83 c0 01             	add    $0x1,%eax
80104329:	83 f8 0a             	cmp    $0xa,%eax
8010432c:	75 e2                	jne    80104310 <acquire+0x70>
8010432e:	eb d6                	jmp    80104306 <acquire+0x66>

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104330:	8b 73 08             	mov    0x8(%ebx),%esi
80104333:	e8 78 f3 ff ff       	call   801036b0 <mycpu>
80104338:	39 c6                	cmp    %eax,%esi
8010433a:	0f 85 73 ff ff ff    	jne    801042b3 <acquire+0x13>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104340:	83 ec 0c             	sub    $0xc,%esp
80104343:	68 9b 76 10 80       	push   $0x8010769b
80104348:	e8 23 c0 ff ff       	call   80100370 <panic>
8010434d:	8d 76 00             	lea    0x0(%esi),%esi

80104350 <popcli>:
  mycpu()->ncli += 1;
}

void
popcli(void)
{
80104350:	55                   	push   %ebp
80104351:	89 e5                	mov    %esp,%ebp
80104353:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104356:	9c                   	pushf  
80104357:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104358:	f6 c4 02             	test   $0x2,%ah
8010435b:	75 52                	jne    801043af <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010435d:	e8 4e f3 ff ff       	call   801036b0 <mycpu>
80104362:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104368:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010436b:	85 d2                	test   %edx,%edx
8010436d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104373:	78 2d                	js     801043a2 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104375:	e8 36 f3 ff ff       	call   801036b0 <mycpu>
8010437a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104380:	85 d2                	test   %edx,%edx
80104382:	74 0c                	je     80104390 <popcli+0x40>
    sti();
}
80104384:	c9                   	leave  
80104385:	c3                   	ret    
80104386:	8d 76 00             	lea    0x0(%esi),%esi
80104389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104390:	e8 1b f3 ff ff       	call   801036b0 <mycpu>
80104395:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010439b:	85 c0                	test   %eax,%eax
8010439d:	74 e5                	je     80104384 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
8010439f:	fb                   	sti    
    sti();
}
801043a0:	c9                   	leave  
801043a1:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
801043a2:	83 ec 0c             	sub    $0xc,%esp
801043a5:	68 ba 76 10 80       	push   $0x801076ba
801043aa:	e8 c1 bf ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801043af:	83 ec 0c             	sub    $0xc,%esp
801043b2:	68 a3 76 10 80       	push   $0x801076a3
801043b7:	e8 b4 bf ff ff       	call   80100370 <panic>
801043bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043c0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	56                   	push   %esi
801043c4:	53                   	push   %ebx
801043c5:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801043c8:	8b 03                	mov    (%ebx),%eax
801043ca:	85 c0                	test   %eax,%eax
801043cc:	75 12                	jne    801043e0 <release+0x20>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
801043ce:	83 ec 0c             	sub    $0xc,%esp
801043d1:	68 c1 76 10 80       	push   $0x801076c1
801043d6:	e8 95 bf ff ff       	call   80100370 <panic>
801043db:	90                   	nop
801043dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801043e0:	8b 73 08             	mov    0x8(%ebx),%esi
801043e3:	e8 c8 f2 ff ff       	call   801036b0 <mycpu>
801043e8:	39 c6                	cmp    %eax,%esi
801043ea:	75 e2                	jne    801043ce <release+0xe>
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");

  lk->pcs[0] = 0;
801043ec:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801043f3:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
801043fa:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801043ff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
80104405:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104408:	5b                   	pop    %ebx
80104409:	5e                   	pop    %esi
8010440a:	5d                   	pop    %ebp
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
8010440b:	e9 40 ff ff ff       	jmp    80104350 <popcli>

80104410 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	57                   	push   %edi
80104414:	53                   	push   %ebx
80104415:	8b 55 08             	mov    0x8(%ebp),%edx
80104418:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010441b:	f6 c2 03             	test   $0x3,%dl
8010441e:	75 05                	jne    80104425 <memset+0x15>
80104420:	f6 c1 03             	test   $0x3,%cl
80104423:	74 13                	je     80104438 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104425:	89 d7                	mov    %edx,%edi
80104427:	8b 45 0c             	mov    0xc(%ebp),%eax
8010442a:	fc                   	cld    
8010442b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010442d:	5b                   	pop    %ebx
8010442e:	89 d0                	mov    %edx,%eax
80104430:	5f                   	pop    %edi
80104431:	5d                   	pop    %ebp
80104432:	c3                   	ret    
80104433:	90                   	nop
80104434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104438:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
8010443c:	c1 e9 02             	shr    $0x2,%ecx
8010443f:	89 fb                	mov    %edi,%ebx
80104441:	89 f8                	mov    %edi,%eax
80104443:	c1 e3 18             	shl    $0x18,%ebx
80104446:	c1 e0 10             	shl    $0x10,%eax
80104449:	09 d8                	or     %ebx,%eax
8010444b:	09 f8                	or     %edi,%eax
8010444d:	c1 e7 08             	shl    $0x8,%edi
80104450:	09 f8                	or     %edi,%eax
80104452:	89 d7                	mov    %edx,%edi
80104454:	fc                   	cld    
80104455:	f3 ab                	rep stos %eax,%es:(%edi)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104457:	5b                   	pop    %ebx
80104458:	89 d0                	mov    %edx,%eax
8010445a:	5f                   	pop    %edi
8010445b:	5d                   	pop    %ebp
8010445c:	c3                   	ret    
8010445d:	8d 76 00             	lea    0x0(%esi),%esi

80104460 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	57                   	push   %edi
80104464:	56                   	push   %esi
80104465:	8b 45 10             	mov    0x10(%ebp),%eax
80104468:	53                   	push   %ebx
80104469:	8b 75 0c             	mov    0xc(%ebp),%esi
8010446c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010446f:	85 c0                	test   %eax,%eax
80104471:	74 29                	je     8010449c <memcmp+0x3c>
    if(*s1 != *s2)
80104473:	0f b6 13             	movzbl (%ebx),%edx
80104476:	0f b6 0e             	movzbl (%esi),%ecx
80104479:	38 d1                	cmp    %dl,%cl
8010447b:	75 2b                	jne    801044a8 <memcmp+0x48>
8010447d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104480:	31 c0                	xor    %eax,%eax
80104482:	eb 14                	jmp    80104498 <memcmp+0x38>
80104484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104488:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010448d:	83 c0 01             	add    $0x1,%eax
80104490:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104494:	38 ca                	cmp    %cl,%dl
80104496:	75 10                	jne    801044a8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
80104498:	39 f8                	cmp    %edi,%eax
8010449a:	75 ec                	jne    80104488 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010449c:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
8010449d:	31 c0                	xor    %eax,%eax
}
8010449f:	5e                   	pop    %esi
801044a0:	5f                   	pop    %edi
801044a1:	5d                   	pop    %ebp
801044a2:	c3                   	ret    
801044a3:	90                   	nop
801044a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801044a8:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
801044ab:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801044ac:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801044ae:	5e                   	pop    %esi
801044af:	5f                   	pop    %edi
801044b0:	5d                   	pop    %ebp
801044b1:	c3                   	ret    
801044b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044c0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	56                   	push   %esi
801044c4:	53                   	push   %ebx
801044c5:	8b 45 08             	mov    0x8(%ebp),%eax
801044c8:	8b 75 0c             	mov    0xc(%ebp),%esi
801044cb:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801044ce:	39 c6                	cmp    %eax,%esi
801044d0:	73 2e                	jae    80104500 <memmove+0x40>
801044d2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801044d5:	39 c8                	cmp    %ecx,%eax
801044d7:	73 27                	jae    80104500 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
801044d9:	85 db                	test   %ebx,%ebx
801044db:	8d 53 ff             	lea    -0x1(%ebx),%edx
801044de:	74 17                	je     801044f7 <memmove+0x37>
      *--d = *--s;
801044e0:	29 d9                	sub    %ebx,%ecx
801044e2:	89 cb                	mov    %ecx,%ebx
801044e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044e8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801044ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
801044ef:	83 ea 01             	sub    $0x1,%edx
801044f2:	83 fa ff             	cmp    $0xffffffff,%edx
801044f5:	75 f1                	jne    801044e8 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801044f7:	5b                   	pop    %ebx
801044f8:	5e                   	pop    %esi
801044f9:	5d                   	pop    %ebp
801044fa:	c3                   	ret    
801044fb:	90                   	nop
801044fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104500:	31 d2                	xor    %edx,%edx
80104502:	85 db                	test   %ebx,%ebx
80104504:	74 f1                	je     801044f7 <memmove+0x37>
80104506:	8d 76 00             	lea    0x0(%esi),%esi
80104509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
80104510:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104514:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104517:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010451a:	39 d3                	cmp    %edx,%ebx
8010451c:	75 f2                	jne    80104510 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010451e:	5b                   	pop    %ebx
8010451f:	5e                   	pop    %esi
80104520:	5d                   	pop    %ebp
80104521:	c3                   	ret    
80104522:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104530 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104533:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104534:	eb 8a                	jmp    801044c0 <memmove>
80104536:	8d 76 00             	lea    0x0(%esi),%esi
80104539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104540 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	57                   	push   %edi
80104544:	56                   	push   %esi
80104545:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104548:	53                   	push   %ebx
80104549:	8b 7d 08             	mov    0x8(%ebp),%edi
8010454c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010454f:	85 c9                	test   %ecx,%ecx
80104551:	74 37                	je     8010458a <strncmp+0x4a>
80104553:	0f b6 17             	movzbl (%edi),%edx
80104556:	0f b6 1e             	movzbl (%esi),%ebx
80104559:	84 d2                	test   %dl,%dl
8010455b:	74 3f                	je     8010459c <strncmp+0x5c>
8010455d:	38 d3                	cmp    %dl,%bl
8010455f:	75 3b                	jne    8010459c <strncmp+0x5c>
80104561:	8d 47 01             	lea    0x1(%edi),%eax
80104564:	01 cf                	add    %ecx,%edi
80104566:	eb 1b                	jmp    80104583 <strncmp+0x43>
80104568:	90                   	nop
80104569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104570:	0f b6 10             	movzbl (%eax),%edx
80104573:	84 d2                	test   %dl,%dl
80104575:	74 21                	je     80104598 <strncmp+0x58>
80104577:	0f b6 19             	movzbl (%ecx),%ebx
8010457a:	83 c0 01             	add    $0x1,%eax
8010457d:	89 ce                	mov    %ecx,%esi
8010457f:	38 da                	cmp    %bl,%dl
80104581:	75 19                	jne    8010459c <strncmp+0x5c>
80104583:	39 c7                	cmp    %eax,%edi
    n--, p++, q++;
80104585:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104588:	75 e6                	jne    80104570 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
8010458a:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
8010458b:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
8010458d:	5e                   	pop    %esi
8010458e:	5f                   	pop    %edi
8010458f:	5d                   	pop    %ebp
80104590:	c3                   	ret    
80104591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104598:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
8010459c:	0f b6 c2             	movzbl %dl,%eax
8010459f:	29 d8                	sub    %ebx,%eax
}
801045a1:	5b                   	pop    %ebx
801045a2:	5e                   	pop    %esi
801045a3:	5f                   	pop    %edi
801045a4:	5d                   	pop    %ebp
801045a5:	c3                   	ret    
801045a6:	8d 76 00             	lea    0x0(%esi),%esi
801045a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045b0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	56                   	push   %esi
801045b4:	53                   	push   %ebx
801045b5:	8b 45 08             	mov    0x8(%ebp),%eax
801045b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801045bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801045be:	89 c2                	mov    %eax,%edx
801045c0:	eb 19                	jmp    801045db <strncpy+0x2b>
801045c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045c8:	83 c3 01             	add    $0x1,%ebx
801045cb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801045cf:	83 c2 01             	add    $0x1,%edx
801045d2:	84 c9                	test   %cl,%cl
801045d4:	88 4a ff             	mov    %cl,-0x1(%edx)
801045d7:	74 09                	je     801045e2 <strncpy+0x32>
801045d9:	89 f1                	mov    %esi,%ecx
801045db:	85 c9                	test   %ecx,%ecx
801045dd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801045e0:	7f e6                	jg     801045c8 <strncpy+0x18>
    ;
  while(n-- > 0)
801045e2:	31 c9                	xor    %ecx,%ecx
801045e4:	85 f6                	test   %esi,%esi
801045e6:	7e 17                	jle    801045ff <strncpy+0x4f>
801045e8:	90                   	nop
801045e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801045f0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801045f4:	89 f3                	mov    %esi,%ebx
801045f6:	83 c1 01             	add    $0x1,%ecx
801045f9:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
801045fb:	85 db                	test   %ebx,%ebx
801045fd:	7f f1                	jg     801045f0 <strncpy+0x40>
    *s++ = 0;
  return os;
}
801045ff:	5b                   	pop    %ebx
80104600:	5e                   	pop    %esi
80104601:	5d                   	pop    %ebp
80104602:	c3                   	ret    
80104603:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104610 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	56                   	push   %esi
80104614:	53                   	push   %ebx
80104615:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104618:	8b 45 08             	mov    0x8(%ebp),%eax
8010461b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010461e:	85 c9                	test   %ecx,%ecx
80104620:	7e 26                	jle    80104648 <safestrcpy+0x38>
80104622:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104626:	89 c1                	mov    %eax,%ecx
80104628:	eb 17                	jmp    80104641 <safestrcpy+0x31>
8010462a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104630:	83 c2 01             	add    $0x1,%edx
80104633:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104637:	83 c1 01             	add    $0x1,%ecx
8010463a:	84 db                	test   %bl,%bl
8010463c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010463f:	74 04                	je     80104645 <safestrcpy+0x35>
80104641:	39 f2                	cmp    %esi,%edx
80104643:	75 eb                	jne    80104630 <safestrcpy+0x20>
    ;
  *s = 0;
80104645:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104648:	5b                   	pop    %ebx
80104649:	5e                   	pop    %esi
8010464a:	5d                   	pop    %ebp
8010464b:	c3                   	ret    
8010464c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104650 <strlen>:

int
strlen(const char *s)
{
80104650:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104651:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104653:	89 e5                	mov    %esp,%ebp
80104655:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104658:	80 3a 00             	cmpb   $0x0,(%edx)
8010465b:	74 0c                	je     80104669 <strlen+0x19>
8010465d:	8d 76 00             	lea    0x0(%esi),%esi
80104660:	83 c0 01             	add    $0x1,%eax
80104663:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104667:	75 f7                	jne    80104660 <strlen+0x10>
    ;
  return n;
}
80104669:	5d                   	pop    %ebp
8010466a:	c3                   	ret    

8010466b <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010466b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010466f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104673:	55                   	push   %ebp
  pushl %ebx
80104674:	53                   	push   %ebx
  pushl %esi
80104675:	56                   	push   %esi
  pushl %edi
80104676:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104677:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104679:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
8010467b:	5f                   	pop    %edi
  popl %esi
8010467c:	5e                   	pop    %esi
  popl %ebx
8010467d:	5b                   	pop    %ebx
  popl %ebp
8010467e:	5d                   	pop    %ebp
  ret
8010467f:	c3                   	ret    

80104680 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz || addr+4 > curproc->sz)
  //  return -1;
  *ip = *(int*)(addr);
80104683:	8b 45 08             	mov    0x8(%ebp),%eax
80104686:	8b 10                	mov    (%eax),%edx
80104688:	8b 45 0c             	mov    0xc(%ebp),%eax
8010468b:	89 10                	mov    %edx,(%eax)
  return 0;
}
8010468d:	31 c0                	xor    %eax,%eax
8010468f:	5d                   	pop    %ebp
80104690:	c3                   	ret    
80104691:	eb 0d                	jmp    801046a0 <fetchstr>
80104693:	90                   	nop
80104694:	90                   	nop
80104695:	90                   	nop
80104696:	90                   	nop
80104697:	90                   	nop
80104698:	90                   	nop
80104699:	90                   	nop
8010469a:	90                   	nop
8010469b:	90                   	nop
8010469c:	90                   	nop
8010469d:	90                   	nop
8010469e:	90                   	nop
8010469f:	90                   	nop

801046a0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	8b 55 08             	mov    0x8(%ebp),%edx
  char *s;
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz)
  //  return -1;
  *pp = (char*)addr;
801046a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801046a9:	89 11                	mov    %edx,(%ecx)
  //ep = (char*)curproc->sz;
  //for(s = *pp; s < ep; s++){
  s = *pp;
  while(*s != 0) {
801046ab:	80 3a 00             	cmpb   $0x0,(%edx)
  char *s;
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz)
  //  return -1;
  *pp = (char*)addr;
801046ae:	89 d0                	mov    %edx,%eax
  //ep = (char*)curproc->sz;
  //for(s = *pp; s < ep; s++){
  s = *pp;
  while(*s != 0) {
801046b0:	74 0e                	je     801046c0 <fetchstr+0x20>
801046b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
801046b8:	83 c0 01             	add    $0x1,%eax
  //  return -1;
  *pp = (char*)addr;
  //ep = (char*)curproc->sz;
  //for(s = *pp; s < ep; s++){
  s = *pp;
  while(*s != 0) {
801046bb:	80 38 00             	cmpb   $0x0,(%eax)
801046be:	75 f8                	jne    801046b8 <fetchstr+0x18>
    s++;
  }
  //}
  
  return (s - *pp) - 1;
801046c0:	29 d0                	sub    %edx,%eax
801046c2:	83 e8 01             	sub    $0x1,%eax
}
801046c5:	5d                   	pop    %ebp
801046c6:	c3                   	ret    
801046c7:	89 f6                	mov    %esi,%esi
801046c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046d0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	83 ec 08             	sub    $0x8,%esp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801046d6:	e8 75 f0 ff ff       	call   80103750 <myproc>
801046db:	8b 40 18             	mov    0x18(%eax),%eax
{
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz || addr+4 > curproc->sz)
  //  return -1;
  *ip = *(int*)(addr);
801046de:	8b 55 08             	mov    0x8(%ebp),%edx
801046e1:	8b 40 44             	mov    0x44(%eax),%eax
801046e4:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
801046e8:	8b 45 0c             	mov    0xc(%ebp),%eax
801046eb:	89 10                	mov    %edx,(%eax)
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
801046ed:	31 c0                	xor    %eax,%eax
801046ef:	c9                   	leave  
801046f0:	c3                   	ret    
801046f1:	eb 0d                	jmp    80104700 <argptr>
801046f3:	90                   	nop
801046f4:	90                   	nop
801046f5:	90                   	nop
801046f6:	90                   	nop
801046f7:	90                   	nop
801046f8:	90                   	nop
801046f9:	90                   	nop
801046fa:	90                   	nop
801046fb:	90                   	nop
801046fc:	90                   	nop
801046fd:	90                   	nop
801046fe:	90                   	nop
801046ff:	90                   	nop

80104700 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	83 ec 08             	sub    $0x8,%esp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104706:	e8 45 f0 ff ff       	call   80103750 <myproc>
8010470b:	8b 40 18             	mov    0x18(%eax),%eax
 
  if(argint(n, &i) < 0)
    return -1;
  //if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
  //  return -1;
  *pp = (char*)i;
8010470e:	8b 55 08             	mov    0x8(%ebp),%edx
{
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz || addr+4 > curproc->sz)
  //  return -1;
  *ip = *(int*)(addr);
80104711:	8b 40 44             	mov    0x44(%eax),%eax
 
  if(argint(n, &i) < 0)
    return -1;
  //if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
  //  return -1;
  *pp = (char*)i;
80104714:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
80104718:	8b 45 0c             	mov    0xc(%ebp),%eax
8010471b:	89 10                	mov    %edx,(%eax)
  return 0;
}
8010471d:	31 c0                	xor    %eax,%eax
8010471f:	c9                   	leave  
80104720:	c3                   	ret    
80104721:	eb 0d                	jmp    80104730 <argstr>
80104723:	90                   	nop
80104724:	90                   	nop
80104725:	90                   	nop
80104726:	90                   	nop
80104727:	90                   	nop
80104728:	90                   	nop
80104729:	90                   	nop
8010472a:	90                   	nop
8010472b:	90                   	nop
8010472c:	90                   	nop
8010472d:	90                   	nop
8010472e:	90                   	nop
8010472f:	90                   	nop

80104730 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	83 ec 08             	sub    $0x8,%esp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104736:	e8 15 f0 ff ff       	call   80103750 <myproc>
8010473b:	8b 40 18             	mov    0x18(%eax),%eax
{
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz || addr+4 > curproc->sz)
  //  return -1;
  *ip = *(int*)(addr);
8010473e:	8b 55 08             	mov    0x8(%ebp),%edx
  char *s;
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz)
  //  return -1;
  *pp = (char*)addr;
80104741:	8b 4d 0c             	mov    0xc(%ebp),%ecx
{
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz || addr+4 > curproc->sz)
  //  return -1;
  *ip = *(int*)(addr);
80104744:	8b 40 44             	mov    0x44(%eax),%eax
80104747:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
  char *s;
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz)
  //  return -1;
  *pp = (char*)addr;
8010474b:	89 11                	mov    %edx,(%ecx)
  //ep = (char*)curproc->sz;
  //for(s = *pp; s < ep; s++){
  s = *pp;
  while(*s != 0) {
8010474d:	80 3a 00             	cmpb   $0x0,(%edx)
  char *s;
  //struct proc *curproc = myproc();

  //if(addr >= curproc->sz)
  //  return -1;
  *pp = (char*)addr;
80104750:	89 d0                	mov    %edx,%eax
  //ep = (char*)curproc->sz;
  //for(s = *pp; s < ep; s++){
  s = *pp;
  while(*s != 0) {
80104752:	74 0c                	je     80104760 <argstr+0x30>
80104754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
80104758:	83 c0 01             	add    $0x1,%eax
  //  return -1;
  *pp = (char*)addr;
  //ep = (char*)curproc->sz;
  //for(s = *pp; s < ep; s++){
  s = *pp;
  while(*s != 0) {
8010475b:	80 38 00             	cmpb   $0x0,(%eax)
8010475e:	75 f8                	jne    80104758 <argstr+0x28>
{
  int addr;
  //if(argint(n, &addr) < 0)
  //  return -1;
  argint(n,&addr);
  return fetchstr(addr, pp);
80104760:	29 d0                	sub    %edx,%eax
}
80104762:	c9                   	leave  
{
  int addr;
  //if(argint(n, &addr) < 0)
  //  return -1;
  argint(n,&addr);
  return fetchstr(addr, pp);
80104763:	83 e8 01             	sub    $0x1,%eax
}
80104766:	c3                   	ret    
80104767:	89 f6                	mov    %esi,%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104770 <syscall>:
[SYS_shm_close] sys_shm_close
};

void
syscall(void)
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	56                   	push   %esi
80104774:	53                   	push   %ebx
  int num;
  struct proc *curproc = myproc();
80104775:	e8 d6 ef ff ff       	call   80103750 <myproc>

  num = curproc->tf->eax;
8010477a:	8b 70 18             	mov    0x18(%eax),%esi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
8010477d:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
8010477f:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104782:	8d 50 ff             	lea    -0x1(%eax),%edx
80104785:	83 fa 16             	cmp    $0x16,%edx
80104788:	77 1e                	ja     801047a8 <syscall+0x38>
8010478a:	8b 14 85 00 77 10 80 	mov    -0x7fef8900(,%eax,4),%edx
80104791:	85 d2                	test   %edx,%edx
80104793:	74 13                	je     801047a8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104795:	ff d2                	call   *%edx
80104797:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
8010479a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010479d:	5b                   	pop    %ebx
8010479e:	5e                   	pop    %esi
8010479f:	5d                   	pop    %ebp
801047a0:	c3                   	ret    
801047a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801047a8:	50                   	push   %eax
            curproc->pid, curproc->name, num);
801047a9:	8d 43 6c             	lea    0x6c(%ebx),%eax

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801047ac:	50                   	push   %eax
801047ad:	ff 73 10             	pushl  0x10(%ebx)
801047b0:	68 c9 76 10 80       	push   $0x801076c9
801047b5:	e8 a6 be ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
801047ba:	8b 43 18             	mov    0x18(%ebx),%eax
801047bd:	83 c4 10             	add    $0x10,%esp
801047c0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
801047c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047ca:	5b                   	pop    %ebx
801047cb:	5e                   	pop    %esi
801047cc:	5d                   	pop    %ebp
801047cd:	c3                   	ret    
801047ce:	66 90                	xchg   %ax,%ax

801047d0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047d0:	55                   	push   %ebp
801047d1:	89 e5                	mov    %esp,%ebp
801047d3:	57                   	push   %edi
801047d4:	56                   	push   %esi
801047d5:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047d6:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047d9:	83 ec 44             	sub    $0x44,%esp
801047dc:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801047df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047e2:	56                   	push   %esi
801047e3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047e4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801047e7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047ea:	e8 c1 d6 ff ff       	call   80101eb0 <nameiparent>
801047ef:	83 c4 10             	add    $0x10,%esp
801047f2:	85 c0                	test   %eax,%eax
801047f4:	0f 84 f6 00 00 00    	je     801048f0 <create+0x120>
    return 0;
  ilock(dp);
801047fa:	83 ec 0c             	sub    $0xc,%esp
801047fd:	89 c7                	mov    %eax,%edi
801047ff:	50                   	push   %eax
80104800:	e8 3b ce ff ff       	call   80101640 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104805:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104808:	83 c4 0c             	add    $0xc,%esp
8010480b:	50                   	push   %eax
8010480c:	56                   	push   %esi
8010480d:	57                   	push   %edi
8010480e:	e8 5d d3 ff ff       	call   80101b70 <dirlookup>
80104813:	83 c4 10             	add    $0x10,%esp
80104816:	85 c0                	test   %eax,%eax
80104818:	89 c3                	mov    %eax,%ebx
8010481a:	74 54                	je     80104870 <create+0xa0>
    iunlockput(dp);
8010481c:	83 ec 0c             	sub    $0xc,%esp
8010481f:	57                   	push   %edi
80104820:	e8 ab d0 ff ff       	call   801018d0 <iunlockput>
    ilock(ip);
80104825:	89 1c 24             	mov    %ebx,(%esp)
80104828:	e8 13 ce ff ff       	call   80101640 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010482d:	83 c4 10             	add    $0x10,%esp
80104830:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104835:	75 19                	jne    80104850 <create+0x80>
80104837:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010483c:	89 d8                	mov    %ebx,%eax
8010483e:	75 10                	jne    80104850 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104840:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104843:	5b                   	pop    %ebx
80104844:	5e                   	pop    %esi
80104845:	5f                   	pop    %edi
80104846:	5d                   	pop    %ebp
80104847:	c3                   	ret    
80104848:	90                   	nop
80104849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104850:	83 ec 0c             	sub    $0xc,%esp
80104853:	53                   	push   %ebx
80104854:	e8 77 d0 ff ff       	call   801018d0 <iunlockput>
    return 0;
80104859:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010485c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
8010485f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104861:	5b                   	pop    %ebx
80104862:	5e                   	pop    %esi
80104863:	5f                   	pop    %edi
80104864:	5d                   	pop    %ebp
80104865:	c3                   	ret    
80104866:	8d 76 00             	lea    0x0(%esi),%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104870:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104874:	83 ec 08             	sub    $0x8,%esp
80104877:	50                   	push   %eax
80104878:	ff 37                	pushl  (%edi)
8010487a:	e8 51 cc ff ff       	call   801014d0 <ialloc>
8010487f:	83 c4 10             	add    $0x10,%esp
80104882:	85 c0                	test   %eax,%eax
80104884:	89 c3                	mov    %eax,%ebx
80104886:	0f 84 cc 00 00 00    	je     80104958 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
8010488c:	83 ec 0c             	sub    $0xc,%esp
8010488f:	50                   	push   %eax
80104890:	e8 ab cd ff ff       	call   80101640 <ilock>
  ip->major = major;
80104895:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104899:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
8010489d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801048a1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
801048a5:	b8 01 00 00 00       	mov    $0x1,%eax
801048aa:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
801048ae:	89 1c 24             	mov    %ebx,(%esp)
801048b1:	e8 da cc ff ff       	call   80101590 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
801048b6:	83 c4 10             	add    $0x10,%esp
801048b9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801048be:	74 40                	je     80104900 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
801048c0:	83 ec 04             	sub    $0x4,%esp
801048c3:	ff 73 04             	pushl  0x4(%ebx)
801048c6:	56                   	push   %esi
801048c7:	57                   	push   %edi
801048c8:	e8 03 d5 ff ff       	call   80101dd0 <dirlink>
801048cd:	83 c4 10             	add    $0x10,%esp
801048d0:	85 c0                	test   %eax,%eax
801048d2:	78 77                	js     8010494b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
801048d4:	83 ec 0c             	sub    $0xc,%esp
801048d7:	57                   	push   %edi
801048d8:	e8 f3 cf ff ff       	call   801018d0 <iunlockput>

  return ip;
801048dd:	83 c4 10             	add    $0x10,%esp
}
801048e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
801048e3:	89 d8                	mov    %ebx,%eax
}
801048e5:	5b                   	pop    %ebx
801048e6:	5e                   	pop    %esi
801048e7:	5f                   	pop    %edi
801048e8:	5d                   	pop    %ebp
801048e9:	c3                   	ret    
801048ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
801048f0:	31 c0                	xor    %eax,%eax
801048f2:	e9 49 ff ff ff       	jmp    80104840 <create+0x70>
801048f7:	89 f6                	mov    %esi,%esi
801048f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104900:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104905:	83 ec 0c             	sub    $0xc,%esp
80104908:	57                   	push   %edi
80104909:	e8 82 cc ff ff       	call   80101590 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010490e:	83 c4 0c             	add    $0xc,%esp
80104911:	ff 73 04             	pushl  0x4(%ebx)
80104914:	68 7c 77 10 80       	push   $0x8010777c
80104919:	53                   	push   %ebx
8010491a:	e8 b1 d4 ff ff       	call   80101dd0 <dirlink>
8010491f:	83 c4 10             	add    $0x10,%esp
80104922:	85 c0                	test   %eax,%eax
80104924:	78 18                	js     8010493e <create+0x16e>
80104926:	83 ec 04             	sub    $0x4,%esp
80104929:	ff 77 04             	pushl  0x4(%edi)
8010492c:	68 7b 77 10 80       	push   $0x8010777b
80104931:	53                   	push   %ebx
80104932:	e8 99 d4 ff ff       	call   80101dd0 <dirlink>
80104937:	83 c4 10             	add    $0x10,%esp
8010493a:	85 c0                	test   %eax,%eax
8010493c:	79 82                	jns    801048c0 <create+0xf0>
      panic("create dots");
8010493e:	83 ec 0c             	sub    $0xc,%esp
80104941:	68 6f 77 10 80       	push   $0x8010776f
80104946:	e8 25 ba ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
8010494b:	83 ec 0c             	sub    $0xc,%esp
8010494e:	68 7e 77 10 80       	push   $0x8010777e
80104953:	e8 18 ba ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104958:	83 ec 0c             	sub    $0xc,%esp
8010495b:	68 60 77 10 80       	push   $0x80107760
80104960:	e8 0b ba ff ff       	call   80100370 <panic>
80104965:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104970 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104970:	55                   	push   %ebp
80104971:	89 e5                	mov    %esp,%ebp
80104973:	56                   	push   %esi
80104974:	53                   	push   %ebx
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104975:	8d 45 f4             	lea    -0xc(%ebp),%eax
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104978:	31 db                	xor    %ebx,%ebx
  return -1;
}

int
sys_dup(void)
{
8010497a:	83 ec 18             	sub    $0x18,%esp
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
8010497d:	50                   	push   %eax
8010497e:	6a 00                	push   $0x0
80104980:	e8 4b fd ff ff       	call   801046d0 <argint>
  f = myproc()->ofile[fd];
80104985:	e8 c6 ed ff ff       	call   80103750 <myproc>
8010498a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010498d:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104991:	e8 ba ed ff ff       	call   80103750 <myproc>
80104996:	83 c4 10             	add    $0x10,%esp
80104999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801049a0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801049a4:	85 d2                	test   %edx,%edx
801049a6:	74 18                	je     801049c0 <sys_dup+0x50>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801049a8:	83 c3 01             	add    $0x1,%ebx
801049ab:	83 fb 10             	cmp    $0x10,%ebx
801049ae:	75 f0                	jne    801049a0 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
801049b0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
801049b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  filedup(f);
  return fd;
}
801049b8:	5b                   	pop    %ebx
801049b9:	5e                   	pop    %esi
801049ba:	5d                   	pop    %ebp
801049bb:	c3                   	ret    
801049bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
801049c0:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801049c3:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
801049c7:	56                   	push   %esi
801049c8:	e8 e3 c3 ff ff       	call   80100db0 <filedup>
  return fd;
801049cd:	83 c4 10             	add    $0x10,%esp
}
801049d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
801049d3:	89 d8                	mov    %ebx,%eax
}
801049d5:	5b                   	pop    %ebx
801049d6:	5e                   	pop    %esi
801049d7:	5d                   	pop    %ebp
801049d8:	c3                   	ret    
801049d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801049e0 <sys_read>:

int
sys_read(void)
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	56                   	push   %esi
801049e4:	53                   	push   %ebx
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
801049e5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
  return fd;
}

int
sys_read(void)
{
801049e8:	83 ec 18             	sub    $0x18,%esp
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
801049eb:	53                   	push   %ebx
801049ec:	6a 00                	push   $0x0
801049ee:	e8 dd fc ff ff       	call   801046d0 <argint>
  f = myproc()->ofile[fd];
801049f3:	e8 58 ed ff ff       	call   80103750 <myproc>
801049f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
801049fb:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
{
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801049ff:	58                   	pop    %eax
80104a00:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a03:	5a                   	pop    %edx
80104a04:	50                   	push   %eax
80104a05:	6a 02                	push   $0x2
80104a07:	e8 c4 fc ff ff       	call   801046d0 <argint>
80104a0c:	83 c4 10             	add    $0x10,%esp
80104a0f:	85 c0                	test   %eax,%eax
80104a11:	78 35                	js     80104a48 <sys_read+0x68>
80104a13:	83 ec 04             	sub    $0x4,%esp
80104a16:	ff 75 f0             	pushl  -0x10(%ebp)
80104a19:	53                   	push   %ebx
80104a1a:	6a 01                	push   $0x1
80104a1c:	e8 df fc ff ff       	call   80104700 <argptr>
80104a21:	83 c4 10             	add    $0x10,%esp
80104a24:	85 c0                	test   %eax,%eax
80104a26:	78 20                	js     80104a48 <sys_read+0x68>
    return -1;
  return fileread(f, p, n);
80104a28:	83 ec 04             	sub    $0x4,%esp
80104a2b:	ff 75 f0             	pushl  -0x10(%ebp)
80104a2e:	ff 75 f4             	pushl  -0xc(%ebp)
80104a31:	56                   	push   %esi
80104a32:	e8 e9 c4 ff ff       	call   80100f20 <fileread>
80104a37:	83 c4 10             	add    $0x10,%esp
}
80104a3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a3d:	5b                   	pop    %ebx
80104a3e:	5e                   	pop    %esi
80104a3f:	5d                   	pop    %ebp
80104a40:	c3                   	ret    
80104a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a4d:	eb eb                	jmp    80104a3a <sys_read+0x5a>
80104a4f:	90                   	nop

80104a50 <sys_write>:
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104a50:	55                   	push   %ebp
80104a51:	89 e5                	mov    %esp,%ebp
80104a53:	56                   	push   %esi
80104a54:	53                   	push   %ebx
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104a55:	8d 5d f4             	lea    -0xc(%ebp),%ebx
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104a58:	83 ec 18             	sub    $0x18,%esp
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104a5b:	53                   	push   %ebx
80104a5c:	6a 00                	push   $0x0
80104a5e:	e8 6d fc ff ff       	call   801046d0 <argint>
  f = myproc()->ofile[fd];
80104a63:	e8 e8 ec ff ff       	call   80103750 <myproc>
80104a68:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104a6b:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
{
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a6f:	58                   	pop    %eax
80104a70:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a73:	5a                   	pop    %edx
80104a74:	50                   	push   %eax
80104a75:	6a 02                	push   $0x2
80104a77:	e8 54 fc ff ff       	call   801046d0 <argint>
80104a7c:	83 c4 10             	add    $0x10,%esp
80104a7f:	85 c0                	test   %eax,%eax
80104a81:	78 35                	js     80104ab8 <sys_write+0x68>
80104a83:	83 ec 04             	sub    $0x4,%esp
80104a86:	ff 75 f0             	pushl  -0x10(%ebp)
80104a89:	53                   	push   %ebx
80104a8a:	6a 01                	push   $0x1
80104a8c:	e8 6f fc ff ff       	call   80104700 <argptr>
80104a91:	83 c4 10             	add    $0x10,%esp
80104a94:	85 c0                	test   %eax,%eax
80104a96:	78 20                	js     80104ab8 <sys_write+0x68>
    return -1;
  return filewrite(f, p, n);
80104a98:	83 ec 04             	sub    $0x4,%esp
80104a9b:	ff 75 f0             	pushl  -0x10(%ebp)
80104a9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104aa1:	56                   	push   %esi
80104aa2:	e8 09 c5 ff ff       	call   80100fb0 <filewrite>
80104aa7:	83 c4 10             	add    $0x10,%esp
}
80104aaa:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104aad:	5b                   	pop    %ebx
80104aae:	5e                   	pop    %esi
80104aaf:	5d                   	pop    %ebp
80104ab0:	c3                   	ret    
80104ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ab8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104abd:	eb eb                	jmp    80104aaa <sys_write+0x5a>
80104abf:	90                   	nop

80104ac0 <sys_close>:
  return filewrite(f, p, n);
}

int
sys_close(void)
{
80104ac0:	55                   	push   %ebp
80104ac1:	89 e5                	mov    %esp,%ebp
80104ac3:	56                   	push   %esi
80104ac4:	53                   	push   %ebx
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104ac5:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return filewrite(f, p, n);
}

int
sys_close(void)
{
80104ac8:	83 ec 18             	sub    $0x18,%esp
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104acb:	50                   	push   %eax
80104acc:	6a 00                	push   $0x0
80104ace:	e8 fd fb ff ff       	call   801046d0 <argint>
  f = myproc()->ofile[fd];
80104ad3:	e8 78 ec ff ff       	call   80103750 <myproc>
80104ad8:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104adb:	8d 5a 08             	lea    0x8(%edx),%ebx
80104ade:	8b 74 98 08          	mov    0x8(%eax,%ebx,4),%esi
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80104ae2:	e8 69 ec ff ff       	call   80103750 <myproc>
80104ae7:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
80104aee:	00 
  fileclose(f);
80104aef:	89 34 24             	mov    %esi,(%esp)
80104af2:	e8 09 c3 ff ff       	call   80100e00 <fileclose>
  return 0;
}
80104af7:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104afa:	31 c0                	xor    %eax,%eax
80104afc:	5b                   	pop    %ebx
80104afd:	5e                   	pop    %esi
80104afe:	5d                   	pop    %ebp
80104aff:	c3                   	ret    

80104b00 <sys_fstat>:

int
sys_fstat(void)
{
80104b00:	55                   	push   %ebp
80104b01:	89 e5                	mov    %esp,%ebp
80104b03:	56                   	push   %esi
80104b04:	53                   	push   %ebx
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104b05:	8d 5d f4             	lea    -0xc(%ebp),%ebx
  return 0;
}

int
sys_fstat(void)
{
80104b08:	83 ec 18             	sub    $0x18,%esp
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
80104b0b:	53                   	push   %ebx
80104b0c:	6a 00                	push   $0x0
80104b0e:	e8 bd fb ff ff       	call   801046d0 <argint>
  f = myproc()->ofile[fd];
80104b13:	e8 38 ec ff ff       	call   80103750 <myproc>
80104b18:	8b 55 f4             	mov    -0xc(%ebp),%edx
sys_fstat(void)
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b1b:	83 c4 0c             	add    $0xc,%esp
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;
  argint(n, &fd);
  f = myproc()->ofile[fd];
80104b1e:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
sys_fstat(void)
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b22:	6a 14                	push   $0x14
80104b24:	53                   	push   %ebx
80104b25:	6a 01                	push   $0x1
80104b27:	e8 d4 fb ff ff       	call   80104700 <argptr>
80104b2c:	83 c4 10             	add    $0x10,%esp
80104b2f:	85 c0                	test   %eax,%eax
80104b31:	78 1d                	js     80104b50 <sys_fstat+0x50>
    return -1;
  return filestat(f, st);
80104b33:	83 ec 08             	sub    $0x8,%esp
80104b36:	ff 75 f4             	pushl  -0xc(%ebp)
80104b39:	56                   	push   %esi
80104b3a:	e8 91 c3 ff ff       	call   80100ed0 <filestat>
80104b3f:	83 c4 10             	add    $0x10,%esp
}
80104b42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b45:	5b                   	pop    %ebx
80104b46:	5e                   	pop    %esi
80104b47:	5d                   	pop    %ebp
80104b48:	c3                   	ret    
80104b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b55:	eb eb                	jmp    80104b42 <sys_fstat+0x42>
80104b57:	89 f6                	mov    %esi,%esi
80104b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b60 <sys_link>:
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104b60:	55                   	push   %ebp
80104b61:	89 e5                	mov    %esp,%ebp
80104b63:	57                   	push   %edi
80104b64:	56                   	push   %esi
80104b65:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104b66:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104b69:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104b6c:	50                   	push   %eax
80104b6d:	6a 00                	push   $0x0
80104b6f:	e8 bc fb ff ff       	call   80104730 <argstr>
80104b74:	83 c4 10             	add    $0x10,%esp
80104b77:	85 c0                	test   %eax,%eax
80104b79:	0f 88 fb 00 00 00    	js     80104c7a <sys_link+0x11a>
80104b7f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104b82:	83 ec 08             	sub    $0x8,%esp
80104b85:	50                   	push   %eax
80104b86:	6a 01                	push   $0x1
80104b88:	e8 a3 fb ff ff       	call   80104730 <argstr>
80104b8d:	83 c4 10             	add    $0x10,%esp
80104b90:	85 c0                	test   %eax,%eax
80104b92:	0f 88 e2 00 00 00    	js     80104c7a <sys_link+0x11a>
    return -1;

  begin_op();
80104b98:	e8 83 df ff ff       	call   80102b20 <begin_op>
  if((ip = namei(old)) == 0){
80104b9d:	83 ec 0c             	sub    $0xc,%esp
80104ba0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104ba3:	e8 e8 d2 ff ff       	call   80101e90 <namei>
80104ba8:	83 c4 10             	add    $0x10,%esp
80104bab:	85 c0                	test   %eax,%eax
80104bad:	89 c3                	mov    %eax,%ebx
80104baf:	0f 84 f3 00 00 00    	je     80104ca8 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104bb5:	83 ec 0c             	sub    $0xc,%esp
80104bb8:	50                   	push   %eax
80104bb9:	e8 82 ca ff ff       	call   80101640 <ilock>
  if(ip->type == T_DIR){
80104bbe:	83 c4 10             	add    $0x10,%esp
80104bc1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104bc6:	0f 84 c4 00 00 00    	je     80104c90 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104bcc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104bd1:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104bd4:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104bd7:	53                   	push   %ebx
80104bd8:	e8 b3 c9 ff ff       	call   80101590 <iupdate>
  iunlock(ip);
80104bdd:	89 1c 24             	mov    %ebx,(%esp)
80104be0:	e8 3b cb ff ff       	call   80101720 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104be5:	58                   	pop    %eax
80104be6:	5a                   	pop    %edx
80104be7:	57                   	push   %edi
80104be8:	ff 75 d0             	pushl  -0x30(%ebp)
80104beb:	e8 c0 d2 ff ff       	call   80101eb0 <nameiparent>
80104bf0:	83 c4 10             	add    $0x10,%esp
80104bf3:	85 c0                	test   %eax,%eax
80104bf5:	89 c6                	mov    %eax,%esi
80104bf7:	74 5b                	je     80104c54 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104bf9:	83 ec 0c             	sub    $0xc,%esp
80104bfc:	50                   	push   %eax
80104bfd:	e8 3e ca ff ff       	call   80101640 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104c02:	83 c4 10             	add    $0x10,%esp
80104c05:	8b 03                	mov    (%ebx),%eax
80104c07:	39 06                	cmp    %eax,(%esi)
80104c09:	75 3d                	jne    80104c48 <sys_link+0xe8>
80104c0b:	83 ec 04             	sub    $0x4,%esp
80104c0e:	ff 73 04             	pushl  0x4(%ebx)
80104c11:	57                   	push   %edi
80104c12:	56                   	push   %esi
80104c13:	e8 b8 d1 ff ff       	call   80101dd0 <dirlink>
80104c18:	83 c4 10             	add    $0x10,%esp
80104c1b:	85 c0                	test   %eax,%eax
80104c1d:	78 29                	js     80104c48 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104c1f:	83 ec 0c             	sub    $0xc,%esp
80104c22:	56                   	push   %esi
80104c23:	e8 a8 cc ff ff       	call   801018d0 <iunlockput>
  iput(ip);
80104c28:	89 1c 24             	mov    %ebx,(%esp)
80104c2b:	e8 40 cb ff ff       	call   80101770 <iput>

  end_op();
80104c30:	e8 5b df ff ff       	call   80102b90 <end_op>

  return 0;
80104c35:	83 c4 10             	add    $0x10,%esp
80104c38:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104c3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c3d:	5b                   	pop    %ebx
80104c3e:	5e                   	pop    %esi
80104c3f:	5f                   	pop    %edi
80104c40:	5d                   	pop    %ebp
80104c41:	c3                   	ret    
80104c42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104c48:	83 ec 0c             	sub    $0xc,%esp
80104c4b:	56                   	push   %esi
80104c4c:	e8 7f cc ff ff       	call   801018d0 <iunlockput>
    goto bad;
80104c51:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104c54:	83 ec 0c             	sub    $0xc,%esp
80104c57:	53                   	push   %ebx
80104c58:	e8 e3 c9 ff ff       	call   80101640 <ilock>
  ip->nlink--;
80104c5d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104c62:	89 1c 24             	mov    %ebx,(%esp)
80104c65:	e8 26 c9 ff ff       	call   80101590 <iupdate>
  iunlockput(ip);
80104c6a:	89 1c 24             	mov    %ebx,(%esp)
80104c6d:	e8 5e cc ff ff       	call   801018d0 <iunlockput>
  end_op();
80104c72:	e8 19 df ff ff       	call   80102b90 <end_op>
  return -1;
80104c77:	83 c4 10             	add    $0x10,%esp
}
80104c7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104c7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c82:	5b                   	pop    %ebx
80104c83:	5e                   	pop    %esi
80104c84:	5f                   	pop    %edi
80104c85:	5d                   	pop    %ebp
80104c86:	c3                   	ret    
80104c87:	89 f6                	mov    %esi,%esi
80104c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104c90:	83 ec 0c             	sub    $0xc,%esp
80104c93:	53                   	push   %ebx
80104c94:	e8 37 cc ff ff       	call   801018d0 <iunlockput>
    end_op();
80104c99:	e8 f2 de ff ff       	call   80102b90 <end_op>
    return -1;
80104c9e:	83 c4 10             	add    $0x10,%esp
80104ca1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ca6:	eb 92                	jmp    80104c3a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104ca8:	e8 e3 de ff ff       	call   80102b90 <end_op>
    return -1;
80104cad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cb2:	eb 86                	jmp    80104c3a <sys_link+0xda>
80104cb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104cba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104cc0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104cc0:	55                   	push   %ebp
80104cc1:	89 e5                	mov    %esp,%ebp
80104cc3:	57                   	push   %edi
80104cc4:	56                   	push   %esi
80104cc5:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104cc6:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104cc9:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104ccc:	50                   	push   %eax
80104ccd:	6a 00                	push   $0x0
80104ccf:	e8 5c fa ff ff       	call   80104730 <argstr>
80104cd4:	83 c4 10             	add    $0x10,%esp
80104cd7:	85 c0                	test   %eax,%eax
80104cd9:	0f 88 82 01 00 00    	js     80104e61 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104cdf:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104ce2:	e8 39 de ff ff       	call   80102b20 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104ce7:	83 ec 08             	sub    $0x8,%esp
80104cea:	53                   	push   %ebx
80104ceb:	ff 75 c0             	pushl  -0x40(%ebp)
80104cee:	e8 bd d1 ff ff       	call   80101eb0 <nameiparent>
80104cf3:	83 c4 10             	add    $0x10,%esp
80104cf6:	85 c0                	test   %eax,%eax
80104cf8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104cfb:	0f 84 6a 01 00 00    	je     80104e6b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104d01:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104d04:	83 ec 0c             	sub    $0xc,%esp
80104d07:	56                   	push   %esi
80104d08:	e8 33 c9 ff ff       	call   80101640 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104d0d:	58                   	pop    %eax
80104d0e:	5a                   	pop    %edx
80104d0f:	68 7c 77 10 80       	push   $0x8010777c
80104d14:	53                   	push   %ebx
80104d15:	e8 36 ce ff ff       	call   80101b50 <namecmp>
80104d1a:	83 c4 10             	add    $0x10,%esp
80104d1d:	85 c0                	test   %eax,%eax
80104d1f:	0f 84 fc 00 00 00    	je     80104e21 <sys_unlink+0x161>
80104d25:	83 ec 08             	sub    $0x8,%esp
80104d28:	68 7b 77 10 80       	push   $0x8010777b
80104d2d:	53                   	push   %ebx
80104d2e:	e8 1d ce ff ff       	call   80101b50 <namecmp>
80104d33:	83 c4 10             	add    $0x10,%esp
80104d36:	85 c0                	test   %eax,%eax
80104d38:	0f 84 e3 00 00 00    	je     80104e21 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104d3e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104d41:	83 ec 04             	sub    $0x4,%esp
80104d44:	50                   	push   %eax
80104d45:	53                   	push   %ebx
80104d46:	56                   	push   %esi
80104d47:	e8 24 ce ff ff       	call   80101b70 <dirlookup>
80104d4c:	83 c4 10             	add    $0x10,%esp
80104d4f:	85 c0                	test   %eax,%eax
80104d51:	89 c3                	mov    %eax,%ebx
80104d53:	0f 84 c8 00 00 00    	je     80104e21 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80104d59:	83 ec 0c             	sub    $0xc,%esp
80104d5c:	50                   	push   %eax
80104d5d:	e8 de c8 ff ff       	call   80101640 <ilock>

  if(ip->nlink < 1)
80104d62:	83 c4 10             	add    $0x10,%esp
80104d65:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104d6a:	0f 8e 24 01 00 00    	jle    80104e94 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104d70:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d75:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104d78:	74 66                	je     80104de0 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104d7a:	83 ec 04             	sub    $0x4,%esp
80104d7d:	6a 10                	push   $0x10
80104d7f:	6a 00                	push   $0x0
80104d81:	56                   	push   %esi
80104d82:	e8 89 f6 ff ff       	call   80104410 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104d87:	6a 10                	push   $0x10
80104d89:	ff 75 c4             	pushl  -0x3c(%ebp)
80104d8c:	56                   	push   %esi
80104d8d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104d90:	e8 8b cc ff ff       	call   80101a20 <writei>
80104d95:	83 c4 20             	add    $0x20,%esp
80104d98:	83 f8 10             	cmp    $0x10,%eax
80104d9b:	0f 85 e6 00 00 00    	jne    80104e87 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104da1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104da6:	0f 84 9c 00 00 00    	je     80104e48 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104dac:	83 ec 0c             	sub    $0xc,%esp
80104daf:	ff 75 b4             	pushl  -0x4c(%ebp)
80104db2:	e8 19 cb ff ff       	call   801018d0 <iunlockput>

  ip->nlink--;
80104db7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104dbc:	89 1c 24             	mov    %ebx,(%esp)
80104dbf:	e8 cc c7 ff ff       	call   80101590 <iupdate>
  iunlockput(ip);
80104dc4:	89 1c 24             	mov    %ebx,(%esp)
80104dc7:	e8 04 cb ff ff       	call   801018d0 <iunlockput>

  end_op();
80104dcc:	e8 bf dd ff ff       	call   80102b90 <end_op>

  return 0;
80104dd1:	83 c4 10             	add    $0x10,%esp
80104dd4:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104dd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dd9:	5b                   	pop    %ebx
80104dda:	5e                   	pop    %esi
80104ddb:	5f                   	pop    %edi
80104ddc:	5d                   	pop    %ebp
80104ddd:	c3                   	ret    
80104dde:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104de0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104de4:	76 94                	jbe    80104d7a <sys_unlink+0xba>
80104de6:	bf 20 00 00 00       	mov    $0x20,%edi
80104deb:	eb 0f                	jmp    80104dfc <sys_unlink+0x13c>
80104ded:	8d 76 00             	lea    0x0(%esi),%esi
80104df0:	83 c7 10             	add    $0x10,%edi
80104df3:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104df6:	0f 83 7e ff ff ff    	jae    80104d7a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104dfc:	6a 10                	push   $0x10
80104dfe:	57                   	push   %edi
80104dff:	56                   	push   %esi
80104e00:	53                   	push   %ebx
80104e01:	e8 1a cb ff ff       	call   80101920 <readi>
80104e06:	83 c4 10             	add    $0x10,%esp
80104e09:	83 f8 10             	cmp    $0x10,%eax
80104e0c:	75 6c                	jne    80104e7a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104e0e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104e13:	74 db                	je     80104df0 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104e15:	83 ec 0c             	sub    $0xc,%esp
80104e18:	53                   	push   %ebx
80104e19:	e8 b2 ca ff ff       	call   801018d0 <iunlockput>
    goto bad;
80104e1e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104e21:	83 ec 0c             	sub    $0xc,%esp
80104e24:	ff 75 b4             	pushl  -0x4c(%ebp)
80104e27:	e8 a4 ca ff ff       	call   801018d0 <iunlockput>
  end_op();
80104e2c:	e8 5f dd ff ff       	call   80102b90 <end_op>
  return -1;
80104e31:	83 c4 10             	add    $0x10,%esp
}
80104e34:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104e37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e3c:	5b                   	pop    %ebx
80104e3d:	5e                   	pop    %esi
80104e3e:	5f                   	pop    %edi
80104e3f:	5d                   	pop    %ebp
80104e40:	c3                   	ret    
80104e41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104e48:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80104e4b:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104e4e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104e53:	50                   	push   %eax
80104e54:	e8 37 c7 ff ff       	call   80101590 <iupdate>
80104e59:	83 c4 10             	add    $0x10,%esp
80104e5c:	e9 4b ff ff ff       	jmp    80104dac <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80104e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e66:	e9 6b ff ff ff       	jmp    80104dd6 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
80104e6b:	e8 20 dd ff ff       	call   80102b90 <end_op>
    return -1;
80104e70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e75:	e9 5c ff ff ff       	jmp    80104dd6 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
80104e7a:	83 ec 0c             	sub    $0xc,%esp
80104e7d:	68 a0 77 10 80       	push   $0x801077a0
80104e82:	e8 e9 b4 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80104e87:	83 ec 0c             	sub    $0xc,%esp
80104e8a:	68 b2 77 10 80       	push   $0x801077b2
80104e8f:	e8 dc b4 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80104e94:	83 ec 0c             	sub    $0xc,%esp
80104e97:	68 8e 77 10 80       	push   $0x8010778e
80104e9c:	e8 cf b4 ff ff       	call   80100370 <panic>
80104ea1:	eb 0d                	jmp    80104eb0 <sys_open>
80104ea3:	90                   	nop
80104ea4:	90                   	nop
80104ea5:	90                   	nop
80104ea6:	90                   	nop
80104ea7:	90                   	nop
80104ea8:	90                   	nop
80104ea9:	90                   	nop
80104eaa:	90                   	nop
80104eab:	90                   	nop
80104eac:	90                   	nop
80104ead:	90                   	nop
80104eae:	90                   	nop
80104eaf:	90                   	nop

80104eb0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80104eb0:	55                   	push   %ebp
80104eb1:	89 e5                	mov    %esp,%ebp
80104eb3:	57                   	push   %edi
80104eb4:	56                   	push   %esi
80104eb5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104eb6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80104eb9:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104ebc:	50                   	push   %eax
80104ebd:	6a 00                	push   $0x0
80104ebf:	e8 6c f8 ff ff       	call   80104730 <argstr>
80104ec4:	83 c4 10             	add    $0x10,%esp
80104ec7:	85 c0                	test   %eax,%eax
80104ec9:	0f 88 9e 00 00 00    	js     80104f6d <sys_open+0xbd>
80104ecf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104ed2:	83 ec 08             	sub    $0x8,%esp
80104ed5:	50                   	push   %eax
80104ed6:	6a 01                	push   $0x1
80104ed8:	e8 f3 f7 ff ff       	call   801046d0 <argint>
80104edd:	83 c4 10             	add    $0x10,%esp
80104ee0:	85 c0                	test   %eax,%eax
80104ee2:	0f 88 85 00 00 00    	js     80104f6d <sys_open+0xbd>
    return -1;

  begin_op();
80104ee8:	e8 33 dc ff ff       	call   80102b20 <begin_op>

  if(omode & O_CREATE){
80104eed:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104ef1:	0f 85 89 00 00 00    	jne    80104f80 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80104ef7:	83 ec 0c             	sub    $0xc,%esp
80104efa:	ff 75 e0             	pushl  -0x20(%ebp)
80104efd:	e8 8e cf ff ff       	call   80101e90 <namei>
80104f02:	83 c4 10             	add    $0x10,%esp
80104f05:	85 c0                	test   %eax,%eax
80104f07:	89 c6                	mov    %eax,%esi
80104f09:	0f 84 8e 00 00 00    	je     80104f9d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
80104f0f:	83 ec 0c             	sub    $0xc,%esp
80104f12:	50                   	push   %eax
80104f13:	e8 28 c7 ff ff       	call   80101640 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104f18:	83 c4 10             	add    $0x10,%esp
80104f1b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104f20:	0f 84 d2 00 00 00    	je     80104ff8 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104f26:	e8 15 be ff ff       	call   80100d40 <filealloc>
80104f2b:	85 c0                	test   %eax,%eax
80104f2d:	89 c7                	mov    %eax,%edi
80104f2f:	74 2b                	je     80104f5c <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104f31:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104f33:	e8 18 e8 ff ff       	call   80103750 <myproc>
80104f38:	90                   	nop
80104f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104f40:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104f44:	85 d2                	test   %edx,%edx
80104f46:	74 68                	je     80104fb0 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104f48:	83 c3 01             	add    $0x1,%ebx
80104f4b:	83 fb 10             	cmp    $0x10,%ebx
80104f4e:	75 f0                	jne    80104f40 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80104f50:	83 ec 0c             	sub    $0xc,%esp
80104f53:	57                   	push   %edi
80104f54:	e8 a7 be ff ff       	call   80100e00 <fileclose>
80104f59:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
80104f5c:	83 ec 0c             	sub    $0xc,%esp
80104f5f:	56                   	push   %esi
80104f60:	e8 6b c9 ff ff       	call   801018d0 <iunlockput>
    end_op();
80104f65:	e8 26 dc ff ff       	call   80102b90 <end_op>
    return -1;
80104f6a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80104f6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80104f70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80104f75:	5b                   	pop    %ebx
80104f76:	5e                   	pop    %esi
80104f77:	5f                   	pop    %edi
80104f78:	5d                   	pop    %ebp
80104f79:	c3                   	ret    
80104f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104f80:	83 ec 0c             	sub    $0xc,%esp
80104f83:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104f86:	31 c9                	xor    %ecx,%ecx
80104f88:	6a 00                	push   $0x0
80104f8a:	ba 02 00 00 00       	mov    $0x2,%edx
80104f8f:	e8 3c f8 ff ff       	call   801047d0 <create>
    if(ip == 0){
80104f94:	83 c4 10             	add    $0x10,%esp
80104f97:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104f99:	89 c6                	mov    %eax,%esi
    if(ip == 0){
80104f9b:	75 89                	jne    80104f26 <sys_open+0x76>
      end_op();
80104f9d:	e8 ee db ff ff       	call   80102b90 <end_op>
      return -1;
80104fa2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fa7:	eb 43                	jmp    80104fec <sys_open+0x13c>
80104fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104fb0:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80104fb3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104fb7:	56                   	push   %esi
80104fb8:	e8 63 c7 ff ff       	call   80101720 <iunlock>
  end_op();
80104fbd:	e8 ce db ff ff       	call   80102b90 <end_op>

  f->type = FD_INODE;
80104fc2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104fc8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104fcb:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
80104fce:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80104fd1:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80104fd8:	89 d0                	mov    %edx,%eax
80104fda:	83 e0 01             	and    $0x1,%eax
80104fdd:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104fe0:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104fe3:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104fe6:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
80104fea:	89 d8                	mov    %ebx,%eax
}
80104fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fef:	5b                   	pop    %ebx
80104ff0:	5e                   	pop    %esi
80104ff1:	5f                   	pop    %edi
80104ff2:	5d                   	pop    %ebp
80104ff3:	c3                   	ret    
80104ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80104ff8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104ffb:	85 c9                	test   %ecx,%ecx
80104ffd:	0f 84 23 ff ff ff    	je     80104f26 <sys_open+0x76>
80105003:	e9 54 ff ff ff       	jmp    80104f5c <sys_open+0xac>
80105008:	90                   	nop
80105009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105010 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105010:	55                   	push   %ebp
80105011:	89 e5                	mov    %esp,%ebp
80105013:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105016:	e8 05 db ff ff       	call   80102b20 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010501b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010501e:	83 ec 08             	sub    $0x8,%esp
80105021:	50                   	push   %eax
80105022:	6a 00                	push   $0x0
80105024:	e8 07 f7 ff ff       	call   80104730 <argstr>
80105029:	83 c4 10             	add    $0x10,%esp
8010502c:	85 c0                	test   %eax,%eax
8010502e:	78 30                	js     80105060 <sys_mkdir+0x50>
80105030:	83 ec 0c             	sub    $0xc,%esp
80105033:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105036:	31 c9                	xor    %ecx,%ecx
80105038:	6a 00                	push   $0x0
8010503a:	ba 01 00 00 00       	mov    $0x1,%edx
8010503f:	e8 8c f7 ff ff       	call   801047d0 <create>
80105044:	83 c4 10             	add    $0x10,%esp
80105047:	85 c0                	test   %eax,%eax
80105049:	74 15                	je     80105060 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010504b:	83 ec 0c             	sub    $0xc,%esp
8010504e:	50                   	push   %eax
8010504f:	e8 7c c8 ff ff       	call   801018d0 <iunlockput>
  end_op();
80105054:	e8 37 db ff ff       	call   80102b90 <end_op>
  return 0;
80105059:	83 c4 10             	add    $0x10,%esp
8010505c:	31 c0                	xor    %eax,%eax
}
8010505e:	c9                   	leave  
8010505f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105060:	e8 2b db ff ff       	call   80102b90 <end_op>
    return -1;
80105065:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010506a:	c9                   	leave  
8010506b:	c3                   	ret    
8010506c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105070 <sys_mknod>:

int
sys_mknod(void)
{
80105070:	55                   	push   %ebp
80105071:	89 e5                	mov    %esp,%ebp
80105073:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105076:	e8 a5 da ff ff       	call   80102b20 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010507b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010507e:	83 ec 08             	sub    $0x8,%esp
80105081:	50                   	push   %eax
80105082:	6a 00                	push   $0x0
80105084:	e8 a7 f6 ff ff       	call   80104730 <argstr>
80105089:	83 c4 10             	add    $0x10,%esp
8010508c:	85 c0                	test   %eax,%eax
8010508e:	78 60                	js     801050f0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105090:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105093:	83 ec 08             	sub    $0x8,%esp
80105096:	50                   	push   %eax
80105097:	6a 01                	push   $0x1
80105099:	e8 32 f6 ff ff       	call   801046d0 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
8010509e:	83 c4 10             	add    $0x10,%esp
801050a1:	85 c0                	test   %eax,%eax
801050a3:	78 4b                	js     801050f0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801050a5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050a8:	83 ec 08             	sub    $0x8,%esp
801050ab:	50                   	push   %eax
801050ac:	6a 02                	push   $0x2
801050ae:	e8 1d f6 ff ff       	call   801046d0 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801050b3:	83 c4 10             	add    $0x10,%esp
801050b6:	85 c0                	test   %eax,%eax
801050b8:	78 36                	js     801050f0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801050ba:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801050be:	83 ec 0c             	sub    $0xc,%esp
801050c1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801050c5:	ba 03 00 00 00       	mov    $0x3,%edx
801050ca:	50                   	push   %eax
801050cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801050ce:	e8 fd f6 ff ff       	call   801047d0 <create>
801050d3:	83 c4 10             	add    $0x10,%esp
801050d6:	85 c0                	test   %eax,%eax
801050d8:	74 16                	je     801050f0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
801050da:	83 ec 0c             	sub    $0xc,%esp
801050dd:	50                   	push   %eax
801050de:	e8 ed c7 ff ff       	call   801018d0 <iunlockput>
  end_op();
801050e3:	e8 a8 da ff ff       	call   80102b90 <end_op>
  return 0;
801050e8:	83 c4 10             	add    $0x10,%esp
801050eb:	31 c0                	xor    %eax,%eax
}
801050ed:	c9                   	leave  
801050ee:	c3                   	ret    
801050ef:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
801050f0:	e8 9b da ff ff       	call   80102b90 <end_op>
    return -1;
801050f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801050fa:	c9                   	leave  
801050fb:	c3                   	ret    
801050fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105100 <sys_chdir>:

int
sys_chdir(void)
{
80105100:	55                   	push   %ebp
80105101:	89 e5                	mov    %esp,%ebp
80105103:	56                   	push   %esi
80105104:	53                   	push   %ebx
80105105:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105108:	e8 43 e6 ff ff       	call   80103750 <myproc>
8010510d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010510f:	e8 0c da ff ff       	call   80102b20 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105114:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105117:	83 ec 08             	sub    $0x8,%esp
8010511a:	50                   	push   %eax
8010511b:	6a 00                	push   $0x0
8010511d:	e8 0e f6 ff ff       	call   80104730 <argstr>
80105122:	83 c4 10             	add    $0x10,%esp
80105125:	85 c0                	test   %eax,%eax
80105127:	78 77                	js     801051a0 <sys_chdir+0xa0>
80105129:	83 ec 0c             	sub    $0xc,%esp
8010512c:	ff 75 f4             	pushl  -0xc(%ebp)
8010512f:	e8 5c cd ff ff       	call   80101e90 <namei>
80105134:	83 c4 10             	add    $0x10,%esp
80105137:	85 c0                	test   %eax,%eax
80105139:	89 c3                	mov    %eax,%ebx
8010513b:	74 63                	je     801051a0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010513d:	83 ec 0c             	sub    $0xc,%esp
80105140:	50                   	push   %eax
80105141:	e8 fa c4 ff ff       	call   80101640 <ilock>
  if(ip->type != T_DIR){
80105146:	83 c4 10             	add    $0x10,%esp
80105149:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010514e:	75 30                	jne    80105180 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105150:	83 ec 0c             	sub    $0xc,%esp
80105153:	53                   	push   %ebx
80105154:	e8 c7 c5 ff ff       	call   80101720 <iunlock>
  iput(curproc->cwd);
80105159:	58                   	pop    %eax
8010515a:	ff 76 68             	pushl  0x68(%esi)
8010515d:	e8 0e c6 ff ff       	call   80101770 <iput>
  end_op();
80105162:	e8 29 da ff ff       	call   80102b90 <end_op>
  curproc->cwd = ip;
80105167:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010516a:	83 c4 10             	add    $0x10,%esp
8010516d:	31 c0                	xor    %eax,%eax
}
8010516f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105172:	5b                   	pop    %ebx
80105173:	5e                   	pop    %esi
80105174:	5d                   	pop    %ebp
80105175:	c3                   	ret    
80105176:	8d 76 00             	lea    0x0(%esi),%esi
80105179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105180:	83 ec 0c             	sub    $0xc,%esp
80105183:	53                   	push   %ebx
80105184:	e8 47 c7 ff ff       	call   801018d0 <iunlockput>
    end_op();
80105189:	e8 02 da ff ff       	call   80102b90 <end_op>
    return -1;
8010518e:	83 c4 10             	add    $0x10,%esp
80105191:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105196:	eb d7                	jmp    8010516f <sys_chdir+0x6f>
80105198:	90                   	nop
80105199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
801051a0:	e8 eb d9 ff ff       	call   80102b90 <end_op>
    return -1;
801051a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051aa:	eb c3                	jmp    8010516f <sys_chdir+0x6f>
801051ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801051b0 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
801051b0:	55                   	push   %ebp
801051b1:	89 e5                	mov    %esp,%ebp
801051b3:	57                   	push   %edi
801051b4:	56                   	push   %esi
801051b5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801051b6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
801051bc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801051c2:	50                   	push   %eax
801051c3:	6a 00                	push   $0x0
801051c5:	e8 66 f5 ff ff       	call   80104730 <argstr>
801051ca:	83 c4 10             	add    $0x10,%esp
801051cd:	85 c0                	test   %eax,%eax
801051cf:	78 7f                	js     80105250 <sys_exec+0xa0>
801051d1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801051d7:	83 ec 08             	sub    $0x8,%esp
801051da:	50                   	push   %eax
801051db:	6a 01                	push   $0x1
801051dd:	e8 ee f4 ff ff       	call   801046d0 <argint>
801051e2:	83 c4 10             	add    $0x10,%esp
801051e5:	85 c0                	test   %eax,%eax
801051e7:	78 67                	js     80105250 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801051e9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801051ef:	83 ec 04             	sub    $0x4,%esp
801051f2:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
801051f8:	68 80 00 00 00       	push   $0x80
801051fd:	6a 00                	push   $0x0
801051ff:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105205:	50                   	push   %eax
80105206:	31 db                	xor    %ebx,%ebx
80105208:	e8 03 f2 ff ff       	call   80104410 <memset>
8010520d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105210:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105216:	83 ec 08             	sub    $0x8,%esp
80105219:	57                   	push   %edi
8010521a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010521d:	50                   	push   %eax
8010521e:	e8 5d f4 ff ff       	call   80104680 <fetchint>
80105223:	83 c4 10             	add    $0x10,%esp
80105226:	85 c0                	test   %eax,%eax
80105228:	78 26                	js     80105250 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010522a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105230:	85 c0                	test   %eax,%eax
80105232:	74 2c                	je     80105260 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105234:	83 ec 08             	sub    $0x8,%esp
80105237:	56                   	push   %esi
80105238:	50                   	push   %eax
80105239:	e8 62 f4 ff ff       	call   801046a0 <fetchstr>
8010523e:	83 c4 10             	add    $0x10,%esp
80105241:	85 c0                	test   %eax,%eax
80105243:	78 0b                	js     80105250 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105245:	83 c3 01             	add    $0x1,%ebx
80105248:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010524b:	83 fb 20             	cmp    $0x20,%ebx
8010524e:	75 c0                	jne    80105210 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105250:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105253:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105258:	5b                   	pop    %ebx
80105259:	5e                   	pop    %esi
8010525a:	5f                   	pop    %edi
8010525b:	5d                   	pop    %ebp
8010525c:	c3                   	ret    
8010525d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105260:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105266:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105269:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105270:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105274:	50                   	push   %eax
80105275:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010527b:	e8 70 b7 ff ff       	call   801009f0 <exec>
80105280:	83 c4 10             	add    $0x10,%esp
}
80105283:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105286:	5b                   	pop    %ebx
80105287:	5e                   	pop    %esi
80105288:	5f                   	pop    %edi
80105289:	5d                   	pop    %ebp
8010528a:	c3                   	ret    
8010528b:	90                   	nop
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_pipe>:

int
sys_pipe(void)
{
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	57                   	push   %edi
80105294:	56                   	push   %esi
80105295:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105296:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105299:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010529c:	6a 08                	push   $0x8
8010529e:	50                   	push   %eax
8010529f:	6a 00                	push   $0x0
801052a1:	e8 5a f4 ff ff       	call   80104700 <argptr>
801052a6:	83 c4 10             	add    $0x10,%esp
801052a9:	85 c0                	test   %eax,%eax
801052ab:	78 4a                	js     801052f7 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801052ad:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801052b0:	83 ec 08             	sub    $0x8,%esp
801052b3:	50                   	push   %eax
801052b4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801052b7:	50                   	push   %eax
801052b8:	e8 03 df ff ff       	call   801031c0 <pipealloc>
801052bd:	83 c4 10             	add    $0x10,%esp
801052c0:	85 c0                	test   %eax,%eax
801052c2:	78 33                	js     801052f7 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801052c4:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801052c6:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801052c9:	e8 82 e4 ff ff       	call   80103750 <myproc>
801052ce:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801052d0:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801052d4:	85 f6                	test   %esi,%esi
801052d6:	74 30                	je     80105308 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801052d8:	83 c3 01             	add    $0x1,%ebx
801052db:	83 fb 10             	cmp    $0x10,%ebx
801052de:	75 f0                	jne    801052d0 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	ff 75 e0             	pushl  -0x20(%ebp)
801052e6:	e8 15 bb ff ff       	call   80100e00 <fileclose>
    fileclose(wf);
801052eb:	58                   	pop    %eax
801052ec:	ff 75 e4             	pushl  -0x1c(%ebp)
801052ef:	e8 0c bb ff ff       	call   80100e00 <fileclose>
    return -1;
801052f4:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
801052f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
801052fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
801052ff:	5b                   	pop    %ebx
80105300:	5e                   	pop    %esi
80105301:	5f                   	pop    %edi
80105302:	5d                   	pop    %ebp
80105303:	c3                   	ret    
80105304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105308:	8d 73 08             	lea    0x8(%ebx),%esi
8010530b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010530f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105312:	e8 39 e4 ff ff       	call   80103750 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
80105317:	31 d2                	xor    %edx,%edx
80105319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
80105320:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105324:	85 c9                	test   %ecx,%ecx
80105326:	74 18                	je     80105340 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105328:	83 c2 01             	add    $0x1,%edx
8010532b:	83 fa 10             	cmp    $0x10,%edx
8010532e:	75 f0                	jne    80105320 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
80105330:	e8 1b e4 ff ff       	call   80103750 <myproc>
80105335:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010533c:	00 
8010533d:	eb a1                	jmp    801052e0 <sys_pipe+0x50>
8010533f:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105340:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105344:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105347:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105349:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010534c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
8010534f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
80105352:	31 c0                	xor    %eax,%eax
}
80105354:	5b                   	pop    %ebx
80105355:	5e                   	pop    %esi
80105356:	5f                   	pop    %edi
80105357:	5d                   	pop    %ebp
80105358:	c3                   	ret    
80105359:	66 90                	xchg   %ax,%ax
8010535b:	66 90                	xchg   %ax,%ax
8010535d:	66 90                	xchg   %ax,%ax
8010535f:	90                   	nop

80105360 <sys_shm_open>:
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_shm_open(void) {
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
80105363:	83 ec 20             	sub    $0x20,%esp
  int id;
  char **pointer;

  if(argint(0, &id) < 0)
80105366:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105369:	50                   	push   %eax
8010536a:	6a 00                	push   $0x0
8010536c:	e8 5f f3 ff ff       	call   801046d0 <argint>
80105371:	83 c4 10             	add    $0x10,%esp
80105374:	85 c0                	test   %eax,%eax
80105376:	78 30                	js     801053a8 <sys_shm_open+0x48>
    return -1;

  if(argptr(1, (char **) (&pointer),4)<0)
80105378:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010537b:	83 ec 04             	sub    $0x4,%esp
8010537e:	6a 04                	push   $0x4
80105380:	50                   	push   %eax
80105381:	6a 01                	push   $0x1
80105383:	e8 78 f3 ff ff       	call   80104700 <argptr>
80105388:	83 c4 10             	add    $0x10,%esp
8010538b:	85 c0                	test   %eax,%eax
8010538d:	78 19                	js     801053a8 <sys_shm_open+0x48>
    return -1;
  return shm_open(id, pointer);
8010538f:	83 ec 08             	sub    $0x8,%esp
80105392:	ff 75 f4             	pushl  -0xc(%ebp)
80105395:	ff 75 f0             	pushl  -0x10(%ebp)
80105398:	e8 33 1c 00 00       	call   80106fd0 <shm_open>
8010539d:	83 c4 10             	add    $0x10,%esp
}
801053a0:	c9                   	leave  
801053a1:	c3                   	ret    
801053a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int sys_shm_open(void) {
  int id;
  char **pointer;

  if(argint(0, &id) < 0)
    return -1;
801053a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

  if(argptr(1, (char **) (&pointer),4)<0)
    return -1;
  return shm_open(id, pointer);
}
801053ad:	c9                   	leave  
801053ae:	c3                   	ret    
801053af:	90                   	nop

801053b0 <sys_shm_close>:

int sys_shm_close(void) {
801053b0:	55                   	push   %ebp
801053b1:	89 e5                	mov    %esp,%ebp
801053b3:	83 ec 20             	sub    $0x20,%esp
  int id;

  if(argint(0, &id) < 0)
801053b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053b9:	50                   	push   %eax
801053ba:	6a 00                	push   $0x0
801053bc:	e8 0f f3 ff ff       	call   801046d0 <argint>
801053c1:	83 c4 10             	add    $0x10,%esp
801053c4:	85 c0                	test   %eax,%eax
801053c6:	78 18                	js     801053e0 <sys_shm_close+0x30>
    return -1;

  
  return shm_close(id);
801053c8:	83 ec 0c             	sub    $0xc,%esp
801053cb:	ff 75 f4             	pushl  -0xc(%ebp)
801053ce:	e8 0d 1c 00 00       	call   80106fe0 <shm_close>
801053d3:	83 c4 10             	add    $0x10,%esp
}
801053d6:	c9                   	leave  
801053d7:	c3                   	ret    
801053d8:	90                   	nop
801053d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

int sys_shm_close(void) {
  int id;

  if(argint(0, &id) < 0)
    return -1;
801053e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

  
  return shm_close(id);
}
801053e5:	c9                   	leave  
801053e6:	c3                   	ret    
801053e7:	89 f6                	mov    %esi,%esi
801053e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801053f0 <sys_fork>:

int
sys_fork(void)
{
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801053f3:	5d                   	pop    %ebp
}

int
sys_fork(void)
{
  return fork();
801053f4:	e9 27 e5 ff ff       	jmp    80103920 <fork>
801053f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105400 <sys_exit>:
}

int
sys_exit(void)
{
80105400:	55                   	push   %ebp
80105401:	89 e5                	mov    %esp,%ebp
80105403:	83 ec 08             	sub    $0x8,%esp
  exit();
80105406:	e8 a5 e7 ff ff       	call   80103bb0 <exit>
  return 0;  // not reached
}
8010540b:	31 c0                	xor    %eax,%eax
8010540d:	c9                   	leave  
8010540e:	c3                   	ret    
8010540f:	90                   	nop

80105410 <sys_wait>:

int
sys_wait(void)
{
80105410:	55                   	push   %ebp
80105411:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105413:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105414:	e9 d7 e9 ff ff       	jmp    80103df0 <wait>
80105419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_kill>:
}

int
sys_kill(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105426:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105429:	50                   	push   %eax
8010542a:	6a 00                	push   $0x0
8010542c:	e8 9f f2 ff ff       	call   801046d0 <argint>
80105431:	83 c4 10             	add    $0x10,%esp
80105434:	85 c0                	test   %eax,%eax
80105436:	78 18                	js     80105450 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105438:	83 ec 0c             	sub    $0xc,%esp
8010543b:	ff 75 f4             	pushl  -0xc(%ebp)
8010543e:	e8 fd ea ff ff       	call   80103f40 <kill>
80105443:	83 c4 10             	add    $0x10,%esp
}
80105446:	c9                   	leave  
80105447:	c3                   	ret    
80105448:	90                   	nop
80105449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105450:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105455:	c9                   	leave  
80105456:	c3                   	ret    
80105457:	89 f6                	mov    %esi,%esi
80105459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105460 <sys_getpid>:

int
sys_getpid(void)
{
80105460:	55                   	push   %ebp
80105461:	89 e5                	mov    %esp,%ebp
80105463:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105466:	e8 e5 e2 ff ff       	call   80103750 <myproc>
8010546b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010546e:	c9                   	leave  
8010546f:	c3                   	ret    

80105470 <sys_sbrk>:

int
sys_sbrk(void)
{
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105474:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105477:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010547a:	50                   	push   %eax
8010547b:	6a 00                	push   $0x0
8010547d:	e8 4e f2 ff ff       	call   801046d0 <argint>
80105482:	83 c4 10             	add    $0x10,%esp
80105485:	85 c0                	test   %eax,%eax
80105487:	78 27                	js     801054b0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105489:	e8 c2 e2 ff ff       	call   80103750 <myproc>
  if(growproc(n) < 0)
8010548e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
80105491:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105493:	ff 75 f4             	pushl  -0xc(%ebp)
80105496:	e8 05 e4 ff ff       	call   801038a0 <growproc>
8010549b:	83 c4 10             	add    $0x10,%esp
8010549e:	85 c0                	test   %eax,%eax
801054a0:	78 0e                	js     801054b0 <sys_sbrk+0x40>
    return -1;
  return addr;
801054a2:	89 d8                	mov    %ebx,%eax
}
801054a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801054a7:	c9                   	leave  
801054a8:	c3                   	ret    
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801054b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054b5:	eb ed                	jmp    801054a4 <sys_sbrk+0x34>
801054b7:	89 f6                	mov    %esi,%esi
801054b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054c0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801054c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
801054c7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801054ca:	50                   	push   %eax
801054cb:	6a 00                	push   $0x0
801054cd:	e8 fe f1 ff ff       	call   801046d0 <argint>
801054d2:	83 c4 10             	add    $0x10,%esp
801054d5:	85 c0                	test   %eax,%eax
801054d7:	0f 88 8a 00 00 00    	js     80105567 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801054dd:	83 ec 0c             	sub    $0xc,%esp
801054e0:	68 60 4d 11 80       	push   $0x80114d60
801054e5:	e8 b6 ed ff ff       	call   801042a0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801054ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
801054ed:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801054f0:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
  while(ticks - ticks0 < n){
801054f6:	85 d2                	test   %edx,%edx
801054f8:	75 27                	jne    80105521 <sys_sleep+0x61>
801054fa:	eb 54                	jmp    80105550 <sys_sleep+0x90>
801054fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105500:	83 ec 08             	sub    $0x8,%esp
80105503:	68 60 4d 11 80       	push   $0x80114d60
80105508:	68 a0 55 11 80       	push   $0x801155a0
8010550d:	e8 1e e8 ff ff       	call   80103d30 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105512:	a1 a0 55 11 80       	mov    0x801155a0,%eax
80105517:	83 c4 10             	add    $0x10,%esp
8010551a:	29 d8                	sub    %ebx,%eax
8010551c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010551f:	73 2f                	jae    80105550 <sys_sleep+0x90>
    if(myproc()->killed){
80105521:	e8 2a e2 ff ff       	call   80103750 <myproc>
80105526:	8b 40 24             	mov    0x24(%eax),%eax
80105529:	85 c0                	test   %eax,%eax
8010552b:	74 d3                	je     80105500 <sys_sleep+0x40>
      release(&tickslock);
8010552d:	83 ec 0c             	sub    $0xc,%esp
80105530:	68 60 4d 11 80       	push   $0x80114d60
80105535:	e8 86 ee ff ff       	call   801043c0 <release>
      return -1;
8010553a:	83 c4 10             	add    $0x10,%esp
8010553d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105542:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105545:	c9                   	leave  
80105546:	c3                   	ret    
80105547:	89 f6                	mov    %esi,%esi
80105549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105550:	83 ec 0c             	sub    $0xc,%esp
80105553:	68 60 4d 11 80       	push   $0x80114d60
80105558:	e8 63 ee ff ff       	call   801043c0 <release>
  return 0;
8010555d:	83 c4 10             	add    $0x10,%esp
80105560:	31 c0                	xor    %eax,%eax
}
80105562:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105565:	c9                   	leave  
80105566:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105567:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010556c:	eb d4                	jmp    80105542 <sys_sleep+0x82>
8010556e:	66 90                	xchg   %ax,%ax

80105570 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	53                   	push   %ebx
80105574:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105577:	68 60 4d 11 80       	push   $0x80114d60
8010557c:	e8 1f ed ff ff       	call   801042a0 <acquire>
  xticks = ticks;
80105581:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
  release(&tickslock);
80105587:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
8010558e:	e8 2d ee ff ff       	call   801043c0 <release>
  return xticks;
}
80105593:	89 d8                	mov    %ebx,%eax
80105595:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105598:	c9                   	leave  
80105599:	c3                   	ret    

8010559a <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
8010559a:	1e                   	push   %ds
  pushl %es
8010559b:	06                   	push   %es
  pushl %fs
8010559c:	0f a0                	push   %fs
  pushl %gs
8010559e:	0f a8                	push   %gs
  pushal
801055a0:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
801055a1:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
801055a5:	8e d8                	mov    %eax,%ds
  movw %ax, %es
801055a7:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
801055a9:	54                   	push   %esp
  call trap
801055aa:	e8 e1 00 00 00       	call   80105690 <trap>
  addl $4, %esp
801055af:	83 c4 04             	add    $0x4,%esp

801055b2 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
801055b2:	61                   	popa   
  popl %gs
801055b3:	0f a9                	pop    %gs
  popl %fs
801055b5:	0f a1                	pop    %fs
  popl %es
801055b7:	07                   	pop    %es
  popl %ds
801055b8:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
801055b9:	83 c4 08             	add    $0x8,%esp
  iret
801055bc:	cf                   	iret   
801055bd:	66 90                	xchg   %ax,%ax
801055bf:	90                   	nop

801055c0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801055c0:	31 c0                	xor    %eax,%eax
801055c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801055c8:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801055cf:	b9 08 00 00 00       	mov    $0x8,%ecx
801055d4:	c6 04 c5 a4 4d 11 80 	movb   $0x0,-0x7feeb25c(,%eax,8)
801055db:	00 
801055dc:	66 89 0c c5 a2 4d 11 	mov    %cx,-0x7feeb25e(,%eax,8)
801055e3:	80 
801055e4:	c6 04 c5 a5 4d 11 80 	movb   $0x8e,-0x7feeb25b(,%eax,8)
801055eb:	8e 
801055ec:	66 89 14 c5 a0 4d 11 	mov    %dx,-0x7feeb260(,%eax,8)
801055f3:	80 
801055f4:	c1 ea 10             	shr    $0x10,%edx
801055f7:	66 89 14 c5 a6 4d 11 	mov    %dx,-0x7feeb25a(,%eax,8)
801055fe:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801055ff:	83 c0 01             	add    $0x1,%eax
80105602:	3d 00 01 00 00       	cmp    $0x100,%eax
80105607:	75 bf                	jne    801055c8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105609:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010560a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010560f:	89 e5                	mov    %esp,%ebp
80105611:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105614:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105619:	68 c1 77 10 80       	push   $0x801077c1
8010561e:	68 60 4d 11 80       	push   $0x80114d60
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105623:	66 89 15 a2 4f 11 80 	mov    %dx,0x80114fa2
8010562a:	c6 05 a4 4f 11 80 00 	movb   $0x0,0x80114fa4
80105631:	66 a3 a0 4f 11 80    	mov    %ax,0x80114fa0
80105637:	c1 e8 10             	shr    $0x10,%eax
8010563a:	c6 05 a5 4f 11 80 ef 	movb   $0xef,0x80114fa5
80105641:	66 a3 a6 4f 11 80    	mov    %ax,0x80114fa6

  initlock(&tickslock, "time");
80105647:	e8 54 eb ff ff       	call   801041a0 <initlock>
}
8010564c:	83 c4 10             	add    $0x10,%esp
8010564f:	c9                   	leave  
80105650:	c3                   	ret    
80105651:	eb 0d                	jmp    80105660 <idtinit>
80105653:	90                   	nop
80105654:	90                   	nop
80105655:	90                   	nop
80105656:	90                   	nop
80105657:	90                   	nop
80105658:	90                   	nop
80105659:	90                   	nop
8010565a:	90                   	nop
8010565b:	90                   	nop
8010565c:	90                   	nop
8010565d:	90                   	nop
8010565e:	90                   	nop
8010565f:	90                   	nop

80105660 <idtinit>:

void
idtinit(void)
{
80105660:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105661:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105666:	89 e5                	mov    %esp,%ebp
80105668:	83 ec 10             	sub    $0x10,%esp
8010566b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010566f:	b8 a0 4d 11 80       	mov    $0x80114da0,%eax
80105674:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105678:	c1 e8 10             	shr    $0x10,%eax
8010567b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010567f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105682:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105685:	c9                   	leave  
80105686:	c3                   	ret    
80105687:	89 f6                	mov    %esi,%esi
80105689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105690 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
80105693:	57                   	push   %edi
80105694:	56                   	push   %esi
80105695:	53                   	push   %ebx
80105696:	83 ec 1c             	sub    $0x1c,%esp
80105699:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010569c:	8b 47 30             	mov    0x30(%edi),%eax
8010569f:	83 f8 40             	cmp    $0x40,%eax
801056a2:	0f 84 e8 01 00 00    	je     80105890 <trap+0x200>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
801056a8:	83 e8 0e             	sub    $0xe,%eax
801056ab:	83 f8 31             	cmp    $0x31,%eax
801056ae:	77 10                	ja     801056c0 <trap+0x30>
801056b0:	ff 24 85 9c 78 10 80 	jmp    *-0x7fef8764(,%eax,4)
801056b7:	89 f6                	mov    %esi,%esi
801056b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  }

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801056c0:	e8 8b e0 ff ff       	call   80103750 <myproc>
801056c5:	85 c0                	test   %eax,%eax
801056c7:	0f 84 57 02 00 00    	je     80105924 <trap+0x294>
801056cd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801056d1:	0f 84 4d 02 00 00    	je     80105924 <trap+0x294>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801056d7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801056da:	8b 57 38             	mov    0x38(%edi),%edx
801056dd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801056e0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801056e3:	e8 48 e0 ff ff       	call   80103730 <cpuid>
801056e8:	8b 77 34             	mov    0x34(%edi),%esi
801056eb:	8b 5f 30             	mov    0x30(%edi),%ebx
801056ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801056f1:	e8 5a e0 ff ff       	call   80103750 <myproc>
801056f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801056f9:	e8 52 e0 ff ff       	call   80103750 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801056fe:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105701:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105704:	51                   	push   %ecx
80105705:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105706:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105709:	ff 75 e4             	pushl  -0x1c(%ebp)
8010570c:	56                   	push   %esi
8010570d:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
8010570e:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105711:	52                   	push   %edx
80105712:	ff 70 10             	pushl  0x10(%eax)
80105715:	68 58 78 10 80       	push   $0x80107858
8010571a:	e8 41 af ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
8010571f:	83 c4 20             	add    $0x20,%esp
80105722:	e8 29 e0 ff ff       	call   80103750 <myproc>
80105727:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010572e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105730:	e8 1b e0 ff ff       	call   80103750 <myproc>
80105735:	85 c0                	test   %eax,%eax
80105737:	74 0c                	je     80105745 <trap+0xb5>
80105739:	e8 12 e0 ff ff       	call   80103750 <myproc>
8010573e:	8b 50 24             	mov    0x24(%eax),%edx
80105741:	85 d2                	test   %edx,%edx
80105743:	75 4b                	jne    80105790 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105745:	e8 06 e0 ff ff       	call   80103750 <myproc>
8010574a:	85 c0                	test   %eax,%eax
8010574c:	74 0b                	je     80105759 <trap+0xc9>
8010574e:	e8 fd df ff ff       	call   80103750 <myproc>
80105753:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105757:	74 4f                	je     801057a8 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105759:	e8 f2 df ff ff       	call   80103750 <myproc>
8010575e:	85 c0                	test   %eax,%eax
80105760:	74 1d                	je     8010577f <trap+0xef>
80105762:	e8 e9 df ff ff       	call   80103750 <myproc>
80105767:	8b 40 24             	mov    0x24(%eax),%eax
8010576a:	85 c0                	test   %eax,%eax
8010576c:	74 11                	je     8010577f <trap+0xef>
8010576e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105772:	83 e0 03             	and    $0x3,%eax
80105775:	66 83 f8 03          	cmp    $0x3,%ax
80105779:	0f 84 3a 01 00 00    	je     801058b9 <trap+0x229>
    exit();
}
8010577f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105782:	5b                   	pop    %ebx
80105783:	5e                   	pop    %esi
80105784:	5f                   	pop    %edi
80105785:	5d                   	pop    %ebp
80105786:	c3                   	ret    
80105787:	89 f6                	mov    %esi,%esi
80105789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105790:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105794:	83 e0 03             	and    $0x3,%eax
80105797:	66 83 f8 03          	cmp    $0x3,%ax
8010579b:	75 a8                	jne    80105745 <trap+0xb5>
    exit();
8010579d:	e8 0e e4 ff ff       	call   80103bb0 <exit>
801057a2:	eb a1                	jmp    80105745 <trap+0xb5>
801057a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801057a8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
801057ac:	75 ab                	jne    80105759 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
801057ae:	e8 2d e5 ff ff       	call   80103ce0 <yield>
801057b3:	eb a4                	jmp    80105759 <trap+0xc9>
801057b5:	8d 76 00             	lea    0x0(%esi),%esi
801057b8:	0f 20 d3             	mov    %cr2,%ebx
    lapiceoi();
    break;
  case T_PGFLT:
  {
    uint offadd = rcr2();
    cprintf("Page Fault: ");
801057bb:	83 ec 0c             	sub    $0xc,%esp
801057be:	68 c6 77 10 80       	push   $0x801077c6
801057c3:	e8 98 ae ff ff       	call   80100660 <cprintf>
    if(allocuvm(myproc()->pgdir, PGROUNDDOWN(offadd), offadd)){
801057c8:	e8 83 df ff ff       	call   80103750 <myproc>
801057cd:	83 c4 0c             	add    $0xc,%esp
801057d0:	53                   	push   %ebx
801057d1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801057d7:	53                   	push   %ebx
801057d8:	ff 70 04             	pushl  0x4(%eax)
801057db:	e8 90 12 00 00       	call   80106a70 <allocuvm>
801057e0:	83 c4 10             	add    $0x10,%esp
801057e3:	85 c0                	test   %eax,%eax
801057e5:	0f 84 dd 00 00 00    	je     801058c8 <trap+0x238>
      cprintf("Allocation success\n");
801057eb:	83 ec 0c             	sub    $0xc,%esp
801057ee:	68 d3 77 10 80       	push   $0x801077d3
801057f3:	e8 68 ae ff ff       	call   80100660 <cprintf>
      myproc()->pages++;
801057f8:	e8 53 df ff ff       	call   80103750 <myproc>
801057fd:	83 c4 10             	add    $0x10,%esp
80105800:	83 40 7c 01          	addl   $0x1,0x7c(%eax)
80105804:	e9 27 ff ff ff       	jmp    80105730 <trap+0xa0>
80105809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80105810:	e8 1b df ff ff       	call   80103730 <cpuid>
80105815:	85 c0                	test   %eax,%eax
80105817:	0f 84 d3 00 00 00    	je     801058f0 <trap+0x260>
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
8010581d:	e8 be ce ff ff       	call   801026e0 <lapiceoi>
    break;
80105822:	e9 09 ff ff ff       	jmp    80105730 <trap+0xa0>
80105827:	89 f6                	mov    %esi,%esi
80105829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105830:	e8 6b cd ff ff       	call   801025a0 <kbdintr>
    lapiceoi();
80105835:	e8 a6 ce ff ff       	call   801026e0 <lapiceoi>
    break;
8010583a:	e9 f1 fe ff ff       	jmp    80105730 <trap+0xa0>
8010583f:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105840:	e8 7b 02 00 00       	call   80105ac0 <uartintr>
    lapiceoi();
80105845:	e8 96 ce ff ff       	call   801026e0 <lapiceoi>
    break;
8010584a:	e9 e1 fe ff ff       	jmp    80105730 <trap+0xa0>
8010584f:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105850:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105854:	8b 77 38             	mov    0x38(%edi),%esi
80105857:	e8 d4 de ff ff       	call   80103730 <cpuid>
8010585c:	56                   	push   %esi
8010585d:	53                   	push   %ebx
8010585e:	50                   	push   %eax
8010585f:	68 00 78 10 80       	push   $0x80107800
80105864:	e8 f7 ad ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105869:	e8 72 ce ff ff       	call   801026e0 <lapiceoi>
    break;
8010586e:	83 c4 10             	add    $0x10,%esp
80105871:	e9 ba fe ff ff       	jmp    80105730 <trap+0xa0>
80105876:	8d 76 00             	lea    0x0(%esi),%esi
80105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105880:	e8 9b c7 ff ff       	call   80102020 <ideintr>
80105885:	eb 96                	jmp    8010581d <trap+0x18d>
80105887:	89 f6                	mov    %esi,%esi
80105889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
80105890:	e8 bb de ff ff       	call   80103750 <myproc>
80105895:	8b 58 24             	mov    0x24(%eax),%ebx
80105898:	85 db                	test   %ebx,%ebx
8010589a:	75 4c                	jne    801058e8 <trap+0x258>
      exit();
    myproc()->tf = tf;
8010589c:	e8 af de ff ff       	call   80103750 <myproc>
801058a1:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
801058a4:	e8 c7 ee ff ff       	call   80104770 <syscall>
    if(myproc()->killed)
801058a9:	e8 a2 de ff ff       	call   80103750 <myproc>
801058ae:	8b 48 24             	mov    0x24(%eax),%ecx
801058b1:	85 c9                	test   %ecx,%ecx
801058b3:	0f 84 c6 fe ff ff    	je     8010577f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
801058b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058bc:	5b                   	pop    %ebx
801058bd:	5e                   	pop    %esi
801058be:	5f                   	pop    %edi
801058bf:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
801058c0:	e9 eb e2 ff ff       	jmp    80103bb0 <exit>
801058c5:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("Allocation success\n");
      myproc()->pages++;
      //exit();
    }
    else {
      cprintf("Allocation failure\n");
801058c8:	83 ec 0c             	sub    $0xc,%esp
801058cb:	68 e7 77 10 80       	push   $0x801077e7
801058d0:	e8 8b ad ff ff       	call   80100660 <cprintf>
      exit();
801058d5:	e8 d6 e2 ff ff       	call   80103bb0 <exit>
801058da:	83 c4 10             	add    $0x10,%esp
801058dd:	e9 4e fe ff ff       	jmp    80105730 <trap+0xa0>
801058e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
801058e8:	e8 c3 e2 ff ff       	call   80103bb0 <exit>
801058ed:	eb ad                	jmp    8010589c <trap+0x20c>
801058ef:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
801058f0:	83 ec 0c             	sub    $0xc,%esp
801058f3:	68 60 4d 11 80       	push   $0x80114d60
801058f8:	e8 a3 e9 ff ff       	call   801042a0 <acquire>
      ticks++;
      wakeup(&ticks);
801058fd:	c7 04 24 a0 55 11 80 	movl   $0x801155a0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105904:	83 05 a0 55 11 80 01 	addl   $0x1,0x801155a0
      wakeup(&ticks);
8010590b:	e8 d0 e5 ff ff       	call   80103ee0 <wakeup>
      release(&tickslock);
80105910:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
80105917:	e8 a4 ea ff ff       	call   801043c0 <release>
8010591c:	83 c4 10             	add    $0x10,%esp
8010591f:	e9 f9 fe ff ff       	jmp    8010581d <trap+0x18d>
80105924:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105927:	8b 5f 38             	mov    0x38(%edi),%ebx
8010592a:	e8 01 de ff ff       	call   80103730 <cpuid>
8010592f:	83 ec 0c             	sub    $0xc,%esp
80105932:	56                   	push   %esi
80105933:	53                   	push   %ebx
80105934:	50                   	push   %eax
80105935:	ff 77 30             	pushl  0x30(%edi)
80105938:	68 24 78 10 80       	push   $0x80107824
8010593d:	e8 1e ad ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105942:	83 c4 14             	add    $0x14,%esp
80105945:	68 fb 77 10 80       	push   $0x801077fb
8010594a:	e8 21 aa ff ff       	call   80100370 <panic>
8010594f:	90                   	nop

80105950 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105950:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105955:	55                   	push   %ebp
80105956:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105958:	85 c0                	test   %eax,%eax
8010595a:	74 1c                	je     80105978 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010595c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105961:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105962:	a8 01                	test   $0x1,%al
80105964:	74 12                	je     80105978 <uartgetc+0x28>
80105966:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010596b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
8010596c:	0f b6 c0             	movzbl %al,%eax
}
8010596f:	5d                   	pop    %ebp
80105970:	c3                   	ret    
80105971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105978:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
8010597d:	5d                   	pop    %ebp
8010597e:	c3                   	ret    
8010597f:	90                   	nop

80105980 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
80105983:	57                   	push   %edi
80105984:	56                   	push   %esi
80105985:	53                   	push   %ebx
80105986:	89 c7                	mov    %eax,%edi
80105988:	bb 80 00 00 00       	mov    $0x80,%ebx
8010598d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105992:	83 ec 0c             	sub    $0xc,%esp
80105995:	eb 1b                	jmp    801059b2 <uartputc.part.0+0x32>
80105997:	89 f6                	mov    %esi,%esi
80105999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
801059a0:	83 ec 0c             	sub    $0xc,%esp
801059a3:	6a 0a                	push   $0xa
801059a5:	e8 56 cd ff ff       	call   80102700 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801059aa:	83 c4 10             	add    $0x10,%esp
801059ad:	83 eb 01             	sub    $0x1,%ebx
801059b0:	74 07                	je     801059b9 <uartputc.part.0+0x39>
801059b2:	89 f2                	mov    %esi,%edx
801059b4:	ec                   	in     (%dx),%al
801059b5:	a8 20                	test   $0x20,%al
801059b7:	74 e7                	je     801059a0 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801059b9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801059be:	89 f8                	mov    %edi,%eax
801059c0:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
801059c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059c4:	5b                   	pop    %ebx
801059c5:	5e                   	pop    %esi
801059c6:	5f                   	pop    %edi
801059c7:	5d                   	pop    %ebp
801059c8:	c3                   	ret    
801059c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801059d0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
801059d0:	55                   	push   %ebp
801059d1:	31 c9                	xor    %ecx,%ecx
801059d3:	89 c8                	mov    %ecx,%eax
801059d5:	89 e5                	mov    %esp,%ebp
801059d7:	57                   	push   %edi
801059d8:	56                   	push   %esi
801059d9:	53                   	push   %ebx
801059da:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801059df:	89 da                	mov    %ebx,%edx
801059e1:	83 ec 0c             	sub    $0xc,%esp
801059e4:	ee                   	out    %al,(%dx)
801059e5:	bf fb 03 00 00       	mov    $0x3fb,%edi
801059ea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801059ef:	89 fa                	mov    %edi,%edx
801059f1:	ee                   	out    %al,(%dx)
801059f2:	b8 0c 00 00 00       	mov    $0xc,%eax
801059f7:	ba f8 03 00 00       	mov    $0x3f8,%edx
801059fc:	ee                   	out    %al,(%dx)
801059fd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105a02:	89 c8                	mov    %ecx,%eax
80105a04:	89 f2                	mov    %esi,%edx
80105a06:	ee                   	out    %al,(%dx)
80105a07:	b8 03 00 00 00       	mov    $0x3,%eax
80105a0c:	89 fa                	mov    %edi,%edx
80105a0e:	ee                   	out    %al,(%dx)
80105a0f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105a14:	89 c8                	mov    %ecx,%eax
80105a16:	ee                   	out    %al,(%dx)
80105a17:	b8 01 00 00 00       	mov    $0x1,%eax
80105a1c:	89 f2                	mov    %esi,%edx
80105a1e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105a1f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a24:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105a25:	3c ff                	cmp    $0xff,%al
80105a27:	74 5a                	je     80105a83 <uartinit+0xb3>
    return;
  uart = 1;
80105a29:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105a30:	00 00 00 
80105a33:	89 da                	mov    %ebx,%edx
80105a35:	ec                   	in     (%dx),%al
80105a36:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a3b:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
80105a3c:	83 ec 08             	sub    $0x8,%esp
80105a3f:	bb 64 79 10 80       	mov    $0x80107964,%ebx
80105a44:	6a 00                	push   $0x0
80105a46:	6a 04                	push   $0x4
80105a48:	e8 23 c8 ff ff       	call   80102270 <ioapicenable>
80105a4d:	83 c4 10             	add    $0x10,%esp
80105a50:	b8 78 00 00 00       	mov    $0x78,%eax
80105a55:	eb 13                	jmp    80105a6a <uartinit+0x9a>
80105a57:	89 f6                	mov    %esi,%esi
80105a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105a60:	83 c3 01             	add    $0x1,%ebx
80105a63:	0f be 03             	movsbl (%ebx),%eax
80105a66:	84 c0                	test   %al,%al
80105a68:	74 19                	je     80105a83 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105a6a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105a70:	85 d2                	test   %edx,%edx
80105a72:	74 ec                	je     80105a60 <uartinit+0x90>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105a74:	83 c3 01             	add    $0x1,%ebx
80105a77:	e8 04 ff ff ff       	call   80105980 <uartputc.part.0>
80105a7c:	0f be 03             	movsbl (%ebx),%eax
80105a7f:	84 c0                	test   %al,%al
80105a81:	75 e7                	jne    80105a6a <uartinit+0x9a>
    uartputc(*p);
}
80105a83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a86:	5b                   	pop    %ebx
80105a87:	5e                   	pop    %esi
80105a88:	5f                   	pop    %edi
80105a89:	5d                   	pop    %ebp
80105a8a:	c3                   	ret    
80105a8b:	90                   	nop
80105a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105a90 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105a90:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105a96:	55                   	push   %ebp
80105a97:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105a99:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105a9b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105a9e:	74 10                	je     80105ab0 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105aa0:	5d                   	pop    %ebp
80105aa1:	e9 da fe ff ff       	jmp    80105980 <uartputc.part.0>
80105aa6:	8d 76 00             	lea    0x0(%esi),%esi
80105aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ab0:	5d                   	pop    %ebp
80105ab1:	c3                   	ret    
80105ab2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ac0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105ac0:	55                   	push   %ebp
80105ac1:	89 e5                	mov    %esp,%ebp
80105ac3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105ac6:	68 50 59 10 80       	push   $0x80105950
80105acb:	e8 20 ad ff ff       	call   801007f0 <consoleintr>
}
80105ad0:	83 c4 10             	add    $0x10,%esp
80105ad3:	c9                   	leave  
80105ad4:	c3                   	ret    

80105ad5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105ad5:	6a 00                	push   $0x0
  pushl $0
80105ad7:	6a 00                	push   $0x0
  jmp alltraps
80105ad9:	e9 bc fa ff ff       	jmp    8010559a <alltraps>

80105ade <vector1>:
.globl vector1
vector1:
  pushl $0
80105ade:	6a 00                	push   $0x0
  pushl $1
80105ae0:	6a 01                	push   $0x1
  jmp alltraps
80105ae2:	e9 b3 fa ff ff       	jmp    8010559a <alltraps>

80105ae7 <vector2>:
.globl vector2
vector2:
  pushl $0
80105ae7:	6a 00                	push   $0x0
  pushl $2
80105ae9:	6a 02                	push   $0x2
  jmp alltraps
80105aeb:	e9 aa fa ff ff       	jmp    8010559a <alltraps>

80105af0 <vector3>:
.globl vector3
vector3:
  pushl $0
80105af0:	6a 00                	push   $0x0
  pushl $3
80105af2:	6a 03                	push   $0x3
  jmp alltraps
80105af4:	e9 a1 fa ff ff       	jmp    8010559a <alltraps>

80105af9 <vector4>:
.globl vector4
vector4:
  pushl $0
80105af9:	6a 00                	push   $0x0
  pushl $4
80105afb:	6a 04                	push   $0x4
  jmp alltraps
80105afd:	e9 98 fa ff ff       	jmp    8010559a <alltraps>

80105b02 <vector5>:
.globl vector5
vector5:
  pushl $0
80105b02:	6a 00                	push   $0x0
  pushl $5
80105b04:	6a 05                	push   $0x5
  jmp alltraps
80105b06:	e9 8f fa ff ff       	jmp    8010559a <alltraps>

80105b0b <vector6>:
.globl vector6
vector6:
  pushl $0
80105b0b:	6a 00                	push   $0x0
  pushl $6
80105b0d:	6a 06                	push   $0x6
  jmp alltraps
80105b0f:	e9 86 fa ff ff       	jmp    8010559a <alltraps>

80105b14 <vector7>:
.globl vector7
vector7:
  pushl $0
80105b14:	6a 00                	push   $0x0
  pushl $7
80105b16:	6a 07                	push   $0x7
  jmp alltraps
80105b18:	e9 7d fa ff ff       	jmp    8010559a <alltraps>

80105b1d <vector8>:
.globl vector8
vector8:
  pushl $8
80105b1d:	6a 08                	push   $0x8
  jmp alltraps
80105b1f:	e9 76 fa ff ff       	jmp    8010559a <alltraps>

80105b24 <vector9>:
.globl vector9
vector9:
  pushl $0
80105b24:	6a 00                	push   $0x0
  pushl $9
80105b26:	6a 09                	push   $0x9
  jmp alltraps
80105b28:	e9 6d fa ff ff       	jmp    8010559a <alltraps>

80105b2d <vector10>:
.globl vector10
vector10:
  pushl $10
80105b2d:	6a 0a                	push   $0xa
  jmp alltraps
80105b2f:	e9 66 fa ff ff       	jmp    8010559a <alltraps>

80105b34 <vector11>:
.globl vector11
vector11:
  pushl $11
80105b34:	6a 0b                	push   $0xb
  jmp alltraps
80105b36:	e9 5f fa ff ff       	jmp    8010559a <alltraps>

80105b3b <vector12>:
.globl vector12
vector12:
  pushl $12
80105b3b:	6a 0c                	push   $0xc
  jmp alltraps
80105b3d:	e9 58 fa ff ff       	jmp    8010559a <alltraps>

80105b42 <vector13>:
.globl vector13
vector13:
  pushl $13
80105b42:	6a 0d                	push   $0xd
  jmp alltraps
80105b44:	e9 51 fa ff ff       	jmp    8010559a <alltraps>

80105b49 <vector14>:
.globl vector14
vector14:
  pushl $14
80105b49:	6a 0e                	push   $0xe
  jmp alltraps
80105b4b:	e9 4a fa ff ff       	jmp    8010559a <alltraps>

80105b50 <vector15>:
.globl vector15
vector15:
  pushl $0
80105b50:	6a 00                	push   $0x0
  pushl $15
80105b52:	6a 0f                	push   $0xf
  jmp alltraps
80105b54:	e9 41 fa ff ff       	jmp    8010559a <alltraps>

80105b59 <vector16>:
.globl vector16
vector16:
  pushl $0
80105b59:	6a 00                	push   $0x0
  pushl $16
80105b5b:	6a 10                	push   $0x10
  jmp alltraps
80105b5d:	e9 38 fa ff ff       	jmp    8010559a <alltraps>

80105b62 <vector17>:
.globl vector17
vector17:
  pushl $17
80105b62:	6a 11                	push   $0x11
  jmp alltraps
80105b64:	e9 31 fa ff ff       	jmp    8010559a <alltraps>

80105b69 <vector18>:
.globl vector18
vector18:
  pushl $0
80105b69:	6a 00                	push   $0x0
  pushl $18
80105b6b:	6a 12                	push   $0x12
  jmp alltraps
80105b6d:	e9 28 fa ff ff       	jmp    8010559a <alltraps>

80105b72 <vector19>:
.globl vector19
vector19:
  pushl $0
80105b72:	6a 00                	push   $0x0
  pushl $19
80105b74:	6a 13                	push   $0x13
  jmp alltraps
80105b76:	e9 1f fa ff ff       	jmp    8010559a <alltraps>

80105b7b <vector20>:
.globl vector20
vector20:
  pushl $0
80105b7b:	6a 00                	push   $0x0
  pushl $20
80105b7d:	6a 14                	push   $0x14
  jmp alltraps
80105b7f:	e9 16 fa ff ff       	jmp    8010559a <alltraps>

80105b84 <vector21>:
.globl vector21
vector21:
  pushl $0
80105b84:	6a 00                	push   $0x0
  pushl $21
80105b86:	6a 15                	push   $0x15
  jmp alltraps
80105b88:	e9 0d fa ff ff       	jmp    8010559a <alltraps>

80105b8d <vector22>:
.globl vector22
vector22:
  pushl $0
80105b8d:	6a 00                	push   $0x0
  pushl $22
80105b8f:	6a 16                	push   $0x16
  jmp alltraps
80105b91:	e9 04 fa ff ff       	jmp    8010559a <alltraps>

80105b96 <vector23>:
.globl vector23
vector23:
  pushl $0
80105b96:	6a 00                	push   $0x0
  pushl $23
80105b98:	6a 17                	push   $0x17
  jmp alltraps
80105b9a:	e9 fb f9 ff ff       	jmp    8010559a <alltraps>

80105b9f <vector24>:
.globl vector24
vector24:
  pushl $0
80105b9f:	6a 00                	push   $0x0
  pushl $24
80105ba1:	6a 18                	push   $0x18
  jmp alltraps
80105ba3:	e9 f2 f9 ff ff       	jmp    8010559a <alltraps>

80105ba8 <vector25>:
.globl vector25
vector25:
  pushl $0
80105ba8:	6a 00                	push   $0x0
  pushl $25
80105baa:	6a 19                	push   $0x19
  jmp alltraps
80105bac:	e9 e9 f9 ff ff       	jmp    8010559a <alltraps>

80105bb1 <vector26>:
.globl vector26
vector26:
  pushl $0
80105bb1:	6a 00                	push   $0x0
  pushl $26
80105bb3:	6a 1a                	push   $0x1a
  jmp alltraps
80105bb5:	e9 e0 f9 ff ff       	jmp    8010559a <alltraps>

80105bba <vector27>:
.globl vector27
vector27:
  pushl $0
80105bba:	6a 00                	push   $0x0
  pushl $27
80105bbc:	6a 1b                	push   $0x1b
  jmp alltraps
80105bbe:	e9 d7 f9 ff ff       	jmp    8010559a <alltraps>

80105bc3 <vector28>:
.globl vector28
vector28:
  pushl $0
80105bc3:	6a 00                	push   $0x0
  pushl $28
80105bc5:	6a 1c                	push   $0x1c
  jmp alltraps
80105bc7:	e9 ce f9 ff ff       	jmp    8010559a <alltraps>

80105bcc <vector29>:
.globl vector29
vector29:
  pushl $0
80105bcc:	6a 00                	push   $0x0
  pushl $29
80105bce:	6a 1d                	push   $0x1d
  jmp alltraps
80105bd0:	e9 c5 f9 ff ff       	jmp    8010559a <alltraps>

80105bd5 <vector30>:
.globl vector30
vector30:
  pushl $0
80105bd5:	6a 00                	push   $0x0
  pushl $30
80105bd7:	6a 1e                	push   $0x1e
  jmp alltraps
80105bd9:	e9 bc f9 ff ff       	jmp    8010559a <alltraps>

80105bde <vector31>:
.globl vector31
vector31:
  pushl $0
80105bde:	6a 00                	push   $0x0
  pushl $31
80105be0:	6a 1f                	push   $0x1f
  jmp alltraps
80105be2:	e9 b3 f9 ff ff       	jmp    8010559a <alltraps>

80105be7 <vector32>:
.globl vector32
vector32:
  pushl $0
80105be7:	6a 00                	push   $0x0
  pushl $32
80105be9:	6a 20                	push   $0x20
  jmp alltraps
80105beb:	e9 aa f9 ff ff       	jmp    8010559a <alltraps>

80105bf0 <vector33>:
.globl vector33
vector33:
  pushl $0
80105bf0:	6a 00                	push   $0x0
  pushl $33
80105bf2:	6a 21                	push   $0x21
  jmp alltraps
80105bf4:	e9 a1 f9 ff ff       	jmp    8010559a <alltraps>

80105bf9 <vector34>:
.globl vector34
vector34:
  pushl $0
80105bf9:	6a 00                	push   $0x0
  pushl $34
80105bfb:	6a 22                	push   $0x22
  jmp alltraps
80105bfd:	e9 98 f9 ff ff       	jmp    8010559a <alltraps>

80105c02 <vector35>:
.globl vector35
vector35:
  pushl $0
80105c02:	6a 00                	push   $0x0
  pushl $35
80105c04:	6a 23                	push   $0x23
  jmp alltraps
80105c06:	e9 8f f9 ff ff       	jmp    8010559a <alltraps>

80105c0b <vector36>:
.globl vector36
vector36:
  pushl $0
80105c0b:	6a 00                	push   $0x0
  pushl $36
80105c0d:	6a 24                	push   $0x24
  jmp alltraps
80105c0f:	e9 86 f9 ff ff       	jmp    8010559a <alltraps>

80105c14 <vector37>:
.globl vector37
vector37:
  pushl $0
80105c14:	6a 00                	push   $0x0
  pushl $37
80105c16:	6a 25                	push   $0x25
  jmp alltraps
80105c18:	e9 7d f9 ff ff       	jmp    8010559a <alltraps>

80105c1d <vector38>:
.globl vector38
vector38:
  pushl $0
80105c1d:	6a 00                	push   $0x0
  pushl $38
80105c1f:	6a 26                	push   $0x26
  jmp alltraps
80105c21:	e9 74 f9 ff ff       	jmp    8010559a <alltraps>

80105c26 <vector39>:
.globl vector39
vector39:
  pushl $0
80105c26:	6a 00                	push   $0x0
  pushl $39
80105c28:	6a 27                	push   $0x27
  jmp alltraps
80105c2a:	e9 6b f9 ff ff       	jmp    8010559a <alltraps>

80105c2f <vector40>:
.globl vector40
vector40:
  pushl $0
80105c2f:	6a 00                	push   $0x0
  pushl $40
80105c31:	6a 28                	push   $0x28
  jmp alltraps
80105c33:	e9 62 f9 ff ff       	jmp    8010559a <alltraps>

80105c38 <vector41>:
.globl vector41
vector41:
  pushl $0
80105c38:	6a 00                	push   $0x0
  pushl $41
80105c3a:	6a 29                	push   $0x29
  jmp alltraps
80105c3c:	e9 59 f9 ff ff       	jmp    8010559a <alltraps>

80105c41 <vector42>:
.globl vector42
vector42:
  pushl $0
80105c41:	6a 00                	push   $0x0
  pushl $42
80105c43:	6a 2a                	push   $0x2a
  jmp alltraps
80105c45:	e9 50 f9 ff ff       	jmp    8010559a <alltraps>

80105c4a <vector43>:
.globl vector43
vector43:
  pushl $0
80105c4a:	6a 00                	push   $0x0
  pushl $43
80105c4c:	6a 2b                	push   $0x2b
  jmp alltraps
80105c4e:	e9 47 f9 ff ff       	jmp    8010559a <alltraps>

80105c53 <vector44>:
.globl vector44
vector44:
  pushl $0
80105c53:	6a 00                	push   $0x0
  pushl $44
80105c55:	6a 2c                	push   $0x2c
  jmp alltraps
80105c57:	e9 3e f9 ff ff       	jmp    8010559a <alltraps>

80105c5c <vector45>:
.globl vector45
vector45:
  pushl $0
80105c5c:	6a 00                	push   $0x0
  pushl $45
80105c5e:	6a 2d                	push   $0x2d
  jmp alltraps
80105c60:	e9 35 f9 ff ff       	jmp    8010559a <alltraps>

80105c65 <vector46>:
.globl vector46
vector46:
  pushl $0
80105c65:	6a 00                	push   $0x0
  pushl $46
80105c67:	6a 2e                	push   $0x2e
  jmp alltraps
80105c69:	e9 2c f9 ff ff       	jmp    8010559a <alltraps>

80105c6e <vector47>:
.globl vector47
vector47:
  pushl $0
80105c6e:	6a 00                	push   $0x0
  pushl $47
80105c70:	6a 2f                	push   $0x2f
  jmp alltraps
80105c72:	e9 23 f9 ff ff       	jmp    8010559a <alltraps>

80105c77 <vector48>:
.globl vector48
vector48:
  pushl $0
80105c77:	6a 00                	push   $0x0
  pushl $48
80105c79:	6a 30                	push   $0x30
  jmp alltraps
80105c7b:	e9 1a f9 ff ff       	jmp    8010559a <alltraps>

80105c80 <vector49>:
.globl vector49
vector49:
  pushl $0
80105c80:	6a 00                	push   $0x0
  pushl $49
80105c82:	6a 31                	push   $0x31
  jmp alltraps
80105c84:	e9 11 f9 ff ff       	jmp    8010559a <alltraps>

80105c89 <vector50>:
.globl vector50
vector50:
  pushl $0
80105c89:	6a 00                	push   $0x0
  pushl $50
80105c8b:	6a 32                	push   $0x32
  jmp alltraps
80105c8d:	e9 08 f9 ff ff       	jmp    8010559a <alltraps>

80105c92 <vector51>:
.globl vector51
vector51:
  pushl $0
80105c92:	6a 00                	push   $0x0
  pushl $51
80105c94:	6a 33                	push   $0x33
  jmp alltraps
80105c96:	e9 ff f8 ff ff       	jmp    8010559a <alltraps>

80105c9b <vector52>:
.globl vector52
vector52:
  pushl $0
80105c9b:	6a 00                	push   $0x0
  pushl $52
80105c9d:	6a 34                	push   $0x34
  jmp alltraps
80105c9f:	e9 f6 f8 ff ff       	jmp    8010559a <alltraps>

80105ca4 <vector53>:
.globl vector53
vector53:
  pushl $0
80105ca4:	6a 00                	push   $0x0
  pushl $53
80105ca6:	6a 35                	push   $0x35
  jmp alltraps
80105ca8:	e9 ed f8 ff ff       	jmp    8010559a <alltraps>

80105cad <vector54>:
.globl vector54
vector54:
  pushl $0
80105cad:	6a 00                	push   $0x0
  pushl $54
80105caf:	6a 36                	push   $0x36
  jmp alltraps
80105cb1:	e9 e4 f8 ff ff       	jmp    8010559a <alltraps>

80105cb6 <vector55>:
.globl vector55
vector55:
  pushl $0
80105cb6:	6a 00                	push   $0x0
  pushl $55
80105cb8:	6a 37                	push   $0x37
  jmp alltraps
80105cba:	e9 db f8 ff ff       	jmp    8010559a <alltraps>

80105cbf <vector56>:
.globl vector56
vector56:
  pushl $0
80105cbf:	6a 00                	push   $0x0
  pushl $56
80105cc1:	6a 38                	push   $0x38
  jmp alltraps
80105cc3:	e9 d2 f8 ff ff       	jmp    8010559a <alltraps>

80105cc8 <vector57>:
.globl vector57
vector57:
  pushl $0
80105cc8:	6a 00                	push   $0x0
  pushl $57
80105cca:	6a 39                	push   $0x39
  jmp alltraps
80105ccc:	e9 c9 f8 ff ff       	jmp    8010559a <alltraps>

80105cd1 <vector58>:
.globl vector58
vector58:
  pushl $0
80105cd1:	6a 00                	push   $0x0
  pushl $58
80105cd3:	6a 3a                	push   $0x3a
  jmp alltraps
80105cd5:	e9 c0 f8 ff ff       	jmp    8010559a <alltraps>

80105cda <vector59>:
.globl vector59
vector59:
  pushl $0
80105cda:	6a 00                	push   $0x0
  pushl $59
80105cdc:	6a 3b                	push   $0x3b
  jmp alltraps
80105cde:	e9 b7 f8 ff ff       	jmp    8010559a <alltraps>

80105ce3 <vector60>:
.globl vector60
vector60:
  pushl $0
80105ce3:	6a 00                	push   $0x0
  pushl $60
80105ce5:	6a 3c                	push   $0x3c
  jmp alltraps
80105ce7:	e9 ae f8 ff ff       	jmp    8010559a <alltraps>

80105cec <vector61>:
.globl vector61
vector61:
  pushl $0
80105cec:	6a 00                	push   $0x0
  pushl $61
80105cee:	6a 3d                	push   $0x3d
  jmp alltraps
80105cf0:	e9 a5 f8 ff ff       	jmp    8010559a <alltraps>

80105cf5 <vector62>:
.globl vector62
vector62:
  pushl $0
80105cf5:	6a 00                	push   $0x0
  pushl $62
80105cf7:	6a 3e                	push   $0x3e
  jmp alltraps
80105cf9:	e9 9c f8 ff ff       	jmp    8010559a <alltraps>

80105cfe <vector63>:
.globl vector63
vector63:
  pushl $0
80105cfe:	6a 00                	push   $0x0
  pushl $63
80105d00:	6a 3f                	push   $0x3f
  jmp alltraps
80105d02:	e9 93 f8 ff ff       	jmp    8010559a <alltraps>

80105d07 <vector64>:
.globl vector64
vector64:
  pushl $0
80105d07:	6a 00                	push   $0x0
  pushl $64
80105d09:	6a 40                	push   $0x40
  jmp alltraps
80105d0b:	e9 8a f8 ff ff       	jmp    8010559a <alltraps>

80105d10 <vector65>:
.globl vector65
vector65:
  pushl $0
80105d10:	6a 00                	push   $0x0
  pushl $65
80105d12:	6a 41                	push   $0x41
  jmp alltraps
80105d14:	e9 81 f8 ff ff       	jmp    8010559a <alltraps>

80105d19 <vector66>:
.globl vector66
vector66:
  pushl $0
80105d19:	6a 00                	push   $0x0
  pushl $66
80105d1b:	6a 42                	push   $0x42
  jmp alltraps
80105d1d:	e9 78 f8 ff ff       	jmp    8010559a <alltraps>

80105d22 <vector67>:
.globl vector67
vector67:
  pushl $0
80105d22:	6a 00                	push   $0x0
  pushl $67
80105d24:	6a 43                	push   $0x43
  jmp alltraps
80105d26:	e9 6f f8 ff ff       	jmp    8010559a <alltraps>

80105d2b <vector68>:
.globl vector68
vector68:
  pushl $0
80105d2b:	6a 00                	push   $0x0
  pushl $68
80105d2d:	6a 44                	push   $0x44
  jmp alltraps
80105d2f:	e9 66 f8 ff ff       	jmp    8010559a <alltraps>

80105d34 <vector69>:
.globl vector69
vector69:
  pushl $0
80105d34:	6a 00                	push   $0x0
  pushl $69
80105d36:	6a 45                	push   $0x45
  jmp alltraps
80105d38:	e9 5d f8 ff ff       	jmp    8010559a <alltraps>

80105d3d <vector70>:
.globl vector70
vector70:
  pushl $0
80105d3d:	6a 00                	push   $0x0
  pushl $70
80105d3f:	6a 46                	push   $0x46
  jmp alltraps
80105d41:	e9 54 f8 ff ff       	jmp    8010559a <alltraps>

80105d46 <vector71>:
.globl vector71
vector71:
  pushl $0
80105d46:	6a 00                	push   $0x0
  pushl $71
80105d48:	6a 47                	push   $0x47
  jmp alltraps
80105d4a:	e9 4b f8 ff ff       	jmp    8010559a <alltraps>

80105d4f <vector72>:
.globl vector72
vector72:
  pushl $0
80105d4f:	6a 00                	push   $0x0
  pushl $72
80105d51:	6a 48                	push   $0x48
  jmp alltraps
80105d53:	e9 42 f8 ff ff       	jmp    8010559a <alltraps>

80105d58 <vector73>:
.globl vector73
vector73:
  pushl $0
80105d58:	6a 00                	push   $0x0
  pushl $73
80105d5a:	6a 49                	push   $0x49
  jmp alltraps
80105d5c:	e9 39 f8 ff ff       	jmp    8010559a <alltraps>

80105d61 <vector74>:
.globl vector74
vector74:
  pushl $0
80105d61:	6a 00                	push   $0x0
  pushl $74
80105d63:	6a 4a                	push   $0x4a
  jmp alltraps
80105d65:	e9 30 f8 ff ff       	jmp    8010559a <alltraps>

80105d6a <vector75>:
.globl vector75
vector75:
  pushl $0
80105d6a:	6a 00                	push   $0x0
  pushl $75
80105d6c:	6a 4b                	push   $0x4b
  jmp alltraps
80105d6e:	e9 27 f8 ff ff       	jmp    8010559a <alltraps>

80105d73 <vector76>:
.globl vector76
vector76:
  pushl $0
80105d73:	6a 00                	push   $0x0
  pushl $76
80105d75:	6a 4c                	push   $0x4c
  jmp alltraps
80105d77:	e9 1e f8 ff ff       	jmp    8010559a <alltraps>

80105d7c <vector77>:
.globl vector77
vector77:
  pushl $0
80105d7c:	6a 00                	push   $0x0
  pushl $77
80105d7e:	6a 4d                	push   $0x4d
  jmp alltraps
80105d80:	e9 15 f8 ff ff       	jmp    8010559a <alltraps>

80105d85 <vector78>:
.globl vector78
vector78:
  pushl $0
80105d85:	6a 00                	push   $0x0
  pushl $78
80105d87:	6a 4e                	push   $0x4e
  jmp alltraps
80105d89:	e9 0c f8 ff ff       	jmp    8010559a <alltraps>

80105d8e <vector79>:
.globl vector79
vector79:
  pushl $0
80105d8e:	6a 00                	push   $0x0
  pushl $79
80105d90:	6a 4f                	push   $0x4f
  jmp alltraps
80105d92:	e9 03 f8 ff ff       	jmp    8010559a <alltraps>

80105d97 <vector80>:
.globl vector80
vector80:
  pushl $0
80105d97:	6a 00                	push   $0x0
  pushl $80
80105d99:	6a 50                	push   $0x50
  jmp alltraps
80105d9b:	e9 fa f7 ff ff       	jmp    8010559a <alltraps>

80105da0 <vector81>:
.globl vector81
vector81:
  pushl $0
80105da0:	6a 00                	push   $0x0
  pushl $81
80105da2:	6a 51                	push   $0x51
  jmp alltraps
80105da4:	e9 f1 f7 ff ff       	jmp    8010559a <alltraps>

80105da9 <vector82>:
.globl vector82
vector82:
  pushl $0
80105da9:	6a 00                	push   $0x0
  pushl $82
80105dab:	6a 52                	push   $0x52
  jmp alltraps
80105dad:	e9 e8 f7 ff ff       	jmp    8010559a <alltraps>

80105db2 <vector83>:
.globl vector83
vector83:
  pushl $0
80105db2:	6a 00                	push   $0x0
  pushl $83
80105db4:	6a 53                	push   $0x53
  jmp alltraps
80105db6:	e9 df f7 ff ff       	jmp    8010559a <alltraps>

80105dbb <vector84>:
.globl vector84
vector84:
  pushl $0
80105dbb:	6a 00                	push   $0x0
  pushl $84
80105dbd:	6a 54                	push   $0x54
  jmp alltraps
80105dbf:	e9 d6 f7 ff ff       	jmp    8010559a <alltraps>

80105dc4 <vector85>:
.globl vector85
vector85:
  pushl $0
80105dc4:	6a 00                	push   $0x0
  pushl $85
80105dc6:	6a 55                	push   $0x55
  jmp alltraps
80105dc8:	e9 cd f7 ff ff       	jmp    8010559a <alltraps>

80105dcd <vector86>:
.globl vector86
vector86:
  pushl $0
80105dcd:	6a 00                	push   $0x0
  pushl $86
80105dcf:	6a 56                	push   $0x56
  jmp alltraps
80105dd1:	e9 c4 f7 ff ff       	jmp    8010559a <alltraps>

80105dd6 <vector87>:
.globl vector87
vector87:
  pushl $0
80105dd6:	6a 00                	push   $0x0
  pushl $87
80105dd8:	6a 57                	push   $0x57
  jmp alltraps
80105dda:	e9 bb f7 ff ff       	jmp    8010559a <alltraps>

80105ddf <vector88>:
.globl vector88
vector88:
  pushl $0
80105ddf:	6a 00                	push   $0x0
  pushl $88
80105de1:	6a 58                	push   $0x58
  jmp alltraps
80105de3:	e9 b2 f7 ff ff       	jmp    8010559a <alltraps>

80105de8 <vector89>:
.globl vector89
vector89:
  pushl $0
80105de8:	6a 00                	push   $0x0
  pushl $89
80105dea:	6a 59                	push   $0x59
  jmp alltraps
80105dec:	e9 a9 f7 ff ff       	jmp    8010559a <alltraps>

80105df1 <vector90>:
.globl vector90
vector90:
  pushl $0
80105df1:	6a 00                	push   $0x0
  pushl $90
80105df3:	6a 5a                	push   $0x5a
  jmp alltraps
80105df5:	e9 a0 f7 ff ff       	jmp    8010559a <alltraps>

80105dfa <vector91>:
.globl vector91
vector91:
  pushl $0
80105dfa:	6a 00                	push   $0x0
  pushl $91
80105dfc:	6a 5b                	push   $0x5b
  jmp alltraps
80105dfe:	e9 97 f7 ff ff       	jmp    8010559a <alltraps>

80105e03 <vector92>:
.globl vector92
vector92:
  pushl $0
80105e03:	6a 00                	push   $0x0
  pushl $92
80105e05:	6a 5c                	push   $0x5c
  jmp alltraps
80105e07:	e9 8e f7 ff ff       	jmp    8010559a <alltraps>

80105e0c <vector93>:
.globl vector93
vector93:
  pushl $0
80105e0c:	6a 00                	push   $0x0
  pushl $93
80105e0e:	6a 5d                	push   $0x5d
  jmp alltraps
80105e10:	e9 85 f7 ff ff       	jmp    8010559a <alltraps>

80105e15 <vector94>:
.globl vector94
vector94:
  pushl $0
80105e15:	6a 00                	push   $0x0
  pushl $94
80105e17:	6a 5e                	push   $0x5e
  jmp alltraps
80105e19:	e9 7c f7 ff ff       	jmp    8010559a <alltraps>

80105e1e <vector95>:
.globl vector95
vector95:
  pushl $0
80105e1e:	6a 00                	push   $0x0
  pushl $95
80105e20:	6a 5f                	push   $0x5f
  jmp alltraps
80105e22:	e9 73 f7 ff ff       	jmp    8010559a <alltraps>

80105e27 <vector96>:
.globl vector96
vector96:
  pushl $0
80105e27:	6a 00                	push   $0x0
  pushl $96
80105e29:	6a 60                	push   $0x60
  jmp alltraps
80105e2b:	e9 6a f7 ff ff       	jmp    8010559a <alltraps>

80105e30 <vector97>:
.globl vector97
vector97:
  pushl $0
80105e30:	6a 00                	push   $0x0
  pushl $97
80105e32:	6a 61                	push   $0x61
  jmp alltraps
80105e34:	e9 61 f7 ff ff       	jmp    8010559a <alltraps>

80105e39 <vector98>:
.globl vector98
vector98:
  pushl $0
80105e39:	6a 00                	push   $0x0
  pushl $98
80105e3b:	6a 62                	push   $0x62
  jmp alltraps
80105e3d:	e9 58 f7 ff ff       	jmp    8010559a <alltraps>

80105e42 <vector99>:
.globl vector99
vector99:
  pushl $0
80105e42:	6a 00                	push   $0x0
  pushl $99
80105e44:	6a 63                	push   $0x63
  jmp alltraps
80105e46:	e9 4f f7 ff ff       	jmp    8010559a <alltraps>

80105e4b <vector100>:
.globl vector100
vector100:
  pushl $0
80105e4b:	6a 00                	push   $0x0
  pushl $100
80105e4d:	6a 64                	push   $0x64
  jmp alltraps
80105e4f:	e9 46 f7 ff ff       	jmp    8010559a <alltraps>

80105e54 <vector101>:
.globl vector101
vector101:
  pushl $0
80105e54:	6a 00                	push   $0x0
  pushl $101
80105e56:	6a 65                	push   $0x65
  jmp alltraps
80105e58:	e9 3d f7 ff ff       	jmp    8010559a <alltraps>

80105e5d <vector102>:
.globl vector102
vector102:
  pushl $0
80105e5d:	6a 00                	push   $0x0
  pushl $102
80105e5f:	6a 66                	push   $0x66
  jmp alltraps
80105e61:	e9 34 f7 ff ff       	jmp    8010559a <alltraps>

80105e66 <vector103>:
.globl vector103
vector103:
  pushl $0
80105e66:	6a 00                	push   $0x0
  pushl $103
80105e68:	6a 67                	push   $0x67
  jmp alltraps
80105e6a:	e9 2b f7 ff ff       	jmp    8010559a <alltraps>

80105e6f <vector104>:
.globl vector104
vector104:
  pushl $0
80105e6f:	6a 00                	push   $0x0
  pushl $104
80105e71:	6a 68                	push   $0x68
  jmp alltraps
80105e73:	e9 22 f7 ff ff       	jmp    8010559a <alltraps>

80105e78 <vector105>:
.globl vector105
vector105:
  pushl $0
80105e78:	6a 00                	push   $0x0
  pushl $105
80105e7a:	6a 69                	push   $0x69
  jmp alltraps
80105e7c:	e9 19 f7 ff ff       	jmp    8010559a <alltraps>

80105e81 <vector106>:
.globl vector106
vector106:
  pushl $0
80105e81:	6a 00                	push   $0x0
  pushl $106
80105e83:	6a 6a                	push   $0x6a
  jmp alltraps
80105e85:	e9 10 f7 ff ff       	jmp    8010559a <alltraps>

80105e8a <vector107>:
.globl vector107
vector107:
  pushl $0
80105e8a:	6a 00                	push   $0x0
  pushl $107
80105e8c:	6a 6b                	push   $0x6b
  jmp alltraps
80105e8e:	e9 07 f7 ff ff       	jmp    8010559a <alltraps>

80105e93 <vector108>:
.globl vector108
vector108:
  pushl $0
80105e93:	6a 00                	push   $0x0
  pushl $108
80105e95:	6a 6c                	push   $0x6c
  jmp alltraps
80105e97:	e9 fe f6 ff ff       	jmp    8010559a <alltraps>

80105e9c <vector109>:
.globl vector109
vector109:
  pushl $0
80105e9c:	6a 00                	push   $0x0
  pushl $109
80105e9e:	6a 6d                	push   $0x6d
  jmp alltraps
80105ea0:	e9 f5 f6 ff ff       	jmp    8010559a <alltraps>

80105ea5 <vector110>:
.globl vector110
vector110:
  pushl $0
80105ea5:	6a 00                	push   $0x0
  pushl $110
80105ea7:	6a 6e                	push   $0x6e
  jmp alltraps
80105ea9:	e9 ec f6 ff ff       	jmp    8010559a <alltraps>

80105eae <vector111>:
.globl vector111
vector111:
  pushl $0
80105eae:	6a 00                	push   $0x0
  pushl $111
80105eb0:	6a 6f                	push   $0x6f
  jmp alltraps
80105eb2:	e9 e3 f6 ff ff       	jmp    8010559a <alltraps>

80105eb7 <vector112>:
.globl vector112
vector112:
  pushl $0
80105eb7:	6a 00                	push   $0x0
  pushl $112
80105eb9:	6a 70                	push   $0x70
  jmp alltraps
80105ebb:	e9 da f6 ff ff       	jmp    8010559a <alltraps>

80105ec0 <vector113>:
.globl vector113
vector113:
  pushl $0
80105ec0:	6a 00                	push   $0x0
  pushl $113
80105ec2:	6a 71                	push   $0x71
  jmp alltraps
80105ec4:	e9 d1 f6 ff ff       	jmp    8010559a <alltraps>

80105ec9 <vector114>:
.globl vector114
vector114:
  pushl $0
80105ec9:	6a 00                	push   $0x0
  pushl $114
80105ecb:	6a 72                	push   $0x72
  jmp alltraps
80105ecd:	e9 c8 f6 ff ff       	jmp    8010559a <alltraps>

80105ed2 <vector115>:
.globl vector115
vector115:
  pushl $0
80105ed2:	6a 00                	push   $0x0
  pushl $115
80105ed4:	6a 73                	push   $0x73
  jmp alltraps
80105ed6:	e9 bf f6 ff ff       	jmp    8010559a <alltraps>

80105edb <vector116>:
.globl vector116
vector116:
  pushl $0
80105edb:	6a 00                	push   $0x0
  pushl $116
80105edd:	6a 74                	push   $0x74
  jmp alltraps
80105edf:	e9 b6 f6 ff ff       	jmp    8010559a <alltraps>

80105ee4 <vector117>:
.globl vector117
vector117:
  pushl $0
80105ee4:	6a 00                	push   $0x0
  pushl $117
80105ee6:	6a 75                	push   $0x75
  jmp alltraps
80105ee8:	e9 ad f6 ff ff       	jmp    8010559a <alltraps>

80105eed <vector118>:
.globl vector118
vector118:
  pushl $0
80105eed:	6a 00                	push   $0x0
  pushl $118
80105eef:	6a 76                	push   $0x76
  jmp alltraps
80105ef1:	e9 a4 f6 ff ff       	jmp    8010559a <alltraps>

80105ef6 <vector119>:
.globl vector119
vector119:
  pushl $0
80105ef6:	6a 00                	push   $0x0
  pushl $119
80105ef8:	6a 77                	push   $0x77
  jmp alltraps
80105efa:	e9 9b f6 ff ff       	jmp    8010559a <alltraps>

80105eff <vector120>:
.globl vector120
vector120:
  pushl $0
80105eff:	6a 00                	push   $0x0
  pushl $120
80105f01:	6a 78                	push   $0x78
  jmp alltraps
80105f03:	e9 92 f6 ff ff       	jmp    8010559a <alltraps>

80105f08 <vector121>:
.globl vector121
vector121:
  pushl $0
80105f08:	6a 00                	push   $0x0
  pushl $121
80105f0a:	6a 79                	push   $0x79
  jmp alltraps
80105f0c:	e9 89 f6 ff ff       	jmp    8010559a <alltraps>

80105f11 <vector122>:
.globl vector122
vector122:
  pushl $0
80105f11:	6a 00                	push   $0x0
  pushl $122
80105f13:	6a 7a                	push   $0x7a
  jmp alltraps
80105f15:	e9 80 f6 ff ff       	jmp    8010559a <alltraps>

80105f1a <vector123>:
.globl vector123
vector123:
  pushl $0
80105f1a:	6a 00                	push   $0x0
  pushl $123
80105f1c:	6a 7b                	push   $0x7b
  jmp alltraps
80105f1e:	e9 77 f6 ff ff       	jmp    8010559a <alltraps>

80105f23 <vector124>:
.globl vector124
vector124:
  pushl $0
80105f23:	6a 00                	push   $0x0
  pushl $124
80105f25:	6a 7c                	push   $0x7c
  jmp alltraps
80105f27:	e9 6e f6 ff ff       	jmp    8010559a <alltraps>

80105f2c <vector125>:
.globl vector125
vector125:
  pushl $0
80105f2c:	6a 00                	push   $0x0
  pushl $125
80105f2e:	6a 7d                	push   $0x7d
  jmp alltraps
80105f30:	e9 65 f6 ff ff       	jmp    8010559a <alltraps>

80105f35 <vector126>:
.globl vector126
vector126:
  pushl $0
80105f35:	6a 00                	push   $0x0
  pushl $126
80105f37:	6a 7e                	push   $0x7e
  jmp alltraps
80105f39:	e9 5c f6 ff ff       	jmp    8010559a <alltraps>

80105f3e <vector127>:
.globl vector127
vector127:
  pushl $0
80105f3e:	6a 00                	push   $0x0
  pushl $127
80105f40:	6a 7f                	push   $0x7f
  jmp alltraps
80105f42:	e9 53 f6 ff ff       	jmp    8010559a <alltraps>

80105f47 <vector128>:
.globl vector128
vector128:
  pushl $0
80105f47:	6a 00                	push   $0x0
  pushl $128
80105f49:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80105f4e:	e9 47 f6 ff ff       	jmp    8010559a <alltraps>

80105f53 <vector129>:
.globl vector129
vector129:
  pushl $0
80105f53:	6a 00                	push   $0x0
  pushl $129
80105f55:	68 81 00 00 00       	push   $0x81
  jmp alltraps
80105f5a:	e9 3b f6 ff ff       	jmp    8010559a <alltraps>

80105f5f <vector130>:
.globl vector130
vector130:
  pushl $0
80105f5f:	6a 00                	push   $0x0
  pushl $130
80105f61:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80105f66:	e9 2f f6 ff ff       	jmp    8010559a <alltraps>

80105f6b <vector131>:
.globl vector131
vector131:
  pushl $0
80105f6b:	6a 00                	push   $0x0
  pushl $131
80105f6d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80105f72:	e9 23 f6 ff ff       	jmp    8010559a <alltraps>

80105f77 <vector132>:
.globl vector132
vector132:
  pushl $0
80105f77:	6a 00                	push   $0x0
  pushl $132
80105f79:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80105f7e:	e9 17 f6 ff ff       	jmp    8010559a <alltraps>

80105f83 <vector133>:
.globl vector133
vector133:
  pushl $0
80105f83:	6a 00                	push   $0x0
  pushl $133
80105f85:	68 85 00 00 00       	push   $0x85
  jmp alltraps
80105f8a:	e9 0b f6 ff ff       	jmp    8010559a <alltraps>

80105f8f <vector134>:
.globl vector134
vector134:
  pushl $0
80105f8f:	6a 00                	push   $0x0
  pushl $134
80105f91:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80105f96:	e9 ff f5 ff ff       	jmp    8010559a <alltraps>

80105f9b <vector135>:
.globl vector135
vector135:
  pushl $0
80105f9b:	6a 00                	push   $0x0
  pushl $135
80105f9d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80105fa2:	e9 f3 f5 ff ff       	jmp    8010559a <alltraps>

80105fa7 <vector136>:
.globl vector136
vector136:
  pushl $0
80105fa7:	6a 00                	push   $0x0
  pushl $136
80105fa9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80105fae:	e9 e7 f5 ff ff       	jmp    8010559a <alltraps>

80105fb3 <vector137>:
.globl vector137
vector137:
  pushl $0
80105fb3:	6a 00                	push   $0x0
  pushl $137
80105fb5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80105fba:	e9 db f5 ff ff       	jmp    8010559a <alltraps>

80105fbf <vector138>:
.globl vector138
vector138:
  pushl $0
80105fbf:	6a 00                	push   $0x0
  pushl $138
80105fc1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80105fc6:	e9 cf f5 ff ff       	jmp    8010559a <alltraps>

80105fcb <vector139>:
.globl vector139
vector139:
  pushl $0
80105fcb:	6a 00                	push   $0x0
  pushl $139
80105fcd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80105fd2:	e9 c3 f5 ff ff       	jmp    8010559a <alltraps>

80105fd7 <vector140>:
.globl vector140
vector140:
  pushl $0
80105fd7:	6a 00                	push   $0x0
  pushl $140
80105fd9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80105fde:	e9 b7 f5 ff ff       	jmp    8010559a <alltraps>

80105fe3 <vector141>:
.globl vector141
vector141:
  pushl $0
80105fe3:	6a 00                	push   $0x0
  pushl $141
80105fe5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
80105fea:	e9 ab f5 ff ff       	jmp    8010559a <alltraps>

80105fef <vector142>:
.globl vector142
vector142:
  pushl $0
80105fef:	6a 00                	push   $0x0
  pushl $142
80105ff1:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80105ff6:	e9 9f f5 ff ff       	jmp    8010559a <alltraps>

80105ffb <vector143>:
.globl vector143
vector143:
  pushl $0
80105ffb:	6a 00                	push   $0x0
  pushl $143
80105ffd:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106002:	e9 93 f5 ff ff       	jmp    8010559a <alltraps>

80106007 <vector144>:
.globl vector144
vector144:
  pushl $0
80106007:	6a 00                	push   $0x0
  pushl $144
80106009:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010600e:	e9 87 f5 ff ff       	jmp    8010559a <alltraps>

80106013 <vector145>:
.globl vector145
vector145:
  pushl $0
80106013:	6a 00                	push   $0x0
  pushl $145
80106015:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010601a:	e9 7b f5 ff ff       	jmp    8010559a <alltraps>

8010601f <vector146>:
.globl vector146
vector146:
  pushl $0
8010601f:	6a 00                	push   $0x0
  pushl $146
80106021:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106026:	e9 6f f5 ff ff       	jmp    8010559a <alltraps>

8010602b <vector147>:
.globl vector147
vector147:
  pushl $0
8010602b:	6a 00                	push   $0x0
  pushl $147
8010602d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106032:	e9 63 f5 ff ff       	jmp    8010559a <alltraps>

80106037 <vector148>:
.globl vector148
vector148:
  pushl $0
80106037:	6a 00                	push   $0x0
  pushl $148
80106039:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010603e:	e9 57 f5 ff ff       	jmp    8010559a <alltraps>

80106043 <vector149>:
.globl vector149
vector149:
  pushl $0
80106043:	6a 00                	push   $0x0
  pushl $149
80106045:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010604a:	e9 4b f5 ff ff       	jmp    8010559a <alltraps>

8010604f <vector150>:
.globl vector150
vector150:
  pushl $0
8010604f:	6a 00                	push   $0x0
  pushl $150
80106051:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106056:	e9 3f f5 ff ff       	jmp    8010559a <alltraps>

8010605b <vector151>:
.globl vector151
vector151:
  pushl $0
8010605b:	6a 00                	push   $0x0
  pushl $151
8010605d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106062:	e9 33 f5 ff ff       	jmp    8010559a <alltraps>

80106067 <vector152>:
.globl vector152
vector152:
  pushl $0
80106067:	6a 00                	push   $0x0
  pushl $152
80106069:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010606e:	e9 27 f5 ff ff       	jmp    8010559a <alltraps>

80106073 <vector153>:
.globl vector153
vector153:
  pushl $0
80106073:	6a 00                	push   $0x0
  pushl $153
80106075:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010607a:	e9 1b f5 ff ff       	jmp    8010559a <alltraps>

8010607f <vector154>:
.globl vector154
vector154:
  pushl $0
8010607f:	6a 00                	push   $0x0
  pushl $154
80106081:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106086:	e9 0f f5 ff ff       	jmp    8010559a <alltraps>

8010608b <vector155>:
.globl vector155
vector155:
  pushl $0
8010608b:	6a 00                	push   $0x0
  pushl $155
8010608d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106092:	e9 03 f5 ff ff       	jmp    8010559a <alltraps>

80106097 <vector156>:
.globl vector156
vector156:
  pushl $0
80106097:	6a 00                	push   $0x0
  pushl $156
80106099:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010609e:	e9 f7 f4 ff ff       	jmp    8010559a <alltraps>

801060a3 <vector157>:
.globl vector157
vector157:
  pushl $0
801060a3:	6a 00                	push   $0x0
  pushl $157
801060a5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801060aa:	e9 eb f4 ff ff       	jmp    8010559a <alltraps>

801060af <vector158>:
.globl vector158
vector158:
  pushl $0
801060af:	6a 00                	push   $0x0
  pushl $158
801060b1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801060b6:	e9 df f4 ff ff       	jmp    8010559a <alltraps>

801060bb <vector159>:
.globl vector159
vector159:
  pushl $0
801060bb:	6a 00                	push   $0x0
  pushl $159
801060bd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801060c2:	e9 d3 f4 ff ff       	jmp    8010559a <alltraps>

801060c7 <vector160>:
.globl vector160
vector160:
  pushl $0
801060c7:	6a 00                	push   $0x0
  pushl $160
801060c9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801060ce:	e9 c7 f4 ff ff       	jmp    8010559a <alltraps>

801060d3 <vector161>:
.globl vector161
vector161:
  pushl $0
801060d3:	6a 00                	push   $0x0
  pushl $161
801060d5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801060da:	e9 bb f4 ff ff       	jmp    8010559a <alltraps>

801060df <vector162>:
.globl vector162
vector162:
  pushl $0
801060df:	6a 00                	push   $0x0
  pushl $162
801060e1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801060e6:	e9 af f4 ff ff       	jmp    8010559a <alltraps>

801060eb <vector163>:
.globl vector163
vector163:
  pushl $0
801060eb:	6a 00                	push   $0x0
  pushl $163
801060ed:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801060f2:	e9 a3 f4 ff ff       	jmp    8010559a <alltraps>

801060f7 <vector164>:
.globl vector164
vector164:
  pushl $0
801060f7:	6a 00                	push   $0x0
  pushl $164
801060f9:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801060fe:	e9 97 f4 ff ff       	jmp    8010559a <alltraps>

80106103 <vector165>:
.globl vector165
vector165:
  pushl $0
80106103:	6a 00                	push   $0x0
  pushl $165
80106105:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010610a:	e9 8b f4 ff ff       	jmp    8010559a <alltraps>

8010610f <vector166>:
.globl vector166
vector166:
  pushl $0
8010610f:	6a 00                	push   $0x0
  pushl $166
80106111:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106116:	e9 7f f4 ff ff       	jmp    8010559a <alltraps>

8010611b <vector167>:
.globl vector167
vector167:
  pushl $0
8010611b:	6a 00                	push   $0x0
  pushl $167
8010611d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106122:	e9 73 f4 ff ff       	jmp    8010559a <alltraps>

80106127 <vector168>:
.globl vector168
vector168:
  pushl $0
80106127:	6a 00                	push   $0x0
  pushl $168
80106129:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010612e:	e9 67 f4 ff ff       	jmp    8010559a <alltraps>

80106133 <vector169>:
.globl vector169
vector169:
  pushl $0
80106133:	6a 00                	push   $0x0
  pushl $169
80106135:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010613a:	e9 5b f4 ff ff       	jmp    8010559a <alltraps>

8010613f <vector170>:
.globl vector170
vector170:
  pushl $0
8010613f:	6a 00                	push   $0x0
  pushl $170
80106141:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106146:	e9 4f f4 ff ff       	jmp    8010559a <alltraps>

8010614b <vector171>:
.globl vector171
vector171:
  pushl $0
8010614b:	6a 00                	push   $0x0
  pushl $171
8010614d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106152:	e9 43 f4 ff ff       	jmp    8010559a <alltraps>

80106157 <vector172>:
.globl vector172
vector172:
  pushl $0
80106157:	6a 00                	push   $0x0
  pushl $172
80106159:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010615e:	e9 37 f4 ff ff       	jmp    8010559a <alltraps>

80106163 <vector173>:
.globl vector173
vector173:
  pushl $0
80106163:	6a 00                	push   $0x0
  pushl $173
80106165:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010616a:	e9 2b f4 ff ff       	jmp    8010559a <alltraps>

8010616f <vector174>:
.globl vector174
vector174:
  pushl $0
8010616f:	6a 00                	push   $0x0
  pushl $174
80106171:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106176:	e9 1f f4 ff ff       	jmp    8010559a <alltraps>

8010617b <vector175>:
.globl vector175
vector175:
  pushl $0
8010617b:	6a 00                	push   $0x0
  pushl $175
8010617d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106182:	e9 13 f4 ff ff       	jmp    8010559a <alltraps>

80106187 <vector176>:
.globl vector176
vector176:
  pushl $0
80106187:	6a 00                	push   $0x0
  pushl $176
80106189:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010618e:	e9 07 f4 ff ff       	jmp    8010559a <alltraps>

80106193 <vector177>:
.globl vector177
vector177:
  pushl $0
80106193:	6a 00                	push   $0x0
  pushl $177
80106195:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010619a:	e9 fb f3 ff ff       	jmp    8010559a <alltraps>

8010619f <vector178>:
.globl vector178
vector178:
  pushl $0
8010619f:	6a 00                	push   $0x0
  pushl $178
801061a1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801061a6:	e9 ef f3 ff ff       	jmp    8010559a <alltraps>

801061ab <vector179>:
.globl vector179
vector179:
  pushl $0
801061ab:	6a 00                	push   $0x0
  pushl $179
801061ad:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801061b2:	e9 e3 f3 ff ff       	jmp    8010559a <alltraps>

801061b7 <vector180>:
.globl vector180
vector180:
  pushl $0
801061b7:	6a 00                	push   $0x0
  pushl $180
801061b9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801061be:	e9 d7 f3 ff ff       	jmp    8010559a <alltraps>

801061c3 <vector181>:
.globl vector181
vector181:
  pushl $0
801061c3:	6a 00                	push   $0x0
  pushl $181
801061c5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801061ca:	e9 cb f3 ff ff       	jmp    8010559a <alltraps>

801061cf <vector182>:
.globl vector182
vector182:
  pushl $0
801061cf:	6a 00                	push   $0x0
  pushl $182
801061d1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801061d6:	e9 bf f3 ff ff       	jmp    8010559a <alltraps>

801061db <vector183>:
.globl vector183
vector183:
  pushl $0
801061db:	6a 00                	push   $0x0
  pushl $183
801061dd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801061e2:	e9 b3 f3 ff ff       	jmp    8010559a <alltraps>

801061e7 <vector184>:
.globl vector184
vector184:
  pushl $0
801061e7:	6a 00                	push   $0x0
  pushl $184
801061e9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801061ee:	e9 a7 f3 ff ff       	jmp    8010559a <alltraps>

801061f3 <vector185>:
.globl vector185
vector185:
  pushl $0
801061f3:	6a 00                	push   $0x0
  pushl $185
801061f5:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801061fa:	e9 9b f3 ff ff       	jmp    8010559a <alltraps>

801061ff <vector186>:
.globl vector186
vector186:
  pushl $0
801061ff:	6a 00                	push   $0x0
  pushl $186
80106201:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106206:	e9 8f f3 ff ff       	jmp    8010559a <alltraps>

8010620b <vector187>:
.globl vector187
vector187:
  pushl $0
8010620b:	6a 00                	push   $0x0
  pushl $187
8010620d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106212:	e9 83 f3 ff ff       	jmp    8010559a <alltraps>

80106217 <vector188>:
.globl vector188
vector188:
  pushl $0
80106217:	6a 00                	push   $0x0
  pushl $188
80106219:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010621e:	e9 77 f3 ff ff       	jmp    8010559a <alltraps>

80106223 <vector189>:
.globl vector189
vector189:
  pushl $0
80106223:	6a 00                	push   $0x0
  pushl $189
80106225:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010622a:	e9 6b f3 ff ff       	jmp    8010559a <alltraps>

8010622f <vector190>:
.globl vector190
vector190:
  pushl $0
8010622f:	6a 00                	push   $0x0
  pushl $190
80106231:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106236:	e9 5f f3 ff ff       	jmp    8010559a <alltraps>

8010623b <vector191>:
.globl vector191
vector191:
  pushl $0
8010623b:	6a 00                	push   $0x0
  pushl $191
8010623d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106242:	e9 53 f3 ff ff       	jmp    8010559a <alltraps>

80106247 <vector192>:
.globl vector192
vector192:
  pushl $0
80106247:	6a 00                	push   $0x0
  pushl $192
80106249:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010624e:	e9 47 f3 ff ff       	jmp    8010559a <alltraps>

80106253 <vector193>:
.globl vector193
vector193:
  pushl $0
80106253:	6a 00                	push   $0x0
  pushl $193
80106255:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010625a:	e9 3b f3 ff ff       	jmp    8010559a <alltraps>

8010625f <vector194>:
.globl vector194
vector194:
  pushl $0
8010625f:	6a 00                	push   $0x0
  pushl $194
80106261:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106266:	e9 2f f3 ff ff       	jmp    8010559a <alltraps>

8010626b <vector195>:
.globl vector195
vector195:
  pushl $0
8010626b:	6a 00                	push   $0x0
  pushl $195
8010626d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106272:	e9 23 f3 ff ff       	jmp    8010559a <alltraps>

80106277 <vector196>:
.globl vector196
vector196:
  pushl $0
80106277:	6a 00                	push   $0x0
  pushl $196
80106279:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010627e:	e9 17 f3 ff ff       	jmp    8010559a <alltraps>

80106283 <vector197>:
.globl vector197
vector197:
  pushl $0
80106283:	6a 00                	push   $0x0
  pushl $197
80106285:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010628a:	e9 0b f3 ff ff       	jmp    8010559a <alltraps>

8010628f <vector198>:
.globl vector198
vector198:
  pushl $0
8010628f:	6a 00                	push   $0x0
  pushl $198
80106291:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106296:	e9 ff f2 ff ff       	jmp    8010559a <alltraps>

8010629b <vector199>:
.globl vector199
vector199:
  pushl $0
8010629b:	6a 00                	push   $0x0
  pushl $199
8010629d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801062a2:	e9 f3 f2 ff ff       	jmp    8010559a <alltraps>

801062a7 <vector200>:
.globl vector200
vector200:
  pushl $0
801062a7:	6a 00                	push   $0x0
  pushl $200
801062a9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801062ae:	e9 e7 f2 ff ff       	jmp    8010559a <alltraps>

801062b3 <vector201>:
.globl vector201
vector201:
  pushl $0
801062b3:	6a 00                	push   $0x0
  pushl $201
801062b5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801062ba:	e9 db f2 ff ff       	jmp    8010559a <alltraps>

801062bf <vector202>:
.globl vector202
vector202:
  pushl $0
801062bf:	6a 00                	push   $0x0
  pushl $202
801062c1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801062c6:	e9 cf f2 ff ff       	jmp    8010559a <alltraps>

801062cb <vector203>:
.globl vector203
vector203:
  pushl $0
801062cb:	6a 00                	push   $0x0
  pushl $203
801062cd:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801062d2:	e9 c3 f2 ff ff       	jmp    8010559a <alltraps>

801062d7 <vector204>:
.globl vector204
vector204:
  pushl $0
801062d7:	6a 00                	push   $0x0
  pushl $204
801062d9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801062de:	e9 b7 f2 ff ff       	jmp    8010559a <alltraps>

801062e3 <vector205>:
.globl vector205
vector205:
  pushl $0
801062e3:	6a 00                	push   $0x0
  pushl $205
801062e5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801062ea:	e9 ab f2 ff ff       	jmp    8010559a <alltraps>

801062ef <vector206>:
.globl vector206
vector206:
  pushl $0
801062ef:	6a 00                	push   $0x0
  pushl $206
801062f1:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801062f6:	e9 9f f2 ff ff       	jmp    8010559a <alltraps>

801062fb <vector207>:
.globl vector207
vector207:
  pushl $0
801062fb:	6a 00                	push   $0x0
  pushl $207
801062fd:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106302:	e9 93 f2 ff ff       	jmp    8010559a <alltraps>

80106307 <vector208>:
.globl vector208
vector208:
  pushl $0
80106307:	6a 00                	push   $0x0
  pushl $208
80106309:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010630e:	e9 87 f2 ff ff       	jmp    8010559a <alltraps>

80106313 <vector209>:
.globl vector209
vector209:
  pushl $0
80106313:	6a 00                	push   $0x0
  pushl $209
80106315:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010631a:	e9 7b f2 ff ff       	jmp    8010559a <alltraps>

8010631f <vector210>:
.globl vector210
vector210:
  pushl $0
8010631f:	6a 00                	push   $0x0
  pushl $210
80106321:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106326:	e9 6f f2 ff ff       	jmp    8010559a <alltraps>

8010632b <vector211>:
.globl vector211
vector211:
  pushl $0
8010632b:	6a 00                	push   $0x0
  pushl $211
8010632d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106332:	e9 63 f2 ff ff       	jmp    8010559a <alltraps>

80106337 <vector212>:
.globl vector212
vector212:
  pushl $0
80106337:	6a 00                	push   $0x0
  pushl $212
80106339:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010633e:	e9 57 f2 ff ff       	jmp    8010559a <alltraps>

80106343 <vector213>:
.globl vector213
vector213:
  pushl $0
80106343:	6a 00                	push   $0x0
  pushl $213
80106345:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
8010634a:	e9 4b f2 ff ff       	jmp    8010559a <alltraps>

8010634f <vector214>:
.globl vector214
vector214:
  pushl $0
8010634f:	6a 00                	push   $0x0
  pushl $214
80106351:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106356:	e9 3f f2 ff ff       	jmp    8010559a <alltraps>

8010635b <vector215>:
.globl vector215
vector215:
  pushl $0
8010635b:	6a 00                	push   $0x0
  pushl $215
8010635d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106362:	e9 33 f2 ff ff       	jmp    8010559a <alltraps>

80106367 <vector216>:
.globl vector216
vector216:
  pushl $0
80106367:	6a 00                	push   $0x0
  pushl $216
80106369:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
8010636e:	e9 27 f2 ff ff       	jmp    8010559a <alltraps>

80106373 <vector217>:
.globl vector217
vector217:
  pushl $0
80106373:	6a 00                	push   $0x0
  pushl $217
80106375:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
8010637a:	e9 1b f2 ff ff       	jmp    8010559a <alltraps>

8010637f <vector218>:
.globl vector218
vector218:
  pushl $0
8010637f:	6a 00                	push   $0x0
  pushl $218
80106381:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106386:	e9 0f f2 ff ff       	jmp    8010559a <alltraps>

8010638b <vector219>:
.globl vector219
vector219:
  pushl $0
8010638b:	6a 00                	push   $0x0
  pushl $219
8010638d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106392:	e9 03 f2 ff ff       	jmp    8010559a <alltraps>

80106397 <vector220>:
.globl vector220
vector220:
  pushl $0
80106397:	6a 00                	push   $0x0
  pushl $220
80106399:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010639e:	e9 f7 f1 ff ff       	jmp    8010559a <alltraps>

801063a3 <vector221>:
.globl vector221
vector221:
  pushl $0
801063a3:	6a 00                	push   $0x0
  pushl $221
801063a5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
801063aa:	e9 eb f1 ff ff       	jmp    8010559a <alltraps>

801063af <vector222>:
.globl vector222
vector222:
  pushl $0
801063af:	6a 00                	push   $0x0
  pushl $222
801063b1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
801063b6:	e9 df f1 ff ff       	jmp    8010559a <alltraps>

801063bb <vector223>:
.globl vector223
vector223:
  pushl $0
801063bb:	6a 00                	push   $0x0
  pushl $223
801063bd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
801063c2:	e9 d3 f1 ff ff       	jmp    8010559a <alltraps>

801063c7 <vector224>:
.globl vector224
vector224:
  pushl $0
801063c7:	6a 00                	push   $0x0
  pushl $224
801063c9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
801063ce:	e9 c7 f1 ff ff       	jmp    8010559a <alltraps>

801063d3 <vector225>:
.globl vector225
vector225:
  pushl $0
801063d3:	6a 00                	push   $0x0
  pushl $225
801063d5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
801063da:	e9 bb f1 ff ff       	jmp    8010559a <alltraps>

801063df <vector226>:
.globl vector226
vector226:
  pushl $0
801063df:	6a 00                	push   $0x0
  pushl $226
801063e1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
801063e6:	e9 af f1 ff ff       	jmp    8010559a <alltraps>

801063eb <vector227>:
.globl vector227
vector227:
  pushl $0
801063eb:	6a 00                	push   $0x0
  pushl $227
801063ed:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
801063f2:	e9 a3 f1 ff ff       	jmp    8010559a <alltraps>

801063f7 <vector228>:
.globl vector228
vector228:
  pushl $0
801063f7:	6a 00                	push   $0x0
  pushl $228
801063f9:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
801063fe:	e9 97 f1 ff ff       	jmp    8010559a <alltraps>

80106403 <vector229>:
.globl vector229
vector229:
  pushl $0
80106403:	6a 00                	push   $0x0
  pushl $229
80106405:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010640a:	e9 8b f1 ff ff       	jmp    8010559a <alltraps>

8010640f <vector230>:
.globl vector230
vector230:
  pushl $0
8010640f:	6a 00                	push   $0x0
  pushl $230
80106411:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106416:	e9 7f f1 ff ff       	jmp    8010559a <alltraps>

8010641b <vector231>:
.globl vector231
vector231:
  pushl $0
8010641b:	6a 00                	push   $0x0
  pushl $231
8010641d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106422:	e9 73 f1 ff ff       	jmp    8010559a <alltraps>

80106427 <vector232>:
.globl vector232
vector232:
  pushl $0
80106427:	6a 00                	push   $0x0
  pushl $232
80106429:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010642e:	e9 67 f1 ff ff       	jmp    8010559a <alltraps>

80106433 <vector233>:
.globl vector233
vector233:
  pushl $0
80106433:	6a 00                	push   $0x0
  pushl $233
80106435:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010643a:	e9 5b f1 ff ff       	jmp    8010559a <alltraps>

8010643f <vector234>:
.globl vector234
vector234:
  pushl $0
8010643f:	6a 00                	push   $0x0
  pushl $234
80106441:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106446:	e9 4f f1 ff ff       	jmp    8010559a <alltraps>

8010644b <vector235>:
.globl vector235
vector235:
  pushl $0
8010644b:	6a 00                	push   $0x0
  pushl $235
8010644d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106452:	e9 43 f1 ff ff       	jmp    8010559a <alltraps>

80106457 <vector236>:
.globl vector236
vector236:
  pushl $0
80106457:	6a 00                	push   $0x0
  pushl $236
80106459:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
8010645e:	e9 37 f1 ff ff       	jmp    8010559a <alltraps>

80106463 <vector237>:
.globl vector237
vector237:
  pushl $0
80106463:	6a 00                	push   $0x0
  pushl $237
80106465:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
8010646a:	e9 2b f1 ff ff       	jmp    8010559a <alltraps>

8010646f <vector238>:
.globl vector238
vector238:
  pushl $0
8010646f:	6a 00                	push   $0x0
  pushl $238
80106471:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106476:	e9 1f f1 ff ff       	jmp    8010559a <alltraps>

8010647b <vector239>:
.globl vector239
vector239:
  pushl $0
8010647b:	6a 00                	push   $0x0
  pushl $239
8010647d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106482:	e9 13 f1 ff ff       	jmp    8010559a <alltraps>

80106487 <vector240>:
.globl vector240
vector240:
  pushl $0
80106487:	6a 00                	push   $0x0
  pushl $240
80106489:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
8010648e:	e9 07 f1 ff ff       	jmp    8010559a <alltraps>

80106493 <vector241>:
.globl vector241
vector241:
  pushl $0
80106493:	6a 00                	push   $0x0
  pushl $241
80106495:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010649a:	e9 fb f0 ff ff       	jmp    8010559a <alltraps>

8010649f <vector242>:
.globl vector242
vector242:
  pushl $0
8010649f:	6a 00                	push   $0x0
  pushl $242
801064a1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
801064a6:	e9 ef f0 ff ff       	jmp    8010559a <alltraps>

801064ab <vector243>:
.globl vector243
vector243:
  pushl $0
801064ab:	6a 00                	push   $0x0
  pushl $243
801064ad:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
801064b2:	e9 e3 f0 ff ff       	jmp    8010559a <alltraps>

801064b7 <vector244>:
.globl vector244
vector244:
  pushl $0
801064b7:	6a 00                	push   $0x0
  pushl $244
801064b9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
801064be:	e9 d7 f0 ff ff       	jmp    8010559a <alltraps>

801064c3 <vector245>:
.globl vector245
vector245:
  pushl $0
801064c3:	6a 00                	push   $0x0
  pushl $245
801064c5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
801064ca:	e9 cb f0 ff ff       	jmp    8010559a <alltraps>

801064cf <vector246>:
.globl vector246
vector246:
  pushl $0
801064cf:	6a 00                	push   $0x0
  pushl $246
801064d1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
801064d6:	e9 bf f0 ff ff       	jmp    8010559a <alltraps>

801064db <vector247>:
.globl vector247
vector247:
  pushl $0
801064db:	6a 00                	push   $0x0
  pushl $247
801064dd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
801064e2:	e9 b3 f0 ff ff       	jmp    8010559a <alltraps>

801064e7 <vector248>:
.globl vector248
vector248:
  pushl $0
801064e7:	6a 00                	push   $0x0
  pushl $248
801064e9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
801064ee:	e9 a7 f0 ff ff       	jmp    8010559a <alltraps>

801064f3 <vector249>:
.globl vector249
vector249:
  pushl $0
801064f3:	6a 00                	push   $0x0
  pushl $249
801064f5:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
801064fa:	e9 9b f0 ff ff       	jmp    8010559a <alltraps>

801064ff <vector250>:
.globl vector250
vector250:
  pushl $0
801064ff:	6a 00                	push   $0x0
  pushl $250
80106501:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106506:	e9 8f f0 ff ff       	jmp    8010559a <alltraps>

8010650b <vector251>:
.globl vector251
vector251:
  pushl $0
8010650b:	6a 00                	push   $0x0
  pushl $251
8010650d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106512:	e9 83 f0 ff ff       	jmp    8010559a <alltraps>

80106517 <vector252>:
.globl vector252
vector252:
  pushl $0
80106517:	6a 00                	push   $0x0
  pushl $252
80106519:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010651e:	e9 77 f0 ff ff       	jmp    8010559a <alltraps>

80106523 <vector253>:
.globl vector253
vector253:
  pushl $0
80106523:	6a 00                	push   $0x0
  pushl $253
80106525:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010652a:	e9 6b f0 ff ff       	jmp    8010559a <alltraps>

8010652f <vector254>:
.globl vector254
vector254:
  pushl $0
8010652f:	6a 00                	push   $0x0
  pushl $254
80106531:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106536:	e9 5f f0 ff ff       	jmp    8010559a <alltraps>

8010653b <vector255>:
.globl vector255
vector255:
  pushl $0
8010653b:	6a 00                	push   $0x0
  pushl $255
8010653d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106542:	e9 53 f0 ff ff       	jmp    8010559a <alltraps>
80106547:	66 90                	xchg   %ax,%ax
80106549:	66 90                	xchg   %ax,%ax
8010654b:	66 90                	xchg   %ax,%ax
8010654d:	66 90                	xchg   %ax,%ax
8010654f:	90                   	nop

80106550 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106550:	55                   	push   %ebp
80106551:	89 e5                	mov    %esp,%ebp
80106553:	57                   	push   %edi
80106554:	56                   	push   %esi
80106555:	53                   	push   %ebx
80106556:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106558:	c1 ea 16             	shr    $0x16,%edx
8010655b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010655e:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106561:	8b 07                	mov    (%edi),%eax
80106563:	a8 01                	test   $0x1,%al
80106565:	74 29                	je     80106590 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106567:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010656c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106572:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106575:	c1 eb 0a             	shr    $0xa,%ebx
80106578:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010657e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106581:	5b                   	pop    %ebx
80106582:	5e                   	pop    %esi
80106583:	5f                   	pop    %edi
80106584:	5d                   	pop    %ebp
80106585:	c3                   	ret    
80106586:	8d 76 00             	lea    0x0(%esi),%esi
80106589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106590:	85 c9                	test   %ecx,%ecx
80106592:	74 2c                	je     801065c0 <walkpgdir+0x70>
80106594:	e8 c7 be ff ff       	call   80102460 <kalloc>
80106599:	85 c0                	test   %eax,%eax
8010659b:	89 c6                	mov    %eax,%esi
8010659d:	74 21                	je     801065c0 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010659f:	83 ec 04             	sub    $0x4,%esp
801065a2:	68 00 10 00 00       	push   $0x1000
801065a7:	6a 00                	push   $0x0
801065a9:	50                   	push   %eax
801065aa:	e8 61 de ff ff       	call   80104410 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801065af:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801065b5:	83 c4 10             	add    $0x10,%esp
801065b8:	83 c8 07             	or     $0x7,%eax
801065bb:	89 07                	mov    %eax,(%edi)
801065bd:	eb b3                	jmp    80106572 <walkpgdir+0x22>
801065bf:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
801065c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801065c3:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801065c5:	5b                   	pop    %ebx
801065c6:	5e                   	pop    %esi
801065c7:	5f                   	pop    %edi
801065c8:	5d                   	pop    %ebp
801065c9:	c3                   	ret    
801065ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801065d0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801065d0:	55                   	push   %ebp
801065d1:	89 e5                	mov    %esp,%ebp
801065d3:	57                   	push   %edi
801065d4:	56                   	push   %esi
801065d5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801065d6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801065dc:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801065de:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801065e4:	83 ec 1c             	sub    $0x1c,%esp
801065e7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801065ea:	39 d3                	cmp    %edx,%ebx
801065ec:	73 66                	jae    80106654 <deallocuvm.part.0+0x84>
801065ee:	89 d6                	mov    %edx,%esi
801065f0:	eb 3d                	jmp    8010662f <deallocuvm.part.0+0x5f>
801065f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801065f8:	8b 10                	mov    (%eax),%edx
801065fa:	f6 c2 01             	test   $0x1,%dl
801065fd:	74 26                	je     80106625 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801065ff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106605:	74 58                	je     8010665f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106607:	83 ec 0c             	sub    $0xc,%esp
8010660a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106610:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106613:	52                   	push   %edx
80106614:	e8 97 bc ff ff       	call   801022b0 <kfree>
      *pte = 0;
80106619:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010661c:	83 c4 10             	add    $0x10,%esp
8010661f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106625:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010662b:	39 f3                	cmp    %esi,%ebx
8010662d:	73 25                	jae    80106654 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010662f:	31 c9                	xor    %ecx,%ecx
80106631:	89 da                	mov    %ebx,%edx
80106633:	89 f8                	mov    %edi,%eax
80106635:	e8 16 ff ff ff       	call   80106550 <walkpgdir>
    if(!pte)
8010663a:	85 c0                	test   %eax,%eax
8010663c:	75 ba                	jne    801065f8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010663e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106644:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010664a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106650:	39 f3                	cmp    %esi,%ebx
80106652:	72 db                	jb     8010662f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106654:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106657:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010665a:	5b                   	pop    %ebx
8010665b:	5e                   	pop    %esi
8010665c:	5f                   	pop    %edi
8010665d:	5d                   	pop    %ebp
8010665e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010665f:	83 ec 0c             	sub    $0xc,%esp
80106662:	68 66 72 10 80       	push   $0x80107266
80106667:	e8 04 9d ff ff       	call   80100370 <panic>
8010666c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106670 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106670:	55                   	push   %ebp
80106671:	89 e5                	mov    %esp,%ebp
80106673:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106676:	e8 b5 d0 ff ff       	call   80103730 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010667b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106681:	31 c9                	xor    %ecx,%ecx
80106683:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106688:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
8010668f:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106696:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010669b:	31 c9                	xor    %ecx,%ecx
8010669d:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801066a4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801066a9:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801066b0:	31 c9                	xor    %ecx,%ecx
801066b2:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
801066b9:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801066c0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801066c5:	31 c9                	xor    %ecx,%ecx
801066c7:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801066ce:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801066d5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801066da:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
801066e1:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
801066e8:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801066ef:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
801066f6:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
801066fd:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
80106704:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010670b:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
80106712:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
80106719:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
80106720:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106727:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
8010672e:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
80106735:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
8010673c:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106743:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010674a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010674f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106753:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106757:	c1 e8 10             	shr    $0x10,%eax
8010675a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
8010675e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106761:	0f 01 10             	lgdtl  (%eax)
}
80106764:	c9                   	leave  
80106765:	c3                   	ret    
80106766:	8d 76 00             	lea    0x0(%esi),%esi
80106769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106770 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106770:	55                   	push   %ebp
80106771:	89 e5                	mov    %esp,%ebp
80106773:	57                   	push   %edi
80106774:	56                   	push   %esi
80106775:	53                   	push   %ebx
80106776:	83 ec 1c             	sub    $0x1c,%esp
80106779:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010677c:	8b 55 10             	mov    0x10(%ebp),%edx
8010677f:	8b 7d 14             	mov    0x14(%ebp),%edi
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106782:	89 c3                	mov    %eax,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106784:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106788:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010678e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106793:	29 df                	sub    %ebx,%edi
80106795:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106798:	8b 45 18             	mov    0x18(%ebp),%eax
8010679b:	83 c8 01             	or     $0x1,%eax
8010679e:	89 45 e0             	mov    %eax,-0x20(%ebp)
801067a1:	eb 1a                	jmp    801067bd <mappages+0x4d>
801067a3:	90                   	nop
801067a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
801067a8:	f6 00 01             	testb  $0x1,(%eax)
801067ab:	75 3d                	jne    801067ea <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
801067ad:	0b 75 e0             	or     -0x20(%ebp),%esi
    if(a == last)
801067b0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801067b3:	89 30                	mov    %esi,(%eax)
    if(a == last)
801067b5:	74 29                	je     801067e0 <mappages+0x70>
      break;
    a += PGSIZE;
801067b7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801067bd:	8b 45 08             	mov    0x8(%ebp),%eax
801067c0:	b9 01 00 00 00       	mov    $0x1,%ecx
801067c5:	89 da                	mov    %ebx,%edx
801067c7:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801067ca:	e8 81 fd ff ff       	call   80106550 <walkpgdir>
801067cf:	85 c0                	test   %eax,%eax
801067d1:	75 d5                	jne    801067a8 <mappages+0x38>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801067d3:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801067d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801067db:	5b                   	pop    %ebx
801067dc:	5e                   	pop    %esi
801067dd:	5f                   	pop    %edi
801067de:	5d                   	pop    %ebp
801067df:	c3                   	ret    
801067e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801067e3:	31 c0                	xor    %eax,%eax
}
801067e5:	5b                   	pop    %ebx
801067e6:	5e                   	pop    %esi
801067e7:	5f                   	pop    %edi
801067e8:	5d                   	pop    %ebp
801067e9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801067ea:	83 ec 0c             	sub    $0xc,%esp
801067ed:	68 6c 79 10 80       	push   $0x8010796c
801067f2:	e8 79 9b ff ff       	call   80100370 <panic>
801067f7:	89 f6                	mov    %esi,%esi
801067f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106800 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106800:	a1 a4 55 11 80       	mov    0x801155a4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106805:	55                   	push   %ebp
80106806:	89 e5                	mov    %esp,%ebp
80106808:	05 00 00 00 80       	add    $0x80000000,%eax
8010680d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106810:	5d                   	pop    %ebp
80106811:	c3                   	ret    
80106812:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106820 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106820:	55                   	push   %ebp
80106821:	89 e5                	mov    %esp,%ebp
80106823:	57                   	push   %edi
80106824:	56                   	push   %esi
80106825:	53                   	push   %ebx
80106826:	83 ec 1c             	sub    $0x1c,%esp
80106829:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
8010682c:	85 f6                	test   %esi,%esi
8010682e:	0f 84 cd 00 00 00    	je     80106901 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106834:	8b 46 08             	mov    0x8(%esi),%eax
80106837:	85 c0                	test   %eax,%eax
80106839:	0f 84 dc 00 00 00    	je     8010691b <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
8010683f:	8b 7e 04             	mov    0x4(%esi),%edi
80106842:	85 ff                	test   %edi,%edi
80106844:	0f 84 c4 00 00 00    	je     8010690e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
8010684a:	e8 11 da ff ff       	call   80104260 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
8010684f:	e8 5c ce ff ff       	call   801036b0 <mycpu>
80106854:	89 c3                	mov    %eax,%ebx
80106856:	e8 55 ce ff ff       	call   801036b0 <mycpu>
8010685b:	89 c7                	mov    %eax,%edi
8010685d:	e8 4e ce ff ff       	call   801036b0 <mycpu>
80106862:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106865:	83 c7 08             	add    $0x8,%edi
80106868:	e8 43 ce ff ff       	call   801036b0 <mycpu>
8010686d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106870:	83 c0 08             	add    $0x8,%eax
80106873:	ba 67 00 00 00       	mov    $0x67,%edx
80106878:	c1 e8 18             	shr    $0x18,%eax
8010687b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106882:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106889:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106890:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106897:	83 c1 08             	add    $0x8,%ecx
8010689a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
801068a0:	c1 e9 10             	shr    $0x10,%ecx
801068a3:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801068a9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
801068ae:	e8 fd cd ff ff       	call   801036b0 <mycpu>
801068b3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801068ba:	e8 f1 cd ff ff       	call   801036b0 <mycpu>
801068bf:	b9 10 00 00 00       	mov    $0x10,%ecx
801068c4:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801068c8:	e8 e3 cd ff ff       	call   801036b0 <mycpu>
801068cd:	8b 56 08             	mov    0x8(%esi),%edx
801068d0:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
801068d6:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801068d9:	e8 d2 cd ff ff       	call   801036b0 <mycpu>
801068de:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
801068e2:	b8 28 00 00 00       	mov    $0x28,%eax
801068e7:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801068ea:	8b 46 04             	mov    0x4(%esi),%eax
801068ed:	05 00 00 00 80       	add    $0x80000000,%eax
801068f2:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
801068f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068f8:	5b                   	pop    %ebx
801068f9:	5e                   	pop    %esi
801068fa:	5f                   	pop    %edi
801068fb:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
801068fc:	e9 4f da ff ff       	jmp    80104350 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106901:	83 ec 0c             	sub    $0xc,%esp
80106904:	68 72 79 10 80       	push   $0x80107972
80106909:	e8 62 9a ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
8010690e:	83 ec 0c             	sub    $0xc,%esp
80106911:	68 9d 79 10 80       	push   $0x8010799d
80106916:	e8 55 9a ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
8010691b:	83 ec 0c             	sub    $0xc,%esp
8010691e:	68 88 79 10 80       	push   $0x80107988
80106923:	e8 48 9a ff ff       	call   80100370 <panic>
80106928:	90                   	nop
80106929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106930 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106930:	55                   	push   %ebp
80106931:	89 e5                	mov    %esp,%ebp
80106933:	57                   	push   %edi
80106934:	56                   	push   %esi
80106935:	53                   	push   %ebx
80106936:	83 ec 1c             	sub    $0x1c,%esp
80106939:	8b 75 10             	mov    0x10(%ebp),%esi
8010693c:	8b 55 08             	mov    0x8(%ebp),%edx
8010693f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106942:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106948:	77 50                	ja     8010699a <inituvm+0x6a>
8010694a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    panic("inituvm: more than a page");
  mem = kalloc();
8010694d:	e8 0e bb ff ff       	call   80102460 <kalloc>
  memset(mem, 0, PGSIZE);
80106952:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106955:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106957:	68 00 10 00 00       	push   $0x1000
8010695c:	6a 00                	push   $0x0
8010695e:	50                   	push   %eax
8010695f:	e8 ac da ff ff       	call   80104410 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106964:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106967:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010696d:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106974:	50                   	push   %eax
80106975:	68 00 10 00 00       	push   $0x1000
8010697a:	6a 00                	push   $0x0
8010697c:	52                   	push   %edx
8010697d:	e8 ee fd ff ff       	call   80106770 <mappages>
  memmove(mem, init, sz);
80106982:	89 75 10             	mov    %esi,0x10(%ebp)
80106985:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106988:	83 c4 20             	add    $0x20,%esp
8010698b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010698e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106991:	5b                   	pop    %ebx
80106992:	5e                   	pop    %esi
80106993:	5f                   	pop    %edi
80106994:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106995:	e9 26 db ff ff       	jmp    801044c0 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
8010699a:	83 ec 0c             	sub    $0xc,%esp
8010699d:	68 b1 79 10 80       	push   $0x801079b1
801069a2:	e8 c9 99 ff ff       	call   80100370 <panic>
801069a7:	89 f6                	mov    %esi,%esi
801069a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069b0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
801069b0:	55                   	push   %ebp
801069b1:	89 e5                	mov    %esp,%ebp
801069b3:	57                   	push   %edi
801069b4:	56                   	push   %esi
801069b5:	53                   	push   %ebx
801069b6:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
801069b9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
801069c0:	0f 85 91 00 00 00    	jne    80106a57 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
801069c6:	8b 75 18             	mov    0x18(%ebp),%esi
801069c9:	31 db                	xor    %ebx,%ebx
801069cb:	85 f6                	test   %esi,%esi
801069cd:	75 1a                	jne    801069e9 <loaduvm+0x39>
801069cf:	eb 6f                	jmp    80106a40 <loaduvm+0x90>
801069d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069d8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069de:	81 ee 00 10 00 00    	sub    $0x1000,%esi
801069e4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
801069e7:	76 57                	jbe    80106a40 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801069e9:	8b 55 0c             	mov    0xc(%ebp),%edx
801069ec:	8b 45 08             	mov    0x8(%ebp),%eax
801069ef:	31 c9                	xor    %ecx,%ecx
801069f1:	01 da                	add    %ebx,%edx
801069f3:	e8 58 fb ff ff       	call   80106550 <walkpgdir>
801069f8:	85 c0                	test   %eax,%eax
801069fa:	74 4e                	je     80106a4a <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
801069fc:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
801069fe:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106a01:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106a06:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106a0b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106a11:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106a14:	01 d9                	add    %ebx,%ecx
80106a16:	05 00 00 00 80       	add    $0x80000000,%eax
80106a1b:	57                   	push   %edi
80106a1c:	51                   	push   %ecx
80106a1d:	50                   	push   %eax
80106a1e:	ff 75 10             	pushl  0x10(%ebp)
80106a21:	e8 fa ae ff ff       	call   80101920 <readi>
80106a26:	83 c4 10             	add    $0x10,%esp
80106a29:	39 c7                	cmp    %eax,%edi
80106a2b:	74 ab                	je     801069d8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106a2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106a30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106a35:	5b                   	pop    %ebx
80106a36:	5e                   	pop    %esi
80106a37:	5f                   	pop    %edi
80106a38:	5d                   	pop    %ebp
80106a39:	c3                   	ret    
80106a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a40:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106a43:	31 c0                	xor    %eax,%eax
}
80106a45:	5b                   	pop    %ebx
80106a46:	5e                   	pop    %esi
80106a47:	5f                   	pop    %edi
80106a48:	5d                   	pop    %ebp
80106a49:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106a4a:	83 ec 0c             	sub    $0xc,%esp
80106a4d:	68 cb 79 10 80       	push   $0x801079cb
80106a52:	e8 19 99 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106a57:	83 ec 0c             	sub    $0xc,%esp
80106a5a:	68 6c 7a 10 80       	push   $0x80107a6c
80106a5f:	e8 0c 99 ff ff       	call   80100370 <panic>
80106a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106a70 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106a70:	55                   	push   %ebp
80106a71:	89 e5                	mov    %esp,%ebp
80106a73:	57                   	push   %edi
80106a74:	56                   	push   %esi
80106a75:	53                   	push   %ebx
80106a76:	83 ec 0c             	sub    $0xc,%esp
80106a79:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106a7c:	85 ff                	test   %edi,%edi
80106a7e:	0f 88 ca 00 00 00    	js     80106b4e <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106a84:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106a87:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106a8a:	0f 82 84 00 00 00    	jb     80106b14 <allocuvm+0xa4>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106a90:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106a96:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106a9c:	39 df                	cmp    %ebx,%edi
80106a9e:	77 45                	ja     80106ae5 <allocuvm+0x75>
80106aa0:	e9 bb 00 00 00       	jmp    80106b60 <allocuvm+0xf0>
80106aa5:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106aa8:	83 ec 04             	sub    $0x4,%esp
80106aab:	68 00 10 00 00       	push   $0x1000
80106ab0:	6a 00                	push   $0x0
80106ab2:	50                   	push   %eax
80106ab3:	e8 58 d9 ff ff       	call   80104410 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106ab8:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106abe:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106ac5:	50                   	push   %eax
80106ac6:	68 00 10 00 00       	push   $0x1000
80106acb:	53                   	push   %ebx
80106acc:	ff 75 08             	pushl  0x8(%ebp)
80106acf:	e8 9c fc ff ff       	call   80106770 <mappages>
80106ad4:	83 c4 20             	add    $0x20,%esp
80106ad7:	85 c0                	test   %eax,%eax
80106ad9:	78 45                	js     80106b20 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106adb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ae1:	39 df                	cmp    %ebx,%edi
80106ae3:	76 7b                	jbe    80106b60 <allocuvm+0xf0>
    mem = kalloc();
80106ae5:	e8 76 b9 ff ff       	call   80102460 <kalloc>
    if(mem == 0){
80106aea:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106aec:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106aee:	75 b8                	jne    80106aa8 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106af0:	83 ec 0c             	sub    $0xc,%esp
80106af3:	68 e9 79 10 80       	push   $0x801079e9
80106af8:	e8 63 9b ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106afd:	83 c4 10             	add    $0x10,%esp
80106b00:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b03:	76 49                	jbe    80106b4e <allocuvm+0xde>
80106b05:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b08:	8b 45 08             	mov    0x8(%ebp),%eax
80106b0b:	89 fa                	mov    %edi,%edx
80106b0d:	e8 be fa ff ff       	call   801065d0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106b12:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106b14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b17:	5b                   	pop    %ebx
80106b18:	5e                   	pop    %esi
80106b19:	5f                   	pop    %edi
80106b1a:	5d                   	pop    %ebp
80106b1b:	c3                   	ret    
80106b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106b20:	83 ec 0c             	sub    $0xc,%esp
80106b23:	68 01 7a 10 80       	push   $0x80107a01
80106b28:	e8 33 9b ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106b2d:	83 c4 10             	add    $0x10,%esp
80106b30:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b33:	76 0d                	jbe    80106b42 <allocuvm+0xd2>
80106b35:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b38:	8b 45 08             	mov    0x8(%ebp),%eax
80106b3b:	89 fa                	mov    %edi,%edx
80106b3d:	e8 8e fa ff ff       	call   801065d0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106b42:	83 ec 0c             	sub    $0xc,%esp
80106b45:	56                   	push   %esi
80106b46:	e8 65 b7 ff ff       	call   801022b0 <kfree>
      return 0;
80106b4b:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106b4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106b51:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106b53:	5b                   	pop    %ebx
80106b54:	5e                   	pop    %esi
80106b55:	5f                   	pop    %edi
80106b56:	5d                   	pop    %ebp
80106b57:	c3                   	ret    
80106b58:	90                   	nop
80106b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b60:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106b63:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106b65:	5b                   	pop    %ebx
80106b66:	5e                   	pop    %esi
80106b67:	5f                   	pop    %edi
80106b68:	5d                   	pop    %ebp
80106b69:	c3                   	ret    
80106b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b70 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106b70:	55                   	push   %ebp
80106b71:	89 e5                	mov    %esp,%ebp
80106b73:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b76:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106b79:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106b7c:	39 d1                	cmp    %edx,%ecx
80106b7e:	73 10                	jae    80106b90 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106b80:	5d                   	pop    %ebp
80106b81:	e9 4a fa ff ff       	jmp    801065d0 <deallocuvm.part.0>
80106b86:	8d 76 00             	lea    0x0(%esi),%esi
80106b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106b90:	89 d0                	mov    %edx,%eax
80106b92:	5d                   	pop    %ebp
80106b93:	c3                   	ret    
80106b94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ba0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106ba0:	55                   	push   %ebp
80106ba1:	89 e5                	mov    %esp,%ebp
80106ba3:	57                   	push   %edi
80106ba4:	56                   	push   %esi
80106ba5:	53                   	push   %ebx
80106ba6:	83 ec 0c             	sub    $0xc,%esp
80106ba9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106bac:	85 f6                	test   %esi,%esi
80106bae:	74 59                	je     80106c09 <freevm+0x69>
80106bb0:	31 c9                	xor    %ecx,%ecx
80106bb2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106bb7:	89 f0                	mov    %esi,%eax
80106bb9:	e8 12 fa ff ff       	call   801065d0 <deallocuvm.part.0>
80106bbe:	89 f3                	mov    %esi,%ebx
80106bc0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106bc6:	eb 0f                	jmp    80106bd7 <freevm+0x37>
80106bc8:	90                   	nop
80106bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bd0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106bd3:	39 fb                	cmp    %edi,%ebx
80106bd5:	74 23                	je     80106bfa <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106bd7:	8b 03                	mov    (%ebx),%eax
80106bd9:	a8 01                	test   $0x1,%al
80106bdb:	74 f3                	je     80106bd0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106bdd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106be2:	83 ec 0c             	sub    $0xc,%esp
80106be5:	83 c3 04             	add    $0x4,%ebx
80106be8:	05 00 00 00 80       	add    $0x80000000,%eax
80106bed:	50                   	push   %eax
80106bee:	e8 bd b6 ff ff       	call   801022b0 <kfree>
80106bf3:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106bf6:	39 fb                	cmp    %edi,%ebx
80106bf8:	75 dd                	jne    80106bd7 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106bfa:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106bfd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c00:	5b                   	pop    %ebx
80106c01:	5e                   	pop    %esi
80106c02:	5f                   	pop    %edi
80106c03:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106c04:	e9 a7 b6 ff ff       	jmp    801022b0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106c09:	83 ec 0c             	sub    $0xc,%esp
80106c0c:	68 1d 7a 10 80       	push   $0x80107a1d
80106c11:	e8 5a 97 ff ff       	call   80100370 <panic>
80106c16:	8d 76 00             	lea    0x0(%esi),%esi
80106c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c20 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106c20:	55                   	push   %ebp
80106c21:	89 e5                	mov    %esp,%ebp
80106c23:	56                   	push   %esi
80106c24:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106c25:	e8 36 b8 ff ff       	call   80102460 <kalloc>
80106c2a:	85 c0                	test   %eax,%eax
80106c2c:	74 6a                	je     80106c98 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c2e:	83 ec 04             	sub    $0x4,%esp
80106c31:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c33:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c38:	68 00 10 00 00       	push   $0x1000
80106c3d:	6a 00                	push   $0x0
80106c3f:	50                   	push   %eax
80106c40:	e8 cb d7 ff ff       	call   80104410 <memset>
80106c45:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106c48:	8b 43 04             	mov    0x4(%ebx),%eax
80106c4b:	8b 53 08             	mov    0x8(%ebx),%edx
80106c4e:	83 ec 0c             	sub    $0xc,%esp
80106c51:	ff 73 0c             	pushl  0xc(%ebx)
80106c54:	29 c2                	sub    %eax,%edx
80106c56:	50                   	push   %eax
80106c57:	52                   	push   %edx
80106c58:	ff 33                	pushl  (%ebx)
80106c5a:	56                   	push   %esi
80106c5b:	e8 10 fb ff ff       	call   80106770 <mappages>
80106c60:	83 c4 20             	add    $0x20,%esp
80106c63:	85 c0                	test   %eax,%eax
80106c65:	78 19                	js     80106c80 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c67:	83 c3 10             	add    $0x10,%ebx
80106c6a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106c70:	75 d6                	jne    80106c48 <setupkvm+0x28>
80106c72:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106c74:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106c77:	5b                   	pop    %ebx
80106c78:	5e                   	pop    %esi
80106c79:	5d                   	pop    %ebp
80106c7a:	c3                   	ret    
80106c7b:	90                   	nop
80106c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106c80:	83 ec 0c             	sub    $0xc,%esp
80106c83:	56                   	push   %esi
80106c84:	e8 17 ff ff ff       	call   80106ba0 <freevm>
      return 0;
80106c89:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106c8c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106c8f:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106c91:	5b                   	pop    %ebx
80106c92:	5e                   	pop    %esi
80106c93:	5d                   	pop    %ebp
80106c94:	c3                   	ret    
80106c95:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106c98:	31 c0                	xor    %eax,%eax
80106c9a:	eb d8                	jmp    80106c74 <setupkvm+0x54>
80106c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ca0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106ca6:	e8 75 ff ff ff       	call   80106c20 <setupkvm>
80106cab:	a3 a4 55 11 80       	mov    %eax,0x801155a4
80106cb0:	05 00 00 00 80       	add    $0x80000000,%eax
80106cb5:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106cb8:	c9                   	leave  
80106cb9:	c3                   	ret    
80106cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cc0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106cc0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106cc1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106cc3:	89 e5                	mov    %esp,%ebp
80106cc5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106cc8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80106cce:	e8 7d f8 ff ff       	call   80106550 <walkpgdir>
  if(pte == 0)
80106cd3:	85 c0                	test   %eax,%eax
80106cd5:	74 05                	je     80106cdc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106cd7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106cda:	c9                   	leave  
80106cdb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106cdc:	83 ec 0c             	sub    $0xc,%esp
80106cdf:	68 2e 7a 10 80       	push   $0x80107a2e
80106ce4:	e8 87 96 ff ff       	call   80100370 <panic>
80106ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106cf0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(struct proc * pcs)
{
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	57                   	push   %edi
80106cf4:	56                   	push   %esi
80106cf5:	53                   	push   %ebx
80106cf6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106cf9:	e8 22 ff ff ff       	call   80106c20 <setupkvm>
80106cfe:	85 c0                	test   %eax,%eax
80106d00:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106d03:	0f 84 61 01 00 00    	je     80106e6a <copyuvm+0x17a>
    return 0;
  for(i = 0; i < pcs->sz; i += PGSIZE){
80106d09:	8b 45 08             	mov    0x8(%ebp),%eax
80106d0c:	8b 08                	mov    (%eax),%ecx
80106d0e:	85 c9                	test   %ecx,%ecx
80106d10:	0f 84 aa 00 00 00    	je     80106dc0 <copyuvm+0xd0>
80106d16:	31 f6                	xor    %esi,%esi
80106d18:	89 c7                	mov    %eax,%edi
80106d1a:	eb 45                	jmp    80106d61 <copyuvm+0x71>
80106d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106d20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d23:	83 ec 04             	sub    $0x4,%esp
80106d26:	68 00 10 00 00       	push   $0x1000
80106d2b:	05 00 00 00 80       	add    $0x80000000,%eax
80106d30:	50                   	push   %eax
80106d31:	53                   	push   %ebx
80106d32:	e8 89 d7 ff ff       	call   801044c0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106d37:	5a                   	pop    %edx
80106d38:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106d3e:	ff 75 e0             	pushl  -0x20(%ebp)
80106d41:	52                   	push   %edx
80106d42:	68 00 10 00 00       	push   $0x1000
80106d47:	56                   	push   %esi
80106d48:	ff 75 dc             	pushl  -0x24(%ebp)
80106d4b:	e8 20 fa ff ff       	call   80106770 <mappages>
80106d50:	83 c4 20             	add    $0x20,%esp
80106d53:	85 c0                	test   %eax,%eax
80106d55:	78 47                	js     80106d9e <copyuvm+0xae>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < pcs->sz; i += PGSIZE){
80106d57:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106d5d:	39 37                	cmp    %esi,(%edi)
80106d5f:	76 5f                	jbe    80106dc0 <copyuvm+0xd0>
    if((pte = walkpgdir(pcs->pgdir, (void *) i, 0)) == 0)
80106d61:	8b 47 04             	mov    0x4(%edi),%eax
80106d64:	31 c9                	xor    %ecx,%ecx
80106d66:	89 f2                	mov    %esi,%edx
80106d68:	e8 e3 f7 ff ff       	call   80106550 <walkpgdir>
80106d6d:	85 c0                	test   %eax,%eax
80106d6f:	0f 84 09 01 00 00    	je     80106e7e <copyuvm+0x18e>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106d75:	8b 18                	mov    (%eax),%ebx
80106d77:	f6 c3 01             	test   $0x1,%bl
80106d7a:	0f 84 f1 00 00 00    	je     80106e71 <copyuvm+0x181>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106d80:	89 d8                	mov    %ebx,%eax
    flags = PTE_FLAGS(*pte);
80106d82:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  for(i = 0; i < pcs->sz; i += PGSIZE){
    if((pte = walkpgdir(pcs->pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106d88:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    flags = PTE_FLAGS(*pte);
80106d8d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  for(i = 0; i < pcs->sz; i += PGSIZE){
    if((pte = walkpgdir(pcs->pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106d90:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106d93:	e8 c8 b6 ff ff       	call   80102460 <kalloc>
80106d98:	85 c0                	test   %eax,%eax
80106d9a:	89 c3                	mov    %eax,%ebx
80106d9c:	75 82                	jne    80106d20 <copyuvm+0x30>
  }

  return d;

bad:
  freevm(d);
80106d9e:	83 ec 0c             	sub    $0xc,%esp
80106da1:	ff 75 dc             	pushl  -0x24(%ebp)
80106da4:	e8 f7 fd ff ff       	call   80106ba0 <freevm>
  return 0;
80106da9:	83 c4 10             	add    $0x10,%esp
80106dac:	31 c0                	xor    %eax,%eax
}
80106dae:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106db1:	5b                   	pop    %ebx
80106db2:	5e                   	pop    %esi
80106db3:	5f                   	pop    %edi
80106db4:	5d                   	pop    %ebp
80106db5:	c3                   	ret    
80106db6:	8d 76 00             	lea    0x0(%esi),%esi
80106db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < pcs->sz; i += PGSIZE){
80106dc0:	bf 00 f0 ff 7f       	mov    $0x7ffff000,%edi
80106dc5:	31 db                	xor    %ebx,%ebx
80106dc7:	8b 75 08             	mov    0x8(%ebp),%esi
80106dca:	e9 87 00 00 00       	jmp    80106e56 <copyuvm+0x166>
80106dcf:	90                   	nop
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
  for(i = 0; i < pcs->pages; i++){
    uint pgadd = STACKBASE - ((PGSIZE - 1) * (i + 1));
    if((pte = walkpgdir(pcs->pgdir, (void *) pgadd, 0)) == 0)
80106dd0:	8b 46 04             	mov    0x4(%esi),%eax
80106dd3:	31 c9                	xor    %ecx,%ecx
80106dd5:	89 fa                	mov    %edi,%edx
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
  for(i = 0; i < pcs->pages; i++){
    uint pgadd = STACKBASE - ((PGSIZE - 1) * (i + 1));
80106dd7:	83 c3 01             	add    $0x1,%ebx
    if((pte = walkpgdir(pcs->pgdir, (void *) pgadd, 0)) == 0)
80106dda:	e8 71 f7 ff ff       	call   80106550 <walkpgdir>
80106ddf:	85 c0                	test   %eax,%eax
80106de1:	0f 84 97 00 00 00    	je     80106e7e <copyuvm+0x18e>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106de7:	8b 00                	mov    (%eax),%eax
80106de9:	a8 01                	test   $0x1,%al
80106deb:	0f 84 80 00 00 00    	je     80106e71 <copyuvm+0x181>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106df1:	89 c1                	mov    %eax,%ecx
    flags = PTE_FLAGS(*pte);
80106df3:	25 ff 0f 00 00       	and    $0xfff,%eax
    uint pgadd = STACKBASE - ((PGSIZE - 1) * (i + 1));
    if((pte = walkpgdir(pcs->pgdir, (void *) pgadd, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106df8:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
    flags = PTE_FLAGS(*pte);
80106dfe:	89 45 e0             	mov    %eax,-0x20(%ebp)
    uint pgadd = STACKBASE - ((PGSIZE - 1) * (i + 1));
    if((pte = walkpgdir(pcs->pgdir, (void *) pgadd, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e01:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106e04:	e8 57 b6 ff ff       	call   80102460 <kalloc>
80106e09:	85 c0                	test   %eax,%eax
80106e0b:	89 c2                	mov    %eax,%edx
80106e0d:	74 8f                	je     80106d9e <copyuvm+0xae>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106e0f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e12:	83 ec 04             	sub    $0x4,%esp
80106e15:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106e18:	68 00 10 00 00       	push   $0x1000
80106e1d:	05 00 00 00 80       	add    $0x80000000,%eax
80106e22:	50                   	push   %eax
80106e23:	52                   	push   %edx
80106e24:	e8 97 d6 ff ff       	call   801044c0 <memmove>
    if(mappages(d, (void*)pgadd, PGSIZE, V2P(mem), flags) < 0)
80106e29:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106e2c:	58                   	pop    %eax
80106e2d:	ff 75 e0             	pushl  -0x20(%ebp)
80106e30:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106e36:	52                   	push   %edx
80106e37:	68 00 10 00 00       	push   $0x1000
80106e3c:	57                   	push   %edi
80106e3d:	ff 75 dc             	pushl  -0x24(%ebp)
80106e40:	81 ef ff 0f 00 00    	sub    $0xfff,%edi
80106e46:	e8 25 f9 ff ff       	call   80106770 <mappages>
80106e4b:	83 c4 20             	add    $0x20,%esp
80106e4e:	85 c0                	test   %eax,%eax
80106e50:	0f 88 48 ff ff ff    	js     80106d9e <copyuvm+0xae>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
  for(i = 0; i < pcs->pages; i++){
80106e56:	3b 5e 7c             	cmp    0x7c(%esi),%ebx
80106e59:	0f 82 71 ff ff ff    	jb     80106dd0 <copyuvm+0xe0>
80106e5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106e62:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e65:	5b                   	pop    %ebx
80106e66:	5e                   	pop    %esi
80106e67:	5f                   	pop    %edi
80106e68:	5d                   	pop    %ebp
80106e69:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106e6a:	31 c0                	xor    %eax,%eax
80106e6c:	e9 3d ff ff ff       	jmp    80106dae <copyuvm+0xbe>
  for(i = 0; i < pcs->sz; i += PGSIZE){
    if((pte = walkpgdir(pcs->pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106e71:	83 ec 0c             	sub    $0xc,%esp
80106e74:	68 52 7a 10 80       	push   $0x80107a52
80106e79:	e8 f2 94 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < pcs->sz; i += PGSIZE){
    if((pte = walkpgdir(pcs->pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106e7e:	83 ec 0c             	sub    $0xc,%esp
80106e81:	68 38 7a 10 80       	push   $0x80107a38
80106e86:	e8 e5 94 ff ff       	call   80100370 <panic>
80106e8b:	90                   	nop
80106e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e90 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106e90:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e91:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106e93:	89 e5                	mov    %esp,%ebp
80106e95:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e98:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e9b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e9e:	e8 ad f6 ff ff       	call   80106550 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106ea3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80106ea5:	89 c2                	mov    %eax,%edx
80106ea7:	83 e2 05             	and    $0x5,%edx
80106eaa:	83 fa 05             	cmp    $0x5,%edx
80106ead:	75 11                	jne    80106ec0 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106eaf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80106eb4:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106eb5:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106eba:	c3                   	ret    
80106ebb:	90                   	nop
80106ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106ec0:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106ec2:	c9                   	leave  
80106ec3:	c3                   	ret    
80106ec4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ed0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106ed0:	55                   	push   %ebp
80106ed1:	89 e5                	mov    %esp,%ebp
80106ed3:	57                   	push   %edi
80106ed4:	56                   	push   %esi
80106ed5:	53                   	push   %ebx
80106ed6:	83 ec 1c             	sub    $0x1c,%esp
80106ed9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106edc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106edf:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106ee2:	85 db                	test   %ebx,%ebx
80106ee4:	75 40                	jne    80106f26 <copyout+0x56>
80106ee6:	eb 70                	jmp    80106f58 <copyout+0x88>
80106ee8:	90                   	nop
80106ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106ef0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ef3:	89 f1                	mov    %esi,%ecx
80106ef5:	29 d1                	sub    %edx,%ecx
80106ef7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106efd:	39 d9                	cmp    %ebx,%ecx
80106eff:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106f02:	29 f2                	sub    %esi,%edx
80106f04:	83 ec 04             	sub    $0x4,%esp
80106f07:	01 d0                	add    %edx,%eax
80106f09:	51                   	push   %ecx
80106f0a:	57                   	push   %edi
80106f0b:	50                   	push   %eax
80106f0c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106f0f:	e8 ac d5 ff ff       	call   801044c0 <memmove>
    len -= n;
    buf += n;
80106f14:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106f17:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
80106f1a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80106f20:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106f22:	29 cb                	sub    %ecx,%ebx
80106f24:	74 32                	je     80106f58 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80106f26:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f28:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106f2b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f2e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f34:	56                   	push   %esi
80106f35:	ff 75 08             	pushl  0x8(%ebp)
80106f38:	e8 53 ff ff ff       	call   80106e90 <uva2ka>
    if(pa0 == 0)
80106f3d:	83 c4 10             	add    $0x10,%esp
80106f40:	85 c0                	test   %eax,%eax
80106f42:	75 ac                	jne    80106ef0 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106f44:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80106f47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106f4c:	5b                   	pop    %ebx
80106f4d:	5e                   	pop    %esi
80106f4e:	5f                   	pop    %edi
80106f4f:	5d                   	pop    %ebp
80106f50:	c3                   	ret    
80106f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f58:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106f5b:	31 c0                	xor    %eax,%eax
}
80106f5d:	5b                   	pop    %ebx
80106f5e:	5e                   	pop    %esi
80106f5f:	5f                   	pop    %edi
80106f60:	5d                   	pop    %ebp
80106f61:	c3                   	ret    
80106f62:	66 90                	xchg   %ax,%ax
80106f64:	66 90                	xchg   %ax,%ax
80106f66:	66 90                	xchg   %ax,%ax
80106f68:	66 90                	xchg   %ax,%ax
80106f6a:	66 90                	xchg   %ax,%ax
80106f6c:	66 90                	xchg   %ax,%ax
80106f6e:	66 90                	xchg   %ax,%ax

80106f70 <shminit>:
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
80106f70:	55                   	push   %ebp
80106f71:	89 e5                	mov    %esp,%ebp
80106f73:	83 ec 10             	sub    $0x10,%esp
  int i;
  initlock(&(shm_table.lock), "SHM lock");
80106f76:	68 90 7a 10 80       	push   $0x80107a90
80106f7b:	68 c0 55 11 80       	push   $0x801155c0
80106f80:	e8 1b d2 ff ff       	call   801041a0 <initlock>
  acquire(&(shm_table.lock));
80106f85:	c7 04 24 c0 55 11 80 	movl   $0x801155c0,(%esp)
80106f8c:	e8 0f d3 ff ff       	call   801042a0 <acquire>
80106f91:	b8 f4 55 11 80       	mov    $0x801155f4,%eax
80106f96:	83 c4 10             	add    $0x10,%esp
80106f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
80106fa0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    shm_table.shm_pages[i].frame =0;
80106fa6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80106fad:	83 c0 0c             	add    $0xc,%eax
    shm_table.shm_pages[i].refcnt =0;
80106fb0:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
80106fb7:	3d f4 58 11 80       	cmp    $0x801158f4,%eax
80106fbc:	75 e2                	jne    80106fa0 <shminit+0x30>
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
80106fbe:	83 ec 0c             	sub    $0xc,%esp
80106fc1:	68 c0 55 11 80       	push   $0x801155c0
80106fc6:	e8 f5 d3 ff ff       	call   801043c0 <release>
}
80106fcb:	83 c4 10             	add    $0x10,%esp
80106fce:	c9                   	leave  
80106fcf:	c3                   	ret    

80106fd0 <shm_open>:

int shm_open(int id, char **pointer) {
80106fd0:	55                   	push   %ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
80106fd1:	31 c0                	xor    %eax,%eax
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
80106fd3:	89 e5                	mov    %esp,%ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
80106fd5:	5d                   	pop    %ebp
80106fd6:	c3                   	ret    
80106fd7:	89 f6                	mov    %esi,%esi
80106fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fe0 <shm_close>:


int shm_close(int id) {
80106fe0:	55                   	push   %ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
80106fe1:	31 c0                	xor    %eax,%eax

return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
80106fe3:	89 e5                	mov    %esp,%ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
80106fe5:	5d                   	pop    %ebp
80106fe6:	c3                   	ret    
