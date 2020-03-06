
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	be 01 00 00 00       	mov    $0x1,%esi
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1021:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
    1024:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
    1027:	7e 54                	jle    107d <main+0x7d>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 56 03 00 00       	call   1392 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 1e 03 00 00       	call   137a <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
    1064:	e8 e9 02 00 00       	call   1352 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	pushl  (%ebx)
    106c:	68 27 18 00 00       	push   $0x1827
    1071:	6a 01                	push   $0x1
    1073:	e8 38 04 00 00       	call   14b0 <printf>
      exit();
    1078:	e8 d5 02 00 00       	call   1352 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 c6 02 00 00       	call   1352 <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:

char buf[512];

void
cat(int fd)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    1098:	eb 1d                	jmp    10b7 <cat+0x27>
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 80 1b 00 00       	push   $0x1b80
    10a9:	6a 01                	push   $0x1
    10ab:	e8 c2 02 00 00       	call   1372 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 c3                	cmp    %eax,%ebx
    10b5:	75 26                	jne    10dd <cat+0x4d>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 80 1b 00 00       	push   $0x1b80
    10c4:	56                   	push   %esi
    10c5:	e8 a0 02 00 00       	call   136a <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	83 f8 00             	cmp    $0x0,%eax
    10d0:	89 c3                	mov    %eax,%ebx
    10d2:	7f cc                	jg     10a0 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit();
    }
  }
  if(n < 0){
    10d4:	75 1b                	jne    10f1 <cat+0x61>
    printf(1, "cat: read error\n");
    exit();
  }
}
    10d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d9:	5b                   	pop    %ebx
    10da:	5e                   	pop    %esi
    10db:	5d                   	pop    %ebp
    10dc:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
    10dd:	83 ec 08             	sub    $0x8,%esp
    10e0:	68 04 18 00 00       	push   $0x1804
    10e5:	6a 01                	push   $0x1
    10e7:	e8 c4 03 00 00       	call   14b0 <printf>
      exit();
    10ec:	e8 61 02 00 00       	call   1352 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
    10f1:	83 ec 08             	sub    $0x8,%esp
    10f4:	68 16 18 00 00       	push   $0x1816
    10f9:	6a 01                	push   $0x1
    10fb:	e8 b0 03 00 00       	call   14b0 <printf>
    exit();
    1100:	e8 4d 02 00 00       	call   1352 <exit>
    1105:	66 90                	xchg   %ax,%ax
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	53                   	push   %ebx
    1114:	8b 45 08             	mov    0x8(%ebp),%eax
    1117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    111a:	89 c2                	mov    %eax,%edx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	83 c1 01             	add    $0x1,%ecx
    1123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1127:	83 c2 01             	add    $0x1,%edx
    112a:	84 db                	test   %bl,%bl
    112c:	88 5a ff             	mov    %bl,-0x1(%edx)
    112f:	75 ef                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    1131:	5b                   	pop    %ebx
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    113a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	56                   	push   %esi
    1144:	53                   	push   %ebx
    1145:	8b 55 08             	mov    0x8(%ebp),%edx
    1148:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114b:	0f b6 02             	movzbl (%edx),%eax
    114e:	0f b6 19             	movzbl (%ecx),%ebx
    1151:	84 c0                	test   %al,%al
    1153:	75 1e                	jne    1173 <strcmp+0x33>
    1155:	eb 29                	jmp    1180 <strcmp+0x40>
    1157:	89 f6                	mov    %esi,%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1160:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1166:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1169:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    116d:	84 c0                	test   %al,%al
    116f:	74 0f                	je     1180 <strcmp+0x40>
    1171:	89 f1                	mov    %esi,%ecx
    1173:	38 d8                	cmp    %bl,%al
    1175:	74 e9                	je     1160 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1177:	29 d8                	sub    %ebx,%eax
}
    1179:	5b                   	pop    %ebx
    117a:	5e                   	pop    %esi
    117b:	5d                   	pop    %ebp
    117c:	c3                   	ret    
    117d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1180:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1182:	29 d8                	sub    %ebx,%eax
}
    1184:	5b                   	pop    %ebx
    1185:	5e                   	pop    %esi
    1186:	5d                   	pop    %ebp
    1187:	c3                   	ret    
    1188:	90                   	nop
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001190 <strlen>:

uint
strlen(char *s)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1196:	80 39 00             	cmpb   $0x0,(%ecx)
    1199:	74 12                	je     11ad <strlen+0x1d>
    119b:	31 d2                	xor    %edx,%edx
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    11a0:	83 c2 01             	add    $0x1,%edx
    11a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	75 f5                	jne    11a0 <strlen+0x10>
    ;
  return n;
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    11ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	eb 0d                	jmp    11c0 <memset>
    11b3:	90                   	nop
    11b4:	90                   	nop
    11b5:	90                   	nop
    11b6:	90                   	nop
    11b7:	90                   	nop
    11b8:	90                   	nop
    11b9:	90                   	nop
    11ba:	90                   	nop
    11bb:	90                   	nop
    11bc:	90                   	nop
    11bd:	90                   	nop
    11be:	90                   	nop
    11bf:	90                   	nop

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	57                   	push   %edi
    11c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 d7                	mov    %edx,%edi
    11cf:	fc                   	cld    
    11d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d2:	89 d0                	mov    %edx,%eax
    11d4:	5f                   	pop    %edi
    11d5:	5d                   	pop    %ebp
    11d6:	c3                   	ret    
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	8b 45 08             	mov    0x8(%ebp),%eax
    11e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ea:	0f b6 10             	movzbl (%eax),%edx
    11ed:	84 d2                	test   %dl,%dl
    11ef:	74 1d                	je     120e <strchr+0x2e>
    if(*s == c)
    11f1:	38 d3                	cmp    %dl,%bl
    11f3:	89 d9                	mov    %ebx,%ecx
    11f5:	75 0d                	jne    1204 <strchr+0x24>
    11f7:	eb 17                	jmp    1210 <strchr+0x30>
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	38 ca                	cmp    %cl,%dl
    1202:	74 0c                	je     1210 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	0f b6 10             	movzbl (%eax),%edx
    120a:	84 d2                	test   %dl,%dl
    120c:	75 f2                	jne    1200 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    120e:	31 c0                	xor    %eax,%eax
}
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
    1225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1226:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1228:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    122b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    122e:	eb 29                	jmp    1259 <gets+0x39>
    cc = read(0, &c, 1);
    1230:	83 ec 04             	sub    $0x4,%esp
    1233:	6a 01                	push   $0x1
    1235:	57                   	push   %edi
    1236:	6a 00                	push   $0x0
    1238:	e8 2d 01 00 00       	call   136a <read>
    if(cc < 1)
    123d:	83 c4 10             	add    $0x10,%esp
    1240:	85 c0                	test   %eax,%eax
    1242:	7e 1d                	jle    1261 <gets+0x41>
      break;
    buf[i++] = c;
    1244:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1248:	8b 55 08             	mov    0x8(%ebp),%edx
    124b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    124d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    124f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1253:	74 1b                	je     1270 <gets+0x50>
    1255:	3c 0d                	cmp    $0xd,%al
    1257:	74 17                	je     1270 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1259:	8d 5e 01             	lea    0x1(%esi),%ebx
    125c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    125f:	7c cf                	jl     1230 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1261:	8b 45 08             	mov    0x8(%ebp),%eax
    1264:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1268:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126b:	5b                   	pop    %ebx
    126c:	5e                   	pop    %esi
    126d:	5f                   	pop    %edi
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1270:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1273:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1275:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1279:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127c:	5b                   	pop    %ebx
    127d:	5e                   	pop    %esi
    127e:	5f                   	pop    %edi
    127f:	5d                   	pop    %ebp
    1280:	c3                   	ret    
    1281:	eb 0d                	jmp    1290 <stat>
    1283:	90                   	nop
    1284:	90                   	nop
    1285:	90                   	nop
    1286:	90                   	nop
    1287:	90                   	nop
    1288:	90                   	nop
    1289:	90                   	nop
    128a:	90                   	nop
    128b:	90                   	nop
    128c:	90                   	nop
    128d:	90                   	nop
    128e:	90                   	nop
    128f:	90                   	nop

00001290 <stat>:

int
stat(char *n, struct stat *st)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	56                   	push   %esi
    1294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1295:	83 ec 08             	sub    $0x8,%esp
    1298:	6a 00                	push   $0x0
    129a:	ff 75 08             	pushl  0x8(%ebp)
    129d:	e8 f0 00 00 00       	call   1392 <open>
  if(fd < 0)
    12a2:	83 c4 10             	add    $0x10,%esp
    12a5:	85 c0                	test   %eax,%eax
    12a7:	78 27                	js     12d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12a9:	83 ec 08             	sub    $0x8,%esp
    12ac:	ff 75 0c             	pushl  0xc(%ebp)
    12af:	89 c3                	mov    %eax,%ebx
    12b1:	50                   	push   %eax
    12b2:	e8 f3 00 00 00       	call   13aa <fstat>
    12b7:	89 c6                	mov    %eax,%esi
  close(fd);
    12b9:	89 1c 24             	mov    %ebx,(%esp)
    12bc:	e8 b9 00 00 00       	call   137a <close>
  return r;
    12c1:	83 c4 10             	add    $0x10,%esp
    12c4:	89 f0                	mov    %esi,%eax
}
    12c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12c9:	5b                   	pop    %ebx
    12ca:	5e                   	pop    %esi
    12cb:	5d                   	pop    %ebp
    12cc:	c3                   	ret    
    12cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    12d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12d5:	eb ef                	jmp    12c6 <stat+0x36>
    12d7:	89 f6                	mov    %esi,%esi
    12d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	53                   	push   %ebx
    12e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12e7:	0f be 11             	movsbl (%ecx),%edx
    12ea:	8d 42 d0             	lea    -0x30(%edx),%eax
    12ed:	3c 09                	cmp    $0x9,%al
    12ef:	b8 00 00 00 00       	mov    $0x0,%eax
    12f4:	77 1f                	ja     1315 <atoi+0x35>
    12f6:	8d 76 00             	lea    0x0(%esi),%esi
    12f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1300:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1303:	83 c1 01             	add    $0x1,%ecx
    1306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    130a:	0f be 11             	movsbl (%ecx),%edx
    130d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1310:	80 fb 09             	cmp    $0x9,%bl
    1313:	76 eb                	jbe    1300 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1315:	5b                   	pop    %ebx
    1316:	5d                   	pop    %ebp
    1317:	c3                   	ret    
    1318:	90                   	nop
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001320 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	56                   	push   %esi
    1324:	53                   	push   %ebx
    1325:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1328:	8b 45 08             	mov    0x8(%ebp),%eax
    132b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    132e:	85 db                	test   %ebx,%ebx
    1330:	7e 14                	jle    1346 <memmove+0x26>
    1332:	31 d2                	xor    %edx,%edx
    1334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    133c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    133f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1342:	39 da                	cmp    %ebx,%edx
    1344:	75 f2                	jne    1338 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1346:	5b                   	pop    %ebx
    1347:	5e                   	pop    %esi
    1348:	5d                   	pop    %ebp
    1349:	c3                   	ret    

0000134a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    134a:	b8 01 00 00 00       	mov    $0x1,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <exit>:
SYSCALL(exit)
    1352:	b8 02 00 00 00       	mov    $0x2,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <wait>:
SYSCALL(wait)
    135a:	b8 03 00 00 00       	mov    $0x3,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <pipe>:
SYSCALL(pipe)
    1362:	b8 04 00 00 00       	mov    $0x4,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <read>:
SYSCALL(read)
    136a:	b8 05 00 00 00       	mov    $0x5,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <write>:
SYSCALL(write)
    1372:	b8 10 00 00 00       	mov    $0x10,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <close>:
SYSCALL(close)
    137a:	b8 15 00 00 00       	mov    $0x15,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <kill>:
SYSCALL(kill)
    1382:	b8 06 00 00 00       	mov    $0x6,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <exec>:
SYSCALL(exec)
    138a:	b8 07 00 00 00       	mov    $0x7,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <open>:
SYSCALL(open)
    1392:	b8 0f 00 00 00       	mov    $0xf,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <mknod>:
SYSCALL(mknod)
    139a:	b8 11 00 00 00       	mov    $0x11,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <unlink>:
SYSCALL(unlink)
    13a2:	b8 12 00 00 00       	mov    $0x12,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <fstat>:
SYSCALL(fstat)
    13aa:	b8 08 00 00 00       	mov    $0x8,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <link>:
SYSCALL(link)
    13b2:	b8 13 00 00 00       	mov    $0x13,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <mkdir>:
SYSCALL(mkdir)
    13ba:	b8 14 00 00 00       	mov    $0x14,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <chdir>:
SYSCALL(chdir)
    13c2:	b8 09 00 00 00       	mov    $0x9,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <dup>:
SYSCALL(dup)
    13ca:	b8 0a 00 00 00       	mov    $0xa,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <getpid>:
SYSCALL(getpid)
    13d2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <sbrk>:
SYSCALL(sbrk)
    13da:	b8 0c 00 00 00       	mov    $0xc,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <sleep>:
SYSCALL(sleep)
    13e2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <uptime>:
SYSCALL(uptime)
    13ea:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <shm_open>:
SYSCALL(shm_open)
    13f2:	b8 16 00 00 00       	mov    $0x16,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <shm_close>:
SYSCALL(shm_close)	
    13fa:	b8 17 00 00 00       	mov    $0x17,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    
    1402:	66 90                	xchg   %ax,%ax
    1404:	66 90                	xchg   %ax,%ax
    1406:	66 90                	xchg   %ax,%ax
    1408:	66 90                	xchg   %ax,%ax
    140a:	66 90                	xchg   %ax,%ax
    140c:	66 90                	xchg   %ax,%ax
    140e:	66 90                	xchg   %ax,%ax

