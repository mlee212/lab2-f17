
_null:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
int *i = 0;

(*i)++;
    1001:	a1 00 00 00 00       	mov    0x0,%eax
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    1006:	89 e5                	mov    %esp,%ebp
    1008:	0f 0b                	ud2    
    100a:	66 90                	xchg   %ax,%ax
    100c:	66 90                	xchg   %ax,%ax
    100e:	66 90                	xchg   %ax,%ax

00001010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	53                   	push   %ebx
    1014:	8b 45 08             	mov    0x8(%ebp),%eax
    1017:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    101a:	89 c2                	mov    %eax,%edx
    101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1020:	83 c1 01             	add    $0x1,%ecx
    1023:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1027:	83 c2 01             	add    $0x1,%edx
    102a:	84 db                	test   %bl,%bl
    102c:	88 5a ff             	mov    %bl,-0x1(%edx)
    102f:	75 ef                	jne    1020 <strcpy+0x10>
    ;
  return os;
}
    1031:	5b                   	pop    %ebx
    1032:	5d                   	pop    %ebp
    1033:	c3                   	ret    
    1034:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    103a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	56                   	push   %esi
    1044:	53                   	push   %ebx
    1045:	8b 55 08             	mov    0x8(%ebp),%edx
    1048:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    104b:	0f b6 02             	movzbl (%edx),%eax
    104e:	0f b6 19             	movzbl (%ecx),%ebx
    1051:	84 c0                	test   %al,%al
    1053:	75 1e                	jne    1073 <strcmp+0x33>
    1055:	eb 29                	jmp    1080 <strcmp+0x40>
    1057:	89 f6                	mov    %esi,%esi
    1059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1060:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1063:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1066:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1069:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    106d:	84 c0                	test   %al,%al
    106f:	74 0f                	je     1080 <strcmp+0x40>
    1071:	89 f1                	mov    %esi,%ecx
    1073:	38 d8                	cmp    %bl,%al
    1075:	74 e9                	je     1060 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1077:	29 d8                	sub    %ebx,%eax
}
    1079:	5b                   	pop    %ebx
    107a:	5e                   	pop    %esi
    107b:	5d                   	pop    %ebp
    107c:	c3                   	ret    
    107d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1080:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1082:	29 d8                	sub    %ebx,%eax
}
    1084:	5b                   	pop    %ebx
    1085:	5e                   	pop    %esi
    1086:	5d                   	pop    %ebp
    1087:	c3                   	ret    
    1088:	90                   	nop
    1089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001090 <strlen>:

uint
strlen(char *s)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1096:	80 39 00             	cmpb   $0x0,(%ecx)
    1099:	74 12                	je     10ad <strlen+0x1d>
    109b:	31 d2                	xor    %edx,%edx
    109d:	8d 76 00             	lea    0x0(%esi),%esi
    10a0:	83 c2 01             	add    $0x1,%edx
    10a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10a7:	89 d0                	mov    %edx,%eax
    10a9:	75 f5                	jne    10a0 <strlen+0x10>
    ;
  return n;
}
    10ab:	5d                   	pop    %ebp
    10ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    10ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    10af:	5d                   	pop    %ebp
    10b0:	c3                   	ret    
    10b1:	eb 0d                	jmp    10c0 <memset>
    10b3:	90                   	nop
    10b4:	90                   	nop
    10b5:	90                   	nop
    10b6:	90                   	nop
    10b7:	90                   	nop
    10b8:	90                   	nop
    10b9:	90                   	nop
    10ba:	90                   	nop
    10bb:	90                   	nop
    10bc:	90                   	nop
    10bd:	90                   	nop
    10be:	90                   	nop
    10bf:	90                   	nop

000010c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    10cd:	89 d7                	mov    %edx,%edi
    10cf:	fc                   	cld    
    10d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10d2:	89 d0                	mov    %edx,%eax
    10d4:	5f                   	pop    %edi
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <strchr>:

