
_shm_cnt:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
   struct uspinlock lock;
   int cnt;
};

int main(int argc, char *argv[])
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
    1011:	83 ec 28             	sub    $0x28,%esp
int pid;
int i=0;
struct shm_cnt *counter;
  pid=fork();
    1014:	e8 21 03 00 00       	call   133a <fork>
  sleep(1);
    1019:	83 ec 0c             	sub    $0xc,%esp
int main(int argc, char *argv[])
{
int pid;
int i=0;
struct shm_cnt *counter;
  pid=fork();
    101c:	89 c6                	mov    %eax,%esi
    101e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  sleep(1);
    1021:	6a 01                	push   $0x1
    1023:	e8 aa 03 00 00       	call   13d2 <sleep>

//shm_open: first process will create the page, the second will just attach to the same page
//we get the virtual address of the page returned into counter
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
    1028:	5b                   	pop    %ebx
    1029:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     uacquire(&(counter->lock));
     counter->cnt++;
     urelease(&(counter->lock));

//print something because we are curious and to give a chance to switch process
     if(i%1000 == 0)
    102c:	bb d3 4d 62 10       	mov    $0x10624dd3,%ebx

//shm_open: first process will create the page, the second will just attach to the same page
//we get the virtual address of the page returned into counter
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
    1031:	5f                   	pop    %edi
    1032:	50                   	push   %eax
    1033:	6a 01                	push   $0x1
    1035:	e8 a8 03 00 00       	call   13e2 <shm_open>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	b8 fb 17 00 00       	mov    $0x17fb,%eax
    1042:	85 f6                	test   %esi,%esi
    1044:	be f4 17 00 00       	mov    $0x17f4,%esi
    1049:	0f 44 f0             	cmove  %eax,%esi
 
//  printf(1,"%s returned successfully from shm_open with counter %x\n", pid? "Child": "Parent", counter); 
  for(i = 0; i < 10000; i++)
    104c:	31 ff                	xor    %edi,%edi
    104e:	66 90                	xchg   %ax,%ax
    {
     uacquire(&(counter->lock));
    1050:	83 ec 0c             	sub    $0xc,%esp
    1053:	ff 75 e4             	pushl  -0x1c(%ebp)
    1056:	e8 65 07 00 00       	call   17c0 <uacquire>
     counter->cnt++;
    105b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    105e:	83 40 04 01          	addl   $0x1,0x4(%eax)
     urelease(&(counter->lock));
    1062:	89 04 24             	mov    %eax,(%esp)
    1065:	e8 76 07 00 00       	call   17e0 <urelease>

//print something because we are curious and to give a chance to switch process
     if(i%1000 == 0)
    106a:	89 f8                	mov    %edi,%eax
    106c:	83 c4 10             	add    $0x10,%esp
    106f:	f7 eb                	imul   %ebx
    1071:	89 f8                	mov    %edi,%eax
    1073:	c1 f8 1f             	sar    $0x1f,%eax
    1076:	c1 fa 06             	sar    $0x6,%edx
    1079:	29 c2                	sub    %eax,%edx
    107b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    1081:	39 d7                	cmp    %edx,%edi
    1083:	75 1a                	jne    109f <main+0x9f>
       printf(1,"Counter in %s is %d at address %x\n",pid? "Parent" : "Child", counter->cnt, counter);
    1085:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1088:	83 ec 0c             	sub    $0xc,%esp
    108b:	50                   	push   %eax
    108c:	ff 70 04             	pushl  0x4(%eax)
    108f:	56                   	push   %esi
    1090:	68 34 18 00 00       	push   $0x1834
    1095:	6a 01                	push   $0x1
    1097:	e8 04 04 00 00       	call   14a0 <printf>
    109c:	83 c4 20             	add    $0x20,%esp
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
 
//  printf(1,"%s returned successfully from shm_open with counter %x\n", pid? "Child": "Parent", counter); 
  for(i = 0; i < 10000; i++)
    109f:	83 c7 01             	add    $0x1,%edi
    10a2:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
    10a8:	75 a6                	jne    1050 <main+0x50>
//print something because we are curious and to give a chance to switch process
     if(i%1000 == 0)
       printf(1,"Counter in %s is %d at address %x\n",pid? "Parent" : "Child", counter->cnt, counter);
}
  
  if(pid)
    10aa:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    10ad:	85 c9                	test   %ecx,%ecx
    10af:	74 2a                	je     10db <main+0xdb>
     {
       printf(1,"Counter in parent is %d\n",counter->cnt);
    10b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10b4:	52                   	push   %edx
    10b5:	ff 70 04             	pushl  0x4(%eax)
    10b8:	68 01 18 00 00       	push   $0x1801
    10bd:	6a 01                	push   $0x1
    10bf:	e8 dc 03 00 00       	call   14a0 <printf>
    wait();
    10c4:	e8 81 02 00 00       	call   134a <wait>
    10c9:	83 c4 10             	add    $0x10,%esp
    } else
    printf(1,"Counter in child is %d\n\n",counter->cnt);

//shm_close: first process will just detach, next one will free up the shm_table entry (but for now not the page)
   shm_close(1);
    10cc:	83 ec 0c             	sub    $0xc,%esp
    10cf:	6a 01                	push   $0x1
    10d1:	e8 14 03 00 00       	call   13ea <shm_close>
   exit();
    10d6:	e8 67 02 00 00       	call   1342 <exit>
  if(pid)
     {
       printf(1,"Counter in parent is %d\n",counter->cnt);
    wait();
    } else
    printf(1,"Counter in child is %d\n\n",counter->cnt);
    10db:	50                   	push   %eax
    10dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10df:	ff 70 04             	pushl  0x4(%eax)
    10e2:	68 1a 18 00 00       	push   $0x181a
    10e7:	6a 01                	push   $0x1
    10e9:	e8 b2 03 00 00       	call   14a0 <printf>
    10ee:	83 c4 10             	add    $0x10,%esp
    10f1:	eb d9                	jmp    10cc <main+0xcc>
    10f3:	66 90                	xchg   %ax,%ax
    10f5:	66 90                	xchg   %ax,%ax
    10f7:	66 90                	xchg   %ax,%ax
    10f9:	66 90                	xchg   %ax,%ax
    10fb:	66 90                	xchg   %ax,%ax
    10fd:	66 90                	xchg   %ax,%ax
    10ff:	90                   	nop

00001100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	8b 45 08             	mov    0x8(%ebp),%eax
    1107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    110a:	89 c2                	mov    %eax,%edx
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1110:	83 c1 01             	add    $0x1,%ecx
    1113:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1117:	83 c2 01             	add    $0x1,%edx
    111a:	84 db                	test   %bl,%bl
    111c:	88 5a ff             	mov    %bl,-0x1(%edx)
    111f:	75 ef                	jne    1110 <strcpy+0x10>
    ;
  return os;
}
    1121:	5b                   	pop    %ebx
    1122:	5d                   	pop    %ebp
    1123:	c3                   	ret    
    1124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    112a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	56                   	push   %esi
    1134:	53                   	push   %ebx
    1135:	8b 55 08             	mov    0x8(%ebp),%edx
    1138:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    113b:	0f b6 02             	movzbl (%edx),%eax
    113e:	0f b6 19             	movzbl (%ecx),%ebx
    1141:	84 c0                	test   %al,%al
    1143:	75 1e                	jne    1163 <strcmp+0x33>
    1145:	eb 29                	jmp    1170 <strcmp+0x40>
    1147:	89 f6                	mov    %esi,%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1150:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1153:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1156:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1159:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    115d:	84 c0                	test   %al,%al
    115f:	74 0f                	je     1170 <strcmp+0x40>
    1161:	89 f1                	mov    %esi,%ecx
    1163:	38 d8                	cmp    %bl,%al
    1165:	74 e9                	je     1150 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1167:	29 d8                	sub    %ebx,%eax
}
    1169:	5b                   	pop    %ebx
    116a:	5e                   	pop    %esi
    116b:	5d                   	pop    %ebp
    116c:	c3                   	ret    
    116d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1170:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1172:	29 d8                	sub    %ebx,%eax
}
    1174:	5b                   	pop    %ebx
    1175:	5e                   	pop    %esi
    1176:	5d                   	pop    %ebp
    1177:	c3                   	ret    
    1178:	90                   	nop
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001180 <strlen>:

uint
strlen(char *s)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1186:	80 39 00             	cmpb   $0x0,(%ecx)
    1189:	74 12                	je     119d <strlen+0x1d>
    118b:	31 d2                	xor    %edx,%edx
    118d:	8d 76 00             	lea    0x0(%esi),%esi
    1190:	83 c2 01             	add    $0x1,%edx
    1193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1197:	89 d0                	mov    %edx,%eax
    1199:	75 f5                	jne    1190 <strlen+0x10>
    ;
  return n;
}
    119b:	5d                   	pop    %ebp
    119c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    119d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    119f:	5d                   	pop    %ebp
    11a0:	c3                   	ret    
    11a1:	eb 0d                	jmp    11b0 <memset>
    11a3:	90                   	nop
    11a4:	90                   	nop
    11a5:	90                   	nop
    11a6:	90                   	nop
    11a7:	90                   	nop
    11a8:	90                   	nop
    11a9:	90                   	nop
    11aa:	90                   	nop
    11ab:	90                   	nop
    11ac:	90                   	nop
    11ad:	90                   	nop
    11ae:	90                   	nop
    11af:	90                   	nop

000011b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bd:	89 d7                	mov    %edx,%edi
    11bf:	fc                   	cld    
    11c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11c2:	89 d0                	mov    %edx,%eax
    11c4:	5f                   	pop    %edi
    11c5:	5d                   	pop    %ebp
    11c6:	c3                   	ret    
    11c7:	89 f6                	mov    %esi,%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011d0 <strchr>:

char*
strchr(const char *s, char c)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	53                   	push   %ebx
    11d4:	8b 45 08             	mov    0x8(%ebp),%eax
    11d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11da:	0f b6 10             	movzbl (%eax),%edx
    11dd:	84 d2                	test   %dl,%dl
    11df:	74 1d                	je     11fe <strchr+0x2e>
    if(*s == c)
    11e1:	38 d3                	cmp    %dl,%bl
    11e3:	89 d9                	mov    %ebx,%ecx
    11e5:	75 0d                	jne    11f4 <strchr+0x24>
    11e7:	eb 17                	jmp    1200 <strchr+0x30>
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11f0:	38 ca                	cmp    %cl,%dl
    11f2:	74 0c                	je     1200 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11f4:	83 c0 01             	add    $0x1,%eax
    11f7:	0f b6 10             	movzbl (%eax),%edx
    11fa:	84 d2                	test   %dl,%dl
    11fc:	75 f2                	jne    11f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    11fe:	31 c0                	xor    %eax,%eax
}
    1200:	5b                   	pop    %ebx
    1201:	5d                   	pop    %ebp
    1202:	c3                   	ret    
    1203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <gets>:

char*
gets(char *buf, int max)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
    1215:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1216:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1218:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    121b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    121e:	eb 29                	jmp    1249 <gets+0x39>
    cc = read(0, &c, 1);
    1220:	83 ec 04             	sub    $0x4,%esp
    1223:	6a 01                	push   $0x1
    1225:	57                   	push   %edi
    1226:	6a 00                	push   $0x0
    1228:	e8 2d 01 00 00       	call   135a <read>
    if(cc < 1)
    122d:	83 c4 10             	add    $0x10,%esp
    1230:	85 c0                	test   %eax,%eax
    1232:	7e 1d                	jle    1251 <gets+0x41>
      break;
    buf[i++] = c;
    1234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1238:	8b 55 08             	mov    0x8(%ebp),%edx
    123b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    123d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    123f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1243:	74 1b                	je     1260 <gets+0x50>
    1245:	3c 0d                	cmp    $0xd,%al
    1247:	74 17                	je     1260 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1249:	8d 5e 01             	lea    0x1(%esi),%ebx
    124c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    124f:	7c cf                	jl     1220 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1251:	8b 45 08             	mov    0x8(%ebp),%eax
    1254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1258:	8d 65 f4             	lea    -0xc(%ebp),%esp
    125b:	5b                   	pop    %ebx
    125c:	5e                   	pop    %esi
    125d:	5f                   	pop    %edi
    125e:	5d                   	pop    %ebp
    125f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1260:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1263:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1269:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126c:	5b                   	pop    %ebx
    126d:	5e                   	pop    %esi
    126e:	5f                   	pop    %edi
    126f:	5d                   	pop    %ebp
    1270:	c3                   	ret    
    1271:	eb 0d                	jmp    1280 <stat>
    1273:	90                   	nop
    1274:	90                   	nop
    1275:	90                   	nop
    1276:	90                   	nop
    1277:	90                   	nop
    1278:	90                   	nop
    1279:	90                   	nop
    127a:	90                   	nop
    127b:	90                   	nop
    127c:	90                   	nop
    127d:	90                   	nop
    127e:	90                   	nop
    127f:	90                   	nop