00001410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	89 c6                	mov    %eax,%esi
    1418:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    141b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    141e:	85 db                	test   %ebx,%ebx
    1420:	74 7e                	je     14a0 <printint+0x90>
    1422:	89 d0                	mov    %edx,%eax
    1424:	c1 e8 1f             	shr    $0x1f,%eax
    1427:	84 c0                	test   %al,%al
    1429:	74 75                	je     14a0 <printint+0x90>
    neg = 1;
    x = -xx;
    142b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    142d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1434:	f7 d8                	neg    %eax
    1436:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1439:	31 ff                	xor    %edi,%edi
    143b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    143e:	89 ce                	mov    %ecx,%esi
    1440:	eb 08                	jmp    144a <printint+0x3a>
    1442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1448:	89 cf                	mov    %ecx,%edi
    144a:	31 d2                	xor    %edx,%edx
    144c:	8d 4f 01             	lea    0x1(%edi),%ecx
    144f:	f7 f6                	div    %esi
    1451:	0f b6 92 44 18 00 00 	movzbl 0x1844(%edx),%edx
  }while((x /= base) != 0);
    1458:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    145a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    145d:	75 e9                	jne    1448 <printint+0x38>
  if(neg)
    145f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1462:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1465:	85 c0                	test   %eax,%eax
    1467:	74 08                	je     1471 <printint+0x61>
    buf[i++] = '-';
    1469:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    146e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1471:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1475:	8d 76 00             	lea    0x0(%esi),%esi
    1478:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    147b:	83 ec 04             	sub    $0x4,%esp
    147e:	83 ef 01             	sub    $0x1,%edi
    1481:	6a 01                	push   $0x1
    1483:	53                   	push   %ebx
    1484:	56                   	push   %esi
    1485:	88 45 d7             	mov    %al,-0x29(%ebp)
    1488:	e8 e5 fe ff ff       	call   1372 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    148d:	83 c4 10             	add    $0x10,%esp
    1490:	39 df                	cmp    %ebx,%edi
    1492:	75 e4                	jne    1478 <printint+0x68>
    putc(fd, buf[i]);
}
    1494:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1497:	5b                   	pop    %ebx
    1498:	5e                   	pop    %esi
    1499:	5f                   	pop    %edi
    149a:	5d                   	pop    %ebp
    149b:	c3                   	ret    
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    14a0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14a2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14a9:	eb 8b                	jmp    1436 <printint+0x26>
    14ab:	90                   	nop
    14ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	57                   	push   %edi
    14b4:	56                   	push   %esi
    14b5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14b6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14b9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14bc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14bf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14c5:	0f b6 1e             	movzbl (%esi),%ebx
    14c8:	83 c6 01             	add    $0x1,%esi
    14cb:	84 db                	test   %bl,%bl
    14cd:	0f 84 b0 00 00 00    	je     1583 <printf+0xd3>
    14d3:	31 d2                	xor    %edx,%edx
    14d5:	eb 39                	jmp    1510 <printf+0x60>
    14d7:	89 f6                	mov    %esi,%esi
    14d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14e0:	83 f8 25             	cmp    $0x25,%eax
    14e3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14e6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14eb:	74 18                	je     1505 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14ed:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14f0:	83 ec 04             	sub    $0x4,%esp
    14f3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14f6:	6a 01                	push   $0x1
    14f8:	50                   	push   %eax
    14f9:	57                   	push   %edi
    14fa:	e8 73 fe ff ff       	call   1372 <write>
    14ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1502:	83 c4 10             	add    $0x10,%esp
    1505:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1508:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    150c:	84 db                	test   %bl,%bl
    150e:	74 73                	je     1583 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1510:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1512:	0f be cb             	movsbl %bl,%ecx
    1515:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1518:	74 c6                	je     14e0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    151a:	83 fa 25             	cmp    $0x25,%edx
    151d:	75 e6                	jne    1505 <printf+0x55>
      if(c == 'd'){
    151f:	83 f8 64             	cmp    $0x64,%eax
    1522:	0f 84 f8 00 00 00    	je     1620 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1528:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    152e:	83 f9 70             	cmp    $0x70,%ecx
    1531:	74 5d                	je     1590 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1533:	83 f8 73             	cmp    $0x73,%eax
    1536:	0f 84 84 00 00 00    	je     15c0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    153c:	83 f8 63             	cmp    $0x63,%eax
    153f:	0f 84 ea 00 00 00    	je     162f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1545:	83 f8 25             	cmp    $0x25,%eax
    1548:	0f 84 c2 00 00 00    	je     1610 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    154e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1551:	83 ec 04             	sub    $0x4,%esp
    1554:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1558:	6a 01                	push   $0x1
    155a:	50                   	push   %eax
    155b:	57                   	push   %edi
    155c:	e8 11 fe ff ff       	call   1372 <write>
    1561:	83 c4 0c             	add    $0xc,%esp
    1564:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1567:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    156a:	6a 01                	push   $0x1
    156c:	50                   	push   %eax
    156d:	57                   	push   %edi
    156e:	83 c6 01             	add    $0x1,%esi
    1571:	e8 fc fd ff ff       	call   1372 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1576:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    157a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    157d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    157f:	84 db                	test   %bl,%bl
    1581:	75 8d                	jne    1510 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1583:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1586:	5b                   	pop    %ebx
    1587:	5e                   	pop    %esi
    1588:	5f                   	pop    %edi
    1589:	5d                   	pop    %ebp
    158a:	c3                   	ret    
    158b:	90                   	nop
    158c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1590:	83 ec 0c             	sub    $0xc,%esp
    1593:	b9 10 00 00 00       	mov    $0x10,%ecx
    1598:	6a 00                	push   $0x0
    159a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    159d:	89 f8                	mov    %edi,%eax
    159f:	8b 13                	mov    (%ebx),%edx
    15a1:	e8 6a fe ff ff       	call   1410 <printint>
        ap++;
    15a6:	89 d8                	mov    %ebx,%eax
    15a8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15ab:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    15ad:	83 c0 04             	add    $0x4,%eax
    15b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15b3:	e9 4d ff ff ff       	jmp    1505 <printf+0x55>
    15b8:	90                   	nop
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    15c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15c3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15c5:	83 c0 04             	add    $0x4,%eax
    15c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    15cb:	b8 3c 18 00 00       	mov    $0x183c,%eax
    15d0:	85 db                	test   %ebx,%ebx
    15d2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    15d5:	0f b6 03             	movzbl (%ebx),%eax
    15d8:	84 c0                	test   %al,%al
    15da:	74 23                	je     15ff <printf+0x14f>
    15dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15e6:	83 ec 04             	sub    $0x4,%esp
    15e9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    15eb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15ee:	50                   	push   %eax
    15ef:	57                   	push   %edi
    15f0:	e8 7d fd ff ff       	call   1372 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15f5:	0f b6 03             	movzbl (%ebx),%eax
    15f8:	83 c4 10             	add    $0x10,%esp
    15fb:	84 c0                	test   %al,%al
    15fd:	75 e1                	jne    15e0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15ff:	31 d2                	xor    %edx,%edx
    1601:	e9 ff fe ff ff       	jmp    1505 <printf+0x55>
    1606:	8d 76 00             	lea    0x0(%esi),%esi
    1609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1610:	83 ec 04             	sub    $0x4,%esp
    1613:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1616:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1619:	6a 01                	push   $0x1
    161b:	e9 4c ff ff ff       	jmp    156c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1620:	83 ec 0c             	sub    $0xc,%esp
    1623:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1628:	6a 01                	push   $0x1
    162a:	e9 6b ff ff ff       	jmp    159a <printf+0xea>
    162f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1632:	83 ec 04             	sub    $0x4,%esp
    1635:	8b 03                	mov    (%ebx),%eax
    1637:	6a 01                	push   $0x1
    1639:	88 45 e4             	mov    %al,-0x1c(%ebp)
    163c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    163f:	50                   	push   %eax
    1640:	57                   	push   %edi
    1641:	e8 2c fd ff ff       	call   1372 <write>
    1646:	e9 5b ff ff ff       	jmp    15a6 <printf+0xf6>
    164b:	66 90                	xchg   %ax,%ax
    164d:	66 90                	xchg   %ax,%ax
    164f:	90                   	nop

00001650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1651:	a1 60 1b 00 00       	mov    0x1b60,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1656:	89 e5                	mov    %esp,%ebp
    1658:	57                   	push   %edi
    1659:	56                   	push   %esi
    165a:	53                   	push   %ebx
    165b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    165e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1660:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1663:	39 c8                	cmp    %ecx,%eax
    1665:	73 19                	jae    1680 <free+0x30>
    1667:	89 f6                	mov    %esi,%esi
    1669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1670:	39 d1                	cmp    %edx,%ecx
    1672:	72 1c                	jb     1690 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1674:	39 d0                	cmp    %edx,%eax
    1676:	73 18                	jae    1690 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1678:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    167a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    167c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    167e:	72 f0                	jb     1670 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1680:	39 d0                	cmp    %edx,%eax
    1682:	72 f4                	jb     1678 <free+0x28>
    1684:	39 d1                	cmp    %edx,%ecx
    1686:	73 f0                	jae    1678 <free+0x28>
    1688:	90                   	nop
    1689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1690:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1693:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1696:	39 d7                	cmp    %edx,%edi
    1698:	74 19                	je     16b3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    169a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    169d:	8b 50 04             	mov    0x4(%eax),%edx
    16a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16a3:	39 f1                	cmp    %esi,%ecx
    16a5:	74 23                	je     16ca <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16a7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    16a9:	a3 60 1b 00 00       	mov    %eax,0x1b60
}
    16ae:	5b                   	pop    %ebx
    16af:	5e                   	pop    %esi
    16b0:	5f                   	pop    %edi
    16b1:	5d                   	pop    %ebp
    16b2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16b3:	03 72 04             	add    0x4(%edx),%esi
    16b6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16b9:	8b 10                	mov    (%eax),%edx
    16bb:	8b 12                	mov    (%edx),%edx
    16bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16c0:	8b 50 04             	mov    0x4(%eax),%edx
    16c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16c6:	39 f1                	cmp    %esi,%ecx
    16c8:	75 dd                	jne    16a7 <free+0x57>
    p->s.size += bp->s.size;
    16ca:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    16cd:	a3 60 1b 00 00       	mov    %eax,0x1b60
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16d5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16d8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16da:	5b                   	pop    %ebx
    16db:	5e                   	pop    %esi
    16dc:	5f                   	pop    %edi
    16dd:	5d                   	pop    %ebp
    16de:	c3                   	ret    
    16df:	90                   	nop