char*
strchr(const char *s, char c)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	53                   	push   %ebx
    10e4:	8b 45 08             	mov    0x8(%ebp),%eax
    10e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    10ea:	0f b6 10             	movzbl (%eax),%edx
    10ed:	84 d2                	test   %dl,%dl
    10ef:	74 1d                	je     110e <strchr+0x2e>
    if(*s == c)
    10f1:	38 d3                	cmp    %dl,%bl
    10f3:	89 d9                	mov    %ebx,%ecx
    10f5:	75 0d                	jne    1104 <strchr+0x24>
    10f7:	eb 17                	jmp    1110 <strchr+0x30>
    10f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1100:	38 ca                	cmp    %cl,%dl
    1102:	74 0c                	je     1110 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1104:	83 c0 01             	add    $0x1,%eax
    1107:	0f b6 10             	movzbl (%eax),%edx
    110a:	84 d2                	test   %dl,%dl
    110c:	75 f2                	jne    1100 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    110e:	31 c0                	xor    %eax,%eax
}
    1110:	5b                   	pop    %ebx
    1111:	5d                   	pop    %ebp
    1112:	c3                   	ret    
    1113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001120 <gets>:

char*
gets(char *buf, int max)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	56                   	push   %esi
    1125:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1126:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1128:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    112b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    112e:	eb 29                	jmp    1159 <gets+0x39>
    cc = read(0, &c, 1);
    1130:	83 ec 04             	sub    $0x4,%esp
    1133:	6a 01                	push   $0x1
    1135:	57                   	push   %edi
    1136:	6a 00                	push   $0x0
    1138:	e8 2d 01 00 00       	call   126a <read>
    if(cc < 1)
    113d:	83 c4 10             	add    $0x10,%esp
    1140:	85 c0                	test   %eax,%eax
    1142:	7e 1d                	jle    1161 <gets+0x41>
      break;
    buf[i++] = c;
    1144:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1148:	8b 55 08             	mov    0x8(%ebp),%edx
    114b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    114d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    114f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1153:	74 1b                	je     1170 <gets+0x50>
    1155:	3c 0d                	cmp    $0xd,%al
    1157:	74 17                	je     1170 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1159:	8d 5e 01             	lea    0x1(%esi),%ebx
    115c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    115f:	7c cf                	jl     1130 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1161:	8b 45 08             	mov    0x8(%ebp),%eax
    1164:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1168:	8d 65 f4             	lea    -0xc(%ebp),%esp
    116b:	5b                   	pop    %ebx
    116c:	5e                   	pop    %esi
    116d:	5f                   	pop    %edi
    116e:	5d                   	pop    %ebp
    116f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1170:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1173:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1175:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1179:	8d 65 f4             	lea    -0xc(%ebp),%esp
    117c:	5b                   	pop    %ebx
    117d:	5e                   	pop    %esi
    117e:	5f                   	pop    %edi
    117f:	5d                   	pop    %ebp
    1180:	c3                   	ret    
    1181:	eb 0d                	jmp    1190 <stat>
    1183:	90                   	nop
    1184:	90                   	nop
    1185:	90                   	nop
    1186:	90                   	nop
    1187:	90                   	nop
    1188:	90                   	nop
    1189:	90                   	nop
    118a:	90                   	nop
    118b:	90                   	nop
    118c:	90                   	nop
    118d:	90                   	nop
    118e:	90                   	nop
    118f:	90                   	nop

00001190 <stat>:

int
stat(char *n, struct stat *st)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	56                   	push   %esi
    1194:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1195:	83 ec 08             	sub    $0x8,%esp
    1198:	6a 00                	push   $0x0
    119a:	ff 75 08             	pushl  0x8(%ebp)
    119d:	e8 f0 00 00 00       	call   1292 <open>
  if(fd < 0)
    11a2:	83 c4 10             	add    $0x10,%esp
    11a5:	85 c0                	test   %eax,%eax
    11a7:	78 27                	js     11d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11a9:	83 ec 08             	sub    $0x8,%esp
    11ac:	ff 75 0c             	pushl  0xc(%ebp)
    11af:	89 c3                	mov    %eax,%ebx
    11b1:	50                   	push   %eax
    11b2:	e8 f3 00 00 00       	call   12aa <fstat>
    11b7:	89 c6                	mov    %eax,%esi
  close(fd);
    11b9:	89 1c 24             	mov    %ebx,(%esp)
    11bc:	e8 b9 00 00 00       	call   127a <close>
  return r;
    11c1:	83 c4 10             	add    $0x10,%esp
    11c4:	89 f0                	mov    %esi,%eax
}
    11c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11c9:	5b                   	pop    %ebx
    11ca:	5e                   	pop    %esi
    11cb:	5d                   	pop    %ebp
    11cc:	c3                   	ret    
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    11d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11d5:	eb ef                	jmp    11c6 <stat+0x36>
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11e7:	0f be 11             	movsbl (%ecx),%edx
    11ea:	8d 42 d0             	lea    -0x30(%edx),%eax
    11ed:	3c 09                	cmp    $0x9,%al
    11ef:	b8 00 00 00 00       	mov    $0x0,%eax
    11f4:	77 1f                	ja     1215 <atoi+0x35>
    11f6:	8d 76 00             	lea    0x0(%esi),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1200:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1203:	83 c1 01             	add    $0x1,%ecx
    1206:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    120a:	0f be 11             	movsbl (%ecx),%edx
    120d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1210:	80 fb 09             	cmp    $0x9,%bl
    1213:	76 eb                	jbe    1200 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1215:	5b                   	pop    %ebx
    1216:	5d                   	pop    %ebp
    1217:	c3                   	ret    
    1218:	90                   	nop
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001220 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	56                   	push   %esi
    1224:	53                   	push   %ebx
    1225:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1228:	8b 45 08             	mov    0x8(%ebp),%eax
    122b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    122e:	85 db                	test   %ebx,%ebx
    1230:	7e 14                	jle    1246 <memmove+0x26>
    1232:	31 d2                	xor    %edx,%edx
    1234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    123c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    123f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1242:	39 da                	cmp    %ebx,%edx
    1244:	75 f2                	jne    1238 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1246:	5b                   	pop    %ebx
    1247:	5e                   	pop    %esi
    1248:	5d                   	pop    %ebp
    1249:	c3                   	ret    

0000124a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    124a:	b8 01 00 00 00       	mov    $0x1,%eax
    124f:	cd 40                	int    $0x40
    1251:	c3                   	ret    

00001252 <exit>:
SYSCALL(exit)
    1252:	b8 02 00 00 00       	mov    $0x2,%eax
    1257:	cd 40                	int    $0x40
    1259:	c3                   	ret    

0000125a <wait>:
SYSCALL(wait)
    125a:	b8 03 00 00 00       	mov    $0x3,%eax
    125f:	cd 40                	int    $0x40
    1261:	c3                   	ret    

00001262 <pipe>:
SYSCALL(pipe)
    1262:	b8 04 00 00 00       	mov    $0x4,%eax
    1267:	cd 40                	int    $0x40
    1269:	c3                   	ret    

0000126a <read>:
SYSCALL(read)
    126a:	b8 05 00 00 00       	mov    $0x5,%eax
    126f:	cd 40                	int    $0x40
    1271:	c3                   	ret    

00001272 <write>:
SYSCALL(write)
    1272:	b8 10 00 00 00       	mov    $0x10,%eax
    1277:	cd 40                	int    $0x40
    1279:	c3                   	ret    

0000127a <close>:
SYSCALL(close)
    127a:	b8 15 00 00 00       	mov    $0x15,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <kill>:
SYSCALL(kill)
    1282:	b8 06 00 00 00       	mov    $0x6,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <exec>:
SYSCALL(exec)
    128a:	b8 07 00 00 00       	mov    $0x7,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <open>:
SYSCALL(open)
    1292:	b8 0f 00 00 00       	mov    $0xf,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <mknod>:
SYSCALL(mknod)
    129a:	b8 11 00 00 00       	mov    $0x11,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <unlink>:
SYSCALL(unlink)
    12a2:	b8 12 00 00 00       	mov    $0x12,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <fstat>:
SYSCALL(fstat)
    12aa:	b8 08 00 00 00       	mov    $0x8,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <link>:
SYSCALL(link)
    12b2:	b8 13 00 00 00       	mov    $0x13,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <mkdir>:
SYSCALL(mkdir)
    12ba:	b8 14 00 00 00       	mov    $0x14,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <chdir>:
SYSCALL(chdir)
    12c2:	b8 09 00 00 00       	mov    $0x9,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <dup>:
SYSCALL(dup)
    12ca:	b8 0a 00 00 00       	mov    $0xa,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <getpid>:
SYSCALL(getpid)
    12d2:	b8 0b 00 00 00       	mov    $0xb,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <sbrk>:
SYSCALL(sbrk)
    12da:	b8 0c 00 00 00       	mov    $0xc,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <sleep>:
SYSCALL(sleep)
    12e2:	b8 0d 00 00 00       	mov    $0xd,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <uptime>:
SYSCALL(uptime)
    12ea:	b8 0e 00 00 00       	mov    $0xe,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <shm_open>:
SYSCALL(shm_open)
    12f2:	b8 16 00 00 00       	mov    $0x16,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <shm_close>:
SYSCALL(shm_close)	
    12fa:	b8 17 00 00 00       	mov    $0x17,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    
    1302:	66 90                	xchg   %ax,%ax
    1304:	66 90                	xchg   %ax,%ax
    1306:	66 90                	xchg   %ax,%ax
    1308:	66 90                	xchg   %ax,%ax
    130a:	66 90                	xchg   %ax,%ax
    130c:	66 90                	xchg   %ax,%ax
    130e:	66 90                	xchg   %ax,%ax