00001280 <stat>:

int
stat(char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	6a 00                	push   $0x0
    128a:	ff 75 08             	pushl  0x8(%ebp)
    128d:	e8 f0 00 00 00       	call   1382 <open>
  if(fd < 0)
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	85 c0                	test   %eax,%eax
    1297:	78 27                	js     12c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	ff 75 0c             	pushl  0xc(%ebp)
    129f:	89 c3                	mov    %eax,%ebx
    12a1:	50                   	push   %eax
    12a2:	e8 f3 00 00 00       	call   139a <fstat>
    12a7:	89 c6                	mov    %eax,%esi
  close(fd);
    12a9:	89 1c 24             	mov    %ebx,(%esp)
    12ac:	e8 b9 00 00 00       	call   136a <close>
  return r;
    12b1:	83 c4 10             	add    $0x10,%esp
    12b4:	89 f0                	mov    %esi,%eax
}
    12b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12b9:	5b                   	pop    %ebx
    12ba:	5e                   	pop    %esi
    12bb:	5d                   	pop    %ebp
    12bc:	c3                   	ret    
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    12c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12c5:	eb ef                	jmp    12b6 <stat+0x36>
    12c7:	89 f6                	mov    %esi,%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012d0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 11             	movsbl (%ecx),%edx
    12da:	8d 42 d0             	lea    -0x30(%edx),%eax
    12dd:	3c 09                	cmp    $0x9,%al
    12df:	b8 00 00 00 00       	mov    $0x0,%eax
    12e4:	77 1f                	ja     1305 <atoi+0x35>
    12e6:	8d 76 00             	lea    0x0(%esi),%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12f3:	83 c1 01             	add    $0x1,%ecx
    12f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12fa:	0f be 11             	movsbl (%ecx),%edx
    12fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1300:	80 fb 09             	cmp    $0x9,%bl
    1303:	76 eb                	jbe    12f0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1305:	5b                   	pop    %ebx
    1306:	5d                   	pop    %ebp
    1307:	c3                   	ret    
    1308:	90                   	nop
    1309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001310 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
    1315:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1318:	8b 45 08             	mov    0x8(%ebp),%eax
    131b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    131e:	85 db                	test   %ebx,%ebx
    1320:	7e 14                	jle    1336 <memmove+0x26>
    1322:	31 d2                	xor    %edx,%edx
    1324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    132c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    132f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1332:	39 da                	cmp    %ebx,%edx
    1334:	75 f2                	jne    1328 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1336:	5b                   	pop    %ebx
    1337:	5e                   	pop    %esi
    1338:	5d                   	pop    %ebp
    1339:	c3                   	ret    

0000133a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    133a:	b8 01 00 00 00       	mov    $0x1,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <exit>:
SYSCALL(exit)
    1342:	b8 02 00 00 00       	mov    $0x2,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <wait>:
SYSCALL(wait)
    134a:	b8 03 00 00 00       	mov    $0x3,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <pipe>:
SYSCALL(pipe)
    1352:	b8 04 00 00 00       	mov    $0x4,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <read>:
SYSCALL(read)
    135a:	b8 05 00 00 00       	mov    $0x5,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <write>:
SYSCALL(write)
    1362:	b8 10 00 00 00       	mov    $0x10,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <close>:
SYSCALL(close)
    136a:	b8 15 00 00 00       	mov    $0x15,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <kill>:
SYSCALL(kill)
    1372:	b8 06 00 00 00       	mov    $0x6,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <exec>:
SYSCALL(exec)
    137a:	b8 07 00 00 00       	mov    $0x7,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <open>:
SYSCALL(open)
    1382:	b8 0f 00 00 00       	mov    $0xf,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <mknod>:
SYSCALL(mknod)
    138a:	b8 11 00 00 00       	mov    $0x11,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <unlink>:
SYSCALL(unlink)
    1392:	b8 12 00 00 00       	mov    $0x12,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <fstat>:
SYSCALL(fstat)
    139a:	b8 08 00 00 00       	mov    $0x8,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <link>:
SYSCALL(link)
    13a2:	b8 13 00 00 00       	mov    $0x13,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mkdir>:
SYSCALL(mkdir)
    13aa:	b8 14 00 00 00       	mov    $0x14,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <chdir>:
SYSCALL(chdir)
    13b2:	b8 09 00 00 00       	mov    $0x9,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <dup>:
SYSCALL(dup)
    13ba:	b8 0a 00 00 00       	mov    $0xa,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <getpid>:
SYSCALL(getpid)
    13c2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <sbrk>:
SYSCALL(sbrk)
    13ca:	b8 0c 00 00 00       	mov    $0xc,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <sleep>:
SYSCALL(sleep)
    13d2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <uptime>:
SYSCALL(uptime)
    13da:	b8 0e 00 00 00       	mov    $0xe,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <shm_open>:
SYSCALL(shm_open)
    13e2:	b8 16 00 00 00       	mov    $0x16,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <shm_close>:
SYSCALL(shm_close)	
    13ea:	b8 17 00 00 00       	mov    $0x17,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    
    13f2:	66 90                	xchg   %ax,%ax
    13f4:	66 90                	xchg   %ax,%ax
    13f6:	66 90                	xchg   %ax,%ax
    13f8:	66 90                	xchg   %ax,%ax
    13fa:	66 90                	xchg   %ax,%ax
    13fc:	66 90                	xchg   %ax,%ax
    13fe:	66 90                	xchg   %ax,%ax

