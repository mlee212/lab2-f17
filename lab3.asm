
_lab3:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
}
#pragma GCC pop_options

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  int n, m;

  if(argc != 2){
    1007:	83 39 02             	cmpl   $0x2,(%ecx)
}
#pragma GCC pop_options

int
main(int argc, char *argv[])
{
    100a:	ff 71 fc             	pushl  -0x4(%ecx)
    100d:	55                   	push   %ebp
    100e:	89 e5                	mov    %esp,%ebp
    1010:	53                   	push   %ebx
    1011:	51                   	push   %ecx
    1012:	8b 41 04             	mov    0x4(%ecx),%eax
  int n, m;

  if(argc != 2){
    1015:	74 16                	je     102d <main+0x2d>
    printf(1, "Usage: %s levels\n", argv[0]);
    1017:	83 ec 04             	sub    $0x4,%esp
    101a:	ff 30                	pushl  (%eax)
    101c:	68 94 17 00 00       	push   $0x1794
    1021:	6a 01                	push   $0x1
    1023:	e8 18 04 00 00       	call   1440 <printf>
    exit();
    1028:	e8 b5 02 00 00       	call   12e2 <exit>
  }

  n = atoi(argv[1]);
    102d:	83 ec 0c             	sub    $0xc,%esp
    1030:	ff 70 04             	pushl  0x4(%eax)
    1033:	e8 38 02 00 00       	call   1270 <atoi>
  printf(1, "Lab 3: Recursing %d levels\n", n);
    1038:	83 c4 0c             	add    $0xc,%esp
  if(argc != 2){
    printf(1, "Usage: %s levels\n", argv[0]);
    exit();
  }

  n = atoi(argv[1]);
    103b:	89 c3                	mov    %eax,%ebx
  printf(1, "Lab 3: Recursing %d levels\n", n);
    103d:	50                   	push   %eax
    103e:	68 a6 17 00 00       	push   $0x17a6
    1043:	6a 01                	push   $0x1
    1045:	e8 f6 03 00 00       	call   1440 <printf>
  m = recurse(n);
    104a:	89 1c 24             	mov    %ebx,(%esp)
    104d:	e8 15 00 00 00       	call   1067 <recurse>
  printf(1, "Lab 3: Yielded a value of %d\n", m);
    1052:	83 c4 0c             	add    $0xc,%esp
    1055:	50                   	push   %eax
    1056:	68 c2 17 00 00       	push   $0x17c2
    105b:	6a 01                	push   $0x1
    105d:	e8 de 03 00 00       	call   1440 <printf>
  exit();
    1062:	e8 7b 02 00 00       	call   12e2 <exit>

00001067 <recurse>:
// Prevent this function from being optimized, which might give it closed form
#pragma GCC push_options
#pragma GCC optimize ("O0")
static int
recurse(int n)
{
    1067:	55                   	push   %ebp
    1068:	89 e5                	mov    %esp,%ebp
    106a:	83 ec 08             	sub    $0x8,%esp
  if(n == 0)
    106d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1071:	75 07                	jne    107a <recurse+0x13>
    return 0;
    1073:	b8 00 00 00 00       	mov    $0x0,%eax
    1078:	eb 19                	jmp    1093 <recurse+0x2c>
  return n + recurse(n - 1);
    107a:	8b 45 08             	mov    0x8(%ebp),%eax
    107d:	83 e8 01             	sub    $0x1,%eax
    1080:	83 ec 0c             	sub    $0xc,%esp
    1083:	50                   	push   %eax
    1084:	e8 de ff ff ff       	call   1067 <recurse>
    1089:	83 c4 10             	add    $0x10,%esp
    108c:	89 c2                	mov    %eax,%edx
    108e:	8b 45 08             	mov    0x8(%ebp),%eax
    1091:	01 d0                	add    %edx,%eax
}
    1093:	c9                   	leave  
    1094:	c3                   	ret    
    1095:	66 90                	xchg   %ax,%ax
    1097:	66 90                	xchg   %ax,%ax
    1099:	66 90                	xchg   %ax,%ax
    109b:	66 90                	xchg   %ax,%ax
    109d:	66 90                	xchg   %ax,%ax
    109f:	90                   	nop

000010a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	8b 45 08             	mov    0x8(%ebp),%eax
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10aa:	89 c2                	mov    %eax,%edx
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10b0:	83 c1 01             	add    $0x1,%ecx
    10b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10b7:	83 c2 01             	add    $0x1,%edx
    10ba:	84 db                	test   %bl,%bl
    10bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    10bf:	75 ef                	jne    10b0 <strcpy+0x10>
    ;
  return os;
}
    10c1:	5b                   	pop    %ebx
    10c2:	5d                   	pop    %ebp
    10c3:	c3                   	ret    
    10c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	56                   	push   %esi
    10d4:	53                   	push   %ebx
    10d5:	8b 55 08             	mov    0x8(%ebp),%edx
    10d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10db:	0f b6 02             	movzbl (%edx),%eax
    10de:	0f b6 19             	movzbl (%ecx),%ebx
    10e1:	84 c0                	test   %al,%al
    10e3:	75 1e                	jne    1103 <strcmp+0x33>
    10e5:	eb 29                	jmp    1110 <strcmp+0x40>
    10e7:	89 f6                	mov    %esi,%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10f0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10f6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10fd:	84 c0                	test   %al,%al
    10ff:	74 0f                	je     1110 <strcmp+0x40>
    1101:	89 f1                	mov    %esi,%ecx
    1103:	38 d8                	cmp    %bl,%al
    1105:	74 e9                	je     10f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1107:	29 d8                	sub    %ebx,%eax
}
    1109:	5b                   	pop    %ebx
    110a:	5e                   	pop    %esi
    110b:	5d                   	pop    %ebp
    110c:	c3                   	ret    
    110d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1110:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1112:	29 d8                	sub    %ebx,%eax
}
    1114:	5b                   	pop    %ebx
    1115:	5e                   	pop    %esi
    1116:	5d                   	pop    %ebp
    1117:	c3                   	ret    
    1118:	90                   	nop
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001120 <strlen>:

uint
strlen(char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1126:	80 39 00             	cmpb   $0x0,(%ecx)
    1129:	74 12                	je     113d <strlen+0x1d>
    112b:	31 d2                	xor    %edx,%edx
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	83 c2 01             	add    $0x1,%edx
    1133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1137:	89 d0                	mov    %edx,%eax
    1139:	75 f5                	jne    1130 <strlen+0x10>
    ;
  return n;
}
    113b:	5d                   	pop    %ebp
    113c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    113d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    113f:	5d                   	pop    %ebp
    1140:	c3                   	ret    
    1141:	eb 0d                	jmp    1150 <memset>
    1143:	90                   	nop
    1144:	90                   	nop
    1145:	90                   	nop
    1146:	90                   	nop
    1147:	90                   	nop
    1148:	90                   	nop
    1149:	90                   	nop
    114a:	90                   	nop
    114b:	90                   	nop
    114c:	90                   	nop
    114d:	90                   	nop
    114e:	90                   	nop
    114f:	90                   	nop

00001150 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    115a:	8b 45 0c             	mov    0xc(%ebp),%eax
    115d:	89 d7                	mov    %edx,%edi
    115f:	fc                   	cld    
    1160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1162:	89 d0                	mov    %edx,%eax
    1164:	5f                   	pop    %edi
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <strchr>:

char*
strchr(const char *s, char c)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 45 08             	mov    0x8(%ebp),%eax
    1177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    117a:	0f b6 10             	movzbl (%eax),%edx
    117d:	84 d2                	test   %dl,%dl
    117f:	74 1d                	je     119e <strchr+0x2e>
    if(*s == c)
    1181:	38 d3                	cmp    %dl,%bl
    1183:	89 d9                	mov    %ebx,%ecx
    1185:	75 0d                	jne    1194 <strchr+0x24>
    1187:	eb 17                	jmp    11a0 <strchr+0x30>
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1190:	38 ca                	cmp    %cl,%dl
    1192:	74 0c                	je     11a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1194:	83 c0 01             	add    $0x1,%eax
    1197:	0f b6 10             	movzbl (%eax),%edx
    119a:	84 d2                	test   %dl,%dl
    119c:	75 f2                	jne    1190 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    119e:	31 c0                	xor    %eax,%eax
}
    11a0:	5b                   	pop    %ebx
    11a1:	5d                   	pop    %ebp
    11a2:	c3                   	ret    
    11a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011b0 <gets>:

char*
gets(char *buf, int max)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11b6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    11b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    11bb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11be:	eb 29                	jmp    11e9 <gets+0x39>
    cc = read(0, &c, 1);
    11c0:	83 ec 04             	sub    $0x4,%esp
    11c3:	6a 01                	push   $0x1
    11c5:	57                   	push   %edi
    11c6:	6a 00                	push   $0x0
    11c8:	e8 2d 01 00 00       	call   12fa <read>
    if(cc < 1)
    11cd:	83 c4 10             	add    $0x10,%esp
    11d0:	85 c0                	test   %eax,%eax
    11d2:	7e 1d                	jle    11f1 <gets+0x41>
      break;
    buf[i++] = c;
    11d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11d8:	8b 55 08             	mov    0x8(%ebp),%edx
    11db:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    11dd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    11df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11e3:	74 1b                	je     1200 <gets+0x50>
    11e5:	3c 0d                	cmp    $0xd,%al
    11e7:	74 17                	je     1200 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11e9:	8d 5e 01             	lea    0x1(%esi),%ebx
    11ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11ef:	7c cf                	jl     11c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11f1:	8b 45 08             	mov    0x8(%ebp),%eax
    11f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fb:	5b                   	pop    %ebx
    11fc:	5e                   	pop    %esi
    11fd:	5f                   	pop    %edi
    11fe:	5d                   	pop    %ebp
    11ff:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1200:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1203:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1205:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1209:	8d 65 f4             	lea    -0xc(%ebp),%esp
    120c:	5b                   	pop    %ebx
    120d:	5e                   	pop    %esi
    120e:	5f                   	pop    %edi
    120f:	5d                   	pop    %ebp
    1210:	c3                   	ret    
    1211:	eb 0d                	jmp    1220 <stat>
    1213:	90                   	nop
    1214:	90                   	nop
    1215:	90                   	nop
    1216:	90                   	nop
    1217:	90                   	nop
    1218:	90                   	nop
    1219:	90                   	nop
    121a:	90                   	nop
    121b:	90                   	nop
    121c:	90                   	nop
    121d:	90                   	nop
    121e:	90                   	nop
    121f:	90                   	nop

00001220 <stat>:

int
stat(char *n, struct stat *st)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	56                   	push   %esi
    1224:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1225:	83 ec 08             	sub    $0x8,%esp
    1228:	6a 00                	push   $0x0
    122a:	ff 75 08             	pushl  0x8(%ebp)
    122d:	e8 f0 00 00 00       	call   1322 <open>
  if(fd < 0)
    1232:	83 c4 10             	add    $0x10,%esp
    1235:	85 c0                	test   %eax,%eax
    1237:	78 27                	js     1260 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1239:	83 ec 08             	sub    $0x8,%esp
    123c:	ff 75 0c             	pushl  0xc(%ebp)
    123f:	89 c3                	mov    %eax,%ebx
    1241:	50                   	push   %eax
    1242:	e8 f3 00 00 00       	call   133a <fstat>
    1247:	89 c6                	mov    %eax,%esi
  close(fd);
    1249:	89 1c 24             	mov    %ebx,(%esp)
    124c:	e8 b9 00 00 00       	call   130a <close>
  return r;
    1251:	83 c4 10             	add    $0x10,%esp
    1254:	89 f0                	mov    %esi,%eax
}
    1256:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1259:	5b                   	pop    %ebx
    125a:	5e                   	pop    %esi
    125b:	5d                   	pop    %ebp
    125c:	c3                   	ret    
    125d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1265:	eb ef                	jmp    1256 <stat+0x36>
    1267:	89 f6                	mov    %esi,%esi
    1269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001270 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	53                   	push   %ebx
    1274:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1277:	0f be 11             	movsbl (%ecx),%edx
    127a:	8d 42 d0             	lea    -0x30(%edx),%eax
    127d:	3c 09                	cmp    $0x9,%al
    127f:	b8 00 00 00 00       	mov    $0x0,%eax
    1284:	77 1f                	ja     12a5 <atoi+0x35>
    1286:	8d 76 00             	lea    0x0(%esi),%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1290:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1293:	83 c1 01             	add    $0x1,%ecx
    1296:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    129a:	0f be 11             	movsbl (%ecx),%edx
    129d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12a0:	80 fb 09             	cmp    $0x9,%bl
    12a3:	76 eb                	jbe    1290 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    12a5:	5b                   	pop    %ebx
    12a6:	5d                   	pop    %ebp
    12a7:	c3                   	ret    
    12a8:	90                   	nop
    12a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	56                   	push   %esi
    12b4:	53                   	push   %ebx
    12b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12b8:	8b 45 08             	mov    0x8(%ebp),%eax
    12bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12be:	85 db                	test   %ebx,%ebx
    12c0:	7e 14                	jle    12d6 <memmove+0x26>
    12c2:	31 d2                	xor    %edx,%edx
    12c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12cf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12d2:	39 da                	cmp    %ebx,%edx
    12d4:	75 f2                	jne    12c8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    12d6:	5b                   	pop    %ebx
    12d7:	5e                   	pop    %esi
    12d8:	5d                   	pop    %ebp
    12d9:	c3                   	ret    

000012da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12da:	b8 01 00 00 00       	mov    $0x1,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <exit>:
SYSCALL(exit)
    12e2:	b8 02 00 00 00       	mov    $0x2,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <wait>:
SYSCALL(wait)
    12ea:	b8 03 00 00 00       	mov    $0x3,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <pipe>:
SYSCALL(pipe)
    12f2:	b8 04 00 00 00       	mov    $0x4,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <read>:
SYSCALL(read)
    12fa:	b8 05 00 00 00       	mov    $0x5,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <write>:
SYSCALL(write)
    1302:	b8 10 00 00 00       	mov    $0x10,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <close>:
SYSCALL(close)
    130a:	b8 15 00 00 00       	mov    $0x15,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <kill>:
SYSCALL(kill)
    1312:	b8 06 00 00 00       	mov    $0x6,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <exec>:
SYSCALL(exec)
    131a:	b8 07 00 00 00       	mov    $0x7,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <open>:
SYSCALL(open)
    1322:	b8 0f 00 00 00       	mov    $0xf,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <mknod>:
SYSCALL(mknod)
    132a:	b8 11 00 00 00       	mov    $0x11,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <unlink>:
SYSCALL(unlink)
    1332:	b8 12 00 00 00       	mov    $0x12,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <fstat>:
SYSCALL(fstat)
    133a:	b8 08 00 00 00       	mov    $0x8,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <link>:
SYSCALL(link)
    1342:	b8 13 00 00 00       	mov    $0x13,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <mkdir>:
SYSCALL(mkdir)
    134a:	b8 14 00 00 00       	mov    $0x14,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <chdir>:
SYSCALL(chdir)
    1352:	b8 09 00 00 00       	mov    $0x9,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <dup>:
SYSCALL(dup)
    135a:	b8 0a 00 00 00       	mov    $0xa,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <getpid>:
SYSCALL(getpid)
    1362:	b8 0b 00 00 00       	mov    $0xb,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <sbrk>:
SYSCALL(sbrk)
    136a:	b8 0c 00 00 00       	mov    $0xc,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <sleep>:
SYSCALL(sleep)
    1372:	b8 0d 00 00 00       	mov    $0xd,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <uptime>:
SYSCALL(uptime)
    137a:	b8 0e 00 00 00       	mov    $0xe,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <shm_open>:
SYSCALL(shm_open)
    1382:	b8 16 00 00 00       	mov    $0x16,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <shm_close>:
SYSCALL(shm_close)	
    138a:	b8 17 00 00 00       	mov    $0x17,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    
    1392:	66 90                	xchg   %ax,%ax
    1394:	66 90                	xchg   %ax,%ax
    1396:	66 90                	xchg   %ax,%ax
    1398:	66 90                	xchg   %ax,%ax
    139a:	66 90                	xchg   %ax,%ax
    139c:	66 90                	xchg   %ax,%ax
    139e:	66 90                	xchg   %ax,%ax

000013a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	56                   	push   %esi
    13a5:	53                   	push   %ebx
    13a6:	89 c6                	mov    %eax,%esi
    13a8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13ae:	85 db                	test   %ebx,%ebx
    13b0:	74 7e                	je     1430 <printint+0x90>
    13b2:	89 d0                	mov    %edx,%eax
    13b4:	c1 e8 1f             	shr    $0x1f,%eax
    13b7:	84 c0                	test   %al,%al
    13b9:	74 75                	je     1430 <printint+0x90>
    neg = 1;
    x = -xx;
    13bb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    13bd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    13c4:	f7 d8                	neg    %eax
    13c6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13c9:	31 ff                	xor    %edi,%edi
    13cb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13ce:	89 ce                	mov    %ecx,%esi
    13d0:	eb 08                	jmp    13da <printint+0x3a>
    13d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13d8:	89 cf                	mov    %ecx,%edi
    13da:	31 d2                	xor    %edx,%edx
    13dc:	8d 4f 01             	lea    0x1(%edi),%ecx
    13df:	f7 f6                	div    %esi
    13e1:	0f b6 92 e8 17 00 00 	movzbl 0x17e8(%edx),%edx
  }while((x /= base) != 0);
    13e8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    13ea:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    13ed:	75 e9                	jne    13d8 <printint+0x38>
  if(neg)
    13ef:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13f2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    13f5:	85 c0                	test   %eax,%eax
    13f7:	74 08                	je     1401 <printint+0x61>
    buf[i++] = '-';
    13f9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    13fe:	8d 4f 02             	lea    0x2(%edi),%ecx
    1401:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1405:	8d 76 00             	lea    0x0(%esi),%esi
    1408:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    140b:	83 ec 04             	sub    $0x4,%esp
    140e:	83 ef 01             	sub    $0x1,%edi
    1411:	6a 01                	push   $0x1
    1413:	53                   	push   %ebx
    1414:	56                   	push   %esi
    1415:	88 45 d7             	mov    %al,-0x29(%ebp)
    1418:	e8 e5 fe ff ff       	call   1302 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    141d:	83 c4 10             	add    $0x10,%esp
    1420:	39 df                	cmp    %ebx,%edi
    1422:	75 e4                	jne    1408 <printint+0x68>
    putc(fd, buf[i]);
}
    1424:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1427:	5b                   	pop    %ebx
    1428:	5e                   	pop    %esi
    1429:	5f                   	pop    %edi
    142a:	5d                   	pop    %ebp
    142b:	c3                   	ret    
    142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1430:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1432:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1439:	eb 8b                	jmp    13c6 <printint+0x26>
    143b:	90                   	nop
    143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001440 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1446:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1449:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    144c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    144f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1452:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1455:	0f b6 1e             	movzbl (%esi),%ebx
    1458:	83 c6 01             	add    $0x1,%esi
    145b:	84 db                	test   %bl,%bl
    145d:	0f 84 b0 00 00 00    	je     1513 <printf+0xd3>
    1463:	31 d2                	xor    %edx,%edx
    1465:	eb 39                	jmp    14a0 <printf+0x60>
    1467:	89 f6                	mov    %esi,%esi
    1469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1470:	83 f8 25             	cmp    $0x25,%eax
    1473:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1476:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    147b:	74 18                	je     1495 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    147d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1480:	83 ec 04             	sub    $0x4,%esp
    1483:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1486:	6a 01                	push   $0x1
    1488:	50                   	push   %eax
    1489:	57                   	push   %edi
    148a:	e8 73 fe ff ff       	call   1302 <write>
    148f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1492:	83 c4 10             	add    $0x10,%esp
    1495:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1498:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    149c:	84 db                	test   %bl,%bl
    149e:	74 73                	je     1513 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    14a0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    14a2:	0f be cb             	movsbl %bl,%ecx
    14a5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14a8:	74 c6                	je     1470 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14aa:	83 fa 25             	cmp    $0x25,%edx
    14ad:	75 e6                	jne    1495 <printf+0x55>
      if(c == 'd'){
    14af:	83 f8 64             	cmp    $0x64,%eax
    14b2:	0f 84 f8 00 00 00    	je     15b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14b8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14be:	83 f9 70             	cmp    $0x70,%ecx
    14c1:	74 5d                	je     1520 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14c3:	83 f8 73             	cmp    $0x73,%eax
    14c6:	0f 84 84 00 00 00    	je     1550 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14cc:	83 f8 63             	cmp    $0x63,%eax
    14cf:	0f 84 ea 00 00 00    	je     15bf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14d5:	83 f8 25             	cmp    $0x25,%eax
    14d8:	0f 84 c2 00 00 00    	je     15a0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14de:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14e1:	83 ec 04             	sub    $0x4,%esp
    14e4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14e8:	6a 01                	push   $0x1
    14ea:	50                   	push   %eax
    14eb:	57                   	push   %edi
    14ec:	e8 11 fe ff ff       	call   1302 <write>
    14f1:	83 c4 0c             	add    $0xc,%esp
    14f4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14f7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14fa:	6a 01                	push   $0x1
    14fc:	50                   	push   %eax
    14fd:	57                   	push   %edi
    14fe:	83 c6 01             	add    $0x1,%esi
    1501:	e8 fc fd ff ff       	call   1302 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1506:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    150a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    150d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    150f:	84 db                	test   %bl,%bl
    1511:	75 8d                	jne    14a0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1513:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1516:	5b                   	pop    %ebx
    1517:	5e                   	pop    %esi
    1518:	5f                   	pop    %edi
    1519:	5d                   	pop    %ebp
    151a:	c3                   	ret    
    151b:	90                   	nop
    151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	b9 10 00 00 00       	mov    $0x10,%ecx
    1528:	6a 00                	push   $0x0
    152a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    152d:	89 f8                	mov    %edi,%eax
    152f:	8b 13                	mov    (%ebx),%edx
    1531:	e8 6a fe ff ff       	call   13a0 <printint>
        ap++;
    1536:	89 d8                	mov    %ebx,%eax
    1538:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    153b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    153d:	83 c0 04             	add    $0x4,%eax
    1540:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1543:	e9 4d ff ff ff       	jmp    1495 <printf+0x55>
    1548:	90                   	nop
    1549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1550:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1553:	8b 18                	mov    (%eax),%ebx
        ap++;
    1555:	83 c0 04             	add    $0x4,%eax
    1558:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    155b:	b8 e0 17 00 00       	mov    $0x17e0,%eax
    1560:	85 db                	test   %ebx,%ebx
    1562:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1565:	0f b6 03             	movzbl (%ebx),%eax
    1568:	84 c0                	test   %al,%al
    156a:	74 23                	je     158f <printf+0x14f>
    156c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1570:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1573:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1576:	83 ec 04             	sub    $0x4,%esp
    1579:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    157b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    157e:	50                   	push   %eax
    157f:	57                   	push   %edi
    1580:	e8 7d fd ff ff       	call   1302 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1585:	0f b6 03             	movzbl (%ebx),%eax
    1588:	83 c4 10             	add    $0x10,%esp
    158b:	84 c0                	test   %al,%al
    158d:	75 e1                	jne    1570 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    158f:	31 d2                	xor    %edx,%edx
    1591:	e9 ff fe ff ff       	jmp    1495 <printf+0x55>
    1596:	8d 76 00             	lea    0x0(%esi),%esi
    1599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15a0:	83 ec 04             	sub    $0x4,%esp
    15a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    15a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    15a9:	6a 01                	push   $0x1
    15ab:	e9 4c ff ff ff       	jmp    14fc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15b8:	6a 01                	push   $0x1
    15ba:	e9 6b ff ff ff       	jmp    152a <printf+0xea>
    15bf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15c2:	83 ec 04             	sub    $0x4,%esp
    15c5:	8b 03                	mov    (%ebx),%eax
    15c7:	6a 01                	push   $0x1
    15c9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    15cc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15cf:	50                   	push   %eax
    15d0:	57                   	push   %edi
    15d1:	e8 2c fd ff ff       	call   1302 <write>
    15d6:	e9 5b ff ff ff       	jmp    1536 <printf+0xf6>
    15db:	66 90                	xchg   %ax,%ax
    15dd:	66 90                	xchg   %ax,%ax
    15df:	90                   	nop

000015e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e1:	a1 e4 1a 00 00       	mov    0x1ae4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    15e6:	89 e5                	mov    %esp,%ebp
    15e8:	57                   	push   %edi
    15e9:	56                   	push   %esi
    15ea:	53                   	push   %ebx
    15eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15ee:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15f0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f3:	39 c8                	cmp    %ecx,%eax
    15f5:	73 19                	jae    1610 <free+0x30>
    15f7:	89 f6                	mov    %esi,%esi
    15f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1600:	39 d1                	cmp    %edx,%ecx
    1602:	72 1c                	jb     1620 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1604:	39 d0                	cmp    %edx,%eax
    1606:	73 18                	jae    1620 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1608:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    160a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    160c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    160e:	72 f0                	jb     1600 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1610:	39 d0                	cmp    %edx,%eax
    1612:	72 f4                	jb     1608 <free+0x28>
    1614:	39 d1                	cmp    %edx,%ecx
    1616:	73 f0                	jae    1608 <free+0x28>
    1618:	90                   	nop
    1619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1620:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1623:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1626:	39 d7                	cmp    %edx,%edi
    1628:	74 19                	je     1643 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    162a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    162d:	8b 50 04             	mov    0x4(%eax),%edx
    1630:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1633:	39 f1                	cmp    %esi,%ecx
    1635:	74 23                	je     165a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1637:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1639:	a3 e4 1a 00 00       	mov    %eax,0x1ae4
}
    163e:	5b                   	pop    %ebx
    163f:	5e                   	pop    %esi
    1640:	5f                   	pop    %edi
    1641:	5d                   	pop    %ebp
    1642:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1643:	03 72 04             	add    0x4(%edx),%esi
    1646:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1649:	8b 10                	mov    (%eax),%edx
    164b:	8b 12                	mov    (%edx),%edx
    164d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1650:	8b 50 04             	mov    0x4(%eax),%edx
    1653:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1656:	39 f1                	cmp    %esi,%ecx
    1658:	75 dd                	jne    1637 <free+0x57>
    p->s.size += bp->s.size;
    165a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    165d:	a3 e4 1a 00 00       	mov    %eax,0x1ae4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1662:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1665:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1668:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    166a:	5b                   	pop    %ebx
    166b:	5e                   	pop    %esi
    166c:	5f                   	pop    %edi
    166d:	5d                   	pop    %ebp
    166e:	c3                   	ret    
    166f:	90                   	nop