00001310 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	89 c6                	mov    %eax,%esi
    1318:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    131b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    131e:	85 db                	test   %ebx,%ebx
    1320:	74 7e                	je     13a0 <printint+0x90>
    1322:	89 d0                	mov    %edx,%eax
    1324:	c1 e8 1f             	shr    $0x1f,%eax
    1327:	84 c0                	test   %al,%al
    1329:	74 75                	je     13a0 <printint+0x90>
    neg = 1;
    x = -xx;
    132b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    132d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1334:	f7 d8                	neg    %eax
    1336:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1339:	31 ff                	xor    %edi,%edi
    133b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    133e:	89 ce                	mov    %ecx,%esi
    1340:	eb 08                	jmp    134a <printint+0x3a>
    1342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1348:	89 cf                	mov    %ecx,%edi
    134a:	31 d2                	xor    %edx,%edx
    134c:	8d 4f 01             	lea    0x1(%edi),%ecx
    134f:	f7 f6                	div    %esi
    1351:	0f b6 92 0c 17 00 00 	movzbl 0x170c(%edx),%edx
  }while((x /= base) != 0);
    1358:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    135a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    135d:	75 e9                	jne    1348 <printint+0x38>
  if(neg)
    135f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1362:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1365:	85 c0                	test   %eax,%eax
    1367:	74 08                	je     1371 <printint+0x61>
    buf[i++] = '-';
    1369:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    136e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1371:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1375:	8d 76 00             	lea    0x0(%esi),%esi
    1378:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    137b:	83 ec 04             	sub    $0x4,%esp
    137e:	83 ef 01             	sub    $0x1,%edi
    1381:	6a 01                	push   $0x1
    1383:	53                   	push   %ebx
    1384:	56                   	push   %esi
    1385:	88 45 d7             	mov    %al,-0x29(%ebp)
    1388:	e8 e5 fe ff ff       	call   1272 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    138d:	83 c4 10             	add    $0x10,%esp
    1390:	39 df                	cmp    %ebx,%edi
    1392:	75 e4                	jne    1378 <printint+0x68>
    putc(fd, buf[i]);
}
    1394:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1397:	5b                   	pop    %ebx
    1398:	5e                   	pop    %esi
    1399:	5f                   	pop    %edi
    139a:	5d                   	pop    %ebp
    139b:	c3                   	ret    
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13a0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13a2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13a9:	eb 8b                	jmp    1336 <printint+0x26>
    13ab:	90                   	nop
    13ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	57                   	push   %edi
    13b4:	56                   	push   %esi
    13b5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13b6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13b9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13bc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13bf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    13c5:	0f b6 1e             	movzbl (%esi),%ebx
    13c8:	83 c6 01             	add    $0x1,%esi
    13cb:	84 db                	test   %bl,%bl
    13cd:	0f 84 b0 00 00 00    	je     1483 <printf+0xd3>
    13d3:	31 d2                	xor    %edx,%edx
    13d5:	eb 39                	jmp    1410 <printf+0x60>
    13d7:	89 f6                	mov    %esi,%esi
    13d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13e0:	83 f8 25             	cmp    $0x25,%eax
    13e3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    13e6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13eb:	74 18                	je     1405 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13ed:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    13f0:	83 ec 04             	sub    $0x4,%esp
    13f3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    13f6:	6a 01                	push   $0x1
    13f8:	50                   	push   %eax
    13f9:	57                   	push   %edi
    13fa:	e8 73 fe ff ff       	call   1272 <write>
    13ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1402:	83 c4 10             	add    $0x10,%esp
    1405:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1408:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    140c:	84 db                	test   %bl,%bl
    140e:	74 73                	je     1483 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1410:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1412:	0f be cb             	movsbl %bl,%ecx
    1415:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1418:	74 c6                	je     13e0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    141a:	83 fa 25             	cmp    $0x25,%edx
    141d:	75 e6                	jne    1405 <printf+0x55>
      if(c == 'd'){
    141f:	83 f8 64             	cmp    $0x64,%eax
    1422:	0f 84 f8 00 00 00    	je     1520 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1428:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    142e:	83 f9 70             	cmp    $0x70,%ecx
    1431:	74 5d                	je     1490 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1433:	83 f8 73             	cmp    $0x73,%eax
    1436:	0f 84 84 00 00 00    	je     14c0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    143c:	83 f8 63             	cmp    $0x63,%eax
    143f:	0f 84 ea 00 00 00    	je     152f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1445:	83 f8 25             	cmp    $0x25,%eax
    1448:	0f 84 c2 00 00 00    	je     1510 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    144e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1451:	83 ec 04             	sub    $0x4,%esp
    1454:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1458:	6a 01                	push   $0x1
    145a:	50                   	push   %eax
    145b:	57                   	push   %edi
    145c:	e8 11 fe ff ff       	call   1272 <write>
    1461:	83 c4 0c             	add    $0xc,%esp
    1464:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1467:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    146a:	6a 01                	push   $0x1
    146c:	50                   	push   %eax
    146d:	57                   	push   %edi
    146e:	83 c6 01             	add    $0x1,%esi
    1471:	e8 fc fd ff ff       	call   1272 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1476:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    147a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    147d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    147f:	84 db                	test   %bl,%bl
    1481:	75 8d                	jne    1410 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1483:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1486:	5b                   	pop    %ebx
    1487:	5e                   	pop    %esi
    1488:	5f                   	pop    %edi
    1489:	5d                   	pop    %ebp
    148a:	c3                   	ret    
    148b:	90                   	nop
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1490:	83 ec 0c             	sub    $0xc,%esp
    1493:	b9 10 00 00 00       	mov    $0x10,%ecx
    1498:	6a 00                	push   $0x0
    149a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    149d:	89 f8                	mov    %edi,%eax
    149f:	8b 13                	mov    (%ebx),%edx
    14a1:	e8 6a fe ff ff       	call   1310 <printint>
        ap++;
    14a6:	89 d8                	mov    %ebx,%eax
    14a8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14ab:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    14ad:	83 c0 04             	add    $0x4,%eax
    14b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14b3:	e9 4d ff ff ff       	jmp    1405 <printf+0x55>
    14b8:	90                   	nop
    14b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    14c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14c3:	8b 18                	mov    (%eax),%ebx
        ap++;
    14c5:	83 c0 04             	add    $0x4,%eax
    14c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    14cb:	b8 04 17 00 00       	mov    $0x1704,%eax
    14d0:	85 db                	test   %ebx,%ebx
    14d2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    14d5:	0f b6 03             	movzbl (%ebx),%eax
    14d8:	84 c0                	test   %al,%al
    14da:	74 23                	je     14ff <printf+0x14f>
    14dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    14e6:	83 ec 04             	sub    $0x4,%esp
    14e9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    14eb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14ee:	50                   	push   %eax
    14ef:	57                   	push   %edi
    14f0:	e8 7d fd ff ff       	call   1272 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    14f5:	0f b6 03             	movzbl (%ebx),%eax
    14f8:	83 c4 10             	add    $0x10,%esp
    14fb:	84 c0                	test   %al,%al
    14fd:	75 e1                	jne    14e0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14ff:	31 d2                	xor    %edx,%edx
    1501:	e9 ff fe ff ff       	jmp    1405 <printf+0x55>
    1506:	8d 76 00             	lea    0x0(%esi),%esi
    1509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1510:	83 ec 04             	sub    $0x4,%esp
    1513:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1516:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1519:	6a 01                	push   $0x1
    151b:	e9 4c ff ff ff       	jmp    146c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1528:	6a 01                	push   $0x1
    152a:	e9 6b ff ff ff       	jmp    149a <printf+0xea>
    152f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1532:	83 ec 04             	sub    $0x4,%esp
    1535:	8b 03                	mov    (%ebx),%eax
    1537:	6a 01                	push   $0x1
    1539:	88 45 e4             	mov    %al,-0x1c(%ebp)
    153c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    153f:	50                   	push   %eax
    1540:	57                   	push   %edi
    1541:	e8 2c fd ff ff       	call   1272 <write>
    1546:	e9 5b ff ff ff       	jmp    14a6 <printf+0xf6>
    154b:	66 90                	xchg   %ax,%ax
    154d:	66 90                	xchg   %ax,%ax
    154f:	90                   	nop

00001550 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1550:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1551:	a1 dc 19 00 00       	mov    0x19dc,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1556:	89 e5                	mov    %esp,%ebp
    1558:	57                   	push   %edi
    1559:	56                   	push   %esi
    155a:	53                   	push   %ebx
    155b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    155e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1560:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1563:	39 c8                	cmp    %ecx,%eax
    1565:	73 19                	jae    1580 <free+0x30>
    1567:	89 f6                	mov    %esi,%esi
    1569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1570:	39 d1                	cmp    %edx,%ecx
    1572:	72 1c                	jb     1590 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1574:	39 d0                	cmp    %edx,%eax
    1576:	73 18                	jae    1590 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1578:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    157a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    157c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    157e:	72 f0                	jb     1570 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1580:	39 d0                	cmp    %edx,%eax
    1582:	72 f4                	jb     1578 <free+0x28>
    1584:	39 d1                	cmp    %edx,%ecx
    1586:	73 f0                	jae    1578 <free+0x28>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1590:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1593:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1596:	39 d7                	cmp    %edx,%edi
    1598:	74 19                	je     15b3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    159a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    159d:	8b 50 04             	mov    0x4(%eax),%edx
    15a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15a3:	39 f1                	cmp    %esi,%ecx
    15a5:	74 23                	je     15ca <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15a7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    15a9:	a3 dc 19 00 00       	mov    %eax,0x19dc
}
    15ae:	5b                   	pop    %ebx
    15af:	5e                   	pop    %esi
    15b0:	5f                   	pop    %edi
    15b1:	5d                   	pop    %ebp
    15b2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    15b3:	03 72 04             	add    0x4(%edx),%esi
    15b6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15b9:	8b 10                	mov    (%eax),%edx
    15bb:	8b 12                	mov    (%edx),%edx
    15bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15c0:	8b 50 04             	mov    0x4(%eax),%edx
    15c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15c6:	39 f1                	cmp    %esi,%ecx
    15c8:	75 dd                	jne    15a7 <free+0x57>
    p->s.size += bp->s.size;
    15ca:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    15cd:	a3 dc 19 00 00       	mov    %eax,0x19dc
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    15d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    15d5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    15d8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    15da:	5b                   	pop    %ebx
    15db:	5e                   	pop    %esi
    15dc:	5f                   	pop    %edi
    15dd:	5d                   	pop    %ebp
    15de:	c3                   	ret    
    15df:	90                   	nop