00001400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	53                   	push   %ebx
    1406:	89 c6                	mov    %eax,%esi
    1408:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    140b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    140e:	85 db                	test   %ebx,%ebx
    1410:	74 7e                	je     1490 <printint+0x90>
    1412:	89 d0                	mov    %edx,%eax
    1414:	c1 e8 1f             	shr    $0x1f,%eax
    1417:	84 c0                	test   %al,%al
    1419:	74 75                	je     1490 <printint+0x90>
    neg = 1;
    x = -xx;
    141b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    141d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1424:	f7 d8                	neg    %eax
    1426:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1429:	31 ff                	xor    %edi,%edi
    142b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    142e:	89 ce                	mov    %ecx,%esi
    1430:	eb 08                	jmp    143a <printint+0x3a>
    1432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1438:	89 cf                	mov    %ecx,%edi
    143a:	31 d2                	xor    %edx,%edx
    143c:	8d 4f 01             	lea    0x1(%edi),%ecx
    143f:	f7 f6                	div    %esi
    1441:	0f b6 92 60 18 00 00 	movzbl 0x1860(%edx),%edx
  }while((x /= base) != 0);
    1448:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    144a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    144d:	75 e9                	jne    1438 <printint+0x38>
  if(neg)
    144f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1452:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1455:	85 c0                	test   %eax,%eax
    1457:	74 08                	je     1461 <printint+0x61>
    buf[i++] = '-';
    1459:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    145e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1461:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1465:	8d 76 00             	lea    0x0(%esi),%esi
    1468:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    146b:	83 ec 04             	sub    $0x4,%esp
    146e:	83 ef 01             	sub    $0x1,%edi
    1471:	6a 01                	push   $0x1
    1473:	53                   	push   %ebx
    1474:	56                   	push   %esi
    1475:	88 45 d7             	mov    %al,-0x29(%ebp)
    1478:	e8 e5 fe ff ff       	call   1362 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    147d:	83 c4 10             	add    $0x10,%esp
    1480:	39 df                	cmp    %ebx,%edi
    1482:	75 e4                	jne    1468 <printint+0x68>
    putc(fd, buf[i]);
}
    1484:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1487:	5b                   	pop    %ebx
    1488:	5e                   	pop    %esi
    1489:	5f                   	pop    %edi
    148a:	5d                   	pop    %ebp
    148b:	c3                   	ret    
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1490:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1492:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1499:	eb 8b                	jmp    1426 <printint+0x26>
    149b:	90                   	nop
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14b5:	0f b6 1e             	movzbl (%esi),%ebx
    14b8:	83 c6 01             	add    $0x1,%esi
    14bb:	84 db                	test   %bl,%bl
    14bd:	0f 84 b0 00 00 00    	je     1573 <printf+0xd3>
    14c3:	31 d2                	xor    %edx,%edx
    14c5:	eb 39                	jmp    1500 <printf+0x60>
    14c7:	89 f6                	mov    %esi,%esi
    14c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14d0:	83 f8 25             	cmp    $0x25,%eax
    14d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14db:	74 18                	je     14f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14e0:	83 ec 04             	sub    $0x4,%esp
    14e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14e6:	6a 01                	push   $0x1
    14e8:	50                   	push   %eax
    14e9:	57                   	push   %edi
    14ea:	e8 73 fe ff ff       	call   1362 <write>
    14ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14f2:	83 c4 10             	add    $0x10,%esp
    14f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14fc:	84 db                	test   %bl,%bl
    14fe:	74 73                	je     1573 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1500:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1502:	0f be cb             	movsbl %bl,%ecx
    1505:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1508:	74 c6                	je     14d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    150a:	83 fa 25             	cmp    $0x25,%edx
    150d:	75 e6                	jne    14f5 <printf+0x55>
      if(c == 'd'){
    150f:	83 f8 64             	cmp    $0x64,%eax
    1512:	0f 84 f8 00 00 00    	je     1610 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1518:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    151e:	83 f9 70             	cmp    $0x70,%ecx
    1521:	74 5d                	je     1580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1523:	83 f8 73             	cmp    $0x73,%eax
    1526:	0f 84 84 00 00 00    	je     15b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    152c:	83 f8 63             	cmp    $0x63,%eax
    152f:	0f 84 ea 00 00 00    	je     161f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1535:	83 f8 25             	cmp    $0x25,%eax
    1538:	0f 84 c2 00 00 00    	je     1600 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    153e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1541:	83 ec 04             	sub    $0x4,%esp
    1544:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1548:	6a 01                	push   $0x1
    154a:	50                   	push   %eax
    154b:	57                   	push   %edi
    154c:	e8 11 fe ff ff       	call   1362 <write>
    1551:	83 c4 0c             	add    $0xc,%esp
    1554:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1557:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    155a:	6a 01                	push   $0x1
    155c:	50                   	push   %eax
    155d:	57                   	push   %edi
    155e:	83 c6 01             	add    $0x1,%esi
    1561:	e8 fc fd ff ff       	call   1362 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1566:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    156a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    156d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    156f:	84 db                	test   %bl,%bl
    1571:	75 8d                	jne    1500 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1573:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1576:	5b                   	pop    %ebx
    1577:	5e                   	pop    %esi
    1578:	5f                   	pop    %edi
    1579:	5d                   	pop    %ebp
    157a:	c3                   	ret    
    157b:	90                   	nop
    157c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 10 00 00 00       	mov    $0x10,%ecx
    1588:	6a 00                	push   $0x0
    158a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    158d:	89 f8                	mov    %edi,%eax
    158f:	8b 13                	mov    (%ebx),%edx
    1591:	e8 6a fe ff ff       	call   1400 <printint>
        ap++;
    1596:	89 d8                	mov    %ebx,%eax
    1598:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    159b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    159d:	83 c0 04             	add    $0x4,%eax
    15a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15a3:	e9 4d ff ff ff       	jmp    14f5 <printf+0x55>
    15a8:	90                   	nop
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    15b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15b3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15b5:	83 c0 04             	add    $0x4,%eax
    15b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    15bb:	b8 58 18 00 00       	mov    $0x1858,%eax
    15c0:	85 db                	test   %ebx,%ebx
    15c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    15c5:	0f b6 03             	movzbl (%ebx),%eax
    15c8:	84 c0                	test   %al,%al
    15ca:	74 23                	je     15ef <printf+0x14f>
    15cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15d6:	83 ec 04             	sub    $0x4,%esp
    15d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    15db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15de:	50                   	push   %eax
    15df:	57                   	push   %edi
    15e0:	e8 7d fd ff ff       	call   1362 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15e5:	0f b6 03             	movzbl (%ebx),%eax
    15e8:	83 c4 10             	add    $0x10,%esp
    15eb:	84 c0                	test   %al,%al
    15ed:	75 e1                	jne    15d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15ef:	31 d2                	xor    %edx,%edx
    15f1:	e9 ff fe ff ff       	jmp    14f5 <printf+0x55>
    15f6:	8d 76 00             	lea    0x0(%esi),%esi
    15f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1600:	83 ec 04             	sub    $0x4,%esp
    1603:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1606:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1609:	6a 01                	push   $0x1
    160b:	e9 4c ff ff ff       	jmp    155c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1610:	83 ec 0c             	sub    $0xc,%esp
    1613:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1618:	6a 01                	push   $0x1
    161a:	e9 6b ff ff ff       	jmp    158a <printf+0xea>
    161f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1622:	83 ec 04             	sub    $0x4,%esp
    1625:	8b 03                	mov    (%ebx),%eax
    1627:	6a 01                	push   $0x1
    1629:	88 45 e4             	mov    %al,-0x1c(%ebp)
    162c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    162f:	50                   	push   %eax
    1630:	57                   	push   %edi
    1631:	e8 2c fd ff ff       	call   1362 <write>
    1636:	e9 5b ff ff ff       	jmp    1596 <printf+0xf6>
    163b:	66 90                	xchg   %ax,%ax
    163d:	66 90                	xchg   %ax,%ax
    163f:	90                   	nop

00001640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1641:	a1 44 1b 00 00       	mov    0x1b44,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1646:	89 e5                	mov    %esp,%ebp
    1648:	57                   	push   %edi
    1649:	56                   	push   %esi
    164a:	53                   	push   %ebx
    164b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    164e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1650:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1653:	39 c8                	cmp    %ecx,%eax
    1655:	73 19                	jae    1670 <free+0x30>
    1657:	89 f6                	mov    %esi,%esi
    1659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1660:	39 d1                	cmp    %edx,%ecx
    1662:	72 1c                	jb     1680 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1664:	39 d0                	cmp    %edx,%eax
    1666:	73 18                	jae    1680 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1668:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    166c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166e:	72 f0                	jb     1660 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1670:	39 d0                	cmp    %edx,%eax
    1672:	72 f4                	jb     1668 <free+0x28>
    1674:	39 d1                	cmp    %edx,%ecx
    1676:	73 f0                	jae    1668 <free+0x28>
    1678:	90                   	nop
    1679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1680:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1683:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1686:	39 d7                	cmp    %edx,%edi
    1688:	74 19                	je     16a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    168a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    168d:	8b 50 04             	mov    0x4(%eax),%edx
    1690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1693:	39 f1                	cmp    %esi,%ecx
    1695:	74 23                	je     16ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1697:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1699:	a3 44 1b 00 00       	mov    %eax,0x1b44
}
    169e:	5b                   	pop    %ebx
    169f:	5e                   	pop    %esi
    16a0:	5f                   	pop    %edi
    16a1:	5d                   	pop    %ebp
    16a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16a3:	03 72 04             	add    0x4(%edx),%esi
    16a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16a9:	8b 10                	mov    (%eax),%edx
    16ab:	8b 12                	mov    (%edx),%edx
    16ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16b0:	8b 50 04             	mov    0x4(%eax),%edx
    16b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16b6:	39 f1                	cmp    %esi,%ecx
    16b8:	75 dd                	jne    1697 <free+0x57>
    p->s.size += bp->s.size;
    16ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    16bd:	a3 44 1b 00 00       	mov    %eax,0x1b44
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16ca:	5b                   	pop    %ebx
    16cb:	5e                   	pop    %esi
    16cc:	5f                   	pop    %edi
    16cd:	5d                   	pop    %ebp
    16ce:	c3                   	ret    
    16cf:	90                   	nop