00001670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	57                   	push   %edi
    1674:	56                   	push   %esi
    1675:	53                   	push   %ebx
    1676:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1679:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    167c:	8b 15 e4 1a 00 00    	mov    0x1ae4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1682:	8d 78 07             	lea    0x7(%eax),%edi
    1685:	c1 ef 03             	shr    $0x3,%edi
    1688:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    168b:	85 d2                	test   %edx,%edx
    168d:	0f 84 a3 00 00 00    	je     1736 <malloc+0xc6>
    1693:	8b 02                	mov    (%edx),%eax
    1695:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1698:	39 cf                	cmp    %ecx,%edi
    169a:	76 74                	jbe    1710 <malloc+0xa0>
    169c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16a2:	be 00 10 00 00       	mov    $0x1000,%esi
    16a7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    16ae:	0f 43 f7             	cmovae %edi,%esi
    16b1:	ba 00 80 00 00       	mov    $0x8000,%edx
    16b6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    16bc:	0f 46 da             	cmovbe %edx,%ebx
    16bf:	eb 10                	jmp    16d1 <malloc+0x61>
    16c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ca:	8b 48 04             	mov    0x4(%eax),%ecx
    16cd:	39 cf                	cmp    %ecx,%edi
    16cf:	76 3f                	jbe    1710 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16d1:	39 05 e4 1a 00 00    	cmp    %eax,0x1ae4
    16d7:	89 c2                	mov    %eax,%edx
    16d9:	75 ed                	jne    16c8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    16db:	83 ec 0c             	sub    $0xc,%esp
    16de:	53                   	push   %ebx
    16df:	e8 86 fc ff ff       	call   136a <sbrk>
  if(p == (char*)-1)
    16e4:	83 c4 10             	add    $0x10,%esp
    16e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    16ea:	74 1c                	je     1708 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    16ec:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    16ef:	83 ec 0c             	sub    $0xc,%esp
    16f2:	83 c0 08             	add    $0x8,%eax
    16f5:	50                   	push   %eax
    16f6:	e8 e5 fe ff ff       	call   15e0 <free>
  return freep;
    16fb:	8b 15 e4 1a 00 00    	mov    0x1ae4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1701:	83 c4 10             	add    $0x10,%esp
    1704:	85 d2                	test   %edx,%edx
    1706:	75 c0                	jne    16c8 <malloc+0x58>
        return 0;
    1708:	31 c0                	xor    %eax,%eax
    170a:	eb 1c                	jmp    1728 <malloc+0xb8>
    170c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1710:	39 cf                	cmp    %ecx,%edi
    1712:	74 1c                	je     1730 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1714:	29 f9                	sub    %edi,%ecx
    1716:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1719:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    171c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    171f:	89 15 e4 1a 00 00    	mov    %edx,0x1ae4
      return (void*)(p + 1);
    1725:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1728:	8d 65 f4             	lea    -0xc(%ebp),%esp
    172b:	5b                   	pop    %ebx
    172c:	5e                   	pop    %esi
    172d:	5f                   	pop    %edi
    172e:	5d                   	pop    %ebp
    172f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1730:	8b 08                	mov    (%eax),%ecx
    1732:	89 0a                	mov    %ecx,(%edx)
    1734:	eb e9                	jmp    171f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1736:	c7 05 e4 1a 00 00 e8 	movl   $0x1ae8,0x1ae4
    173d:	1a 00 00 
    1740:	c7 05 e8 1a 00 00 e8 	movl   $0x1ae8,0x1ae8
    1747:	1a 00 00 
    base.s.size = 0;
    174a:	b8 e8 1a 00 00       	mov    $0x1ae8,%eax
    174f:	c7 05 ec 1a 00 00 00 	movl   $0x0,0x1aec
    1756:	00 00 00 
    1759:	e9 3e ff ff ff       	jmp    169c <malloc+0x2c>
    175e:	66 90                	xchg   %ax,%ax

00001760 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1760:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1761:	b9 01 00 00 00       	mov    $0x1,%ecx
    1766:	89 e5                	mov    %esp,%ebp
    1768:	8b 55 08             	mov    0x8(%ebp),%edx
    176b:	90                   	nop
    176c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1770:	89 c8                	mov    %ecx,%eax
    1772:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1775:	85 c0                	test   %eax,%eax
    1777:	75 f7                	jne    1770 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1779:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    177e:	5d                   	pop    %ebp
    177f:	c3                   	ret    

00001780 <urelease>:

void urelease (struct uspinlock *lk) {
    1780:	55                   	push   %ebp
    1781:	89 e5                	mov    %esp,%ebp
    1783:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1786:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    178b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1791:	5d                   	pop    %ebp
    1792:	c3                   	ret    