000015e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	57                   	push   %edi
    15e4:	56                   	push   %esi
    15e5:	53                   	push   %ebx
    15e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    15ec:	8b 15 dc 19 00 00    	mov    0x19dc,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15f2:	8d 78 07             	lea    0x7(%eax),%edi
    15f5:	c1 ef 03             	shr    $0x3,%edi
    15f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    15fb:	85 d2                	test   %edx,%edx
    15fd:	0f 84 a3 00 00 00    	je     16a6 <malloc+0xc6>
    1603:	8b 02                	mov    (%edx),%eax
    1605:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1608:	39 cf                	cmp    %ecx,%edi
    160a:	76 74                	jbe    1680 <malloc+0xa0>
    160c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1612:	be 00 10 00 00       	mov    $0x1000,%esi
    1617:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    161e:	0f 43 f7             	cmovae %edi,%esi
    1621:	ba 00 80 00 00       	mov    $0x8000,%edx
    1626:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    162c:	0f 46 da             	cmovbe %edx,%ebx
    162f:	eb 10                	jmp    1641 <malloc+0x61>
    1631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1638:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    163a:	8b 48 04             	mov    0x4(%eax),%ecx
    163d:	39 cf                	cmp    %ecx,%edi
    163f:	76 3f                	jbe    1680 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1641:	39 05 dc 19 00 00    	cmp    %eax,0x19dc
    1647:	89 c2                	mov    %eax,%edx
    1649:	75 ed                	jne    1638 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    164b:	83 ec 0c             	sub    $0xc,%esp
    164e:	53                   	push   %ebx
    164f:	e8 86 fc ff ff       	call   12da <sbrk>
  if(p == (char*)-1)
    1654:	83 c4 10             	add    $0x10,%esp
    1657:	83 f8 ff             	cmp    $0xffffffff,%eax
    165a:	74 1c                	je     1678 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    165c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    165f:	83 ec 0c             	sub    $0xc,%esp
    1662:	83 c0 08             	add    $0x8,%eax
    1665:	50                   	push   %eax
    1666:	e8 e5 fe ff ff       	call   1550 <free>
  return freep;
    166b:	8b 15 dc 19 00 00    	mov    0x19dc,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1671:	83 c4 10             	add    $0x10,%esp
    1674:	85 d2                	test   %edx,%edx
    1676:	75 c0                	jne    1638 <malloc+0x58>
        return 0;
    1678:	31 c0                	xor    %eax,%eax
    167a:	eb 1c                	jmp    1698 <malloc+0xb8>
    167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1680:	39 cf                	cmp    %ecx,%edi
    1682:	74 1c                	je     16a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1684:	29 f9                	sub    %edi,%ecx
    1686:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1689:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    168c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    168f:	89 15 dc 19 00 00    	mov    %edx,0x19dc
      return (void*)(p + 1);
    1695:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1698:	8d 65 f4             	lea    -0xc(%ebp),%esp
    169b:	5b                   	pop    %ebx
    169c:	5e                   	pop    %esi
    169d:	5f                   	pop    %edi
    169e:	5d                   	pop    %ebp
    169f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    16a0:	8b 08                	mov    (%eax),%ecx
    16a2:	89 0a                	mov    %ecx,(%edx)
    16a4:	eb e9                	jmp    168f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    16a6:	c7 05 dc 19 00 00 e0 	movl   $0x19e0,0x19dc
    16ad:	19 00 00 
    16b0:	c7 05 e0 19 00 00 e0 	movl   $0x19e0,0x19e0
    16b7:	19 00 00 
    base.s.size = 0;
    16ba:	b8 e0 19 00 00       	mov    $0x19e0,%eax
    16bf:	c7 05 e4 19 00 00 00 	movl   $0x0,0x19e4
    16c6:	00 00 00 
    16c9:	e9 3e ff ff ff       	jmp    160c <malloc+0x2c>
    16ce:	66 90                	xchg   %ax,%ax

000016d0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    16d0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    16d1:	b9 01 00 00 00       	mov    $0x1,%ecx
    16d6:	89 e5                	mov    %esp,%ebp
    16d8:	8b 55 08             	mov    0x8(%ebp),%edx
    16db:	90                   	nop
    16dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16e0:	89 c8                	mov    %ecx,%eax
    16e2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    16e5:	85 c0                	test   %eax,%eax
    16e7:	75 f7                	jne    16e0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    16e9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    16ee:	5d                   	pop    %ebp
    16ef:	c3                   	ret    

000016f0 <urelease>:

void urelease (struct uspinlock *lk) {
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    16f6:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    16fb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1701:	5d                   	pop    %ebp
    1702:	c3                   	ret    