000016e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16e0:	55                   	push   %ebp
    16e1:	89 e5                	mov    %esp,%ebp
    16e3:	57                   	push   %edi
    16e4:	56                   	push   %esi
    16e5:	53                   	push   %ebx
    16e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16ec:	8b 15 60 1b 00 00    	mov    0x1b60,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f2:	8d 78 07             	lea    0x7(%eax),%edi
    16f5:	c1 ef 03             	shr    $0x3,%edi
    16f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16fb:	85 d2                	test   %edx,%edx
    16fd:	0f 84 a3 00 00 00    	je     17a6 <malloc+0xc6>
    1703:	8b 02                	mov    (%edx),%eax
    1705:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1708:	39 cf                	cmp    %ecx,%edi
    170a:	76 74                	jbe    1780 <malloc+0xa0>
    170c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1712:	be 00 10 00 00       	mov    $0x1000,%esi
    1717:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    171e:	0f 43 f7             	cmovae %edi,%esi
    1721:	ba 00 80 00 00       	mov    $0x8000,%edx
    1726:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    172c:	0f 46 da             	cmovbe %edx,%ebx
    172f:	eb 10                	jmp    1741 <malloc+0x61>
    1731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    173a:	8b 48 04             	mov    0x4(%eax),%ecx
    173d:	39 cf                	cmp    %ecx,%edi
    173f:	76 3f                	jbe    1780 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1741:	39 05 60 1b 00 00    	cmp    %eax,0x1b60
    1747:	89 c2                	mov    %eax,%edx
    1749:	75 ed                	jne    1738 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	53                   	push   %ebx
    174f:	e8 86 fc ff ff       	call   13da <sbrk>
  if(p == (char*)-1)
    1754:	83 c4 10             	add    $0x10,%esp
    1757:	83 f8 ff             	cmp    $0xffffffff,%eax
    175a:	74 1c                	je     1778 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    175c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    175f:	83 ec 0c             	sub    $0xc,%esp
    1762:	83 c0 08             	add    $0x8,%eax
    1765:	50                   	push   %eax
    1766:	e8 e5 fe ff ff       	call   1650 <free>
  return freep;
    176b:	8b 15 60 1b 00 00    	mov    0x1b60,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1771:	83 c4 10             	add    $0x10,%esp
    1774:	85 d2                	test   %edx,%edx
    1776:	75 c0                	jne    1738 <malloc+0x58>
        return 0;
    1778:	31 c0                	xor    %eax,%eax
    177a:	eb 1c                	jmp    1798 <malloc+0xb8>
    177c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1780:	39 cf                	cmp    %ecx,%edi
    1782:	74 1c                	je     17a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1784:	29 f9                	sub    %edi,%ecx
    1786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    178c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    178f:	89 15 60 1b 00 00    	mov    %edx,0x1b60
      return (void*)(p + 1);
    1795:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1798:	8d 65 f4             	lea    -0xc(%ebp),%esp
    179b:	5b                   	pop    %ebx
    179c:	5e                   	pop    %esi
    179d:	5f                   	pop    %edi
    179e:	5d                   	pop    %ebp
    179f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    17a0:	8b 08                	mov    (%eax),%ecx
    17a2:	89 0a                	mov    %ecx,(%edx)
    17a4:	eb e9                	jmp    178f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    17a6:	c7 05 60 1b 00 00 64 	movl   $0x1b64,0x1b60
    17ad:	1b 00 00 
    17b0:	c7 05 64 1b 00 00 64 	movl   $0x1b64,0x1b64
    17b7:	1b 00 00 
    base.s.size = 0;
    17ba:	b8 64 1b 00 00       	mov    $0x1b64,%eax
    17bf:	c7 05 68 1b 00 00 00 	movl   $0x0,0x1b68
    17c6:	00 00 00 
    17c9:	e9 3e ff ff ff       	jmp    170c <malloc+0x2c>
    17ce:	66 90                	xchg   %ax,%ax

000017d0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17d0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17d1:	b9 01 00 00 00       	mov    $0x1,%ecx
    17d6:	89 e5                	mov    %esp,%ebp
    17d8:	8b 55 08             	mov    0x8(%ebp),%edx
    17db:	90                   	nop
    17dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17e0:	89 c8                	mov    %ecx,%eax
    17e2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17e5:	85 c0                	test   %eax,%eax
    17e7:	75 f7                	jne    17e0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17e9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17ee:	5d                   	pop    %ebp
    17ef:	c3                   	ret    

000017f0 <urelease>:

void urelease (struct uspinlock *lk) {
    17f0:	55                   	push   %ebp
    17f1:	89 e5                	mov    %esp,%ebp
    17f3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17f6:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17fb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1801:	5d                   	pop    %ebp
    1802:	c3                   	ret    