000016d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16d0:	55                   	push   %ebp
    16d1:	89 e5                	mov    %esp,%ebp
    16d3:	57                   	push   %edi
    16d4:	56                   	push   %esi
    16d5:	53                   	push   %ebx
    16d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16dc:	8b 15 44 1b 00 00    	mov    0x1b44,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e2:	8d 78 07             	lea    0x7(%eax),%edi
    16e5:	c1 ef 03             	shr    $0x3,%edi
    16e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16eb:	85 d2                	test   %edx,%edx
    16ed:	0f 84 a3 00 00 00    	je     1796 <malloc+0xc6>
    16f3:	8b 02                	mov    (%edx),%eax
    16f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16f8:	39 cf                	cmp    %ecx,%edi
    16fa:	76 74                	jbe    1770 <malloc+0xa0>
    16fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1702:	be 00 10 00 00       	mov    $0x1000,%esi
    1707:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    170e:	0f 43 f7             	cmovae %edi,%esi
    1711:	ba 00 80 00 00       	mov    $0x8000,%edx
    1716:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    171c:	0f 46 da             	cmovbe %edx,%ebx
    171f:	eb 10                	jmp    1731 <malloc+0x61>
    1721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    172a:	8b 48 04             	mov    0x4(%eax),%ecx
    172d:	39 cf                	cmp    %ecx,%edi
    172f:	76 3f                	jbe    1770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1731:	39 05 44 1b 00 00    	cmp    %eax,0x1b44
    1737:	89 c2                	mov    %eax,%edx
    1739:	75 ed                	jne    1728 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    173b:	83 ec 0c             	sub    $0xc,%esp
    173e:	53                   	push   %ebx
    173f:	e8 86 fc ff ff       	call   13ca <sbrk>
  if(p == (char*)-1)
    1744:	83 c4 10             	add    $0x10,%esp
    1747:	83 f8 ff             	cmp    $0xffffffff,%eax
    174a:	74 1c                	je     1768 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    174c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    174f:	83 ec 0c             	sub    $0xc,%esp
    1752:	83 c0 08             	add    $0x8,%eax
    1755:	50                   	push   %eax
    1756:	e8 e5 fe ff ff       	call   1640 <free>
  return freep;
    175b:	8b 15 44 1b 00 00    	mov    0x1b44,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1761:	83 c4 10             	add    $0x10,%esp
    1764:	85 d2                	test   %edx,%edx
    1766:	75 c0                	jne    1728 <malloc+0x58>
        return 0;
    1768:	31 c0                	xor    %eax,%eax
    176a:	eb 1c                	jmp    1788 <malloc+0xb8>
    176c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1770:	39 cf                	cmp    %ecx,%edi
    1772:	74 1c                	je     1790 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1774:	29 f9                	sub    %edi,%ecx
    1776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    177c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    177f:	89 15 44 1b 00 00    	mov    %edx,0x1b44
      return (void*)(p + 1);
    1785:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1788:	8d 65 f4             	lea    -0xc(%ebp),%esp
    178b:	5b                   	pop    %ebx
    178c:	5e                   	pop    %esi
    178d:	5f                   	pop    %edi
    178e:	5d                   	pop    %ebp
    178f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1790:	8b 08                	mov    (%eax),%ecx
    1792:	89 0a                	mov    %ecx,(%edx)
    1794:	eb e9                	jmp    177f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1796:	c7 05 44 1b 00 00 48 	movl   $0x1b48,0x1b44
    179d:	1b 00 00 
    17a0:	c7 05 48 1b 00 00 48 	movl   $0x1b48,0x1b48
    17a7:	1b 00 00 
    base.s.size = 0;
    17aa:	b8 48 1b 00 00       	mov    $0x1b48,%eax
    17af:	c7 05 4c 1b 00 00 00 	movl   $0x0,0x1b4c
    17b6:	00 00 00 
    17b9:	e9 3e ff ff ff       	jmp    16fc <malloc+0x2c>
    17be:	66 90                	xchg   %ax,%ax

000017c0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17c0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17c1:	b9 01 00 00 00       	mov    $0x1,%ecx
    17c6:	89 e5                	mov    %esp,%ebp
    17c8:	8b 55 08             	mov    0x8(%ebp),%edx
    17cb:	90                   	nop
    17cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17d0:	89 c8                	mov    %ecx,%eax
    17d2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17d5:	85 c0                	test   %eax,%eax
    17d7:	75 f7                	jne    17d0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17d9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17de:	5d                   	pop    %ebp
    17df:	c3                   	ret    

000017e0 <urelease>:

void urelease (struct uspinlock *lk) {
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17e6:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17f1:	5d                   	pop    %ebp
    17f2:	c3                   	ret    
