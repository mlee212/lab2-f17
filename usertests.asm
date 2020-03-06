
_usertests:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
    1011:	68 42 5d 00 00       	push   $0x5d42
    1016:	6a 01                	push   $0x1
    1018:	e8 e3 39 00 00       	call   4a00 <printf>

  if(open("usertests.ran", 0) >= 0){
    101d:	5a                   	pop    %edx
    101e:	59                   	pop    %ecx
    101f:	6a 00                	push   $0x0
    1021:	68 56 5d 00 00       	push   $0x5d56
    1026:	e8 b7 38 00 00       	call   48e2 <open>
    102b:	83 c4 10             	add    $0x10,%esp
    102e:	85 c0                	test   %eax,%eax
    1030:	78 14                	js     1046 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    1032:	83 ec 08             	sub    $0x8,%esp
    1035:	68 c0 64 00 00       	push   $0x64c0
    103a:	6a 01                	push   $0x1
    103c:	e8 bf 39 00 00       	call   4a00 <printf>
    exit();
    1041:	e8 5c 38 00 00       	call   48a2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    1046:	50                   	push   %eax
    1047:	50                   	push   %eax
    1048:	68 00 02 00 00       	push   $0x200
    104d:	68 56 5d 00 00       	push   $0x5d56
    1052:	e8 8b 38 00 00       	call   48e2 <open>
    1057:	89 04 24             	mov    %eax,(%esp)
    105a:	e8 6b 38 00 00       	call   48ca <close>

  argptest();
    105f:	e8 6c 35 00 00       	call   45d0 <argptest>
  createdelete();
    1064:	e8 87 11 00 00       	call   21f0 <createdelete>
  linkunlink();
    1069:	e8 42 1a 00 00       	call   2ab0 <linkunlink>
  concreate();
    106e:	e8 2d 17 00 00       	call   27a0 <concreate>
  fourfiles();
    1073:	e8 88 0f 00 00       	call   2000 <fourfiles>
  sharedfd();
    1078:	e8 c3 0d 00 00       	call   1e40 <sharedfd>

  bigargtest();
    107d:	e8 ee 31 00 00       	call   4270 <bigargtest>
  bigwrite();
    1082:	e8 49 23 00 00       	call   33d0 <bigwrite>
  bigargtest();
    1087:	e8 e4 31 00 00       	call   4270 <bigargtest>
  bsstest();
    108c:	e8 6f 31 00 00       	call   4200 <bsstest>
  sbrktest();
    1091:	e8 8a 2c 00 00       	call   3d20 <sbrktest>
  validatetest();
    1096:	e8 b5 30 00 00       	call   4150 <validatetest>

  opentest();
    109b:	e8 50 03 00 00       	call   13f0 <opentest>
  writetest();
    10a0:	e8 db 03 00 00       	call   1480 <writetest>
  writetest1();
    10a5:	e8 b6 05 00 00       	call   1660 <writetest1>
  createtest();
    10aa:	e8 81 07 00 00       	call   1830 <createtest>

  openiputtest();
    10af:	e8 3c 02 00 00       	call   12f0 <openiputtest>
  exitiputtest();
    10b4:	e8 47 01 00 00       	call   1200 <exitiputtest>
  iputtest();
    10b9:	e8 62 00 00 00       	call   1120 <iputtest>

  mem();
    10be:	e8 ad 0c 00 00       	call   1d70 <mem>
  pipe1();
    10c3:	e8 48 09 00 00       	call   1a10 <pipe1>
  preempt();
    10c8:	e8 d3 0a 00 00       	call   1ba0 <preempt>
  exitwait();
    10cd:	e8 0e 0c 00 00       	call   1ce0 <exitwait>

  rmdot();
    10d2:	e8 e9 26 00 00       	call   37c0 <rmdot>
  fourteen();
    10d7:	e8 a4 25 00 00       	call   3680 <fourteen>
  bigfile();
    10dc:	e8 cf 23 00 00       	call   34b0 <bigfile>
  subdir();
    10e1:	e8 0a 1c 00 00       	call   2cf0 <subdir>
  linktest();
    10e6:	e8 a5 14 00 00       	call   2590 <linktest>
  unlinkread();
    10eb:	e8 10 13 00 00       	call   2400 <unlinkread>
  dirfile();
    10f0:	e8 4b 28 00 00       	call   3940 <dirfile>
  iref();
    10f5:	e8 46 2a 00 00       	call   3b40 <iref>
  forktest();
    10fa:	e8 61 2b 00 00       	call   3c60 <forktest>
  bigdir(); // slow
    10ff:	e8 bc 1a 00 00       	call   2bc0 <bigdir>

  uio();
    1104:	e8 57 34 00 00       	call   4560 <uio>

  exectest();
    1109:	e8 b2 08 00 00       	call   19c0 <exectest>

  exit();
    110e:	e8 8f 37 00 00       	call   48a2 <exit>
    1113:	66 90                	xchg   %ax,%ax
    1115:	66 90                	xchg   %ax,%ax
    1117:	66 90                	xchg   %ax,%ax
    1119:	66 90                	xchg   %ax,%ax
    111b:	66 90                	xchg   %ax,%ax
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
    1126:	68 e8 4d 00 00       	push   $0x4de8
    112b:	ff 35 28 6e 00 00    	pushl  0x6e28
    1131:	e8 ca 38 00 00       	call   4a00 <printf>

  if(mkdir("iputdir") < 0){
    1136:	c7 04 24 7b 4d 00 00 	movl   $0x4d7b,(%esp)
    113d:	e8 c8 37 00 00       	call   490a <mkdir>
    1142:	83 c4 10             	add    $0x10,%esp
    1145:	85 c0                	test   %eax,%eax
    1147:	78 58                	js     11a1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    1149:	83 ec 0c             	sub    $0xc,%esp
    114c:	68 7b 4d 00 00       	push   $0x4d7b
    1151:	e8 bc 37 00 00       	call   4912 <chdir>
    1156:	83 c4 10             	add    $0x10,%esp
    1159:	85 c0                	test   %eax,%eax
    115b:	0f 88 85 00 00 00    	js     11e6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    1161:	83 ec 0c             	sub    $0xc,%esp
    1164:	68 78 4d 00 00       	push   $0x4d78
    1169:	e8 84 37 00 00       	call   48f2 <unlink>
    116e:	83 c4 10             	add    $0x10,%esp
    1171:	85 c0                	test   %eax,%eax
    1173:	78 5a                	js     11cf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    1175:	83 ec 0c             	sub    $0xc,%esp
    1178:	68 9d 4d 00 00       	push   $0x4d9d
    117d:	e8 90 37 00 00       	call   4912 <chdir>
    1182:	83 c4 10             	add    $0x10,%esp
    1185:	85 c0                	test   %eax,%eax
    1187:	78 2f                	js     11b8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
    1189:	83 ec 08             	sub    $0x8,%esp
    118c:	68 20 4e 00 00       	push   $0x4e20
    1191:	ff 35 28 6e 00 00    	pushl  0x6e28
    1197:	e8 64 38 00 00       	call   4a00 <printf>
}
    119c:	83 c4 10             	add    $0x10,%esp
    119f:	c9                   	leave  
    11a0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    11a1:	50                   	push   %eax
    11a2:	50                   	push   %eax
    11a3:	68 54 4d 00 00       	push   $0x4d54
    11a8:	ff 35 28 6e 00 00    	pushl  0x6e28
    11ae:	e8 4d 38 00 00       	call   4a00 <printf>
    exit();
    11b3:	e8 ea 36 00 00       	call   48a2 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
    11b8:	50                   	push   %eax
    11b9:	50                   	push   %eax
    11ba:	68 9f 4d 00 00       	push   $0x4d9f
    11bf:	ff 35 28 6e 00 00    	pushl  0x6e28
    11c5:	e8 36 38 00 00       	call   4a00 <printf>
    exit();
    11ca:	e8 d3 36 00 00       	call   48a2 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    11cf:	52                   	push   %edx
    11d0:	52                   	push   %edx
    11d1:	68 83 4d 00 00       	push   $0x4d83
    11d6:	ff 35 28 6e 00 00    	pushl  0x6e28
    11dc:	e8 1f 38 00 00       	call   4a00 <printf>
    exit();
    11e1:	e8 bc 36 00 00       	call   48a2 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    11e6:	51                   	push   %ecx
    11e7:	51                   	push   %ecx
    11e8:	68 62 4d 00 00       	push   $0x4d62
    11ed:	ff 35 28 6e 00 00    	pushl  0x6e28
    11f3:	e8 08 38 00 00       	call   4a00 <printf>
    exit();
    11f8:	e8 a5 36 00 00       	call   48a2 <exit>
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
    1206:	68 af 4d 00 00       	push   $0x4daf
    120b:	ff 35 28 6e 00 00    	pushl  0x6e28
    1211:	e8 ea 37 00 00       	call   4a00 <printf>

  pid = fork();
    1216:	e8 7f 36 00 00       	call   489a <fork>
  if(pid < 0){
    121b:	83 c4 10             	add    $0x10,%esp
    121e:	85 c0                	test   %eax,%eax
    1220:	0f 88 82 00 00 00    	js     12a8 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    1226:	75 48                	jne    1270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
    1228:	83 ec 0c             	sub    $0xc,%esp
    122b:	68 7b 4d 00 00       	push   $0x4d7b
    1230:	e8 d5 36 00 00       	call   490a <mkdir>
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	85 c0                	test   %eax,%eax
    123a:	0f 88 96 00 00 00    	js     12d6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
    1240:	83 ec 0c             	sub    $0xc,%esp
    1243:	68 7b 4d 00 00       	push   $0x4d7b
    1248:	e8 c5 36 00 00       	call   4912 <chdir>
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	78 6b                	js     12bf <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
    1254:	83 ec 0c             	sub    $0xc,%esp
    1257:	68 78 4d 00 00       	push   $0x4d78
    125c:	e8 91 36 00 00       	call   48f2 <unlink>
    1261:	83 c4 10             	add    $0x10,%esp
    1264:	85 c0                	test   %eax,%eax
    1266:	78 28                	js     1290 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
    1268:	e8 35 36 00 00       	call   48a2 <exit>
    126d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
    1270:	e8 35 36 00 00       	call   48aa <wait>
  printf(stdout, "exitiput test ok\n");
    1275:	83 ec 08             	sub    $0x8,%esp
    1278:	68 d2 4d 00 00       	push   $0x4dd2
    127d:	ff 35 28 6e 00 00    	pushl  0x6e28
    1283:	e8 78 37 00 00       	call   4a00 <printf>
}
    1288:	83 c4 10             	add    $0x10,%esp
    128b:	c9                   	leave  
    128c:	c3                   	ret    
    128d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
    1290:	83 ec 08             	sub    $0x8,%esp
    1293:	68 83 4d 00 00       	push   $0x4d83
    1298:	ff 35 28 6e 00 00    	pushl  0x6e28
    129e:	e8 5d 37 00 00       	call   4a00 <printf>
      exit();
    12a3:	e8 fa 35 00 00       	call   48a2 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
    12a8:	51                   	push   %ecx
    12a9:	51                   	push   %ecx
    12aa:	68 95 5c 00 00       	push   $0x5c95
    12af:	ff 35 28 6e 00 00    	pushl  0x6e28
    12b5:	e8 46 37 00 00       	call   4a00 <printf>
    exit();
    12ba:	e8 e3 35 00 00       	call   48a2 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
    12bf:	50                   	push   %eax
    12c0:	50                   	push   %eax
    12c1:	68 be 4d 00 00       	push   $0x4dbe
    12c6:	ff 35 28 6e 00 00    	pushl  0x6e28
    12cc:	e8 2f 37 00 00       	call   4a00 <printf>
      exit();
    12d1:	e8 cc 35 00 00       	call   48a2 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
    12d6:	52                   	push   %edx
    12d7:	52                   	push   %edx
    12d8:	68 54 4d 00 00       	push   $0x4d54
    12dd:	ff 35 28 6e 00 00    	pushl  0x6e28
    12e3:	e8 18 37 00 00       	call   4a00 <printf>
      exit();
    12e8:	e8 b5 35 00 00       	call   48a2 <exit>
    12ed:	8d 76 00             	lea    0x0(%esi),%esi

000012f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
    12f6:	68 e4 4d 00 00       	push   $0x4de4
    12fb:	ff 35 28 6e 00 00    	pushl  0x6e28
    1301:	e8 fa 36 00 00       	call   4a00 <printf>
  if(mkdir("oidir") < 0){
    1306:	c7 04 24 f3 4d 00 00 	movl   $0x4df3,(%esp)
    130d:	e8 f8 35 00 00       	call   490a <mkdir>
    1312:	83 c4 10             	add    $0x10,%esp
    1315:	85 c0                	test   %eax,%eax
    1317:	0f 88 88 00 00 00    	js     13a5 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
    131d:	e8 78 35 00 00       	call   489a <fork>
  if(pid < 0){
    1322:	85 c0                	test   %eax,%eax
    1324:	0f 88 92 00 00 00    	js     13bc <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    132a:	75 34                	jne    1360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
    132c:	83 ec 08             	sub    $0x8,%esp
    132f:	6a 02                	push   $0x2
    1331:	68 f3 4d 00 00       	push   $0x4df3
    1336:	e8 a7 35 00 00       	call   48e2 <open>
    if(fd >= 0){
    133b:	83 c4 10             	add    $0x10,%esp
    133e:	85 c0                	test   %eax,%eax
    1340:	78 5e                	js     13a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
    1342:	83 ec 08             	sub    $0x8,%esp
    1345:	68 78 5d 00 00       	push   $0x5d78
    134a:	ff 35 28 6e 00 00    	pushl  0x6e28
    1350:	e8 ab 36 00 00       	call   4a00 <printf>
      exit();
    1355:	e8 48 35 00 00       	call   48a2 <exit>
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
    1360:	83 ec 0c             	sub    $0xc,%esp
    1363:	6a 01                	push   $0x1
    1365:	e8 c8 35 00 00       	call   4932 <sleep>
  if(unlink("oidir") != 0){
    136a:	c7 04 24 f3 4d 00 00 	movl   $0x4df3,(%esp)
    1371:	e8 7c 35 00 00       	call   48f2 <unlink>
    1376:	83 c4 10             	add    $0x10,%esp
    1379:	85 c0                	test   %eax,%eax
    137b:	75 56                	jne    13d3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
    137d:	e8 28 35 00 00       	call   48aa <wait>
  printf(stdout, "openiput test ok\n");
    1382:	83 ec 08             	sub    $0x8,%esp
    1385:	68 1c 4e 00 00       	push   $0x4e1c
    138a:	ff 35 28 6e 00 00    	pushl  0x6e28
    1390:	e8 6b 36 00 00       	call   4a00 <printf>
    1395:	83 c4 10             	add    $0x10,%esp
}
    1398:	c9                   	leave  
    1399:	c3                   	ret    
    139a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
    13a0:	e8 fd 34 00 00       	call   48a2 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
    13a5:	51                   	push   %ecx
    13a6:	51                   	push   %ecx
    13a7:	68 f9 4d 00 00       	push   $0x4df9
    13ac:	ff 35 28 6e 00 00    	pushl  0x6e28
    13b2:	e8 49 36 00 00       	call   4a00 <printf>
    exit();
    13b7:	e8 e6 34 00 00       	call   48a2 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
    13bc:	52                   	push   %edx
    13bd:	52                   	push   %edx
    13be:	68 95 5c 00 00       	push   $0x5c95
    13c3:	ff 35 28 6e 00 00    	pushl  0x6e28
    13c9:	e8 32 36 00 00       	call   4a00 <printf>
    exit();
    13ce:	e8 cf 34 00 00       	call   48a2 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
    13d3:	50                   	push   %eax
    13d4:	50                   	push   %eax
    13d5:	68 0d 4e 00 00       	push   $0x4e0d
    13da:	ff 35 28 6e 00 00    	pushl  0x6e28
    13e0:	e8 1b 36 00 00       	call   4a00 <printf>
    exit();
    13e5:	e8 b8 34 00 00       	call   48a2 <exit>
    13ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013f0 <opentest>:

// simple file system tests

void
opentest(void)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
    13f6:	68 2e 4e 00 00       	push   $0x4e2e
    13fb:	ff 35 28 6e 00 00    	pushl  0x6e28
    1401:	e8 fa 35 00 00       	call   4a00 <printf>
  fd = open("echo", 0);
    1406:	58                   	pop    %eax
    1407:	5a                   	pop    %edx
    1408:	6a 00                	push   $0x0
    140a:	68 39 4e 00 00       	push   $0x4e39
    140f:	e8 ce 34 00 00       	call   48e2 <open>
  if(fd < 0){
    1414:	83 c4 10             	add    $0x10,%esp
    1417:	85 c0                	test   %eax,%eax
    1419:	78 36                	js     1451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
    141b:	83 ec 0c             	sub    $0xc,%esp
    141e:	50                   	push   %eax
    141f:	e8 a6 34 00 00       	call   48ca <close>
  fd = open("doesnotexist", 0);
    1424:	5a                   	pop    %edx
    1425:	59                   	pop    %ecx
    1426:	6a 00                	push   $0x0
    1428:	68 51 4e 00 00       	push   $0x4e51
    142d:	e8 b0 34 00 00       	call   48e2 <open>
  if(fd >= 0){
    1432:	83 c4 10             	add    $0x10,%esp
    1435:	85 c0                	test   %eax,%eax
    1437:	79 2f                	jns    1468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
    1439:	83 ec 08             	sub    $0x8,%esp
    143c:	68 7c 4e 00 00       	push   $0x4e7c
    1441:	ff 35 28 6e 00 00    	pushl  0x6e28
    1447:	e8 b4 35 00 00       	call   4a00 <printf>
}
    144c:	83 c4 10             	add    $0x10,%esp
    144f:	c9                   	leave  
    1450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
    1451:	50                   	push   %eax
    1452:	50                   	push   %eax
    1453:	68 3e 4e 00 00       	push   $0x4e3e
    1458:	ff 35 28 6e 00 00    	pushl  0x6e28
    145e:	e8 9d 35 00 00       	call   4a00 <printf>
    exit();
    1463:	e8 3a 34 00 00       	call   48a2 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
    1468:	50                   	push   %eax
    1469:	50                   	push   %eax
    146a:	68 5e 4e 00 00       	push   $0x4e5e
    146f:	ff 35 28 6e 00 00    	pushl  0x6e28
    1475:	e8 86 35 00 00       	call   4a00 <printf>
    exit();
    147a:	e8 23 34 00 00       	call   48a2 <exit>
    147f:	90                   	nop

00001480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	56                   	push   %esi
    1484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
    1485:	83 ec 08             	sub    $0x8,%esp
    1488:	68 8a 4e 00 00       	push   $0x4e8a
    148d:	ff 35 28 6e 00 00    	pushl  0x6e28
    1493:	e8 68 35 00 00       	call   4a00 <printf>
  fd = open("small", O_CREATE|O_RDWR);
    1498:	59                   	pop    %ecx
    1499:	5b                   	pop    %ebx
    149a:	68 02 02 00 00       	push   $0x202
    149f:	68 9b 4e 00 00       	push   $0x4e9b
    14a4:	e8 39 34 00 00       	call   48e2 <open>
  if(fd >= 0){
    14a9:	83 c4 10             	add    $0x10,%esp
    14ac:	85 c0                	test   %eax,%eax
    14ae:	0f 88 8b 01 00 00    	js     163f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
    14b4:	83 ec 08             	sub    $0x8,%esp
    14b7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    14b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
    14bb:	68 a1 4e 00 00       	push   $0x4ea1
    14c0:	ff 35 28 6e 00 00    	pushl  0x6e28
    14c6:	e8 35 35 00 00       	call   4a00 <printf>
    14cb:	83 c4 10             	add    $0x10,%esp
    14ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
    14d0:	83 ec 04             	sub    $0x4,%esp
    14d3:	6a 0a                	push   $0xa
    14d5:	68 d8 4e 00 00       	push   $0x4ed8
    14da:	56                   	push   %esi
    14db:	e8 e2 33 00 00       	call   48c2 <write>
    14e0:	83 c4 10             	add    $0x10,%esp
    14e3:	83 f8 0a             	cmp    $0xa,%eax
    14e6:	0f 85 d9 00 00 00    	jne    15c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
    14ec:	83 ec 04             	sub    $0x4,%esp
    14ef:	6a 0a                	push   $0xa
    14f1:	68 e3 4e 00 00       	push   $0x4ee3
    14f6:	56                   	push   %esi
    14f7:	e8 c6 33 00 00       	call   48c2 <write>
    14fc:	83 c4 10             	add    $0x10,%esp
    14ff:	83 f8 0a             	cmp    $0xa,%eax
    1502:	0f 85 d6 00 00 00    	jne    15de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    1508:	83 c3 01             	add    $0x1,%ebx
    150b:	83 fb 64             	cmp    $0x64,%ebx
    150e:	75 c0                	jne    14d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
    1510:	83 ec 08             	sub    $0x8,%esp
    1513:	68 ee 4e 00 00       	push   $0x4eee
    1518:	ff 35 28 6e 00 00    	pushl  0x6e28
    151e:	e8 dd 34 00 00       	call   4a00 <printf>
  close(fd);
    1523:	89 34 24             	mov    %esi,(%esp)
    1526:	e8 9f 33 00 00       	call   48ca <close>
  fd = open("small", O_RDONLY);
    152b:	58                   	pop    %eax
    152c:	5a                   	pop    %edx
    152d:	6a 00                	push   $0x0
    152f:	68 9b 4e 00 00       	push   $0x4e9b
    1534:	e8 a9 33 00 00       	call   48e2 <open>
  if(fd >= 0){
    1539:	83 c4 10             	add    $0x10,%esp
    153c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
    153e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
    1540:	0f 88 b1 00 00 00    	js     15f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
    1546:	83 ec 08             	sub    $0x8,%esp
    1549:	68 f9 4e 00 00       	push   $0x4ef9
    154e:	ff 35 28 6e 00 00    	pushl  0x6e28
    1554:	e8 a7 34 00 00       	call   4a00 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
    1559:	83 c4 0c             	add    $0xc,%esp
    155c:	68 d0 07 00 00       	push   $0x7d0
    1561:	68 00 96 00 00       	push   $0x9600
    1566:	53                   	push   %ebx
    1567:	e8 4e 33 00 00       	call   48ba <read>
  if(i == 2000){
    156c:	83 c4 10             	add    $0x10,%esp
    156f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    1574:	0f 85 95 00 00 00    	jne    160f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
    157a:	83 ec 08             	sub    $0x8,%esp
    157d:	68 2d 4f 00 00       	push   $0x4f2d
    1582:	ff 35 28 6e 00 00    	pushl  0x6e28
    1588:	e8 73 34 00 00       	call   4a00 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
    158d:	89 1c 24             	mov    %ebx,(%esp)
    1590:	e8 35 33 00 00       	call   48ca <close>

  if(unlink("small") < 0){
    1595:	c7 04 24 9b 4e 00 00 	movl   $0x4e9b,(%esp)
    159c:	e8 51 33 00 00       	call   48f2 <unlink>
    15a1:	83 c4 10             	add    $0x10,%esp
    15a4:	85 c0                	test   %eax,%eax
    15a6:	78 7f                	js     1627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
    15a8:	83 ec 08             	sub    $0x8,%esp
    15ab:	68 55 4f 00 00       	push   $0x4f55
    15b0:	ff 35 28 6e 00 00    	pushl  0x6e28
    15b6:	e8 45 34 00 00       	call   4a00 <printf>
}
    15bb:	83 c4 10             	add    $0x10,%esp
    15be:	8d 65 f8             	lea    -0x8(%ebp),%esp
    15c1:	5b                   	pop    %ebx
    15c2:	5e                   	pop    %esi
    15c3:	5d                   	pop    %ebp
    15c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
    15c5:	83 ec 04             	sub    $0x4,%esp
    15c8:	53                   	push   %ebx
    15c9:	68 9c 5d 00 00       	push   $0x5d9c
    15ce:	ff 35 28 6e 00 00    	pushl  0x6e28
    15d4:	e8 27 34 00 00       	call   4a00 <printf>
      exit();
    15d9:	e8 c4 32 00 00       	call   48a2 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
    15de:	83 ec 04             	sub    $0x4,%esp
    15e1:	53                   	push   %ebx
    15e2:	68 c0 5d 00 00       	push   $0x5dc0
    15e7:	ff 35 28 6e 00 00    	pushl  0x6e28
    15ed:	e8 0e 34 00 00       	call   4a00 <printf>
      exit();
    15f2:	e8 ab 32 00 00       	call   48a2 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
    15f7:	83 ec 08             	sub    $0x8,%esp
    15fa:	68 12 4f 00 00       	push   $0x4f12
    15ff:	ff 35 28 6e 00 00    	pushl  0x6e28
    1605:	e8 f6 33 00 00       	call   4a00 <printf>
    exit();
    160a:	e8 93 32 00 00       	call   48a2 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
    160f:	83 ec 08             	sub    $0x8,%esp
    1612:	68 59 52 00 00       	push   $0x5259
    1617:	ff 35 28 6e 00 00    	pushl  0x6e28
    161d:	e8 de 33 00 00       	call   4a00 <printf>
    exit();
    1622:	e8 7b 32 00 00       	call   48a2 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
    1627:	83 ec 08             	sub    $0x8,%esp
    162a:	68 40 4f 00 00       	push   $0x4f40
    162f:	ff 35 28 6e 00 00    	pushl  0x6e28
    1635:	e8 c6 33 00 00       	call   4a00 <printf>
    exit();
    163a:	e8 63 32 00 00       	call   48a2 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    163f:	83 ec 08             	sub    $0x8,%esp
    1642:	68 bc 4e 00 00       	push   $0x4ebc
    1647:	ff 35 28 6e 00 00    	pushl  0x6e28
    164d:	e8 ae 33 00 00       	call   4a00 <printf>
    exit();
    1652:	e8 4b 32 00 00       	call   48a2 <exit>
    1657:	89 f6                	mov    %esi,%esi
    1659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	56                   	push   %esi
    1664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
    1665:	83 ec 08             	sub    $0x8,%esp
    1668:	68 69 4f 00 00       	push   $0x4f69
    166d:	ff 35 28 6e 00 00    	pushl  0x6e28
    1673:	e8 88 33 00 00       	call   4a00 <printf>

  fd = open("big", O_CREATE|O_RDWR);
    1678:	59                   	pop    %ecx
    1679:	5b                   	pop    %ebx
    167a:	68 02 02 00 00       	push   $0x202
    167f:	68 e3 4f 00 00       	push   $0x4fe3
    1684:	e8 59 32 00 00       	call   48e2 <open>
  if(fd < 0){
    1689:	83 c4 10             	add    $0x10,%esp
    168c:	85 c0                	test   %eax,%eax
    168e:	0f 88 64 01 00 00    	js     17f8 <writetest1+0x198>
    1694:	89 c6                	mov    %eax,%esi
    1696:	31 db                	xor    %ebx,%ebx
    1698:	90                   	nop
    1699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
    16a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    16a3:	89 1d 00 96 00 00    	mov    %ebx,0x9600
    if(write(fd, buf, 512) != 512){
    16a9:	68 00 02 00 00       	push   $0x200
    16ae:	68 00 96 00 00       	push   $0x9600
    16b3:	56                   	push   %esi
    16b4:	e8 09 32 00 00       	call   48c2 <write>
    16b9:	83 c4 10             	add    $0x10,%esp
    16bc:	3d 00 02 00 00       	cmp    $0x200,%eax
    16c1:	0f 85 b3 00 00 00    	jne    177a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    16c7:	83 c3 01             	add    $0x1,%ebx
    16ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
    16d0:	75 ce                	jne    16a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
    16d2:	83 ec 0c             	sub    $0xc,%esp
    16d5:	56                   	push   %esi
    16d6:	e8 ef 31 00 00       	call   48ca <close>

  fd = open("big", O_RDONLY);
    16db:	58                   	pop    %eax
    16dc:	5a                   	pop    %edx
    16dd:	6a 00                	push   $0x0
    16df:	68 e3 4f 00 00       	push   $0x4fe3
    16e4:	e8 f9 31 00 00       	call   48e2 <open>
  if(fd < 0){
    16e9:	83 c4 10             	add    $0x10,%esp
    16ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
    16ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    16f0:	0f 88 ea 00 00 00    	js     17e0 <writetest1+0x180>
    16f6:	31 db                	xor    %ebx,%ebx
    16f8:	eb 1d                	jmp    1717 <writetest1+0xb7>
    16fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
    1700:	3d 00 02 00 00       	cmp    $0x200,%eax
    1705:	0f 85 9f 00 00 00    	jne    17aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
    170b:	a1 00 96 00 00       	mov    0x9600,%eax
    1710:	39 c3                	cmp    %eax,%ebx
    1712:	75 7f                	jne    1793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
    1714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    1717:	83 ec 04             	sub    $0x4,%esp
    171a:	68 00 02 00 00       	push   $0x200
    171f:	68 00 96 00 00       	push   $0x9600
    1724:	56                   	push   %esi
    1725:	e8 90 31 00 00       	call   48ba <read>
    if(i == 0){
    172a:	83 c4 10             	add    $0x10,%esp
    172d:	85 c0                	test   %eax,%eax
    172f:	75 cf                	jne    1700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
    1731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
    1737:	0f 84 86 00 00 00    	je     17c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
    173d:	83 ec 0c             	sub    $0xc,%esp
    1740:	56                   	push   %esi
    1741:	e8 84 31 00 00       	call   48ca <close>
  if(unlink("big") < 0){
    1746:	c7 04 24 e3 4f 00 00 	movl   $0x4fe3,(%esp)
    174d:	e8 a0 31 00 00       	call   48f2 <unlink>
    1752:	83 c4 10             	add    $0x10,%esp
    1755:	85 c0                	test   %eax,%eax
    1757:	0f 88 b3 00 00 00    	js     1810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
    175d:	83 ec 08             	sub    $0x8,%esp
    1760:	68 0a 50 00 00       	push   $0x500a
    1765:	ff 35 28 6e 00 00    	pushl  0x6e28
    176b:	e8 90 32 00 00       	call   4a00 <printf>
}
    1770:	83 c4 10             	add    $0x10,%esp
    1773:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1776:	5b                   	pop    %ebx
    1777:	5e                   	pop    %esi
    1778:	5d                   	pop    %ebp
    1779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
    177a:	83 ec 04             	sub    $0x4,%esp
    177d:	53                   	push   %ebx
    177e:	68 93 4f 00 00       	push   $0x4f93
    1783:	ff 35 28 6e 00 00    	pushl  0x6e28
    1789:	e8 72 32 00 00       	call   4a00 <printf>
      exit();
    178e:	e8 0f 31 00 00       	call   48a2 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
    1793:	50                   	push   %eax
    1794:	53                   	push   %ebx
    1795:	68 e4 5d 00 00       	push   $0x5de4
    179a:	ff 35 28 6e 00 00    	pushl  0x6e28
    17a0:	e8 5b 32 00 00       	call   4a00 <printf>
             n, ((int*)buf)[0]);
      exit();
    17a5:	e8 f8 30 00 00       	call   48a2 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
    17aa:	83 ec 04             	sub    $0x4,%esp
    17ad:	50                   	push   %eax
    17ae:	68 e7 4f 00 00       	push   $0x4fe7
    17b3:	ff 35 28 6e 00 00    	pushl  0x6e28
    17b9:	e8 42 32 00 00       	call   4a00 <printf>
      exit();
    17be:	e8 df 30 00 00       	call   48a2 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
    17c3:	83 ec 04             	sub    $0x4,%esp
    17c6:	68 8b 00 00 00       	push   $0x8b
    17cb:	68 ca 4f 00 00       	push   $0x4fca
    17d0:	ff 35 28 6e 00 00    	pushl  0x6e28
    17d6:	e8 25 32 00 00       	call   4a00 <printf>
        exit();
    17db:	e8 c2 30 00 00       	call   48a2 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
    17e0:	83 ec 08             	sub    $0x8,%esp
    17e3:	68 b1 4f 00 00       	push   $0x4fb1
    17e8:	ff 35 28 6e 00 00    	pushl  0x6e28
    17ee:	e8 0d 32 00 00       	call   4a00 <printf>
    exit();
    17f3:	e8 aa 30 00 00       	call   48a2 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    17f8:	83 ec 08             	sub    $0x8,%esp
    17fb:	68 79 4f 00 00       	push   $0x4f79
    1800:	ff 35 28 6e 00 00    	pushl  0x6e28
    1806:	e8 f5 31 00 00       	call   4a00 <printf>
    exit();
    180b:	e8 92 30 00 00       	call   48a2 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
    1810:	83 ec 08             	sub    $0x8,%esp
    1813:	68 f7 4f 00 00       	push   $0x4ff7
    1818:	ff 35 28 6e 00 00    	pushl  0x6e28
    181e:	e8 dd 31 00 00       	call   4a00 <printf>
    exit();
    1823:	e8 7a 30 00 00       	call   48a2 <exit>
    1828:	90                   	nop
    1829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
    1830:	55                   	push   %ebp
    1831:	89 e5                	mov    %esp,%ebp
    1833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
    1834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
    1839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
    183c:	68 04 5e 00 00       	push   $0x5e04
    1841:	ff 35 28 6e 00 00    	pushl  0x6e28
    1847:	e8 b4 31 00 00       	call   4a00 <printf>

  name[0] = 'a';
    184c:	c6 05 00 b6 00 00 61 	movb   $0x61,0xb600
  name[2] = '\0';
    1853:	c6 05 02 b6 00 00 00 	movb   $0x0,0xb602
    185a:	83 c4 10             	add    $0x10,%esp
    185d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    1860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    1863:	88 1d 01 b6 00 00    	mov    %bl,0xb601
    1869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
    186c:	68 02 02 00 00       	push   $0x202
    1871:	68 00 b6 00 00       	push   $0xb600
    1876:	e8 67 30 00 00       	call   48e2 <open>
    close(fd);
    187b:	89 04 24             	mov    %eax,(%esp)
    187e:	e8 47 30 00 00       	call   48ca <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    1883:	83 c4 10             	add    $0x10,%esp
    1886:	80 fb 64             	cmp    $0x64,%bl
    1889:	75 d5                	jne    1860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
    188b:	c6 05 00 b6 00 00 61 	movb   $0x61,0xb600
  name[2] = '\0';
    1892:	c6 05 02 b6 00 00 00 	movb   $0x0,0xb602
    1899:	bb 30 00 00 00       	mov    $0x30,%ebx
    189e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
    18a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    18a3:	88 1d 01 b6 00 00    	mov    %bl,0xb601
    18a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
    18ac:	68 00 b6 00 00       	push   $0xb600
    18b1:	e8 3c 30 00 00       	call   48f2 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    18b6:	83 c4 10             	add    $0x10,%esp
    18b9:	80 fb 64             	cmp    $0x64,%bl
    18bc:	75 e2                	jne    18a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
    18be:	83 ec 08             	sub    $0x8,%esp
    18c1:	68 2c 5e 00 00       	push   $0x5e2c
    18c6:	ff 35 28 6e 00 00    	pushl  0x6e28
    18cc:	e8 2f 31 00 00       	call   4a00 <printf>
}
    18d1:	83 c4 10             	add    $0x10,%esp
    18d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    18d7:	c9                   	leave  
    18d8:	c3                   	ret    
    18d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000018e0 <dirtest>:

void dirtest(void)
{
    18e0:	55                   	push   %ebp
    18e1:	89 e5                	mov    %esp,%ebp
    18e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
    18e6:	68 18 50 00 00       	push   $0x5018
    18eb:	ff 35 28 6e 00 00    	pushl  0x6e28
    18f1:	e8 0a 31 00 00       	call   4a00 <printf>

  if(mkdir("dir0") < 0){
    18f6:	c7 04 24 24 50 00 00 	movl   $0x5024,(%esp)
    18fd:	e8 08 30 00 00       	call   490a <mkdir>
    1902:	83 c4 10             	add    $0x10,%esp
    1905:	85 c0                	test   %eax,%eax
    1907:	78 58                	js     1961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    1909:	83 ec 0c             	sub    $0xc,%esp
    190c:	68 24 50 00 00       	push   $0x5024
    1911:	e8 fc 2f 00 00       	call   4912 <chdir>
    1916:	83 c4 10             	add    $0x10,%esp
    1919:	85 c0                	test   %eax,%eax
    191b:	0f 88 85 00 00 00    	js     19a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    1921:	83 ec 0c             	sub    $0xc,%esp
    1924:	68 c9 55 00 00       	push   $0x55c9
    1929:	e8 e4 2f 00 00       	call   4912 <chdir>
    192e:	83 c4 10             	add    $0x10,%esp
    1931:	85 c0                	test   %eax,%eax
    1933:	78 5a                	js     198f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    1935:	83 ec 0c             	sub    $0xc,%esp
    1938:	68 24 50 00 00       	push   $0x5024
    193d:	e8 b0 2f 00 00       	call   48f2 <unlink>
    1942:	83 c4 10             	add    $0x10,%esp
    1945:	85 c0                	test   %eax,%eax
    1947:	78 2f                	js     1978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
    1949:	83 ec 08             	sub    $0x8,%esp
    194c:	68 61 50 00 00       	push   $0x5061
    1951:	ff 35 28 6e 00 00    	pushl  0x6e28
    1957:	e8 a4 30 00 00       	call   4a00 <printf>
}
    195c:	83 c4 10             	add    $0x10,%esp
    195f:	c9                   	leave  
    1960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
    1961:	50                   	push   %eax
    1962:	50                   	push   %eax
    1963:	68 54 4d 00 00       	push   $0x4d54
    1968:	ff 35 28 6e 00 00    	pushl  0x6e28
    196e:	e8 8d 30 00 00       	call   4a00 <printf>
    exit();
    1973:	e8 2a 2f 00 00       	call   48a2 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
    1978:	50                   	push   %eax
    1979:	50                   	push   %eax
    197a:	68 4d 50 00 00       	push   $0x504d
    197f:	ff 35 28 6e 00 00    	pushl  0x6e28
    1985:	e8 76 30 00 00       	call   4a00 <printf>
    exit();
    198a:	e8 13 2f 00 00       	call   48a2 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
    198f:	52                   	push   %edx
    1990:	52                   	push   %edx
    1991:	68 3c 50 00 00       	push   $0x503c
    1996:	ff 35 28 6e 00 00    	pushl  0x6e28
    199c:	e8 5f 30 00 00       	call   4a00 <printf>
    exit();
    19a1:	e8 fc 2e 00 00       	call   48a2 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
    19a6:	51                   	push   %ecx
    19a7:	51                   	push   %ecx
    19a8:	68 29 50 00 00       	push   $0x5029
    19ad:	ff 35 28 6e 00 00    	pushl  0x6e28
    19b3:	e8 48 30 00 00       	call   4a00 <printf>
    exit();
    19b8:	e8 e5 2e 00 00       	call   48a2 <exit>
    19bd:	8d 76 00             	lea    0x0(%esi),%esi

000019c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
    19c6:	68 70 50 00 00       	push   $0x5070
    19cb:	ff 35 28 6e 00 00    	pushl  0x6e28
    19d1:	e8 2a 30 00 00       	call   4a00 <printf>
  if(exec("echo", echoargv) < 0){
    19d6:	5a                   	pop    %edx
    19d7:	59                   	pop    %ecx
    19d8:	68 2c 6e 00 00       	push   $0x6e2c
    19dd:	68 39 4e 00 00       	push   $0x4e39
    19e2:	e8 f3 2e 00 00       	call   48da <exec>
    19e7:	83 c4 10             	add    $0x10,%esp
    19ea:	85 c0                	test   %eax,%eax
    19ec:	78 02                	js     19f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
    19ee:	c9                   	leave  
    19ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
    19f0:	50                   	push   %eax
    19f1:	50                   	push   %eax
    19f2:	68 7b 50 00 00       	push   $0x507b
    19f7:	ff 35 28 6e 00 00    	pushl  0x6e28
    19fd:	e8 fe 2f 00 00       	call   4a00 <printf>
    exit();
    1a02:	e8 9b 2e 00 00       	call   48a2 <exit>
    1a07:	89 f6                	mov    %esi,%esi
    1a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
    1a10:	55                   	push   %ebp
    1a11:	89 e5                	mov    %esp,%ebp
    1a13:	57                   	push   %edi
    1a14:	56                   	push   %esi
    1a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    1a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
    1a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    1a1c:	50                   	push   %eax
    1a1d:	e8 90 2e 00 00       	call   48b2 <pipe>
    1a22:	83 c4 10             	add    $0x10,%esp
    1a25:	85 c0                	test   %eax,%eax
    1a27:	0f 85 35 01 00 00    	jne    1b62 <pipe1+0x152>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
    1a2d:	e8 68 2e 00 00       	call   489a <fork>
  seq = 0;
  if(pid == 0){
    1a32:	83 f8 00             	cmp    $0x0,%eax
    1a35:	0f 84 86 00 00 00    	je     1ac1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    1a3b:	0f 8e 35 01 00 00    	jle    1b76 <pipe1+0x166>
    close(fds[1]);
    1a41:	83 ec 0c             	sub    $0xc,%esp
    1a44:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
    1a47:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
    1a4c:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    1a4e:	e8 77 2e 00 00       	call   48ca <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
    1a53:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    1a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
    1a5d:	83 ec 04             	sub    $0x4,%esp
    1a60:	57                   	push   %edi
    1a61:	68 00 96 00 00       	push   $0x9600
    1a66:	ff 75 e0             	pushl  -0x20(%ebp)
    1a69:	e8 4c 2e 00 00       	call   48ba <read>
    1a6e:	83 c4 10             	add    $0x10,%esp
    1a71:	85 c0                	test   %eax,%eax
    1a73:	0f 8e a3 00 00 00    	jle    1b1c <pipe1+0x10c>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1a79:	89 d9                	mov    %ebx,%ecx
    1a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
    1a7e:	f7 d9                	neg    %ecx
    1a80:	38 9c 0b 00 96 00 00 	cmp    %bl,0x9600(%ebx,%ecx,1)
    1a87:	8d 53 01             	lea    0x1(%ebx),%edx
    1a8a:	75 1b                	jne    1aa7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
    1a8c:	39 f2                	cmp    %esi,%edx
    1a8e:	89 d3                	mov    %edx,%ebx
    1a90:	75 ee                	jne    1a80 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
    1a92:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
    1a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
    1a97:	b8 00 20 00 00       	mov    $0x2000,%eax
    1a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
    1aa2:	0f 4f f8             	cmovg  %eax,%edi
    1aa5:	eb b6                	jmp    1a5d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
    1aa7:	83 ec 08             	sub    $0x8,%esp
    1aaa:	68 aa 50 00 00       	push   $0x50aa
    1aaf:	6a 01                	push   $0x1
    1ab1:	e8 4a 2f 00 00       	call   4a00 <printf>
          return;
    1ab6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
    1ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1abc:	5b                   	pop    %ebx
    1abd:	5e                   	pop    %esi
    1abe:	5f                   	pop    %edi
    1abf:	5d                   	pop    %ebp
    1ac0:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    1ac1:	83 ec 0c             	sub    $0xc,%esp
    1ac4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
    1ac7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
    1ac9:	e8 fc 2d 00 00       	call   48ca <close>
    1ace:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
    1ad1:	89 f0                	mov    %esi,%eax
    1ad3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
    1ad9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
    1adb:	f7 d8                	neg    %eax
    1add:	8d 76 00             	lea    0x0(%esi),%esi
    1ae0:	88 9c 18 00 96 00 00 	mov    %bl,0x9600(%eax,%ebx,1)
    1ae7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
    1aea:	39 d3                	cmp    %edx,%ebx
    1aec:	75 f2                	jne    1ae0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
    1aee:	83 ec 04             	sub    $0x4,%esp
    1af1:	89 de                	mov    %ebx,%esi
    1af3:	68 09 04 00 00       	push   $0x409
    1af8:	68 00 96 00 00       	push   $0x9600
    1afd:	ff 75 e4             	pushl  -0x1c(%ebp)
    1b00:	e8 bd 2d 00 00       	call   48c2 <write>
    1b05:	83 c4 10             	add    $0x10,%esp
    1b08:	3d 09 04 00 00       	cmp    $0x409,%eax
    1b0d:	75 7b                	jne    1b8a <pipe1+0x17a>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
    1b0f:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
    1b15:	75 ba                	jne    1ad1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
    1b17:	e8 86 2d 00 00       	call   48a2 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
    1b1c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
    1b23:	75 26                	jne    1b4b <pipe1+0x13b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
    1b25:	83 ec 0c             	sub    $0xc,%esp
    1b28:	ff 75 e0             	pushl  -0x20(%ebp)
    1b2b:	e8 9a 2d 00 00       	call   48ca <close>
    wait();
    1b30:	e8 75 2d 00 00       	call   48aa <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
    1b35:	58                   	pop    %eax
    1b36:	5a                   	pop    %edx
    1b37:	68 cf 50 00 00       	push   $0x50cf
    1b3c:	6a 01                	push   $0x1
    1b3e:	e8 bd 2e 00 00       	call   4a00 <printf>
    1b43:	83 c4 10             	add    $0x10,%esp
    1b46:	e9 6e ff ff ff       	jmp    1ab9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
    1b4b:	83 ec 04             	sub    $0x4,%esp
    1b4e:	ff 75 d4             	pushl  -0x2c(%ebp)
    1b51:	68 b8 50 00 00       	push   $0x50b8
    1b56:	6a 01                	push   $0x1
    1b58:	e8 a3 2e 00 00       	call   4a00 <printf>
      exit();
    1b5d:	e8 40 2d 00 00       	call   48a2 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    1b62:	83 ec 08             	sub    $0x8,%esp
    1b65:	68 8d 50 00 00       	push   $0x508d
    1b6a:	6a 01                	push   $0x1
    1b6c:	e8 8f 2e 00 00       	call   4a00 <printf>
    exit();
    1b71:	e8 2c 2d 00 00       	call   48a2 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
    1b76:	83 ec 08             	sub    $0x8,%esp
    1b79:	68 d9 50 00 00       	push   $0x50d9
    1b7e:	6a 01                	push   $0x1
    1b80:	e8 7b 2e 00 00       	call   4a00 <printf>
    exit();
    1b85:	e8 18 2d 00 00       	call   48a2 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
    1b8a:	83 ec 08             	sub    $0x8,%esp
    1b8d:	68 9c 50 00 00       	push   $0x509c
    1b92:	6a 01                	push   $0x1
    1b94:	e8 67 2e 00 00       	call   4a00 <printf>
        exit();
    1b99:	e8 04 2d 00 00       	call   48a2 <exit>
    1b9e:	66 90                	xchg   %ax,%ax

00001ba0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
    1ba0:	55                   	push   %ebp
    1ba1:	89 e5                	mov    %esp,%ebp
    1ba3:	57                   	push   %edi
    1ba4:	56                   	push   %esi
    1ba5:	53                   	push   %ebx
    1ba6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
    1ba9:	68 e8 50 00 00       	push   $0x50e8
    1bae:	6a 01                	push   $0x1
    1bb0:	e8 4b 2e 00 00       	call   4a00 <printf>
  pid1 = fork();
    1bb5:	e8 e0 2c 00 00       	call   489a <fork>
  if(pid1 == 0)
    1bba:	83 c4 10             	add    $0x10,%esp
    1bbd:	85 c0                	test   %eax,%eax
    1bbf:	75 02                	jne    1bc3 <preempt+0x23>
    1bc1:	eb fe                	jmp    1bc1 <preempt+0x21>
    1bc3:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
    1bc5:	e8 d0 2c 00 00       	call   489a <fork>
  if(pid2 == 0)
    1bca:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
    1bcc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
    1bce:	75 02                	jne    1bd2 <preempt+0x32>
    1bd0:	eb fe                	jmp    1bd0 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
    1bd2:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1bd5:	83 ec 0c             	sub    $0xc,%esp
    1bd8:	50                   	push   %eax
    1bd9:	e8 d4 2c 00 00       	call   48b2 <pipe>
  pid3 = fork();
    1bde:	e8 b7 2c 00 00       	call   489a <fork>
  if(pid3 == 0){
    1be3:	83 c4 10             	add    $0x10,%esp
    1be6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
    1be8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
    1bea:	75 47                	jne    1c33 <preempt+0x93>
    close(pfds[0]);
    1bec:	83 ec 0c             	sub    $0xc,%esp
    1bef:	ff 75 e0             	pushl  -0x20(%ebp)
    1bf2:	e8 d3 2c 00 00       	call   48ca <close>
    if(write(pfds[1], "x", 1) != 1)
    1bf7:	83 c4 0c             	add    $0xc,%esp
    1bfa:	6a 01                	push   $0x1
    1bfc:	68 ad 56 00 00       	push   $0x56ad
    1c01:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c04:	e8 b9 2c 00 00       	call   48c2 <write>
    1c09:	83 c4 10             	add    $0x10,%esp
    1c0c:	83 f8 01             	cmp    $0x1,%eax
    1c0f:	74 12                	je     1c23 <preempt+0x83>
      printf(1, "preempt write error");
    1c11:	83 ec 08             	sub    $0x8,%esp
    1c14:	68 f2 50 00 00       	push   $0x50f2
    1c19:	6a 01                	push   $0x1
    1c1b:	e8 e0 2d 00 00       	call   4a00 <printf>
    1c20:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
    1c23:	83 ec 0c             	sub    $0xc,%esp
    1c26:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c29:	e8 9c 2c 00 00       	call   48ca <close>
    1c2e:	83 c4 10             	add    $0x10,%esp
    1c31:	eb fe                	jmp    1c31 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
    1c33:	83 ec 0c             	sub    $0xc,%esp
    1c36:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c39:	e8 8c 2c 00 00       	call   48ca <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    1c3e:	83 c4 0c             	add    $0xc,%esp
    1c41:	68 00 20 00 00       	push   $0x2000
    1c46:	68 00 96 00 00       	push   $0x9600
    1c4b:	ff 75 e0             	pushl  -0x20(%ebp)
    1c4e:	e8 67 2c 00 00       	call   48ba <read>
    1c53:	83 c4 10             	add    $0x10,%esp
    1c56:	83 f8 01             	cmp    $0x1,%eax
    1c59:	74 1a                	je     1c75 <preempt+0xd5>
    printf(1, "preempt read error");
    1c5b:	83 ec 08             	sub    $0x8,%esp
    1c5e:	68 06 51 00 00       	push   $0x5106
    1c63:	6a 01                	push   $0x1
    1c65:	e8 96 2d 00 00       	call   4a00 <printf>
    return;
    1c6a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
    1c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c70:	5b                   	pop    %ebx
    1c71:	5e                   	pop    %esi
    1c72:	5f                   	pop    %edi
    1c73:	5d                   	pop    %ebp
    1c74:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
    1c75:	83 ec 0c             	sub    $0xc,%esp
    1c78:	ff 75 e0             	pushl  -0x20(%ebp)
    1c7b:	e8 4a 2c 00 00       	call   48ca <close>
  printf(1, "kill... ");
    1c80:	58                   	pop    %eax
    1c81:	5a                   	pop    %edx
    1c82:	68 19 51 00 00       	push   $0x5119
    1c87:	6a 01                	push   $0x1
    1c89:	e8 72 2d 00 00       	call   4a00 <printf>
  kill(pid1);
    1c8e:	89 3c 24             	mov    %edi,(%esp)
    1c91:	e8 3c 2c 00 00       	call   48d2 <kill>
  kill(pid2);
    1c96:	89 34 24             	mov    %esi,(%esp)
    1c99:	e8 34 2c 00 00       	call   48d2 <kill>
  kill(pid3);
    1c9e:	89 1c 24             	mov    %ebx,(%esp)
    1ca1:	e8 2c 2c 00 00       	call   48d2 <kill>
  printf(1, "wait... ");
    1ca6:	59                   	pop    %ecx
    1ca7:	5b                   	pop    %ebx
    1ca8:	68 22 51 00 00       	push   $0x5122
    1cad:	6a 01                	push   $0x1
    1caf:	e8 4c 2d 00 00       	call   4a00 <printf>
  wait();
    1cb4:	e8 f1 2b 00 00       	call   48aa <wait>
  wait();
    1cb9:	e8 ec 2b 00 00       	call   48aa <wait>
  wait();
    1cbe:	e8 e7 2b 00 00       	call   48aa <wait>
  printf(1, "preempt ok\n");
    1cc3:	5e                   	pop    %esi
    1cc4:	5f                   	pop    %edi
    1cc5:	68 2b 51 00 00       	push   $0x512b
    1cca:	6a 01                	push   $0x1
    1ccc:	e8 2f 2d 00 00       	call   4a00 <printf>
    1cd1:	83 c4 10             	add    $0x10,%esp
    1cd4:	eb 97                	jmp    1c6d <preempt+0xcd>
    1cd6:	8d 76 00             	lea    0x0(%esi),%esi
    1cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ce0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
    1ce0:	55                   	push   %ebp
    1ce1:	89 e5                	mov    %esp,%ebp
    1ce3:	56                   	push   %esi
    1ce4:	be 64 00 00 00       	mov    $0x64,%esi
    1ce9:	53                   	push   %ebx
    1cea:	eb 14                	jmp    1d00 <exitwait+0x20>
    1cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
    1cf0:	74 6f                	je     1d61 <exitwait+0x81>
      if(wait() != pid){
    1cf2:	e8 b3 2b 00 00       	call   48aa <wait>
    1cf7:	39 c3                	cmp    %eax,%ebx
    1cf9:	75 2d                	jne    1d28 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    1cfb:	83 ee 01             	sub    $0x1,%esi
    1cfe:	74 48                	je     1d48 <exitwait+0x68>
    pid = fork();
    1d00:	e8 95 2b 00 00       	call   489a <fork>
    if(pid < 0){
    1d05:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
    1d07:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1d09:	79 e5                	jns    1cf0 <exitwait+0x10>
      printf(1, "fork failed\n");
    1d0b:	83 ec 08             	sub    $0x8,%esp
    1d0e:	68 95 5c 00 00       	push   $0x5c95
    1d13:	6a 01                	push   $0x1
    1d15:	e8 e6 2c 00 00       	call   4a00 <printf>
      return;
    1d1a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
    1d1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d20:	5b                   	pop    %ebx
    1d21:	5e                   	pop    %esi
    1d22:	5d                   	pop    %ebp
    1d23:	c3                   	ret    
    1d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
    1d28:	83 ec 08             	sub    $0x8,%esp
    1d2b:	68 37 51 00 00       	push   $0x5137
    1d30:	6a 01                	push   $0x1
    1d32:	e8 c9 2c 00 00       	call   4a00 <printf>
        return;
    1d37:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
    1d3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d3d:	5b                   	pop    %ebx
    1d3e:	5e                   	pop    %esi
    1d3f:	5d                   	pop    %ebp
    1d40:	c3                   	ret    
    1d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
    1d48:	83 ec 08             	sub    $0x8,%esp
    1d4b:	68 47 51 00 00       	push   $0x5147
    1d50:	6a 01                	push   $0x1
    1d52:	e8 a9 2c 00 00       	call   4a00 <printf>
    1d57:	83 c4 10             	add    $0x10,%esp
}
    1d5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d5d:	5b                   	pop    %ebx
    1d5e:	5e                   	pop    %esi
    1d5f:	5d                   	pop    %ebp
    1d60:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
    1d61:	e8 3c 2b 00 00       	call   48a2 <exit>
    1d66:	8d 76 00             	lea    0x0(%esi),%esi
    1d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001d70 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
    1d70:	55                   	push   %ebp
    1d71:	89 e5                	mov    %esp,%ebp
    1d73:	57                   	push   %edi
    1d74:	56                   	push   %esi
    1d75:	53                   	push   %ebx
    1d76:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
    1d79:	68 54 51 00 00       	push   $0x5154
    1d7e:	6a 01                	push   $0x1
    1d80:	e8 7b 2c 00 00       	call   4a00 <printf>
  ppid = getpid();
    1d85:	e8 98 2b 00 00       	call   4922 <getpid>
    1d8a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
    1d8c:	e8 09 2b 00 00       	call   489a <fork>
    1d91:	83 c4 10             	add    $0x10,%esp
    1d94:	85 c0                	test   %eax,%eax
    1d96:	75 70                	jne    1e08 <mem+0x98>
    1d98:	31 db                	xor    %ebx,%ebx
    1d9a:	eb 08                	jmp    1da4 <mem+0x34>
    1d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
    1da0:	89 18                	mov    %ebx,(%eax)
    1da2:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
    1da4:	83 ec 0c             	sub    $0xc,%esp
    1da7:	68 11 27 00 00       	push   $0x2711
    1dac:	e8 7f 2e 00 00       	call   4c30 <malloc>
    1db1:	83 c4 10             	add    $0x10,%esp
    1db4:	85 c0                	test   %eax,%eax
    1db6:	75 e8                	jne    1da0 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
    1db8:	85 db                	test   %ebx,%ebx
    1dba:	74 18                	je     1dd4 <mem+0x64>
    1dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
    1dc0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
    1dc2:	83 ec 0c             	sub    $0xc,%esp
    1dc5:	53                   	push   %ebx
    1dc6:	89 fb                	mov    %edi,%ebx
    1dc8:	e8 d3 2d 00 00       	call   4ba0 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
    1dcd:	83 c4 10             	add    $0x10,%esp
    1dd0:	85 db                	test   %ebx,%ebx
    1dd2:	75 ec                	jne    1dc0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    1dd4:	83 ec 0c             	sub    $0xc,%esp
    1dd7:	68 00 50 00 00       	push   $0x5000
    1ddc:	e8 4f 2e 00 00       	call   4c30 <malloc>
    if(m1 == 0){
    1de1:	83 c4 10             	add    $0x10,%esp
    1de4:	85 c0                	test   %eax,%eax
    1de6:	74 30                	je     1e18 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
    1de8:	83 ec 0c             	sub    $0xc,%esp
    1deb:	50                   	push   %eax
    1dec:	e8 af 2d 00 00       	call   4ba0 <free>
    printf(1, "mem ok\n");
    1df1:	58                   	pop    %eax
    1df2:	5a                   	pop    %edx
    1df3:	68 78 51 00 00       	push   $0x5178
    1df8:	6a 01                	push   $0x1
    1dfa:	e8 01 2c 00 00       	call   4a00 <printf>
    exit();
    1dff:	e8 9e 2a 00 00       	call   48a2 <exit>
    1e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
    1e08:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e0b:	5b                   	pop    %ebx
    1e0c:	5e                   	pop    %esi
    1e0d:	5f                   	pop    %edi
    1e0e:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
    1e0f:	e9 96 2a 00 00       	jmp    48aa <wait>
    1e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
    1e18:	83 ec 08             	sub    $0x8,%esp
    1e1b:	68 5e 51 00 00       	push   $0x515e
    1e20:	6a 01                	push   $0x1
    1e22:	e8 d9 2b 00 00       	call   4a00 <printf>
      kill(ppid);
    1e27:	89 34 24             	mov    %esi,(%esp)
    1e2a:	e8 a3 2a 00 00       	call   48d2 <kill>
      exit();
    1e2f:	e8 6e 2a 00 00       	call   48a2 <exit>
    1e34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1e3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001e40 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
    1e40:	55                   	push   %ebp
    1e41:	89 e5                	mov    %esp,%ebp
    1e43:	57                   	push   %edi
    1e44:	56                   	push   %esi
    1e45:	53                   	push   %ebx
    1e46:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
    1e49:	68 80 51 00 00       	push   $0x5180
    1e4e:	6a 01                	push   $0x1
    1e50:	e8 ab 2b 00 00       	call   4a00 <printf>

  unlink("sharedfd");
    1e55:	c7 04 24 8f 51 00 00 	movl   $0x518f,(%esp)
    1e5c:	e8 91 2a 00 00       	call   48f2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    1e61:	5b                   	pop    %ebx
    1e62:	5e                   	pop    %esi
    1e63:	68 02 02 00 00       	push   $0x202
    1e68:	68 8f 51 00 00       	push   $0x518f
    1e6d:	e8 70 2a 00 00       	call   48e2 <open>
  if(fd < 0){
    1e72:	83 c4 10             	add    $0x10,%esp
    1e75:	85 c0                	test   %eax,%eax
    1e77:	0f 88 29 01 00 00    	js     1fa6 <sharedfd+0x166>
    1e7d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1e7f:	8d 75 de             	lea    -0x22(%ebp),%esi
    1e82:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
    1e87:	e8 0e 2a 00 00       	call   489a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1e8c:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
    1e8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1e92:	19 c0                	sbb    %eax,%eax
    1e94:	83 ec 04             	sub    $0x4,%esp
    1e97:	83 e0 f3             	and    $0xfffffff3,%eax
    1e9a:	6a 0a                	push   $0xa
    1e9c:	83 c0 70             	add    $0x70,%eax
    1e9f:	50                   	push   %eax
    1ea0:	56                   	push   %esi
    1ea1:	e8 6a 28 00 00       	call   4710 <memset>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	eb 0a                	jmp    1eb5 <sharedfd+0x75>
    1eab:	90                   	nop
    1eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
    1eb0:	83 eb 01             	sub    $0x1,%ebx
    1eb3:	74 26                	je     1edb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1eb5:	83 ec 04             	sub    $0x4,%esp
    1eb8:	6a 0a                	push   $0xa
    1eba:	56                   	push   %esi
    1ebb:	57                   	push   %edi
    1ebc:	e8 01 2a 00 00       	call   48c2 <write>
    1ec1:	83 c4 10             	add    $0x10,%esp
    1ec4:	83 f8 0a             	cmp    $0xa,%eax
    1ec7:	74 e7                	je     1eb0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
    1ec9:	83 ec 08             	sub    $0x8,%esp
    1ecc:	68 80 5e 00 00       	push   $0x5e80
    1ed1:	6a 01                	push   $0x1
    1ed3:	e8 28 2b 00 00       	call   4a00 <printf>
      break;
    1ed8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
    1edb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    1ede:	85 c9                	test   %ecx,%ecx
    1ee0:	0f 84 f4 00 00 00    	je     1fda <sharedfd+0x19a>
    exit();
  else
    wait();
    1ee6:	e8 bf 29 00 00       	call   48aa <wait>
  close(fd);
    1eeb:	83 ec 0c             	sub    $0xc,%esp
    1eee:	31 db                	xor    %ebx,%ebx
    1ef0:	57                   	push   %edi
    1ef1:	8d 7d e8             	lea    -0x18(%ebp),%edi
    1ef4:	e8 d1 29 00 00       	call   48ca <close>
  fd = open("sharedfd", 0);
    1ef9:	58                   	pop    %eax
    1efa:	5a                   	pop    %edx
    1efb:	6a 00                	push   $0x0
    1efd:	68 8f 51 00 00       	push   $0x518f
    1f02:	e8 db 29 00 00       	call   48e2 <open>
  if(fd < 0){
    1f07:	83 c4 10             	add    $0x10,%esp
    1f0a:	31 d2                	xor    %edx,%edx
    1f0c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
    1f0e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
    1f11:	0f 88 a9 00 00 00    	js     1fc0 <sharedfd+0x180>
    1f17:	89 f6                	mov    %esi,%esi
    1f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1f20:	83 ec 04             	sub    $0x4,%esp
    1f23:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1f26:	6a 0a                	push   $0xa
    1f28:	56                   	push   %esi
    1f29:	ff 75 d0             	pushl  -0x30(%ebp)
    1f2c:	e8 89 29 00 00       	call   48ba <read>
    1f31:	83 c4 10             	add    $0x10,%esp
    1f34:	85 c0                	test   %eax,%eax
    1f36:	7e 27                	jle    1f5f <sharedfd+0x11f>
    1f38:	89 f0                	mov    %esi,%eax
    1f3a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1f3d:	eb 13                	jmp    1f52 <sharedfd+0x112>
    1f3f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
    1f40:	80 f9 70             	cmp    $0x70,%cl
    1f43:	0f 94 c1             	sete   %cl
    1f46:	0f b6 c9             	movzbl %cl,%ecx
    1f49:	01 cb                	add    %ecx,%ebx
    1f4b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    1f4e:	39 c7                	cmp    %eax,%edi
    1f50:	74 ce                	je     1f20 <sharedfd+0xe0>
      if(buf[i] == 'c')
    1f52:	0f b6 08             	movzbl (%eax),%ecx
    1f55:	80 f9 63             	cmp    $0x63,%cl
    1f58:	75 e6                	jne    1f40 <sharedfd+0x100>
        nc++;
    1f5a:	83 c2 01             	add    $0x1,%edx
    1f5d:	eb ec                	jmp    1f4b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    1f5f:	83 ec 0c             	sub    $0xc,%esp
    1f62:	ff 75 d0             	pushl  -0x30(%ebp)
    1f65:	e8 60 29 00 00       	call   48ca <close>
  unlink("sharedfd");
    1f6a:	c7 04 24 8f 51 00 00 	movl   $0x518f,(%esp)
    1f71:	e8 7c 29 00 00       	call   48f2 <unlink>
  if(nc == 10000 && np == 10000){
    1f76:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1f79:	83 c4 10             	add    $0x10,%esp
    1f7c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    1f82:	75 5b                	jne    1fdf <sharedfd+0x19f>
    1f84:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    1f8a:	75 53                	jne    1fdf <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
    1f8c:	83 ec 08             	sub    $0x8,%esp
    1f8f:	68 98 51 00 00       	push   $0x5198
    1f94:	6a 01                	push   $0x1
    1f96:	e8 65 2a 00 00       	call   4a00 <printf>
    1f9b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
    1f9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fa1:	5b                   	pop    %ebx
    1fa2:	5e                   	pop    %esi
    1fa3:	5f                   	pop    %edi
    1fa4:	5d                   	pop    %ebp
    1fa5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    1fa6:	83 ec 08             	sub    $0x8,%esp
    1fa9:	68 54 5e 00 00       	push   $0x5e54
    1fae:	6a 01                	push   $0x1
    1fb0:	e8 4b 2a 00 00       	call   4a00 <printf>
    return;
    1fb5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
    1fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fbb:	5b                   	pop    %ebx
    1fbc:	5e                   	pop    %esi
    1fbd:	5f                   	pop    %edi
    1fbe:	5d                   	pop    %ebp
    1fbf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1fc0:	83 ec 08             	sub    $0x8,%esp
    1fc3:	68 a0 5e 00 00       	push   $0x5ea0
    1fc8:	6a 01                	push   $0x1
    1fca:	e8 31 2a 00 00       	call   4a00 <printf>
    return;
    1fcf:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
    1fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fd5:	5b                   	pop    %ebx
    1fd6:	5e                   	pop    %esi
    1fd7:	5f                   	pop    %edi
    1fd8:	5d                   	pop    %ebp
    1fd9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
    1fda:	e8 c3 28 00 00       	call   48a2 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1fdf:	53                   	push   %ebx
    1fe0:	52                   	push   %edx
    1fe1:	68 a5 51 00 00       	push   $0x51a5
    1fe6:	6a 01                	push   $0x1
    1fe8:	e8 13 2a 00 00       	call   4a00 <printf>
    exit();
    1fed:	e8 b0 28 00 00       	call   48a2 <exit>
    1ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002000 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    2000:	55                   	push   %ebp
    2001:	89 e5                	mov    %esp,%ebp
    2003:	57                   	push   %edi
    2004:	56                   	push   %esi
    2005:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    2006:	be ba 51 00 00       	mov    $0x51ba,%esi

  for(pi = 0; pi < 4; pi++){
    200b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    200d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    2010:	c7 45 d8 ba 51 00 00 	movl   $0x51ba,-0x28(%ebp)
    2017:	c7 45 dc 03 53 00 00 	movl   $0x5303,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    201e:	68 c0 51 00 00       	push   $0x51c0
    2023:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    2025:	c7 45 e0 07 53 00 00 	movl   $0x5307,-0x20(%ebp)
    202c:	c7 45 e4 bd 51 00 00 	movl   $0x51bd,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    2033:	e8 c8 29 00 00       	call   4a00 <printf>
    2038:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    203b:	83 ec 0c             	sub    $0xc,%esp
    203e:	56                   	push   %esi
    203f:	e8 ae 28 00 00       	call   48f2 <unlink>

    pid = fork();
    2044:	e8 51 28 00 00       	call   489a <fork>
    if(pid < 0){
    2049:	83 c4 10             	add    $0x10,%esp
    204c:	85 c0                	test   %eax,%eax
    204e:	0f 88 83 01 00 00    	js     21d7 <fourfiles+0x1d7>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    2054:	0f 84 e3 00 00 00    	je     213d <fourfiles+0x13d>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    205a:	83 c3 01             	add    $0x1,%ebx
    205d:	83 fb 04             	cmp    $0x4,%ebx
    2060:	74 06                	je     2068 <fourfiles+0x68>
    2062:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    2066:	eb d3                	jmp    203b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    2068:	e8 3d 28 00 00       	call   48aa <wait>
    206d:	bf 30 00 00 00       	mov    $0x30,%edi
    2072:	e8 33 28 00 00       	call   48aa <wait>
    2077:	e8 2e 28 00 00       	call   48aa <wait>
    207c:	e8 29 28 00 00       	call   48aa <wait>
    2081:	c7 45 d4 ba 51 00 00 	movl   $0x51ba,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    2088:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    208b:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    208d:	6a 00                	push   $0x0
    208f:	ff 75 d4             	pushl  -0x2c(%ebp)
    2092:	e8 4b 28 00 00       	call   48e2 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    2097:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    209a:	89 c6                	mov    %eax,%esi
    209c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    20a0:	83 ec 04             	sub    $0x4,%esp
    20a3:	68 00 20 00 00       	push   $0x2000
    20a8:	68 00 96 00 00       	push   $0x9600
    20ad:	56                   	push   %esi
    20ae:	e8 07 28 00 00       	call   48ba <read>
    20b3:	83 c4 10             	add    $0x10,%esp
    20b6:	85 c0                	test   %eax,%eax
    20b8:	7e 1c                	jle    20d6 <fourfiles+0xd6>
    20ba:	31 d2                	xor    %edx,%edx
    20bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    20c0:	0f be 8a 00 96 00 00 	movsbl 0x9600(%edx),%ecx
    20c7:	39 cf                	cmp    %ecx,%edi
    20c9:	75 5e                	jne    2129 <fourfiles+0x129>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    20cb:	83 c2 01             	add    $0x1,%edx
    20ce:	39 d0                	cmp    %edx,%eax
    20d0:	75 ee                	jne    20c0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    20d2:	01 c3                	add    %eax,%ebx
    20d4:	eb ca                	jmp    20a0 <fourfiles+0xa0>
    }
    close(fd);
    20d6:	83 ec 0c             	sub    $0xc,%esp
    20d9:	56                   	push   %esi
    20da:	e8 eb 27 00 00       	call   48ca <close>
    if(total != 12*500){
    20df:	83 c4 10             	add    $0x10,%esp
    20e2:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    20e8:	0f 85 d4 00 00 00    	jne    21c2 <fourfiles+0x1c2>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    20ee:	83 ec 0c             	sub    $0xc,%esp
    20f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    20f4:	83 c7 01             	add    $0x1,%edi
    20f7:	e8 f6 27 00 00       	call   48f2 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    20fc:	83 c4 10             	add    $0x10,%esp
    20ff:	83 ff 32             	cmp    $0x32,%edi
    2102:	75 1a                	jne    211e <fourfiles+0x11e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    2104:	83 ec 08             	sub    $0x8,%esp
    2107:	68 fe 51 00 00       	push   $0x51fe
    210c:	6a 01                	push   $0x1
    210e:	e8 ed 28 00 00       	call   4a00 <printf>
}
    2113:	83 c4 10             	add    $0x10,%esp
    2116:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2119:	5b                   	pop    %ebx
    211a:	5e                   	pop    %esi
    211b:	5f                   	pop    %edi
    211c:	5d                   	pop    %ebp
    211d:	c3                   	ret    
    211e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2121:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2124:	e9 5f ff ff ff       	jmp    2088 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    2129:	83 ec 08             	sub    $0x8,%esp
    212c:	68 e1 51 00 00       	push   $0x51e1
    2131:	6a 01                	push   $0x1
    2133:	e8 c8 28 00 00       	call   4a00 <printf>
          exit();
    2138:	e8 65 27 00 00       	call   48a2 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    213d:	83 ec 08             	sub    $0x8,%esp
    2140:	68 02 02 00 00       	push   $0x202
    2145:	56                   	push   %esi
    2146:	e8 97 27 00 00       	call   48e2 <open>
      if(fd < 0){
    214b:	83 c4 10             	add    $0x10,%esp
    214e:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    2150:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    2152:	78 5a                	js     21ae <fourfiles+0x1ae>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    2154:	83 ec 04             	sub    $0x4,%esp
    2157:	83 c3 30             	add    $0x30,%ebx
    215a:	68 00 02 00 00       	push   $0x200
    215f:	53                   	push   %ebx
    2160:	bb 0c 00 00 00       	mov    $0xc,%ebx
    2165:	68 00 96 00 00       	push   $0x9600
    216a:	e8 a1 25 00 00       	call   4710 <memset>
    216f:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    2172:	83 ec 04             	sub    $0x4,%esp
    2175:	68 f4 01 00 00       	push   $0x1f4
    217a:	68 00 96 00 00       	push   $0x9600
    217f:	56                   	push   %esi
    2180:	e8 3d 27 00 00       	call   48c2 <write>
    2185:	83 c4 10             	add    $0x10,%esp
    2188:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    218d:	75 0a                	jne    2199 <fourfiles+0x199>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    218f:	83 eb 01             	sub    $0x1,%ebx
    2192:	75 de                	jne    2172 <fourfiles+0x172>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    2194:	e8 09 27 00 00       	call   48a2 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    2199:	83 ec 04             	sub    $0x4,%esp
    219c:	50                   	push   %eax
    219d:	68 d0 51 00 00       	push   $0x51d0
    21a2:	6a 01                	push   $0x1
    21a4:	e8 57 28 00 00       	call   4a00 <printf>
          exit();
    21a9:	e8 f4 26 00 00       	call   48a2 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    21ae:	83 ec 08             	sub    $0x8,%esp
    21b1:	68 5b 54 00 00       	push   $0x545b
    21b6:	6a 01                	push   $0x1
    21b8:	e8 43 28 00 00       	call   4a00 <printf>
        exit();
    21bd:	e8 e0 26 00 00       	call   48a2 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    21c2:	83 ec 04             	sub    $0x4,%esp
    21c5:	53                   	push   %ebx
    21c6:	68 ed 51 00 00       	push   $0x51ed
    21cb:	6a 01                	push   $0x1
    21cd:	e8 2e 28 00 00       	call   4a00 <printf>
      exit();
    21d2:	e8 cb 26 00 00       	call   48a2 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    21d7:	83 ec 08             	sub    $0x8,%esp
    21da:	68 95 5c 00 00       	push   $0x5c95
    21df:	6a 01                	push   $0x1
    21e1:	e8 1a 28 00 00       	call   4a00 <printf>
      exit();
    21e6:	e8 b7 26 00 00       	call   48a2 <exit>
    21eb:	90                   	nop
    21ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000021f0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    21f0:	55                   	push   %ebp
    21f1:	89 e5                	mov    %esp,%ebp
    21f3:	57                   	push   %edi
    21f4:	56                   	push   %esi
    21f5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    21f6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    21f8:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    21fb:	68 0c 52 00 00       	push   $0x520c
    2200:	6a 01                	push   $0x1
    2202:	e8 f9 27 00 00       	call   4a00 <printf>
    2207:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    220a:	e8 8b 26 00 00       	call   489a <fork>
    if(pid < 0){
    220f:	85 c0                	test   %eax,%eax
    2211:	0f 88 b7 01 00 00    	js     23ce <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    2217:	0f 84 f6 00 00 00    	je     2313 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    221d:	83 c3 01             	add    $0x1,%ebx
    2220:	83 fb 04             	cmp    $0x4,%ebx
    2223:	75 e5                	jne    220a <createdelete+0x1a>
    2225:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    2228:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    222a:	e8 7b 26 00 00       	call   48aa <wait>
    222f:	e8 76 26 00 00       	call   48aa <wait>
    2234:	e8 71 26 00 00       	call   48aa <wait>
    2239:	e8 6c 26 00 00       	call   48aa <wait>
  }

  name[0] = name[1] = name[2] = 0;
    223e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    2242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2248:	8d 46 30             	lea    0x30(%esi),%eax
    224b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    224e:	bb 70 00 00 00       	mov    $0x70,%ebx
    2253:	0f 9f c2             	setg   %dl
    2256:	85 f6                	test   %esi,%esi
    2258:	88 45 c7             	mov    %al,-0x39(%ebp)
    225b:	0f 94 c0             	sete   %al
    225e:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    2260:	8d 46 ff             	lea    -0x1(%esi),%eax
    2263:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    2266:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    2269:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    226d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    2270:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    2273:	6a 00                	push   $0x0
    2275:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    2276:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    2279:	e8 64 26 00 00       	call   48e2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    227e:	89 c1                	mov    %eax,%ecx
    2280:	83 c4 10             	add    $0x10,%esp
    2283:	c1 e9 1f             	shr    $0x1f,%ecx
    2286:	84 c9                	test   %cl,%cl
    2288:	74 0a                	je     2294 <createdelete+0xa4>
    228a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    228e:	0f 85 11 01 00 00    	jne    23a5 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    2294:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    2298:	0f 86 44 01 00 00    	jbe    23e2 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    229e:	85 c0                	test   %eax,%eax
    22a0:	78 0c                	js     22ae <createdelete+0xbe>
        close(fd);
    22a2:	83 ec 0c             	sub    $0xc,%esp
    22a5:	50                   	push   %eax
    22a6:	e8 1f 26 00 00       	call   48ca <close>
    22ab:	83 c4 10             	add    $0x10,%esp
    22ae:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    22b1:	80 fb 74             	cmp    $0x74,%bl
    22b4:	75 b3                	jne    2269 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    22b6:	83 c6 01             	add    $0x1,%esi
    22b9:	83 fe 14             	cmp    $0x14,%esi
    22bc:	75 8a                	jne    2248 <createdelete+0x58>
    22be:	be 70 00 00 00       	mov    $0x70,%esi
    22c3:	90                   	nop
    22c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    22c8:	8d 46 c0             	lea    -0x40(%esi),%eax
    22cb:	bb 04 00 00 00       	mov    $0x4,%ebx
    22d0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    22d3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    22d5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    22d8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    22db:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    22df:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    22e0:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    22e3:	e8 0a 26 00 00       	call   48f2 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    22e8:	83 c4 10             	add    $0x10,%esp
    22eb:	83 eb 01             	sub    $0x1,%ebx
    22ee:	75 e3                	jne    22d3 <createdelete+0xe3>
    22f0:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    22f3:	89 f0                	mov    %esi,%eax
    22f5:	3c 84                	cmp    $0x84,%al
    22f7:	75 cf                	jne    22c8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    22f9:	83 ec 08             	sub    $0x8,%esp
    22fc:	68 1f 52 00 00       	push   $0x521f
    2301:	6a 01                	push   $0x1
    2303:	e8 f8 26 00 00       	call   4a00 <printf>
}
    2308:	83 c4 10             	add    $0x10,%esp
    230b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    230e:	5b                   	pop    %ebx
    230f:	5e                   	pop    %esi
    2310:	5f                   	pop    %edi
    2311:	5d                   	pop    %ebp
    2312:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    2313:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    2316:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    231a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    231f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    2322:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    2325:	31 db                	xor    %ebx,%ebx
    2327:	eb 12                	jmp    233b <createdelete+0x14b>
    2329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    2330:	83 fe 14             	cmp    $0x14,%esi
    2333:	74 6b                	je     23a0 <createdelete+0x1b0>
    2335:	83 c3 01             	add    $0x1,%ebx
    2338:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    233b:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    233e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    2341:	68 02 02 00 00       	push   $0x202
    2346:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    2347:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    234a:	e8 93 25 00 00       	call   48e2 <open>
        if(fd < 0){
    234f:	83 c4 10             	add    $0x10,%esp
    2352:	85 c0                	test   %eax,%eax
    2354:	78 64                	js     23ba <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    2356:	83 ec 0c             	sub    $0xc,%esp
    2359:	50                   	push   %eax
    235a:	e8 6b 25 00 00       	call   48ca <close>
        if(i > 0 && (i % 2 ) == 0){
    235f:	83 c4 10             	add    $0x10,%esp
    2362:	85 db                	test   %ebx,%ebx
    2364:	74 cf                	je     2335 <createdelete+0x145>
    2366:	f6 c3 01             	test   $0x1,%bl
    2369:	75 c5                	jne    2330 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    236b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    236e:	89 d8                	mov    %ebx,%eax
    2370:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    2372:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    2373:	83 c0 30             	add    $0x30,%eax
    2376:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    2379:	e8 74 25 00 00       	call   48f2 <unlink>
    237e:	83 c4 10             	add    $0x10,%esp
    2381:	85 c0                	test   %eax,%eax
    2383:	79 ab                	jns    2330 <createdelete+0x140>
            printf(1, "unlink failed\n");
    2385:	83 ec 08             	sub    $0x8,%esp
    2388:	68 0d 4e 00 00       	push   $0x4e0d
    238d:	6a 01                	push   $0x1
    238f:	e8 6c 26 00 00       	call   4a00 <printf>
            exit();
    2394:	e8 09 25 00 00       	call   48a2 <exit>
    2399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    23a0:	e8 fd 24 00 00       	call   48a2 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    23a5:	83 ec 04             	sub    $0x4,%esp
    23a8:	57                   	push   %edi
    23a9:	68 cc 5e 00 00       	push   $0x5ecc
    23ae:	6a 01                	push   $0x1
    23b0:	e8 4b 26 00 00       	call   4a00 <printf>
        exit();
    23b5:	e8 e8 24 00 00       	call   48a2 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    23ba:	83 ec 08             	sub    $0x8,%esp
    23bd:	68 5b 54 00 00       	push   $0x545b
    23c2:	6a 01                	push   $0x1
    23c4:	e8 37 26 00 00       	call   4a00 <printf>
          exit();
    23c9:	e8 d4 24 00 00       	call   48a2 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    23ce:	83 ec 08             	sub    $0x8,%esp
    23d1:	68 95 5c 00 00       	push   $0x5c95
    23d6:	6a 01                	push   $0x1
    23d8:	e8 23 26 00 00       	call   4a00 <printf>
      exit();
    23dd:	e8 c0 24 00 00       	call   48a2 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    23e2:	85 c0                	test   %eax,%eax
    23e4:	0f 88 c4 fe ff ff    	js     22ae <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    23ea:	83 ec 04             	sub    $0x4,%esp
    23ed:	57                   	push   %edi
    23ee:	68 f0 5e 00 00       	push   $0x5ef0
    23f3:	6a 01                	push   $0x1
    23f5:	e8 06 26 00 00       	call   4a00 <printf>
        exit();
    23fa:	e8 a3 24 00 00       	call   48a2 <exit>
    23ff:	90                   	nop

00002400 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    2400:	55                   	push   %ebp
    2401:	89 e5                	mov    %esp,%ebp
    2403:	56                   	push   %esi
    2404:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    2405:	83 ec 08             	sub    $0x8,%esp
    2408:	68 30 52 00 00       	push   $0x5230
    240d:	6a 01                	push   $0x1
    240f:	e8 ec 25 00 00       	call   4a00 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    2414:	5b                   	pop    %ebx
    2415:	5e                   	pop    %esi
    2416:	68 02 02 00 00       	push   $0x202
    241b:	68 41 52 00 00       	push   $0x5241
    2420:	e8 bd 24 00 00       	call   48e2 <open>
  if(fd < 0){
    2425:	83 c4 10             	add    $0x10,%esp
    2428:	85 c0                	test   %eax,%eax
    242a:	0f 88 e6 00 00 00    	js     2516 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    2430:	83 ec 04             	sub    $0x4,%esp
    2433:	89 c3                	mov    %eax,%ebx
    2435:	6a 05                	push   $0x5
    2437:	68 66 52 00 00       	push   $0x5266
    243c:	50                   	push   %eax
    243d:	e8 80 24 00 00       	call   48c2 <write>
  close(fd);
    2442:	89 1c 24             	mov    %ebx,(%esp)
    2445:	e8 80 24 00 00       	call   48ca <close>

  fd = open("unlinkread", O_RDWR);
    244a:	58                   	pop    %eax
    244b:	5a                   	pop    %edx
    244c:	6a 02                	push   $0x2
    244e:	68 41 52 00 00       	push   $0x5241
    2453:	e8 8a 24 00 00       	call   48e2 <open>
  if(fd < 0){
    2458:	83 c4 10             	add    $0x10,%esp
    245b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    245d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    245f:	0f 88 10 01 00 00    	js     2575 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    2465:	83 ec 0c             	sub    $0xc,%esp
    2468:	68 41 52 00 00       	push   $0x5241
    246d:	e8 80 24 00 00       	call   48f2 <unlink>
    2472:	83 c4 10             	add    $0x10,%esp
    2475:	85 c0                	test   %eax,%eax
    2477:	0f 85 e5 00 00 00    	jne    2562 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    247d:	83 ec 08             	sub    $0x8,%esp
    2480:	68 02 02 00 00       	push   $0x202
    2485:	68 41 52 00 00       	push   $0x5241
    248a:	e8 53 24 00 00       	call   48e2 <open>
  write(fd1, "yyy", 3);
    248f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    2492:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    2494:	6a 03                	push   $0x3
    2496:	68 9e 52 00 00       	push   $0x529e
    249b:	50                   	push   %eax
    249c:	e8 21 24 00 00       	call   48c2 <write>
  close(fd1);
    24a1:	89 34 24             	mov    %esi,(%esp)
    24a4:	e8 21 24 00 00       	call   48ca <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    24a9:	83 c4 0c             	add    $0xc,%esp
    24ac:	68 00 20 00 00       	push   $0x2000
    24b1:	68 00 96 00 00       	push   $0x9600
    24b6:	53                   	push   %ebx
    24b7:	e8 fe 23 00 00       	call   48ba <read>
    24bc:	83 c4 10             	add    $0x10,%esp
    24bf:	83 f8 05             	cmp    $0x5,%eax
    24c2:	0f 85 87 00 00 00    	jne    254f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    24c8:	80 3d 00 96 00 00 68 	cmpb   $0x68,0x9600
    24cf:	75 6b                	jne    253c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    24d1:	83 ec 04             	sub    $0x4,%esp
    24d4:	6a 0a                	push   $0xa
    24d6:	68 00 96 00 00       	push   $0x9600
    24db:	53                   	push   %ebx
    24dc:	e8 e1 23 00 00       	call   48c2 <write>
    24e1:	83 c4 10             	add    $0x10,%esp
    24e4:	83 f8 0a             	cmp    $0xa,%eax
    24e7:	75 40                	jne    2529 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    24e9:	83 ec 0c             	sub    $0xc,%esp
    24ec:	53                   	push   %ebx
    24ed:	e8 d8 23 00 00       	call   48ca <close>
  unlink("unlinkread");
    24f2:	c7 04 24 41 52 00 00 	movl   $0x5241,(%esp)
    24f9:	e8 f4 23 00 00       	call   48f2 <unlink>
  printf(1, "unlinkread ok\n");
    24fe:	58                   	pop    %eax
    24ff:	5a                   	pop    %edx
    2500:	68 e9 52 00 00       	push   $0x52e9
    2505:	6a 01                	push   $0x1
    2507:	e8 f4 24 00 00       	call   4a00 <printf>
}
    250c:	83 c4 10             	add    $0x10,%esp
    250f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2512:	5b                   	pop    %ebx
    2513:	5e                   	pop    %esi
    2514:	5d                   	pop    %ebp
    2515:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    2516:	51                   	push   %ecx
    2517:	51                   	push   %ecx
    2518:	68 4c 52 00 00       	push   $0x524c
    251d:	6a 01                	push   $0x1
    251f:	e8 dc 24 00 00       	call   4a00 <printf>
    exit();
    2524:	e8 79 23 00 00       	call   48a2 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    2529:	51                   	push   %ecx
    252a:	51                   	push   %ecx
    252b:	68 d0 52 00 00       	push   $0x52d0
    2530:	6a 01                	push   $0x1
    2532:	e8 c9 24 00 00       	call   4a00 <printf>
    exit();
    2537:	e8 66 23 00 00       	call   48a2 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    253c:	53                   	push   %ebx
    253d:	53                   	push   %ebx
    253e:	68 b9 52 00 00       	push   $0x52b9
    2543:	6a 01                	push   $0x1
    2545:	e8 b6 24 00 00       	call   4a00 <printf>
    exit();
    254a:	e8 53 23 00 00       	call   48a2 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    254f:	56                   	push   %esi
    2550:	56                   	push   %esi
    2551:	68 a2 52 00 00       	push   $0x52a2
    2556:	6a 01                	push   $0x1
    2558:	e8 a3 24 00 00       	call   4a00 <printf>
    exit();
    255d:	e8 40 23 00 00       	call   48a2 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    2562:	50                   	push   %eax
    2563:	50                   	push   %eax
    2564:	68 84 52 00 00       	push   $0x5284
    2569:	6a 01                	push   $0x1
    256b:	e8 90 24 00 00       	call   4a00 <printf>
    exit();
    2570:	e8 2d 23 00 00       	call   48a2 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    2575:	50                   	push   %eax
    2576:	50                   	push   %eax
    2577:	68 6c 52 00 00       	push   $0x526c
    257c:	6a 01                	push   $0x1
    257e:	e8 7d 24 00 00       	call   4a00 <printf>
    exit();
    2583:	e8 1a 23 00 00       	call   48a2 <exit>
    2588:	90                   	nop
    2589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002590 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    2590:	55                   	push   %ebp
    2591:	89 e5                	mov    %esp,%ebp
    2593:	53                   	push   %ebx
    2594:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    2597:	68 f8 52 00 00       	push   $0x52f8
    259c:	6a 01                	push   $0x1
    259e:	e8 5d 24 00 00       	call   4a00 <printf>

  unlink("lf1");
    25a3:	c7 04 24 02 53 00 00 	movl   $0x5302,(%esp)
    25aa:	e8 43 23 00 00       	call   48f2 <unlink>
  unlink("lf2");
    25af:	c7 04 24 06 53 00 00 	movl   $0x5306,(%esp)
    25b6:	e8 37 23 00 00       	call   48f2 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    25bb:	58                   	pop    %eax
    25bc:	5a                   	pop    %edx
    25bd:	68 02 02 00 00       	push   $0x202
    25c2:	68 02 53 00 00       	push   $0x5302
    25c7:	e8 16 23 00 00       	call   48e2 <open>
  if(fd < 0){
    25cc:	83 c4 10             	add    $0x10,%esp
    25cf:	85 c0                	test   %eax,%eax
    25d1:	0f 88 1e 01 00 00    	js     26f5 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    25d7:	83 ec 04             	sub    $0x4,%esp
    25da:	89 c3                	mov    %eax,%ebx
    25dc:	6a 05                	push   $0x5
    25de:	68 66 52 00 00       	push   $0x5266
    25e3:	50                   	push   %eax
    25e4:	e8 d9 22 00 00       	call   48c2 <write>
    25e9:	83 c4 10             	add    $0x10,%esp
    25ec:	83 f8 05             	cmp    $0x5,%eax
    25ef:	0f 85 98 01 00 00    	jne    278d <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    25f5:	83 ec 0c             	sub    $0xc,%esp
    25f8:	53                   	push   %ebx
    25f9:	e8 cc 22 00 00       	call   48ca <close>

  if(link("lf1", "lf2") < 0){
    25fe:	5b                   	pop    %ebx
    25ff:	58                   	pop    %eax
    2600:	68 06 53 00 00       	push   $0x5306
    2605:	68 02 53 00 00       	push   $0x5302
    260a:	e8 f3 22 00 00       	call   4902 <link>
    260f:	83 c4 10             	add    $0x10,%esp
    2612:	85 c0                	test   %eax,%eax
    2614:	0f 88 60 01 00 00    	js     277a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    261a:	83 ec 0c             	sub    $0xc,%esp
    261d:	68 02 53 00 00       	push   $0x5302
    2622:	e8 cb 22 00 00       	call   48f2 <unlink>

  if(open("lf1", 0) >= 0){
    2627:	58                   	pop    %eax
    2628:	5a                   	pop    %edx
    2629:	6a 00                	push   $0x0
    262b:	68 02 53 00 00       	push   $0x5302
    2630:	e8 ad 22 00 00       	call   48e2 <open>
    2635:	83 c4 10             	add    $0x10,%esp
    2638:	85 c0                	test   %eax,%eax
    263a:	0f 89 27 01 00 00    	jns    2767 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    2640:	83 ec 08             	sub    $0x8,%esp
    2643:	6a 00                	push   $0x0
    2645:	68 06 53 00 00       	push   $0x5306
    264a:	e8 93 22 00 00       	call   48e2 <open>
  if(fd < 0){
    264f:	83 c4 10             	add    $0x10,%esp
    2652:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    2654:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2656:	0f 88 f8 00 00 00    	js     2754 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    265c:	83 ec 04             	sub    $0x4,%esp
    265f:	68 00 20 00 00       	push   $0x2000
    2664:	68 00 96 00 00       	push   $0x9600
    2669:	50                   	push   %eax
    266a:	e8 4b 22 00 00       	call   48ba <read>
    266f:	83 c4 10             	add    $0x10,%esp
    2672:	83 f8 05             	cmp    $0x5,%eax
    2675:	0f 85 c6 00 00 00    	jne    2741 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    267b:	83 ec 0c             	sub    $0xc,%esp
    267e:	53                   	push   %ebx
    267f:	e8 46 22 00 00       	call   48ca <close>

  if(link("lf2", "lf2") >= 0){
    2684:	58                   	pop    %eax
    2685:	5a                   	pop    %edx
    2686:	68 06 53 00 00       	push   $0x5306
    268b:	68 06 53 00 00       	push   $0x5306
    2690:	e8 6d 22 00 00       	call   4902 <link>
    2695:	83 c4 10             	add    $0x10,%esp
    2698:	85 c0                	test   %eax,%eax
    269a:	0f 89 8e 00 00 00    	jns    272e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    26a0:	83 ec 0c             	sub    $0xc,%esp
    26a3:	68 06 53 00 00       	push   $0x5306
    26a8:	e8 45 22 00 00       	call   48f2 <unlink>
  if(link("lf2", "lf1") >= 0){
    26ad:	59                   	pop    %ecx
    26ae:	5b                   	pop    %ebx
    26af:	68 02 53 00 00       	push   $0x5302
    26b4:	68 06 53 00 00       	push   $0x5306
    26b9:	e8 44 22 00 00       	call   4902 <link>
    26be:	83 c4 10             	add    $0x10,%esp
    26c1:	85 c0                	test   %eax,%eax
    26c3:	79 56                	jns    271b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    26c5:	83 ec 08             	sub    $0x8,%esp
    26c8:	68 02 53 00 00       	push   $0x5302
    26cd:	68 ca 55 00 00       	push   $0x55ca
    26d2:	e8 2b 22 00 00       	call   4902 <link>
    26d7:	83 c4 10             	add    $0x10,%esp
    26da:	85 c0                	test   %eax,%eax
    26dc:	79 2a                	jns    2708 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    26de:	83 ec 08             	sub    $0x8,%esp
    26e1:	68 a0 53 00 00       	push   $0x53a0
    26e6:	6a 01                	push   $0x1
    26e8:	e8 13 23 00 00       	call   4a00 <printf>
}
    26ed:	83 c4 10             	add    $0x10,%esp
    26f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    26f3:	c9                   	leave  
    26f4:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    26f5:	50                   	push   %eax
    26f6:	50                   	push   %eax
    26f7:	68 0a 53 00 00       	push   $0x530a
    26fc:	6a 01                	push   $0x1
    26fe:	e8 fd 22 00 00       	call   4a00 <printf>
    exit();
    2703:	e8 9a 21 00 00       	call   48a2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    2708:	50                   	push   %eax
    2709:	50                   	push   %eax
    270a:	68 84 53 00 00       	push   $0x5384
    270f:	6a 01                	push   $0x1
    2711:	e8 ea 22 00 00       	call   4a00 <printf>
    exit();
    2716:	e8 87 21 00 00       	call   48a2 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    271b:	52                   	push   %edx
    271c:	52                   	push   %edx
    271d:	68 38 5f 00 00       	push   $0x5f38
    2722:	6a 01                	push   $0x1
    2724:	e8 d7 22 00 00       	call   4a00 <printf>
    exit();
    2729:	e8 74 21 00 00       	call   48a2 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    272e:	50                   	push   %eax
    272f:	50                   	push   %eax
    2730:	68 66 53 00 00       	push   $0x5366
    2735:	6a 01                	push   $0x1
    2737:	e8 c4 22 00 00       	call   4a00 <printf>
    exit();
    273c:	e8 61 21 00 00       	call   48a2 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    2741:	51                   	push   %ecx
    2742:	51                   	push   %ecx
    2743:	68 55 53 00 00       	push   $0x5355
    2748:	6a 01                	push   $0x1
    274a:	e8 b1 22 00 00       	call   4a00 <printf>
    exit();
    274f:	e8 4e 21 00 00       	call   48a2 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    2754:	53                   	push   %ebx
    2755:	53                   	push   %ebx
    2756:	68 44 53 00 00       	push   $0x5344
    275b:	6a 01                	push   $0x1
    275d:	e8 9e 22 00 00       	call   4a00 <printf>
    exit();
    2762:	e8 3b 21 00 00       	call   48a2 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    2767:	50                   	push   %eax
    2768:	50                   	push   %eax
    2769:	68 10 5f 00 00       	push   $0x5f10
    276e:	6a 01                	push   $0x1
    2770:	e8 8b 22 00 00       	call   4a00 <printf>
    exit();
    2775:	e8 28 21 00 00       	call   48a2 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    277a:	51                   	push   %ecx
    277b:	51                   	push   %ecx
    277c:	68 2f 53 00 00       	push   $0x532f
    2781:	6a 01                	push   $0x1
    2783:	e8 78 22 00 00       	call   4a00 <printf>
    exit();
    2788:	e8 15 21 00 00       	call   48a2 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    278d:	50                   	push   %eax
    278e:	50                   	push   %eax
    278f:	68 1d 53 00 00       	push   $0x531d
    2794:	6a 01                	push   $0x1
    2796:	e8 65 22 00 00       	call   4a00 <printf>
    exit();
    279b:	e8 02 21 00 00       	call   48a2 <exit>

000027a0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    27a0:	55                   	push   %ebp
    27a1:	89 e5                	mov    %esp,%ebp
    27a3:	57                   	push   %edi
    27a4:	56                   	push   %esi
    27a5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    27a6:	31 f6                	xor    %esi,%esi
    27a8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    27ab:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    27b0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    27b3:	68 ad 53 00 00       	push   $0x53ad
    27b8:	6a 01                	push   $0x1
    27ba:	e8 41 22 00 00       	call   4a00 <printf>
  file[0] = 'C';
    27bf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    27c3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    27c7:	83 c4 10             	add    $0x10,%esp
    27ca:	eb 51                	jmp    281d <concreate+0x7d>
    27cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    27d0:	89 f0                	mov    %esi,%eax
    27d2:	89 f1                	mov    %esi,%ecx
    27d4:	f7 ef                	imul   %edi
    27d6:	89 f0                	mov    %esi,%eax
    27d8:	c1 f8 1f             	sar    $0x1f,%eax
    27db:	29 c2                	sub    %eax,%edx
    27dd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    27e0:	29 c1                	sub    %eax,%ecx
    27e2:	83 f9 01             	cmp    $0x1,%ecx
    27e5:	0f 84 b5 00 00 00    	je     28a0 <concreate+0x100>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    27eb:	83 ec 08             	sub    $0x8,%esp
    27ee:	68 02 02 00 00       	push   $0x202
    27f3:	53                   	push   %ebx
    27f4:	e8 e9 20 00 00       	call   48e2 <open>
      if(fd < 0){
    27f9:	83 c4 10             	add    $0x10,%esp
    27fc:	85 c0                	test   %eax,%eax
    27fe:	78 6d                	js     286d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    2800:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    2803:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    2806:	50                   	push   %eax
    2807:	e8 be 20 00 00       	call   48ca <close>
    280c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    280f:	e8 96 20 00 00       	call   48aa <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    2814:	83 fe 28             	cmp    $0x28,%esi
    2817:	0f 84 ab 00 00 00    	je     28c8 <concreate+0x128>
    file[1] = '0' + i;
    unlink(file);
    281d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    2820:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    2823:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    2824:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    2827:	e8 c6 20 00 00       	call   48f2 <unlink>
    pid = fork();
    282c:	e8 69 20 00 00       	call   489a <fork>
    if(pid && (i % 3) == 1){
    2831:	83 c4 10             	add    $0x10,%esp
    2834:	85 c0                	test   %eax,%eax
    2836:	75 98                	jne    27d0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    2838:	89 f0                	mov    %esi,%eax
    283a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    283f:	f7 ea                	imul   %edx
    2841:	89 f0                	mov    %esi,%eax
    2843:	c1 f8 1f             	sar    $0x1f,%eax
    2846:	d1 fa                	sar    %edx
    2848:	29 c2                	sub    %eax,%edx
    284a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    284d:	29 c6                	sub    %eax,%esi
    284f:	83 fe 01             	cmp    $0x1,%esi
    2852:	74 34                	je     2888 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    2854:	83 ec 08             	sub    $0x8,%esp
    2857:	68 02 02 00 00       	push   $0x202
    285c:	53                   	push   %ebx
    285d:	e8 80 20 00 00       	call   48e2 <open>
      if(fd < 0){
    2862:	83 c4 10             	add    $0x10,%esp
    2865:	85 c0                	test   %eax,%eax
    2867:	0f 89 32 02 00 00    	jns    2a9f <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    286d:	83 ec 04             	sub    $0x4,%esp
    2870:	53                   	push   %ebx
    2871:	68 c0 53 00 00       	push   $0x53c0
    2876:	6a 01                	push   $0x1
    2878:	e8 83 21 00 00       	call   4a00 <printf>
        exit();
    287d:	e8 20 20 00 00       	call   48a2 <exit>
    2882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    2888:	83 ec 08             	sub    $0x8,%esp
    288b:	53                   	push   %ebx
    288c:	68 bd 53 00 00       	push   $0x53bd
    2891:	e8 6c 20 00 00       	call   4902 <link>
    2896:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    2899:	e8 04 20 00 00       	call   48a2 <exit>
    289e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    28a0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    28a3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    28a6:	53                   	push   %ebx
    28a7:	68 bd 53 00 00       	push   $0x53bd
    28ac:	e8 51 20 00 00       	call   4902 <link>
    28b1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    28b4:	e8 f1 1f 00 00       	call   48aa <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    28b9:	83 fe 28             	cmp    $0x28,%esi
    28bc:	0f 85 5b ff ff ff    	jne    281d <concreate+0x7d>
    28c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    28c8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    28cb:	83 ec 04             	sub    $0x4,%esp
    28ce:	8d 7d b0             	lea    -0x50(%ebp),%edi
    28d1:	6a 28                	push   $0x28
    28d3:	6a 00                	push   $0x0
    28d5:	50                   	push   %eax
    28d6:	e8 35 1e 00 00       	call   4710 <memset>
  fd = open(".", 0);
    28db:	59                   	pop    %ecx
    28dc:	5e                   	pop    %esi
    28dd:	6a 00                	push   $0x0
    28df:	68 ca 55 00 00       	push   $0x55ca
    28e4:	e8 f9 1f 00 00       	call   48e2 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    28e9:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    28ec:	89 c6                	mov    %eax,%esi
  n = 0;
    28ee:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    28f5:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    28f8:	83 ec 04             	sub    $0x4,%esp
    28fb:	6a 10                	push   $0x10
    28fd:	57                   	push   %edi
    28fe:	56                   	push   %esi
    28ff:	e8 b6 1f 00 00       	call   48ba <read>
    2904:	83 c4 10             	add    $0x10,%esp
    2907:	85 c0                	test   %eax,%eax
    2909:	7e 3d                	jle    2948 <concreate+0x1a8>
    if(de.inum == 0)
    290b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    2910:	74 e6                	je     28f8 <concreate+0x158>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    2912:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    2916:	75 e0                	jne    28f8 <concreate+0x158>
    2918:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    291c:	75 da                	jne    28f8 <concreate+0x158>
      i = de.name[1] - '0';
    291e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    2922:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    2925:	83 f8 27             	cmp    $0x27,%eax
    2928:	0f 87 59 01 00 00    	ja     2a87 <concreate+0x2e7>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    292e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    2933:	0f 85 36 01 00 00    	jne    2a6f <concreate+0x2cf>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    2939:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    293e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    2942:	eb b4                	jmp    28f8 <concreate+0x158>
    2944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    2948:	83 ec 0c             	sub    $0xc,%esp
    294b:	56                   	push   %esi
    294c:	e8 79 1f 00 00       	call   48ca <close>

  if(n != 40){
    2951:	83 c4 10             	add    $0x10,%esp
    2954:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    2958:	0f 85 fd 00 00 00    	jne    2a5b <concreate+0x2bb>
    295e:	31 f6                	xor    %esi,%esi
    2960:	eb 70                	jmp    29d2 <concreate+0x232>
    2962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    2968:	83 fa 01             	cmp    $0x1,%edx
    296b:	0f 85 99 00 00 00    	jne    2a0a <concreate+0x26a>
      close(open(file, 0));
    2971:	83 ec 08             	sub    $0x8,%esp
    2974:	6a 00                	push   $0x0
    2976:	53                   	push   %ebx
    2977:	e8 66 1f 00 00       	call   48e2 <open>
    297c:	89 04 24             	mov    %eax,(%esp)
    297f:	e8 46 1f 00 00       	call   48ca <close>
      close(open(file, 0));
    2984:	58                   	pop    %eax
    2985:	5a                   	pop    %edx
    2986:	6a 00                	push   $0x0
    2988:	53                   	push   %ebx
    2989:	e8 54 1f 00 00       	call   48e2 <open>
    298e:	89 04 24             	mov    %eax,(%esp)
    2991:	e8 34 1f 00 00       	call   48ca <close>
      close(open(file, 0));
    2996:	59                   	pop    %ecx
    2997:	58                   	pop    %eax
    2998:	6a 00                	push   $0x0
    299a:	53                   	push   %ebx
    299b:	e8 42 1f 00 00       	call   48e2 <open>
    29a0:	89 04 24             	mov    %eax,(%esp)
    29a3:	e8 22 1f 00 00       	call   48ca <close>
      close(open(file, 0));
    29a8:	58                   	pop    %eax
    29a9:	5a                   	pop    %edx
    29aa:	6a 00                	push   $0x0
    29ac:	53                   	push   %ebx
    29ad:	e8 30 1f 00 00       	call   48e2 <open>
    29b2:	89 04 24             	mov    %eax,(%esp)
    29b5:	e8 10 1f 00 00       	call   48ca <close>
    29ba:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    29bd:	85 ff                	test   %edi,%edi
    29bf:	0f 84 d4 fe ff ff    	je     2899 <concreate+0xf9>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    29c5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    29c8:	e8 dd 1e 00 00       	call   48aa <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    29cd:	83 fe 28             	cmp    $0x28,%esi
    29d0:	74 5e                	je     2a30 <concreate+0x290>
    file[1] = '0' + i;
    29d2:	8d 46 30             	lea    0x30(%esi),%eax
    29d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    29d8:	e8 bd 1e 00 00       	call   489a <fork>
    if(pid < 0){
    29dd:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    29df:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    29e1:	78 64                	js     2a47 <concreate+0x2a7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    29e3:	b8 56 55 55 55       	mov    $0x55555556,%eax
    29e8:	f7 ee                	imul   %esi
    29ea:	89 f0                	mov    %esi,%eax
    29ec:	c1 f8 1f             	sar    $0x1f,%eax
    29ef:	29 c2                	sub    %eax,%edx
    29f1:	8d 04 52             	lea    (%edx,%edx,2),%eax
    29f4:	89 f2                	mov    %esi,%edx
    29f6:	29 c2                	sub    %eax,%edx
    29f8:	89 f8                	mov    %edi,%eax
    29fa:	09 d0                	or     %edx,%eax
    29fc:	0f 84 6f ff ff ff    	je     2971 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    2a02:	85 ff                	test   %edi,%edi
    2a04:	0f 85 5e ff ff ff    	jne    2968 <concreate+0x1c8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    2a0a:	83 ec 0c             	sub    $0xc,%esp
    2a0d:	53                   	push   %ebx
    2a0e:	e8 df 1e 00 00       	call   48f2 <unlink>
      unlink(file);
    2a13:	89 1c 24             	mov    %ebx,(%esp)
    2a16:	e8 d7 1e 00 00       	call   48f2 <unlink>
      unlink(file);
    2a1b:	89 1c 24             	mov    %ebx,(%esp)
    2a1e:	e8 cf 1e 00 00       	call   48f2 <unlink>
      unlink(file);
    2a23:	89 1c 24             	mov    %ebx,(%esp)
    2a26:	e8 c7 1e 00 00       	call   48f2 <unlink>
    2a2b:	83 c4 10             	add    $0x10,%esp
    2a2e:	eb 8d                	jmp    29bd <concreate+0x21d>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    2a30:	83 ec 08             	sub    $0x8,%esp
    2a33:	68 12 54 00 00       	push   $0x5412
    2a38:	6a 01                	push   $0x1
    2a3a:	e8 c1 1f 00 00       	call   4a00 <printf>
}
    2a3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2a42:	5b                   	pop    %ebx
    2a43:	5e                   	pop    %esi
    2a44:	5f                   	pop    %edi
    2a45:	5d                   	pop    %ebp
    2a46:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    2a47:	83 ec 08             	sub    $0x8,%esp
    2a4a:	68 95 5c 00 00       	push   $0x5c95
    2a4f:	6a 01                	push   $0x1
    2a51:	e8 aa 1f 00 00       	call   4a00 <printf>
      exit();
    2a56:	e8 47 1e 00 00       	call   48a2 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    2a5b:	83 ec 08             	sub    $0x8,%esp
    2a5e:	68 5c 5f 00 00       	push   $0x5f5c
    2a63:	6a 01                	push   $0x1
    2a65:	e8 96 1f 00 00       	call   4a00 <printf>
    exit();
    2a6a:	e8 33 1e 00 00       	call   48a2 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    2a6f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2a72:	83 ec 04             	sub    $0x4,%esp
    2a75:	50                   	push   %eax
    2a76:	68 f5 53 00 00       	push   $0x53f5
    2a7b:	6a 01                	push   $0x1
    2a7d:	e8 7e 1f 00 00       	call   4a00 <printf>
        exit();
    2a82:	e8 1b 1e 00 00       	call   48a2 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    2a87:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2a8a:	83 ec 04             	sub    $0x4,%esp
    2a8d:	50                   	push   %eax
    2a8e:	68 dc 53 00 00       	push   $0x53dc
    2a93:	6a 01                	push   $0x1
    2a95:	e8 66 1f 00 00       	call   4a00 <printf>
        exit();
    2a9a:	e8 03 1e 00 00       	call   48a2 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    2a9f:	83 ec 0c             	sub    $0xc,%esp
    2aa2:	50                   	push   %eax
    2aa3:	e8 22 1e 00 00       	call   48ca <close>
    2aa8:	83 c4 10             	add    $0x10,%esp
    2aab:	e9 e9 fd ff ff       	jmp    2899 <concreate+0xf9>

00002ab0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    2ab0:	55                   	push   %ebp
    2ab1:	89 e5                	mov    %esp,%ebp
    2ab3:	57                   	push   %edi
    2ab4:	56                   	push   %esi
    2ab5:	53                   	push   %ebx
    2ab6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    2ab9:	68 20 54 00 00       	push   $0x5420
    2abe:	6a 01                	push   $0x1
    2ac0:	e8 3b 1f 00 00       	call   4a00 <printf>

  unlink("x");
    2ac5:	c7 04 24 ad 56 00 00 	movl   $0x56ad,(%esp)
    2acc:	e8 21 1e 00 00       	call   48f2 <unlink>
  pid = fork();
    2ad1:	e8 c4 1d 00 00       	call   489a <fork>
  if(pid < 0){
    2ad6:	83 c4 10             	add    $0x10,%esp
    2ad9:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    2adb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2ade:	0f 88 b6 00 00 00    	js     2b9a <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    2ae4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    2ae8:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    2aed:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    2af2:	19 ff                	sbb    %edi,%edi
    2af4:	83 e7 60             	and    $0x60,%edi
    2af7:	83 c7 01             	add    $0x1,%edi
    2afa:	eb 1e                	jmp    2b1a <linkunlink+0x6a>
    2afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    2b00:	83 fa 01             	cmp    $0x1,%edx
    2b03:	74 7b                	je     2b80 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    2b05:	83 ec 0c             	sub    $0xc,%esp
    2b08:	68 ad 56 00 00       	push   $0x56ad
    2b0d:	e8 e0 1d 00 00       	call   48f2 <unlink>
    2b12:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    2b15:	83 eb 01             	sub    $0x1,%ebx
    2b18:	74 3d                	je     2b57 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    2b1a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    2b20:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    2b26:	89 f8                	mov    %edi,%eax
    2b28:	f7 e6                	mul    %esi
    2b2a:	d1 ea                	shr    %edx
    2b2c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    2b2f:	89 fa                	mov    %edi,%edx
    2b31:	29 c2                	sub    %eax,%edx
    2b33:	75 cb                	jne    2b00 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    2b35:	83 ec 08             	sub    $0x8,%esp
    2b38:	68 02 02 00 00       	push   $0x202
    2b3d:	68 ad 56 00 00       	push   $0x56ad
    2b42:	e8 9b 1d 00 00       	call   48e2 <open>
    2b47:	89 04 24             	mov    %eax,(%esp)
    2b4a:	e8 7b 1d 00 00       	call   48ca <close>
    2b4f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    2b52:	83 eb 01             	sub    $0x1,%ebx
    2b55:	75 c3                	jne    2b1a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    2b57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b5a:	85 c0                	test   %eax,%eax
    2b5c:	74 50                	je     2bae <linkunlink+0xfe>
    wait();
    2b5e:	e8 47 1d 00 00       	call   48aa <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    2b63:	83 ec 08             	sub    $0x8,%esp
    2b66:	68 35 54 00 00       	push   $0x5435
    2b6b:	6a 01                	push   $0x1
    2b6d:	e8 8e 1e 00 00       	call   4a00 <printf>
}
    2b72:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2b75:	5b                   	pop    %ebx
    2b76:	5e                   	pop    %esi
    2b77:	5f                   	pop    %edi
    2b78:	5d                   	pop    %ebp
    2b79:	c3                   	ret    
    2b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    2b80:	83 ec 08             	sub    $0x8,%esp
    2b83:	68 ad 56 00 00       	push   $0x56ad
    2b88:	68 31 54 00 00       	push   $0x5431
    2b8d:	e8 70 1d 00 00       	call   4902 <link>
    2b92:	83 c4 10             	add    $0x10,%esp
    2b95:	e9 7b ff ff ff       	jmp    2b15 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    2b9a:	83 ec 08             	sub    $0x8,%esp
    2b9d:	68 95 5c 00 00       	push   $0x5c95
    2ba2:	6a 01                	push   $0x1
    2ba4:	e8 57 1e 00 00       	call   4a00 <printf>
    exit();
    2ba9:	e8 f4 1c 00 00       	call   48a2 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    2bae:	e8 ef 1c 00 00       	call   48a2 <exit>
    2bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002bc0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    2bc0:	55                   	push   %ebp
    2bc1:	89 e5                	mov    %esp,%ebp
    2bc3:	56                   	push   %esi
    2bc4:	53                   	push   %ebx
    2bc5:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    2bc8:	68 44 54 00 00       	push   $0x5444
    2bcd:	6a 01                	push   $0x1
    2bcf:	e8 2c 1e 00 00       	call   4a00 <printf>
  unlink("bd");
    2bd4:	c7 04 24 51 54 00 00 	movl   $0x5451,(%esp)
    2bdb:	e8 12 1d 00 00       	call   48f2 <unlink>

  fd = open("bd", O_CREATE);
    2be0:	58                   	pop    %eax
    2be1:	5a                   	pop    %edx
    2be2:	68 00 02 00 00       	push   $0x200
    2be7:	68 51 54 00 00       	push   $0x5451
    2bec:	e8 f1 1c 00 00       	call   48e2 <open>
  if(fd < 0){
    2bf1:	83 c4 10             	add    $0x10,%esp
    2bf4:	85 c0                	test   %eax,%eax
    2bf6:	0f 88 de 00 00 00    	js     2cda <bigdir+0x11a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    2bfc:	83 ec 0c             	sub    $0xc,%esp
    2bff:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    2c02:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    2c04:	50                   	push   %eax
    2c05:	e8 c0 1c 00 00       	call   48ca <close>
    2c0a:	83 c4 10             	add    $0x10,%esp
    2c0d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    2c10:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    2c12:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    2c15:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    2c19:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    2c1c:	56                   	push   %esi
    2c1d:	68 51 54 00 00       	push   $0x5451
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    2c22:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    2c25:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    2c29:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    2c2c:	89 d8                	mov    %ebx,%eax
    2c2e:	83 e0 3f             	and    $0x3f,%eax
    2c31:	83 c0 30             	add    $0x30,%eax
    2c34:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    2c37:	e8 c6 1c 00 00       	call   4902 <link>
    2c3c:	83 c4 10             	add    $0x10,%esp
    2c3f:	85 c0                	test   %eax,%eax
    2c41:	75 6f                	jne    2cb2 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    2c43:	83 c3 01             	add    $0x1,%ebx
    2c46:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2c4c:	75 c2                	jne    2c10 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    2c4e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    2c51:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    2c53:	68 51 54 00 00       	push   $0x5451
    2c58:	e8 95 1c 00 00       	call   48f2 <unlink>
    2c5d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    2c60:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    2c62:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    2c65:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    2c69:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    2c6c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    2c6d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    2c71:	83 c0 30             	add    $0x30,%eax
    2c74:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    2c77:	89 d8                	mov    %ebx,%eax
    2c79:	83 e0 3f             	and    $0x3f,%eax
    2c7c:	83 c0 30             	add    $0x30,%eax
    2c7f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    2c82:	e8 6b 1c 00 00       	call   48f2 <unlink>
    2c87:	83 c4 10             	add    $0x10,%esp
    2c8a:	85 c0                	test   %eax,%eax
    2c8c:	75 38                	jne    2cc6 <bigdir+0x106>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    2c8e:	83 c3 01             	add    $0x1,%ebx
    2c91:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2c97:	75 c7                	jne    2c60 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    2c99:	83 ec 08             	sub    $0x8,%esp
    2c9c:	68 93 54 00 00       	push   $0x5493
    2ca1:	6a 01                	push   $0x1
    2ca3:	e8 58 1d 00 00       	call   4a00 <printf>
}
    2ca8:	83 c4 10             	add    $0x10,%esp
    2cab:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2cae:	5b                   	pop    %ebx
    2caf:	5e                   	pop    %esi
    2cb0:	5d                   	pop    %ebp
    2cb1:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    2cb2:	83 ec 08             	sub    $0x8,%esp
    2cb5:	68 6a 54 00 00       	push   $0x546a
    2cba:	6a 01                	push   $0x1
    2cbc:	e8 3f 1d 00 00       	call   4a00 <printf>
      exit();
    2cc1:	e8 dc 1b 00 00       	call   48a2 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    2cc6:	83 ec 08             	sub    $0x8,%esp
    2cc9:	68 7e 54 00 00       	push   $0x547e
    2cce:	6a 01                	push   $0x1
    2cd0:	e8 2b 1d 00 00       	call   4a00 <printf>
      exit();
    2cd5:	e8 c8 1b 00 00       	call   48a2 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    2cda:	83 ec 08             	sub    $0x8,%esp
    2cdd:	68 54 54 00 00       	push   $0x5454
    2ce2:	6a 01                	push   $0x1
    2ce4:	e8 17 1d 00 00       	call   4a00 <printf>
    exit();
    2ce9:	e8 b4 1b 00 00       	call   48a2 <exit>
    2cee:	66 90                	xchg   %ax,%ax

00002cf0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    2cf0:	55                   	push   %ebp
    2cf1:	89 e5                	mov    %esp,%ebp
    2cf3:	53                   	push   %ebx
    2cf4:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    2cf7:	68 9e 54 00 00       	push   $0x549e
    2cfc:	6a 01                	push   $0x1
    2cfe:	e8 fd 1c 00 00       	call   4a00 <printf>

  unlink("ff");
    2d03:	c7 04 24 27 55 00 00 	movl   $0x5527,(%esp)
    2d0a:	e8 e3 1b 00 00       	call   48f2 <unlink>
  if(mkdir("dd") != 0){
    2d0f:	c7 04 24 c4 55 00 00 	movl   $0x55c4,(%esp)
    2d16:	e8 ef 1b 00 00       	call   490a <mkdir>
    2d1b:	83 c4 10             	add    $0x10,%esp
    2d1e:	85 c0                	test   %eax,%eax
    2d20:	0f 85 b3 05 00 00    	jne    32d9 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    2d26:	83 ec 08             	sub    $0x8,%esp
    2d29:	68 02 02 00 00       	push   $0x202
    2d2e:	68 fd 54 00 00       	push   $0x54fd
    2d33:	e8 aa 1b 00 00       	call   48e2 <open>
  if(fd < 0){
    2d38:	83 c4 10             	add    $0x10,%esp
    2d3b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    2d3d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2d3f:	0f 88 81 05 00 00    	js     32c6 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    2d45:	83 ec 04             	sub    $0x4,%esp
    2d48:	6a 02                	push   $0x2
    2d4a:	68 27 55 00 00       	push   $0x5527
    2d4f:	50                   	push   %eax
    2d50:	e8 6d 1b 00 00       	call   48c2 <write>
  close(fd);
    2d55:	89 1c 24             	mov    %ebx,(%esp)
    2d58:	e8 6d 1b 00 00       	call   48ca <close>

  if(unlink("dd") >= 0){
    2d5d:	c7 04 24 c4 55 00 00 	movl   $0x55c4,(%esp)
    2d64:	e8 89 1b 00 00       	call   48f2 <unlink>
    2d69:	83 c4 10             	add    $0x10,%esp
    2d6c:	85 c0                	test   %eax,%eax
    2d6e:	0f 89 3f 05 00 00    	jns    32b3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    2d74:	83 ec 0c             	sub    $0xc,%esp
    2d77:	68 d8 54 00 00       	push   $0x54d8
    2d7c:	e8 89 1b 00 00       	call   490a <mkdir>
    2d81:	83 c4 10             	add    $0x10,%esp
    2d84:	85 c0                	test   %eax,%eax
    2d86:	0f 85 14 05 00 00    	jne    32a0 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2d8c:	83 ec 08             	sub    $0x8,%esp
    2d8f:	68 02 02 00 00       	push   $0x202
    2d94:	68 fa 54 00 00       	push   $0x54fa
    2d99:	e8 44 1b 00 00       	call   48e2 <open>
  if(fd < 0){
    2d9e:	83 c4 10             	add    $0x10,%esp
    2da1:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2da3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2da5:	0f 88 24 04 00 00    	js     31cf <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    2dab:	83 ec 04             	sub    $0x4,%esp
    2dae:	6a 02                	push   $0x2
    2db0:	68 1b 55 00 00       	push   $0x551b
    2db5:	50                   	push   %eax
    2db6:	e8 07 1b 00 00       	call   48c2 <write>
  close(fd);
    2dbb:	89 1c 24             	mov    %ebx,(%esp)
    2dbe:	e8 07 1b 00 00       	call   48ca <close>

  fd = open("dd/dd/../ff", 0);
    2dc3:	58                   	pop    %eax
    2dc4:	5a                   	pop    %edx
    2dc5:	6a 00                	push   $0x0
    2dc7:	68 1e 55 00 00       	push   $0x551e
    2dcc:	e8 11 1b 00 00       	call   48e2 <open>
  if(fd < 0){
    2dd1:	83 c4 10             	add    $0x10,%esp
    2dd4:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    2dd6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2dd8:	0f 88 de 03 00 00    	js     31bc <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    2dde:	83 ec 04             	sub    $0x4,%esp
    2de1:	68 00 20 00 00       	push   $0x2000
    2de6:	68 00 96 00 00       	push   $0x9600
    2deb:	50                   	push   %eax
    2dec:	e8 c9 1a 00 00       	call   48ba <read>
  if(cc != 2 || buf[0] != 'f'){
    2df1:	83 c4 10             	add    $0x10,%esp
    2df4:	83 f8 02             	cmp    $0x2,%eax
    2df7:	0f 85 3a 03 00 00    	jne    3137 <subdir+0x447>
    2dfd:	80 3d 00 96 00 00 66 	cmpb   $0x66,0x9600
    2e04:	0f 85 2d 03 00 00    	jne    3137 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    2e0a:	83 ec 0c             	sub    $0xc,%esp
    2e0d:	53                   	push   %ebx
    2e0e:	e8 b7 1a 00 00       	call   48ca <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2e13:	5b                   	pop    %ebx
    2e14:	58                   	pop    %eax
    2e15:	68 5e 55 00 00       	push   $0x555e
    2e1a:	68 fa 54 00 00       	push   $0x54fa
    2e1f:	e8 de 1a 00 00       	call   4902 <link>
    2e24:	83 c4 10             	add    $0x10,%esp
    2e27:	85 c0                	test   %eax,%eax
    2e29:	0f 85 c6 03 00 00    	jne    31f5 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    2e2f:	83 ec 0c             	sub    $0xc,%esp
    2e32:	68 fa 54 00 00       	push   $0x54fa
    2e37:	e8 b6 1a 00 00       	call   48f2 <unlink>
    2e3c:	83 c4 10             	add    $0x10,%esp
    2e3f:	85 c0                	test   %eax,%eax
    2e41:	0f 85 16 03 00 00    	jne    315d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2e47:	83 ec 08             	sub    $0x8,%esp
    2e4a:	6a 00                	push   $0x0
    2e4c:	68 fa 54 00 00       	push   $0x54fa
    2e51:	e8 8c 1a 00 00       	call   48e2 <open>
    2e56:	83 c4 10             	add    $0x10,%esp
    2e59:	85 c0                	test   %eax,%eax
    2e5b:	0f 89 2c 04 00 00    	jns    328d <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    2e61:	83 ec 0c             	sub    $0xc,%esp
    2e64:	68 c4 55 00 00       	push   $0x55c4
    2e69:	e8 a4 1a 00 00       	call   4912 <chdir>
    2e6e:	83 c4 10             	add    $0x10,%esp
    2e71:	85 c0                	test   %eax,%eax
    2e73:	0f 85 01 04 00 00    	jne    327a <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    2e79:	83 ec 0c             	sub    $0xc,%esp
    2e7c:	68 92 55 00 00       	push   $0x5592
    2e81:	e8 8c 1a 00 00       	call   4912 <chdir>
    2e86:	83 c4 10             	add    $0x10,%esp
    2e89:	85 c0                	test   %eax,%eax
    2e8b:	0f 85 b9 02 00 00    	jne    314a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    2e91:	83 ec 0c             	sub    $0xc,%esp
    2e94:	68 b8 55 00 00       	push   $0x55b8
    2e99:	e8 74 1a 00 00       	call   4912 <chdir>
    2e9e:	83 c4 10             	add    $0x10,%esp
    2ea1:	85 c0                	test   %eax,%eax
    2ea3:	0f 85 a1 02 00 00    	jne    314a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    2ea9:	83 ec 0c             	sub    $0xc,%esp
    2eac:	68 c7 55 00 00       	push   $0x55c7
    2eb1:	e8 5c 1a 00 00       	call   4912 <chdir>
    2eb6:	83 c4 10             	add    $0x10,%esp
    2eb9:	85 c0                	test   %eax,%eax
    2ebb:	0f 85 21 03 00 00    	jne    31e2 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    2ec1:	83 ec 08             	sub    $0x8,%esp
    2ec4:	6a 00                	push   $0x0
    2ec6:	68 5e 55 00 00       	push   $0x555e
    2ecb:	e8 12 1a 00 00       	call   48e2 <open>
  if(fd < 0){
    2ed0:	83 c4 10             	add    $0x10,%esp
    2ed3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    2ed5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2ed7:	0f 88 e0 04 00 00    	js     33bd <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    2edd:	83 ec 04             	sub    $0x4,%esp
    2ee0:	68 00 20 00 00       	push   $0x2000
    2ee5:	68 00 96 00 00       	push   $0x9600
    2eea:	50                   	push   %eax
    2eeb:	e8 ca 19 00 00       	call   48ba <read>
    2ef0:	83 c4 10             	add    $0x10,%esp
    2ef3:	83 f8 02             	cmp    $0x2,%eax
    2ef6:	0f 85 ae 04 00 00    	jne    33aa <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    2efc:	83 ec 0c             	sub    $0xc,%esp
    2eff:	53                   	push   %ebx
    2f00:	e8 c5 19 00 00       	call   48ca <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2f05:	59                   	pop    %ecx
    2f06:	5b                   	pop    %ebx
    2f07:	6a 00                	push   $0x0
    2f09:	68 fa 54 00 00       	push   $0x54fa
    2f0e:	e8 cf 19 00 00       	call   48e2 <open>
    2f13:	83 c4 10             	add    $0x10,%esp
    2f16:	85 c0                	test   %eax,%eax
    2f18:	0f 89 65 02 00 00    	jns    3183 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2f1e:	83 ec 08             	sub    $0x8,%esp
    2f21:	68 02 02 00 00       	push   $0x202
    2f26:	68 12 56 00 00       	push   $0x5612
    2f2b:	e8 b2 19 00 00       	call   48e2 <open>
    2f30:	83 c4 10             	add    $0x10,%esp
    2f33:	85 c0                	test   %eax,%eax
    2f35:	0f 89 35 02 00 00    	jns    3170 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2f3b:	83 ec 08             	sub    $0x8,%esp
    2f3e:	68 02 02 00 00       	push   $0x202
    2f43:	68 37 56 00 00       	push   $0x5637
    2f48:	e8 95 19 00 00       	call   48e2 <open>
    2f4d:	83 c4 10             	add    $0x10,%esp
    2f50:	85 c0                	test   %eax,%eax
    2f52:	0f 89 0f 03 00 00    	jns    3267 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    2f58:	83 ec 08             	sub    $0x8,%esp
    2f5b:	68 00 02 00 00       	push   $0x200
    2f60:	68 c4 55 00 00       	push   $0x55c4
    2f65:	e8 78 19 00 00       	call   48e2 <open>
    2f6a:	83 c4 10             	add    $0x10,%esp
    2f6d:	85 c0                	test   %eax,%eax
    2f6f:	0f 89 df 02 00 00    	jns    3254 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    2f75:	83 ec 08             	sub    $0x8,%esp
    2f78:	6a 02                	push   $0x2
    2f7a:	68 c4 55 00 00       	push   $0x55c4
    2f7f:	e8 5e 19 00 00       	call   48e2 <open>
    2f84:	83 c4 10             	add    $0x10,%esp
    2f87:	85 c0                	test   %eax,%eax
    2f89:	0f 89 b2 02 00 00    	jns    3241 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    2f8f:	83 ec 08             	sub    $0x8,%esp
    2f92:	6a 01                	push   $0x1
    2f94:	68 c4 55 00 00       	push   $0x55c4
    2f99:	e8 44 19 00 00       	call   48e2 <open>
    2f9e:	83 c4 10             	add    $0x10,%esp
    2fa1:	85 c0                	test   %eax,%eax
    2fa3:	0f 89 85 02 00 00    	jns    322e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2fa9:	83 ec 08             	sub    $0x8,%esp
    2fac:	68 a6 56 00 00       	push   $0x56a6
    2fb1:	68 12 56 00 00       	push   $0x5612
    2fb6:	e8 47 19 00 00       	call   4902 <link>
    2fbb:	83 c4 10             	add    $0x10,%esp
    2fbe:	85 c0                	test   %eax,%eax
    2fc0:	0f 84 55 02 00 00    	je     321b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2fc6:	83 ec 08             	sub    $0x8,%esp
    2fc9:	68 a6 56 00 00       	push   $0x56a6
    2fce:	68 37 56 00 00       	push   $0x5637
    2fd3:	e8 2a 19 00 00       	call   4902 <link>
    2fd8:	83 c4 10             	add    $0x10,%esp
    2fdb:	85 c0                	test   %eax,%eax
    2fdd:	0f 84 25 02 00 00    	je     3208 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2fe3:	83 ec 08             	sub    $0x8,%esp
    2fe6:	68 5e 55 00 00       	push   $0x555e
    2feb:	68 fd 54 00 00       	push   $0x54fd
    2ff0:	e8 0d 19 00 00       	call   4902 <link>
    2ff5:	83 c4 10             	add    $0x10,%esp
    2ff8:	85 c0                	test   %eax,%eax
    2ffa:	0f 84 a9 01 00 00    	je     31a9 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    3000:	83 ec 0c             	sub    $0xc,%esp
    3003:	68 12 56 00 00       	push   $0x5612
    3008:	e8 fd 18 00 00       	call   490a <mkdir>
    300d:	83 c4 10             	add    $0x10,%esp
    3010:	85 c0                	test   %eax,%eax
    3012:	0f 84 7e 01 00 00    	je     3196 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    3018:	83 ec 0c             	sub    $0xc,%esp
    301b:	68 37 56 00 00       	push   $0x5637
    3020:	e8 e5 18 00 00       	call   490a <mkdir>
    3025:	83 c4 10             	add    $0x10,%esp
    3028:	85 c0                	test   %eax,%eax
    302a:	0f 84 67 03 00 00    	je     3397 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    3030:	83 ec 0c             	sub    $0xc,%esp
    3033:	68 5e 55 00 00       	push   $0x555e
    3038:	e8 cd 18 00 00       	call   490a <mkdir>
    303d:	83 c4 10             	add    $0x10,%esp
    3040:	85 c0                	test   %eax,%eax
    3042:	0f 84 3c 03 00 00    	je     3384 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    3048:	83 ec 0c             	sub    $0xc,%esp
    304b:	68 37 56 00 00       	push   $0x5637
    3050:	e8 9d 18 00 00       	call   48f2 <unlink>
    3055:	83 c4 10             	add    $0x10,%esp
    3058:	85 c0                	test   %eax,%eax
    305a:	0f 84 11 03 00 00    	je     3371 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    3060:	83 ec 0c             	sub    $0xc,%esp
    3063:	68 12 56 00 00       	push   $0x5612
    3068:	e8 85 18 00 00       	call   48f2 <unlink>
    306d:	83 c4 10             	add    $0x10,%esp
    3070:	85 c0                	test   %eax,%eax
    3072:	0f 84 e6 02 00 00    	je     335e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    3078:	83 ec 0c             	sub    $0xc,%esp
    307b:	68 fd 54 00 00       	push   $0x54fd
    3080:	e8 8d 18 00 00       	call   4912 <chdir>
    3085:	83 c4 10             	add    $0x10,%esp
    3088:	85 c0                	test   %eax,%eax
    308a:	0f 84 bb 02 00 00    	je     334b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    3090:	83 ec 0c             	sub    $0xc,%esp
    3093:	68 a9 56 00 00       	push   $0x56a9
    3098:	e8 75 18 00 00       	call   4912 <chdir>
    309d:	83 c4 10             	add    $0x10,%esp
    30a0:	85 c0                	test   %eax,%eax
    30a2:	0f 84 90 02 00 00    	je     3338 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    30a8:	83 ec 0c             	sub    $0xc,%esp
    30ab:	68 5e 55 00 00       	push   $0x555e
    30b0:	e8 3d 18 00 00       	call   48f2 <unlink>
    30b5:	83 c4 10             	add    $0x10,%esp
    30b8:	85 c0                	test   %eax,%eax
    30ba:	0f 85 9d 00 00 00    	jne    315d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    30c0:	83 ec 0c             	sub    $0xc,%esp
    30c3:	68 fd 54 00 00       	push   $0x54fd
    30c8:	e8 25 18 00 00       	call   48f2 <unlink>
    30cd:	83 c4 10             	add    $0x10,%esp
    30d0:	85 c0                	test   %eax,%eax
    30d2:	0f 85 4d 02 00 00    	jne    3325 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    30d8:	83 ec 0c             	sub    $0xc,%esp
    30db:	68 c4 55 00 00       	push   $0x55c4
    30e0:	e8 0d 18 00 00       	call   48f2 <unlink>
    30e5:	83 c4 10             	add    $0x10,%esp
    30e8:	85 c0                	test   %eax,%eax
    30ea:	0f 84 22 02 00 00    	je     3312 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    30f0:	83 ec 0c             	sub    $0xc,%esp
    30f3:	68 d9 54 00 00       	push   $0x54d9
    30f8:	e8 f5 17 00 00       	call   48f2 <unlink>
    30fd:	83 c4 10             	add    $0x10,%esp
    3100:	85 c0                	test   %eax,%eax
    3102:	0f 88 f7 01 00 00    	js     32ff <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    3108:	83 ec 0c             	sub    $0xc,%esp
    310b:	68 c4 55 00 00       	push   $0x55c4
    3110:	e8 dd 17 00 00       	call   48f2 <unlink>
    3115:	83 c4 10             	add    $0x10,%esp
    3118:	85 c0                	test   %eax,%eax
    311a:	0f 88 cc 01 00 00    	js     32ec <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    3120:	83 ec 08             	sub    $0x8,%esp
    3123:	68 a6 57 00 00       	push   $0x57a6
    3128:	6a 01                	push   $0x1
    312a:	e8 d1 18 00 00       	call   4a00 <printf>
}
    312f:	83 c4 10             	add    $0x10,%esp
    3132:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3135:	c9                   	leave  
    3136:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    3137:	50                   	push   %eax
    3138:	50                   	push   %eax
    3139:	68 43 55 00 00       	push   $0x5543
    313e:	6a 01                	push   $0x1
    3140:	e8 bb 18 00 00       	call   4a00 <printf>
    exit();
    3145:	e8 58 17 00 00       	call   48a2 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    314a:	50                   	push   %eax
    314b:	50                   	push   %eax
    314c:	68 9e 55 00 00       	push   $0x559e
    3151:	6a 01                	push   $0x1
    3153:	e8 a8 18 00 00       	call   4a00 <printf>
    exit();
    3158:	e8 45 17 00 00       	call   48a2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    315d:	52                   	push   %edx
    315e:	52                   	push   %edx
    315f:	68 69 55 00 00       	push   $0x5569
    3164:	6a 01                	push   $0x1
    3166:	e8 95 18 00 00       	call   4a00 <printf>
    exit();
    316b:	e8 32 17 00 00       	call   48a2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    3170:	50                   	push   %eax
    3171:	50                   	push   %eax
    3172:	68 1b 56 00 00       	push   $0x561b
    3177:	6a 01                	push   $0x1
    3179:	e8 82 18 00 00       	call   4a00 <printf>
    exit();
    317e:	e8 1f 17 00 00       	call   48a2 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    3183:	52                   	push   %edx
    3184:	52                   	push   %edx
    3185:	68 00 60 00 00       	push   $0x6000
    318a:	6a 01                	push   $0x1
    318c:	e8 6f 18 00 00       	call   4a00 <printf>
    exit();
    3191:	e8 0c 17 00 00       	call   48a2 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    3196:	52                   	push   %edx
    3197:	52                   	push   %edx
    3198:	68 af 56 00 00       	push   $0x56af
    319d:	6a 01                	push   $0x1
    319f:	e8 5c 18 00 00       	call   4a00 <printf>
    exit();
    31a4:	e8 f9 16 00 00       	call   48a2 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    31a9:	51                   	push   %ecx
    31aa:	51                   	push   %ecx
    31ab:	68 70 60 00 00       	push   $0x6070
    31b0:	6a 01                	push   $0x1
    31b2:	e8 49 18 00 00       	call   4a00 <printf>
    exit();
    31b7:	e8 e6 16 00 00       	call   48a2 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    31bc:	50                   	push   %eax
    31bd:	50                   	push   %eax
    31be:	68 2a 55 00 00       	push   $0x552a
    31c3:	6a 01                	push   $0x1
    31c5:	e8 36 18 00 00       	call   4a00 <printf>
    exit();
    31ca:	e8 d3 16 00 00       	call   48a2 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    31cf:	51                   	push   %ecx
    31d0:	51                   	push   %ecx
    31d1:	68 03 55 00 00       	push   $0x5503
    31d6:	6a 01                	push   $0x1
    31d8:	e8 23 18 00 00       	call   4a00 <printf>
    exit();
    31dd:	e8 c0 16 00 00       	call   48a2 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    31e2:	50                   	push   %eax
    31e3:	50                   	push   %eax
    31e4:	68 cc 55 00 00       	push   $0x55cc
    31e9:	6a 01                	push   $0x1
    31eb:	e8 10 18 00 00       	call   4a00 <printf>
    exit();
    31f0:	e8 ad 16 00 00       	call   48a2 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    31f5:	51                   	push   %ecx
    31f6:	51                   	push   %ecx
    31f7:	68 b8 5f 00 00       	push   $0x5fb8
    31fc:	6a 01                	push   $0x1
    31fe:	e8 fd 17 00 00       	call   4a00 <printf>
    exit();
    3203:	e8 9a 16 00 00       	call   48a2 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    3208:	53                   	push   %ebx
    3209:	53                   	push   %ebx
    320a:	68 4c 60 00 00       	push   $0x604c
    320f:	6a 01                	push   $0x1
    3211:	e8 ea 17 00 00       	call   4a00 <printf>
    exit();
    3216:	e8 87 16 00 00       	call   48a2 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    321b:	50                   	push   %eax
    321c:	50                   	push   %eax
    321d:	68 28 60 00 00       	push   $0x6028
    3222:	6a 01                	push   $0x1
    3224:	e8 d7 17 00 00       	call   4a00 <printf>
    exit();
    3229:	e8 74 16 00 00       	call   48a2 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    322e:	50                   	push   %eax
    322f:	50                   	push   %eax
    3230:	68 8b 56 00 00       	push   $0x568b
    3235:	6a 01                	push   $0x1
    3237:	e8 c4 17 00 00       	call   4a00 <printf>
    exit();
    323c:	e8 61 16 00 00       	call   48a2 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    3241:	50                   	push   %eax
    3242:	50                   	push   %eax
    3243:	68 72 56 00 00       	push   $0x5672
    3248:	6a 01                	push   $0x1
    324a:	e8 b1 17 00 00       	call   4a00 <printf>
    exit();
    324f:	e8 4e 16 00 00       	call   48a2 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    3254:	50                   	push   %eax
    3255:	50                   	push   %eax
    3256:	68 5c 56 00 00       	push   $0x565c
    325b:	6a 01                	push   $0x1
    325d:	e8 9e 17 00 00       	call   4a00 <printf>
    exit();
    3262:	e8 3b 16 00 00       	call   48a2 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    3267:	50                   	push   %eax
    3268:	50                   	push   %eax
    3269:	68 40 56 00 00       	push   $0x5640
    326e:	6a 01                	push   $0x1
    3270:	e8 8b 17 00 00       	call   4a00 <printf>
    exit();
    3275:	e8 28 16 00 00       	call   48a2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    327a:	50                   	push   %eax
    327b:	50                   	push   %eax
    327c:	68 81 55 00 00       	push   $0x5581
    3281:	6a 01                	push   $0x1
    3283:	e8 78 17 00 00       	call   4a00 <printf>
    exit();
    3288:	e8 15 16 00 00       	call   48a2 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    328d:	50                   	push   %eax
    328e:	50                   	push   %eax
    328f:	68 dc 5f 00 00       	push   $0x5fdc
    3294:	6a 01                	push   $0x1
    3296:	e8 65 17 00 00       	call   4a00 <printf>
    exit();
    329b:	e8 02 16 00 00       	call   48a2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    32a0:	53                   	push   %ebx
    32a1:	53                   	push   %ebx
    32a2:	68 df 54 00 00       	push   $0x54df
    32a7:	6a 01                	push   $0x1
    32a9:	e8 52 17 00 00       	call   4a00 <printf>
    exit();
    32ae:	e8 ef 15 00 00       	call   48a2 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    32b3:	50                   	push   %eax
    32b4:	50                   	push   %eax
    32b5:	68 90 5f 00 00       	push   $0x5f90
    32ba:	6a 01                	push   $0x1
    32bc:	e8 3f 17 00 00       	call   4a00 <printf>
    exit();
    32c1:	e8 dc 15 00 00       	call   48a2 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    32c6:	50                   	push   %eax
    32c7:	50                   	push   %eax
    32c8:	68 c3 54 00 00       	push   $0x54c3
    32cd:	6a 01                	push   $0x1
    32cf:	e8 2c 17 00 00       	call   4a00 <printf>
    exit();
    32d4:	e8 c9 15 00 00       	call   48a2 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    32d9:	50                   	push   %eax
    32da:	50                   	push   %eax
    32db:	68 ab 54 00 00       	push   $0x54ab
    32e0:	6a 01                	push   $0x1
    32e2:	e8 19 17 00 00       	call   4a00 <printf>
    exit();
    32e7:	e8 b6 15 00 00       	call   48a2 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    32ec:	50                   	push   %eax
    32ed:	50                   	push   %eax
    32ee:	68 94 57 00 00       	push   $0x5794
    32f3:	6a 01                	push   $0x1
    32f5:	e8 06 17 00 00       	call   4a00 <printf>
    exit();
    32fa:	e8 a3 15 00 00       	call   48a2 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    32ff:	52                   	push   %edx
    3300:	52                   	push   %edx
    3301:	68 7f 57 00 00       	push   $0x577f
    3306:	6a 01                	push   $0x1
    3308:	e8 f3 16 00 00       	call   4a00 <printf>
    exit();
    330d:	e8 90 15 00 00       	call   48a2 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    3312:	51                   	push   %ecx
    3313:	51                   	push   %ecx
    3314:	68 94 60 00 00       	push   $0x6094
    3319:	6a 01                	push   $0x1
    331b:	e8 e0 16 00 00       	call   4a00 <printf>
    exit();
    3320:	e8 7d 15 00 00       	call   48a2 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    3325:	53                   	push   %ebx
    3326:	53                   	push   %ebx
    3327:	68 6a 57 00 00       	push   $0x576a
    332c:	6a 01                	push   $0x1
    332e:	e8 cd 16 00 00       	call   4a00 <printf>
    exit();
    3333:	e8 6a 15 00 00       	call   48a2 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    3338:	50                   	push   %eax
    3339:	50                   	push   %eax
    333a:	68 52 57 00 00       	push   $0x5752
    333f:	6a 01                	push   $0x1
    3341:	e8 ba 16 00 00       	call   4a00 <printf>
    exit();
    3346:	e8 57 15 00 00       	call   48a2 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    334b:	50                   	push   %eax
    334c:	50                   	push   %eax
    334d:	68 3a 57 00 00       	push   $0x573a
    3352:	6a 01                	push   $0x1
    3354:	e8 a7 16 00 00       	call   4a00 <printf>
    exit();
    3359:	e8 44 15 00 00       	call   48a2 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    335e:	50                   	push   %eax
    335f:	50                   	push   %eax
    3360:	68 1e 57 00 00       	push   $0x571e
    3365:	6a 01                	push   $0x1
    3367:	e8 94 16 00 00       	call   4a00 <printf>
    exit();
    336c:	e8 31 15 00 00       	call   48a2 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    3371:	50                   	push   %eax
    3372:	50                   	push   %eax
    3373:	68 02 57 00 00       	push   $0x5702
    3378:	6a 01                	push   $0x1
    337a:	e8 81 16 00 00       	call   4a00 <printf>
    exit();
    337f:	e8 1e 15 00 00       	call   48a2 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    3384:	50                   	push   %eax
    3385:	50                   	push   %eax
    3386:	68 e5 56 00 00       	push   $0x56e5
    338b:	6a 01                	push   $0x1
    338d:	e8 6e 16 00 00       	call   4a00 <printf>
    exit();
    3392:	e8 0b 15 00 00       	call   48a2 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    3397:	50                   	push   %eax
    3398:	50                   	push   %eax
    3399:	68 ca 56 00 00       	push   $0x56ca
    339e:	6a 01                	push   $0x1
    33a0:	e8 5b 16 00 00       	call   4a00 <printf>
    exit();
    33a5:	e8 f8 14 00 00       	call   48a2 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    33aa:	50                   	push   %eax
    33ab:	50                   	push   %eax
    33ac:	68 f7 55 00 00       	push   $0x55f7
    33b1:	6a 01                	push   $0x1
    33b3:	e8 48 16 00 00       	call   4a00 <printf>
    exit();
    33b8:	e8 e5 14 00 00       	call   48a2 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    33bd:	50                   	push   %eax
    33be:	50                   	push   %eax
    33bf:	68 df 55 00 00       	push   $0x55df
    33c4:	6a 01                	push   $0x1
    33c6:	e8 35 16 00 00       	call   4a00 <printf>
    exit();
    33cb:	e8 d2 14 00 00       	call   48a2 <exit>

000033d0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    33d0:	55                   	push   %ebp
    33d1:	89 e5                	mov    %esp,%ebp
    33d3:	56                   	push   %esi
    33d4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    33d5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    33da:	83 ec 08             	sub    $0x8,%esp
    33dd:	68 b1 57 00 00       	push   $0x57b1
    33e2:	6a 01                	push   $0x1
    33e4:	e8 17 16 00 00       	call   4a00 <printf>

  unlink("bigwrite");
    33e9:	c7 04 24 c0 57 00 00 	movl   $0x57c0,(%esp)
    33f0:	e8 fd 14 00 00       	call   48f2 <unlink>
    33f5:	83 c4 10             	add    $0x10,%esp
    33f8:	90                   	nop
    33f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    3400:	83 ec 08             	sub    $0x8,%esp
    3403:	68 02 02 00 00       	push   $0x202
    3408:	68 c0 57 00 00       	push   $0x57c0
    340d:	e8 d0 14 00 00       	call   48e2 <open>
    if(fd < 0){
    3412:	83 c4 10             	add    $0x10,%esp
    3415:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    3417:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    3419:	78 7e                	js     3499 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    341b:	83 ec 04             	sub    $0x4,%esp
    341e:	53                   	push   %ebx
    341f:	68 00 96 00 00       	push   $0x9600
    3424:	50                   	push   %eax
    3425:	e8 98 14 00 00       	call   48c2 <write>
      if(cc != sz){
    342a:	83 c4 10             	add    $0x10,%esp
    342d:	39 c3                	cmp    %eax,%ebx
    342f:	75 55                	jne    3486 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    3431:	83 ec 04             	sub    $0x4,%esp
    3434:	53                   	push   %ebx
    3435:	68 00 96 00 00       	push   $0x9600
    343a:	56                   	push   %esi
    343b:	e8 82 14 00 00       	call   48c2 <write>
      if(cc != sz){
    3440:	83 c4 10             	add    $0x10,%esp
    3443:	39 c3                	cmp    %eax,%ebx
    3445:	75 3f                	jne    3486 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    3447:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    344a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    3450:	56                   	push   %esi
    3451:	e8 74 14 00 00       	call   48ca <close>
    unlink("bigwrite");
    3456:	c7 04 24 c0 57 00 00 	movl   $0x57c0,(%esp)
    345d:	e8 90 14 00 00       	call   48f2 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    3462:	83 c4 10             	add    $0x10,%esp
    3465:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    346b:	75 93                	jne    3400 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    346d:	83 ec 08             	sub    $0x8,%esp
    3470:	68 f3 57 00 00       	push   $0x57f3
    3475:	6a 01                	push   $0x1
    3477:	e8 84 15 00 00       	call   4a00 <printf>
}
    347c:	83 c4 10             	add    $0x10,%esp
    347f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3482:	5b                   	pop    %ebx
    3483:	5e                   	pop    %esi
    3484:	5d                   	pop    %ebp
    3485:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    3486:	50                   	push   %eax
    3487:	53                   	push   %ebx
    3488:	68 e1 57 00 00       	push   $0x57e1
    348d:	6a 01                	push   $0x1
    348f:	e8 6c 15 00 00       	call   4a00 <printf>
        exit();
    3494:	e8 09 14 00 00       	call   48a2 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    3499:	83 ec 08             	sub    $0x8,%esp
    349c:	68 c9 57 00 00       	push   $0x57c9
    34a1:	6a 01                	push   $0x1
    34a3:	e8 58 15 00 00       	call   4a00 <printf>
      exit();
    34a8:	e8 f5 13 00 00       	call   48a2 <exit>
    34ad:	8d 76 00             	lea    0x0(%esi),%esi

000034b0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    34b0:	55                   	push   %ebp
    34b1:	89 e5                	mov    %esp,%ebp
    34b3:	57                   	push   %edi
    34b4:	56                   	push   %esi
    34b5:	53                   	push   %ebx
    34b6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    34b9:	68 00 58 00 00       	push   $0x5800
    34be:	6a 01                	push   $0x1
    34c0:	e8 3b 15 00 00       	call   4a00 <printf>

  unlink("bigfile");
    34c5:	c7 04 24 1c 58 00 00 	movl   $0x581c,(%esp)
    34cc:	e8 21 14 00 00       	call   48f2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    34d1:	5e                   	pop    %esi
    34d2:	5f                   	pop    %edi
    34d3:	68 02 02 00 00       	push   $0x202
    34d8:	68 1c 58 00 00       	push   $0x581c
    34dd:	e8 00 14 00 00       	call   48e2 <open>
  if(fd < 0){
    34e2:	83 c4 10             	add    $0x10,%esp
    34e5:	85 c0                	test   %eax,%eax
    34e7:	0f 88 5f 01 00 00    	js     364c <bigfile+0x19c>
    34ed:	89 c6                	mov    %eax,%esi
    34ef:	31 db                	xor    %ebx,%ebx
    34f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    34f8:	83 ec 04             	sub    $0x4,%esp
    34fb:	68 58 02 00 00       	push   $0x258
    3500:	53                   	push   %ebx
    3501:	68 00 96 00 00       	push   $0x9600
    3506:	e8 05 12 00 00       	call   4710 <memset>
    if(write(fd, buf, 600) != 600){
    350b:	83 c4 0c             	add    $0xc,%esp
    350e:	68 58 02 00 00       	push   $0x258
    3513:	68 00 96 00 00       	push   $0x9600
    3518:	56                   	push   %esi
    3519:	e8 a4 13 00 00       	call   48c2 <write>
    351e:	83 c4 10             	add    $0x10,%esp
    3521:	3d 58 02 00 00       	cmp    $0x258,%eax
    3526:	0f 85 f8 00 00 00    	jne    3624 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    352c:	83 c3 01             	add    $0x1,%ebx
    352f:	83 fb 14             	cmp    $0x14,%ebx
    3532:	75 c4                	jne    34f8 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    3534:	83 ec 0c             	sub    $0xc,%esp
    3537:	56                   	push   %esi
    3538:	e8 8d 13 00 00       	call   48ca <close>

  fd = open("bigfile", 0);
    353d:	59                   	pop    %ecx
    353e:	5b                   	pop    %ebx
    353f:	6a 00                	push   $0x0
    3541:	68 1c 58 00 00       	push   $0x581c
    3546:	e8 97 13 00 00       	call   48e2 <open>
  if(fd < 0){
    354b:	83 c4 10             	add    $0x10,%esp
    354e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    3550:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    3552:	0f 88 e0 00 00 00    	js     3638 <bigfile+0x188>
    3558:	31 db                	xor    %ebx,%ebx
    355a:	31 ff                	xor    %edi,%edi
    355c:	eb 30                	jmp    358e <bigfile+0xde>
    355e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    3560:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    3565:	0f 85 91 00 00 00    	jne    35fc <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    356b:	0f be 05 00 96 00 00 	movsbl 0x9600,%eax
    3572:	89 fa                	mov    %edi,%edx
    3574:	d1 fa                	sar    %edx
    3576:	39 d0                	cmp    %edx,%eax
    3578:	75 6e                	jne    35e8 <bigfile+0x138>
    357a:	0f be 15 2b 97 00 00 	movsbl 0x972b,%edx
    3581:	39 d0                	cmp    %edx,%eax
    3583:	75 63                	jne    35e8 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    3585:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    358b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    358e:	83 ec 04             	sub    $0x4,%esp
    3591:	68 2c 01 00 00       	push   $0x12c
    3596:	68 00 96 00 00       	push   $0x9600
    359b:	56                   	push   %esi
    359c:	e8 19 13 00 00       	call   48ba <read>
    if(cc < 0){
    35a1:	83 c4 10             	add    $0x10,%esp
    35a4:	85 c0                	test   %eax,%eax
    35a6:	78 68                	js     3610 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    35a8:	75 b6                	jne    3560 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    35aa:	83 ec 0c             	sub    $0xc,%esp
    35ad:	56                   	push   %esi
    35ae:	e8 17 13 00 00       	call   48ca <close>
  if(total != 20*600){
    35b3:	83 c4 10             	add    $0x10,%esp
    35b6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    35bc:	0f 85 9e 00 00 00    	jne    3660 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    35c2:	83 ec 0c             	sub    $0xc,%esp
    35c5:	68 1c 58 00 00       	push   $0x581c
    35ca:	e8 23 13 00 00       	call   48f2 <unlink>

  printf(1, "bigfile test ok\n");
    35cf:	58                   	pop    %eax
    35d0:	5a                   	pop    %edx
    35d1:	68 ab 58 00 00       	push   $0x58ab
    35d6:	6a 01                	push   $0x1
    35d8:	e8 23 14 00 00       	call   4a00 <printf>
}
    35dd:	83 c4 10             	add    $0x10,%esp
    35e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    35e3:	5b                   	pop    %ebx
    35e4:	5e                   	pop    %esi
    35e5:	5f                   	pop    %edi
    35e6:	5d                   	pop    %ebp
    35e7:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    35e8:	83 ec 08             	sub    $0x8,%esp
    35eb:	68 78 58 00 00       	push   $0x5878
    35f0:	6a 01                	push   $0x1
    35f2:	e8 09 14 00 00       	call   4a00 <printf>
      exit();
    35f7:	e8 a6 12 00 00       	call   48a2 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    35fc:	83 ec 08             	sub    $0x8,%esp
    35ff:	68 64 58 00 00       	push   $0x5864
    3604:	6a 01                	push   $0x1
    3606:	e8 f5 13 00 00       	call   4a00 <printf>
      exit();
    360b:	e8 92 12 00 00       	call   48a2 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    3610:	83 ec 08             	sub    $0x8,%esp
    3613:	68 4f 58 00 00       	push   $0x584f
    3618:	6a 01                	push   $0x1
    361a:	e8 e1 13 00 00       	call   4a00 <printf>
      exit();
    361f:	e8 7e 12 00 00       	call   48a2 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    3624:	83 ec 08             	sub    $0x8,%esp
    3627:	68 24 58 00 00       	push   $0x5824
    362c:	6a 01                	push   $0x1
    362e:	e8 cd 13 00 00       	call   4a00 <printf>
      exit();
    3633:	e8 6a 12 00 00       	call   48a2 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    3638:	83 ec 08             	sub    $0x8,%esp
    363b:	68 3a 58 00 00       	push   $0x583a
    3640:	6a 01                	push   $0x1
    3642:	e8 b9 13 00 00       	call   4a00 <printf>
    exit();
    3647:	e8 56 12 00 00       	call   48a2 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    364c:	83 ec 08             	sub    $0x8,%esp
    364f:	68 0e 58 00 00       	push   $0x580e
    3654:	6a 01                	push   $0x1
    3656:	e8 a5 13 00 00       	call   4a00 <printf>
    exit();
    365b:	e8 42 12 00 00       	call   48a2 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    3660:	83 ec 08             	sub    $0x8,%esp
    3663:	68 91 58 00 00       	push   $0x5891
    3668:	6a 01                	push   $0x1
    366a:	e8 91 13 00 00       	call   4a00 <printf>
    exit();
    366f:	e8 2e 12 00 00       	call   48a2 <exit>
    3674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    367a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003680 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    3680:	55                   	push   %ebp
    3681:	89 e5                	mov    %esp,%ebp
    3683:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    3686:	68 bc 58 00 00       	push   $0x58bc
    368b:	6a 01                	push   $0x1
    368d:	e8 6e 13 00 00       	call   4a00 <printf>

  if(mkdir("12345678901234") != 0){
    3692:	c7 04 24 f7 58 00 00 	movl   $0x58f7,(%esp)
    3699:	e8 6c 12 00 00       	call   490a <mkdir>
    369e:	83 c4 10             	add    $0x10,%esp
    36a1:	85 c0                	test   %eax,%eax
    36a3:	0f 85 97 00 00 00    	jne    3740 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    36a9:	83 ec 0c             	sub    $0xc,%esp
    36ac:	68 b4 60 00 00       	push   $0x60b4
    36b1:	e8 54 12 00 00       	call   490a <mkdir>
    36b6:	83 c4 10             	add    $0x10,%esp
    36b9:	85 c0                	test   %eax,%eax
    36bb:	0f 85 de 00 00 00    	jne    379f <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    36c1:	83 ec 08             	sub    $0x8,%esp
    36c4:	68 00 02 00 00       	push   $0x200
    36c9:	68 04 61 00 00       	push   $0x6104
    36ce:	e8 0f 12 00 00       	call   48e2 <open>
  if(fd < 0){
    36d3:	83 c4 10             	add    $0x10,%esp
    36d6:	85 c0                	test   %eax,%eax
    36d8:	0f 88 ae 00 00 00    	js     378c <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    36de:	83 ec 0c             	sub    $0xc,%esp
    36e1:	50                   	push   %eax
    36e2:	e8 e3 11 00 00       	call   48ca <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    36e7:	58                   	pop    %eax
    36e8:	5a                   	pop    %edx
    36e9:	6a 00                	push   $0x0
    36eb:	68 74 61 00 00       	push   $0x6174
    36f0:	e8 ed 11 00 00       	call   48e2 <open>
  if(fd < 0){
    36f5:	83 c4 10             	add    $0x10,%esp
    36f8:	85 c0                	test   %eax,%eax
    36fa:	78 7d                	js     3779 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    36fc:	83 ec 0c             	sub    $0xc,%esp
    36ff:	50                   	push   %eax
    3700:	e8 c5 11 00 00       	call   48ca <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    3705:	c7 04 24 e8 58 00 00 	movl   $0x58e8,(%esp)
    370c:	e8 f9 11 00 00       	call   490a <mkdir>
    3711:	83 c4 10             	add    $0x10,%esp
    3714:	85 c0                	test   %eax,%eax
    3716:	74 4e                	je     3766 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    3718:	83 ec 0c             	sub    $0xc,%esp
    371b:	68 10 62 00 00       	push   $0x6210
    3720:	e8 e5 11 00 00       	call   490a <mkdir>
    3725:	83 c4 10             	add    $0x10,%esp
    3728:	85 c0                	test   %eax,%eax
    372a:	74 27                	je     3753 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    372c:	83 ec 08             	sub    $0x8,%esp
    372f:	68 06 59 00 00       	push   $0x5906
    3734:	6a 01                	push   $0x1
    3736:	e8 c5 12 00 00       	call   4a00 <printf>
}
    373b:	83 c4 10             	add    $0x10,%esp
    373e:	c9                   	leave  
    373f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    3740:	50                   	push   %eax
    3741:	50                   	push   %eax
    3742:	68 cb 58 00 00       	push   $0x58cb
    3747:	6a 01                	push   $0x1
    3749:	e8 b2 12 00 00       	call   4a00 <printf>
    exit();
    374e:	e8 4f 11 00 00       	call   48a2 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    3753:	50                   	push   %eax
    3754:	50                   	push   %eax
    3755:	68 30 62 00 00       	push   $0x6230
    375a:	6a 01                	push   $0x1
    375c:	e8 9f 12 00 00       	call   4a00 <printf>
    exit();
    3761:	e8 3c 11 00 00       	call   48a2 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    3766:	52                   	push   %edx
    3767:	52                   	push   %edx
    3768:	68 e0 61 00 00       	push   $0x61e0
    376d:	6a 01                	push   $0x1
    376f:	e8 8c 12 00 00       	call   4a00 <printf>
    exit();
    3774:	e8 29 11 00 00       	call   48a2 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    3779:	51                   	push   %ecx
    377a:	51                   	push   %ecx
    377b:	68 a4 61 00 00       	push   $0x61a4
    3780:	6a 01                	push   $0x1
    3782:	e8 79 12 00 00       	call   4a00 <printf>
    exit();
    3787:	e8 16 11 00 00       	call   48a2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    378c:	51                   	push   %ecx
    378d:	51                   	push   %ecx
    378e:	68 34 61 00 00       	push   $0x6134
    3793:	6a 01                	push   $0x1
    3795:	e8 66 12 00 00       	call   4a00 <printf>
    exit();
    379a:	e8 03 11 00 00       	call   48a2 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    379f:	50                   	push   %eax
    37a0:	50                   	push   %eax
    37a1:	68 d4 60 00 00       	push   $0x60d4
    37a6:	6a 01                	push   $0x1
    37a8:	e8 53 12 00 00       	call   4a00 <printf>
    exit();
    37ad:	e8 f0 10 00 00       	call   48a2 <exit>
    37b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037c0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    37c0:	55                   	push   %ebp
    37c1:	89 e5                	mov    %esp,%ebp
    37c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    37c6:	68 13 59 00 00       	push   $0x5913
    37cb:	6a 01                	push   $0x1
    37cd:	e8 2e 12 00 00       	call   4a00 <printf>
  if(mkdir("dots") != 0){
    37d2:	c7 04 24 1f 59 00 00 	movl   $0x591f,(%esp)
    37d9:	e8 2c 11 00 00       	call   490a <mkdir>
    37de:	83 c4 10             	add    $0x10,%esp
    37e1:	85 c0                	test   %eax,%eax
    37e3:	0f 85 b0 00 00 00    	jne    3899 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    37e9:	83 ec 0c             	sub    $0xc,%esp
    37ec:	68 1f 59 00 00       	push   $0x591f
    37f1:	e8 1c 11 00 00       	call   4912 <chdir>
    37f6:	83 c4 10             	add    $0x10,%esp
    37f9:	85 c0                	test   %eax,%eax
    37fb:	0f 85 1d 01 00 00    	jne    391e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    3801:	83 ec 0c             	sub    $0xc,%esp
    3804:	68 ca 55 00 00       	push   $0x55ca
    3809:	e8 e4 10 00 00       	call   48f2 <unlink>
    380e:	83 c4 10             	add    $0x10,%esp
    3811:	85 c0                	test   %eax,%eax
    3813:	0f 84 f2 00 00 00    	je     390b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    3819:	83 ec 0c             	sub    $0xc,%esp
    381c:	68 c9 55 00 00       	push   $0x55c9
    3821:	e8 cc 10 00 00       	call   48f2 <unlink>
    3826:	83 c4 10             	add    $0x10,%esp
    3829:	85 c0                	test   %eax,%eax
    382b:	0f 84 c7 00 00 00    	je     38f8 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    3831:	83 ec 0c             	sub    $0xc,%esp
    3834:	68 9d 4d 00 00       	push   $0x4d9d
    3839:	e8 d4 10 00 00       	call   4912 <chdir>
    383e:	83 c4 10             	add    $0x10,%esp
    3841:	85 c0                	test   %eax,%eax
    3843:	0f 85 9c 00 00 00    	jne    38e5 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    3849:	83 ec 0c             	sub    $0xc,%esp
    384c:	68 67 59 00 00       	push   $0x5967
    3851:	e8 9c 10 00 00       	call   48f2 <unlink>
    3856:	83 c4 10             	add    $0x10,%esp
    3859:	85 c0                	test   %eax,%eax
    385b:	74 75                	je     38d2 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    385d:	83 ec 0c             	sub    $0xc,%esp
    3860:	68 85 59 00 00       	push   $0x5985
    3865:	e8 88 10 00 00       	call   48f2 <unlink>
    386a:	83 c4 10             	add    $0x10,%esp
    386d:	85 c0                	test   %eax,%eax
    386f:	74 4e                	je     38bf <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    3871:	83 ec 0c             	sub    $0xc,%esp
    3874:	68 1f 59 00 00       	push   $0x591f
    3879:	e8 74 10 00 00       	call   48f2 <unlink>
    387e:	83 c4 10             	add    $0x10,%esp
    3881:	85 c0                	test   %eax,%eax
    3883:	75 27                	jne    38ac <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    3885:	83 ec 08             	sub    $0x8,%esp
    3888:	68 ba 59 00 00       	push   $0x59ba
    388d:	6a 01                	push   $0x1
    388f:	e8 6c 11 00 00       	call   4a00 <printf>
}
    3894:	83 c4 10             	add    $0x10,%esp
    3897:	c9                   	leave  
    3898:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    3899:	50                   	push   %eax
    389a:	50                   	push   %eax
    389b:	68 24 59 00 00       	push   $0x5924
    38a0:	6a 01                	push   $0x1
    38a2:	e8 59 11 00 00       	call   4a00 <printf>
    exit();
    38a7:	e8 f6 0f 00 00       	call   48a2 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    38ac:	50                   	push   %eax
    38ad:	50                   	push   %eax
    38ae:	68 a5 59 00 00       	push   $0x59a5
    38b3:	6a 01                	push   $0x1
    38b5:	e8 46 11 00 00       	call   4a00 <printf>
    exit();
    38ba:	e8 e3 0f 00 00       	call   48a2 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    38bf:	52                   	push   %edx
    38c0:	52                   	push   %edx
    38c1:	68 8d 59 00 00       	push   $0x598d
    38c6:	6a 01                	push   $0x1
    38c8:	e8 33 11 00 00       	call   4a00 <printf>
    exit();
    38cd:	e8 d0 0f 00 00       	call   48a2 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    38d2:	51                   	push   %ecx
    38d3:	51                   	push   %ecx
    38d4:	68 6e 59 00 00       	push   $0x596e
    38d9:	6a 01                	push   $0x1
    38db:	e8 20 11 00 00       	call   4a00 <printf>
    exit();
    38e0:	e8 bd 0f 00 00       	call   48a2 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    38e5:	50                   	push   %eax
    38e6:	50                   	push   %eax
    38e7:	68 9f 4d 00 00       	push   $0x4d9f
    38ec:	6a 01                	push   $0x1
    38ee:	e8 0d 11 00 00       	call   4a00 <printf>
    exit();
    38f3:	e8 aa 0f 00 00       	call   48a2 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    38f8:	50                   	push   %eax
    38f9:	50                   	push   %eax
    38fa:	68 58 59 00 00       	push   $0x5958
    38ff:	6a 01                	push   $0x1
    3901:	e8 fa 10 00 00       	call   4a00 <printf>
    exit();
    3906:	e8 97 0f 00 00       	call   48a2 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    390b:	50                   	push   %eax
    390c:	50                   	push   %eax
    390d:	68 4a 59 00 00       	push   $0x594a
    3912:	6a 01                	push   $0x1
    3914:	e8 e7 10 00 00       	call   4a00 <printf>
    exit();
    3919:	e8 84 0f 00 00       	call   48a2 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    391e:	50                   	push   %eax
    391f:	50                   	push   %eax
    3920:	68 37 59 00 00       	push   $0x5937
    3925:	6a 01                	push   $0x1
    3927:	e8 d4 10 00 00       	call   4a00 <printf>
    exit();
    392c:	e8 71 0f 00 00       	call   48a2 <exit>
    3931:	eb 0d                	jmp    3940 <dirfile>
    3933:	90                   	nop
    3934:	90                   	nop
    3935:	90                   	nop
    3936:	90                   	nop
    3937:	90                   	nop
    3938:	90                   	nop
    3939:	90                   	nop
    393a:	90                   	nop
    393b:	90                   	nop
    393c:	90                   	nop
    393d:	90                   	nop
    393e:	90                   	nop
    393f:	90                   	nop

00003940 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    3940:	55                   	push   %ebp
    3941:	89 e5                	mov    %esp,%ebp
    3943:	53                   	push   %ebx
    3944:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    3947:	68 c4 59 00 00       	push   $0x59c4
    394c:	6a 01                	push   $0x1
    394e:	e8 ad 10 00 00       	call   4a00 <printf>

  fd = open("dirfile", O_CREATE);
    3953:	59                   	pop    %ecx
    3954:	5b                   	pop    %ebx
    3955:	68 00 02 00 00       	push   $0x200
    395a:	68 d1 59 00 00       	push   $0x59d1
    395f:	e8 7e 0f 00 00       	call   48e2 <open>
  if(fd < 0){
    3964:	83 c4 10             	add    $0x10,%esp
    3967:	85 c0                	test   %eax,%eax
    3969:	0f 88 43 01 00 00    	js     3ab2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    396f:	83 ec 0c             	sub    $0xc,%esp
    3972:	50                   	push   %eax
    3973:	e8 52 0f 00 00       	call   48ca <close>
  if(chdir("dirfile") == 0){
    3978:	c7 04 24 d1 59 00 00 	movl   $0x59d1,(%esp)
    397f:	e8 8e 0f 00 00       	call   4912 <chdir>
    3984:	83 c4 10             	add    $0x10,%esp
    3987:	85 c0                	test   %eax,%eax
    3989:	0f 84 10 01 00 00    	je     3a9f <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    398f:	83 ec 08             	sub    $0x8,%esp
    3992:	6a 00                	push   $0x0
    3994:	68 0a 5a 00 00       	push   $0x5a0a
    3999:	e8 44 0f 00 00       	call   48e2 <open>
  if(fd >= 0){
    399e:	83 c4 10             	add    $0x10,%esp
    39a1:	85 c0                	test   %eax,%eax
    39a3:	0f 89 e3 00 00 00    	jns    3a8c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    39a9:	83 ec 08             	sub    $0x8,%esp
    39ac:	68 00 02 00 00       	push   $0x200
    39b1:	68 0a 5a 00 00       	push   $0x5a0a
    39b6:	e8 27 0f 00 00       	call   48e2 <open>
  if(fd >= 0){
    39bb:	83 c4 10             	add    $0x10,%esp
    39be:	85 c0                	test   %eax,%eax
    39c0:	0f 89 c6 00 00 00    	jns    3a8c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    39c6:	83 ec 0c             	sub    $0xc,%esp
    39c9:	68 0a 5a 00 00       	push   $0x5a0a
    39ce:	e8 37 0f 00 00       	call   490a <mkdir>
    39d3:	83 c4 10             	add    $0x10,%esp
    39d6:	85 c0                	test   %eax,%eax
    39d8:	0f 84 46 01 00 00    	je     3b24 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    39de:	83 ec 0c             	sub    $0xc,%esp
    39e1:	68 0a 5a 00 00       	push   $0x5a0a
    39e6:	e8 07 0f 00 00       	call   48f2 <unlink>
    39eb:	83 c4 10             	add    $0x10,%esp
    39ee:	85 c0                	test   %eax,%eax
    39f0:	0f 84 1b 01 00 00    	je     3b11 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    39f6:	83 ec 08             	sub    $0x8,%esp
    39f9:	68 0a 5a 00 00       	push   $0x5a0a
    39fe:	68 6e 5a 00 00       	push   $0x5a6e
    3a03:	e8 fa 0e 00 00       	call   4902 <link>
    3a08:	83 c4 10             	add    $0x10,%esp
    3a0b:	85 c0                	test   %eax,%eax
    3a0d:	0f 84 eb 00 00 00    	je     3afe <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    3a13:	83 ec 0c             	sub    $0xc,%esp
    3a16:	68 d1 59 00 00       	push   $0x59d1
    3a1b:	e8 d2 0e 00 00       	call   48f2 <unlink>
    3a20:	83 c4 10             	add    $0x10,%esp
    3a23:	85 c0                	test   %eax,%eax
    3a25:	0f 85 c0 00 00 00    	jne    3aeb <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    3a2b:	83 ec 08             	sub    $0x8,%esp
    3a2e:	6a 02                	push   $0x2
    3a30:	68 ca 55 00 00       	push   $0x55ca
    3a35:	e8 a8 0e 00 00       	call   48e2 <open>
  if(fd >= 0){
    3a3a:	83 c4 10             	add    $0x10,%esp
    3a3d:	85 c0                	test   %eax,%eax
    3a3f:	0f 89 93 00 00 00    	jns    3ad8 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    3a45:	83 ec 08             	sub    $0x8,%esp
    3a48:	6a 00                	push   $0x0
    3a4a:	68 ca 55 00 00       	push   $0x55ca
    3a4f:	e8 8e 0e 00 00       	call   48e2 <open>
  if(write(fd, "x", 1) > 0){
    3a54:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    3a57:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    3a59:	6a 01                	push   $0x1
    3a5b:	68 ad 56 00 00       	push   $0x56ad
    3a60:	50                   	push   %eax
    3a61:	e8 5c 0e 00 00       	call   48c2 <write>
    3a66:	83 c4 10             	add    $0x10,%esp
    3a69:	85 c0                	test   %eax,%eax
    3a6b:	7f 58                	jg     3ac5 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    3a6d:	83 ec 0c             	sub    $0xc,%esp
    3a70:	53                   	push   %ebx
    3a71:	e8 54 0e 00 00       	call   48ca <close>

  printf(1, "dir vs file OK\n");
    3a76:	58                   	pop    %eax
    3a77:	5a                   	pop    %edx
    3a78:	68 a1 5a 00 00       	push   $0x5aa1
    3a7d:	6a 01                	push   $0x1
    3a7f:	e8 7c 0f 00 00       	call   4a00 <printf>
}
    3a84:	83 c4 10             	add    $0x10,%esp
    3a87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3a8a:	c9                   	leave  
    3a8b:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    3a8c:	50                   	push   %eax
    3a8d:	50                   	push   %eax
    3a8e:	68 15 5a 00 00       	push   $0x5a15
    3a93:	6a 01                	push   $0x1
    3a95:	e8 66 0f 00 00       	call   4a00 <printf>
    exit();
    3a9a:	e8 03 0e 00 00       	call   48a2 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    3a9f:	50                   	push   %eax
    3aa0:	50                   	push   %eax
    3aa1:	68 f0 59 00 00       	push   $0x59f0
    3aa6:	6a 01                	push   $0x1
    3aa8:	e8 53 0f 00 00       	call   4a00 <printf>
    exit();
    3aad:	e8 f0 0d 00 00       	call   48a2 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    3ab2:	52                   	push   %edx
    3ab3:	52                   	push   %edx
    3ab4:	68 d9 59 00 00       	push   $0x59d9
    3ab9:	6a 01                	push   $0x1
    3abb:	e8 40 0f 00 00       	call   4a00 <printf>
    exit();
    3ac0:	e8 dd 0d 00 00       	call   48a2 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    3ac5:	51                   	push   %ecx
    3ac6:	51                   	push   %ecx
    3ac7:	68 8d 5a 00 00       	push   $0x5a8d
    3acc:	6a 01                	push   $0x1
    3ace:	e8 2d 0f 00 00       	call   4a00 <printf>
    exit();
    3ad3:	e8 ca 0d 00 00       	call   48a2 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    3ad8:	53                   	push   %ebx
    3ad9:	53                   	push   %ebx
    3ada:	68 84 62 00 00       	push   $0x6284
    3adf:	6a 01                	push   $0x1
    3ae1:	e8 1a 0f 00 00       	call   4a00 <printf>
    exit();
    3ae6:	e8 b7 0d 00 00       	call   48a2 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    3aeb:	50                   	push   %eax
    3aec:	50                   	push   %eax
    3aed:	68 75 5a 00 00       	push   $0x5a75
    3af2:	6a 01                	push   $0x1
    3af4:	e8 07 0f 00 00       	call   4a00 <printf>
    exit();
    3af9:	e8 a4 0d 00 00       	call   48a2 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    3afe:	50                   	push   %eax
    3aff:	50                   	push   %eax
    3b00:	68 64 62 00 00       	push   $0x6264
    3b05:	6a 01                	push   $0x1
    3b07:	e8 f4 0e 00 00       	call   4a00 <printf>
    exit();
    3b0c:	e8 91 0d 00 00       	call   48a2 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    3b11:	50                   	push   %eax
    3b12:	50                   	push   %eax
    3b13:	68 50 5a 00 00       	push   $0x5a50
    3b18:	6a 01                	push   $0x1
    3b1a:	e8 e1 0e 00 00       	call   4a00 <printf>
    exit();
    3b1f:	e8 7e 0d 00 00       	call   48a2 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    3b24:	50                   	push   %eax
    3b25:	50                   	push   %eax
    3b26:	68 33 5a 00 00       	push   $0x5a33
    3b2b:	6a 01                	push   $0x1
    3b2d:	e8 ce 0e 00 00       	call   4a00 <printf>
    exit();
    3b32:	e8 6b 0d 00 00       	call   48a2 <exit>
    3b37:	89 f6                	mov    %esi,%esi
    3b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003b40 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3b40:	55                   	push   %ebp
    3b41:	89 e5                	mov    %esp,%ebp
    3b43:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    3b44:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3b49:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    3b4c:	68 b1 5a 00 00       	push   $0x5ab1
    3b51:	6a 01                	push   $0x1
    3b53:	e8 a8 0e 00 00       	call   4a00 <printf>
    3b58:	83 c4 10             	add    $0x10,%esp
    3b5b:	90                   	nop
    3b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    3b60:	83 ec 0c             	sub    $0xc,%esp
    3b63:	68 c2 5a 00 00       	push   $0x5ac2
    3b68:	e8 9d 0d 00 00       	call   490a <mkdir>
    3b6d:	83 c4 10             	add    $0x10,%esp
    3b70:	85 c0                	test   %eax,%eax
    3b72:	0f 85 bb 00 00 00    	jne    3c33 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    3b78:	83 ec 0c             	sub    $0xc,%esp
    3b7b:	68 c2 5a 00 00       	push   $0x5ac2
    3b80:	e8 8d 0d 00 00       	call   4912 <chdir>
    3b85:	83 c4 10             	add    $0x10,%esp
    3b88:	85 c0                	test   %eax,%eax
    3b8a:	0f 85 b7 00 00 00    	jne    3c47 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    3b90:	83 ec 0c             	sub    $0xc,%esp
    3b93:	68 77 51 00 00       	push   $0x5177
    3b98:	e8 6d 0d 00 00       	call   490a <mkdir>
    link("README", "");
    3b9d:	59                   	pop    %ecx
    3b9e:	58                   	pop    %eax
    3b9f:	68 77 51 00 00       	push   $0x5177
    3ba4:	68 6e 5a 00 00       	push   $0x5a6e
    3ba9:	e8 54 0d 00 00       	call   4902 <link>
    fd = open("", O_CREATE);
    3bae:	58                   	pop    %eax
    3baf:	5a                   	pop    %edx
    3bb0:	68 00 02 00 00       	push   $0x200
    3bb5:	68 77 51 00 00       	push   $0x5177
    3bba:	e8 23 0d 00 00       	call   48e2 <open>
    if(fd >= 0)
    3bbf:	83 c4 10             	add    $0x10,%esp
    3bc2:	85 c0                	test   %eax,%eax
    3bc4:	78 0c                	js     3bd2 <iref+0x92>
      close(fd);
    3bc6:	83 ec 0c             	sub    $0xc,%esp
    3bc9:	50                   	push   %eax
    3bca:	e8 fb 0c 00 00       	call   48ca <close>
    3bcf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    3bd2:	83 ec 08             	sub    $0x8,%esp
    3bd5:	68 00 02 00 00       	push   $0x200
    3bda:	68 ac 56 00 00       	push   $0x56ac
    3bdf:	e8 fe 0c 00 00       	call   48e2 <open>
    if(fd >= 0)
    3be4:	83 c4 10             	add    $0x10,%esp
    3be7:	85 c0                	test   %eax,%eax
    3be9:	78 0c                	js     3bf7 <iref+0xb7>
      close(fd);
    3beb:	83 ec 0c             	sub    $0xc,%esp
    3bee:	50                   	push   %eax
    3bef:	e8 d6 0c 00 00       	call   48ca <close>
    3bf4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    3bf7:	83 ec 0c             	sub    $0xc,%esp
    3bfa:	68 ac 56 00 00       	push   $0x56ac
    3bff:	e8 ee 0c 00 00       	call   48f2 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3c04:	83 c4 10             	add    $0x10,%esp
    3c07:	83 eb 01             	sub    $0x1,%ebx
    3c0a:	0f 85 50 ff ff ff    	jne    3b60 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    3c10:	83 ec 0c             	sub    $0xc,%esp
    3c13:	68 9d 4d 00 00       	push   $0x4d9d
    3c18:	e8 f5 0c 00 00       	call   4912 <chdir>
  printf(1, "empty file name OK\n");
    3c1d:	58                   	pop    %eax
    3c1e:	5a                   	pop    %edx
    3c1f:	68 f0 5a 00 00       	push   $0x5af0
    3c24:	6a 01                	push   $0x1
    3c26:	e8 d5 0d 00 00       	call   4a00 <printf>
}
    3c2b:	83 c4 10             	add    $0x10,%esp
    3c2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3c31:	c9                   	leave  
    3c32:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    3c33:	83 ec 08             	sub    $0x8,%esp
    3c36:	68 c8 5a 00 00       	push   $0x5ac8
    3c3b:	6a 01                	push   $0x1
    3c3d:	e8 be 0d 00 00       	call   4a00 <printf>
      exit();
    3c42:	e8 5b 0c 00 00       	call   48a2 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    3c47:	83 ec 08             	sub    $0x8,%esp
    3c4a:	68 dc 5a 00 00       	push   $0x5adc
    3c4f:	6a 01                	push   $0x1
    3c51:	e8 aa 0d 00 00       	call   4a00 <printf>
      exit();
    3c56:	e8 47 0c 00 00       	call   48a2 <exit>
    3c5b:	90                   	nop
    3c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003c60 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3c60:	55                   	push   %ebp
    3c61:	89 e5                	mov    %esp,%ebp
    3c63:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3c64:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3c66:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    3c69:	68 04 5b 00 00       	push   $0x5b04
    3c6e:	6a 01                	push   $0x1
    3c70:	e8 8b 0d 00 00       	call   4a00 <printf>
    3c75:	83 c4 10             	add    $0x10,%esp
    3c78:	eb 13                	jmp    3c8d <forktest+0x2d>
    3c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    3c80:	74 62                	je     3ce4 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3c82:	83 c3 01             	add    $0x1,%ebx
    3c85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    3c8b:	74 43                	je     3cd0 <forktest+0x70>
    pid = fork();
    3c8d:	e8 08 0c 00 00       	call   489a <fork>
    if(pid < 0)
    3c92:	85 c0                	test   %eax,%eax
    3c94:	79 ea                	jns    3c80 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    3c96:	85 db                	test   %ebx,%ebx
    3c98:	74 14                	je     3cae <forktest+0x4e>
    3c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    3ca0:	e8 05 0c 00 00       	call   48aa <wait>
    3ca5:	85 c0                	test   %eax,%eax
    3ca7:	78 40                	js     3ce9 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    3ca9:	83 eb 01             	sub    $0x1,%ebx
    3cac:	75 f2                	jne    3ca0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    3cae:	e8 f7 0b 00 00       	call   48aa <wait>
    3cb3:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cb6:	75 45                	jne    3cfd <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    3cb8:	83 ec 08             	sub    $0x8,%esp
    3cbb:	68 36 5b 00 00       	push   $0x5b36
    3cc0:	6a 01                	push   $0x1
    3cc2:	e8 39 0d 00 00       	call   4a00 <printf>
}
    3cc7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3cca:	c9                   	leave  
    3ccb:	c3                   	ret    
    3ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    3cd0:	83 ec 08             	sub    $0x8,%esp
    3cd3:	68 a4 62 00 00       	push   $0x62a4
    3cd8:	6a 01                	push   $0x1
    3cda:	e8 21 0d 00 00       	call   4a00 <printf>
    exit();
    3cdf:	e8 be 0b 00 00       	call   48a2 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    3ce4:	e8 b9 0b 00 00       	call   48a2 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    3ce9:	83 ec 08             	sub    $0x8,%esp
    3cec:	68 0f 5b 00 00       	push   $0x5b0f
    3cf1:	6a 01                	push   $0x1
    3cf3:	e8 08 0d 00 00       	call   4a00 <printf>
      exit();
    3cf8:	e8 a5 0b 00 00       	call   48a2 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    3cfd:	83 ec 08             	sub    $0x8,%esp
    3d00:	68 23 5b 00 00       	push   $0x5b23
    3d05:	6a 01                	push   $0x1
    3d07:	e8 f4 0c 00 00       	call   4a00 <printf>
    exit();
    3d0c:	e8 91 0b 00 00       	call   48a2 <exit>
    3d11:	eb 0d                	jmp    3d20 <sbrktest>
    3d13:	90                   	nop
    3d14:	90                   	nop
    3d15:	90                   	nop
    3d16:	90                   	nop
    3d17:	90                   	nop
    3d18:	90                   	nop
    3d19:	90                   	nop
    3d1a:	90                   	nop
    3d1b:	90                   	nop
    3d1c:	90                   	nop
    3d1d:	90                   	nop
    3d1e:	90                   	nop
    3d1f:	90                   	nop

00003d20 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3d20:	55                   	push   %ebp
    3d21:	89 e5                	mov    %esp,%ebp
    3d23:	57                   	push   %edi
    3d24:	56                   	push   %esi
    3d25:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3d26:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3d28:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    3d2b:	68 44 5b 00 00       	push   $0x5b44
    3d30:	ff 35 28 6e 00 00    	pushl  0x6e28
    3d36:	e8 c5 0c 00 00       	call   4a00 <printf>
  oldbrk = sbrk(0);
    3d3b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d42:	e8 e3 0b 00 00       	call   492a <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    3d47:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    3d4e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    3d51:	e8 d4 0b 00 00       	call   492a <sbrk>
    3d56:	83 c4 10             	add    $0x10,%esp
    3d59:	89 c3                	mov    %eax,%ebx
    3d5b:	90                   	nop
    3d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    3d60:	83 ec 0c             	sub    $0xc,%esp
    3d63:	6a 01                	push   $0x1
    3d65:	e8 c0 0b 00 00       	call   492a <sbrk>
    if(b != a){
    3d6a:	83 c4 10             	add    $0x10,%esp
    3d6d:	39 d8                	cmp    %ebx,%eax
    3d6f:	0f 85 85 02 00 00    	jne    3ffa <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3d75:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    3d78:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    3d7b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3d7e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    3d84:	75 da                	jne    3d60 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    3d86:	e8 0f 0b 00 00       	call   489a <fork>
  if(pid < 0){
    3d8b:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    3d8d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    3d8f:	0f 88 93 03 00 00    	js     4128 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    3d95:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    3d98:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    3d9b:	6a 01                	push   $0x1
    3d9d:	e8 88 0b 00 00       	call   492a <sbrk>
  c = sbrk(1);
    3da2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3da9:	e8 7c 0b 00 00       	call   492a <sbrk>
  if(c != a + 1){
    3dae:	83 c4 10             	add    $0x10,%esp
    3db1:	39 d8                	cmp    %ebx,%eax
    3db3:	0f 85 57 03 00 00    	jne    4110 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    3db9:	85 ff                	test   %edi,%edi
    3dbb:	0f 84 4a 03 00 00    	je     410b <sbrktest+0x3eb>
    exit();
  wait();
    3dc1:	e8 e4 0a 00 00       	call   48aa <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3dc6:	83 ec 0c             	sub    $0xc,%esp
    3dc9:	6a 00                	push   $0x0
    3dcb:	e8 5a 0b 00 00       	call   492a <sbrk>
    3dd0:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    3dd2:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3dd7:	29 d8                	sub    %ebx,%eax
    3dd9:	89 04 24             	mov    %eax,(%esp)
    3ddc:	e8 49 0b 00 00       	call   492a <sbrk>
  if (p != a) {
    3de1:	83 c4 10             	add    $0x10,%esp
    3de4:	39 c3                	cmp    %eax,%ebx
    3de6:	0f 85 07 03 00 00    	jne    40f3 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    3dec:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    3def:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    3df6:	6a 00                	push   $0x0
    3df8:	e8 2d 0b 00 00       	call   492a <sbrk>
  c = sbrk(-4096);
    3dfd:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    3e04:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    3e06:	e8 1f 0b 00 00       	call   492a <sbrk>
  if(c == (char*)0xffffffff){
    3e0b:	83 c4 10             	add    $0x10,%esp
    3e0e:	83 f8 ff             	cmp    $0xffffffff,%eax
    3e11:	0f 84 c4 02 00 00    	je     40db <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    3e17:	83 ec 0c             	sub    $0xc,%esp
    3e1a:	6a 00                	push   $0x0
    3e1c:	e8 09 0b 00 00       	call   492a <sbrk>
  if(c != a - 4096){
    3e21:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    3e27:	83 c4 10             	add    $0x10,%esp
    3e2a:	39 d0                	cmp    %edx,%eax
    3e2c:	0f 85 92 02 00 00    	jne    40c4 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3e32:	83 ec 0c             	sub    $0xc,%esp
    3e35:	6a 00                	push   $0x0
    3e37:	e8 ee 0a 00 00       	call   492a <sbrk>
    3e3c:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    3e3e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3e45:	e8 e0 0a 00 00       	call   492a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    3e4a:	83 c4 10             	add    $0x10,%esp
    3e4d:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    3e4f:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    3e51:	0f 85 56 02 00 00    	jne    40ad <sbrktest+0x38d>
    3e57:	83 ec 0c             	sub    $0xc,%esp
    3e5a:	6a 00                	push   $0x0
    3e5c:	e8 c9 0a 00 00       	call   492a <sbrk>
    3e61:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    3e67:	83 c4 10             	add    $0x10,%esp
    3e6a:	39 d0                	cmp    %edx,%eax
    3e6c:	0f 85 3b 02 00 00    	jne    40ad <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    3e72:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    3e79:	0f 84 16 02 00 00    	je     4095 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    3e7f:	83 ec 0c             	sub    $0xc,%esp
    3e82:	6a 00                	push   $0x0
    3e84:	e8 a1 0a 00 00       	call   492a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    3e89:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    3e90:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    3e92:	e8 93 0a 00 00       	call   492a <sbrk>
    3e97:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    3e9a:	29 c1                	sub    %eax,%ecx
    3e9c:	89 0c 24             	mov    %ecx,(%esp)
    3e9f:	e8 86 0a 00 00       	call   492a <sbrk>
  if(c != a){
    3ea4:	83 c4 10             	add    $0x10,%esp
    3ea7:	39 c3                	cmp    %eax,%ebx
    3ea9:	0f 85 cf 01 00 00    	jne    407e <sbrktest+0x35e>
    3eaf:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    3eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    3eb8:	e8 65 0a 00 00       	call   4922 <getpid>
    3ebd:	89 c7                	mov    %eax,%edi
    pid = fork();
    3ebf:	e8 d6 09 00 00       	call   489a <fork>
    if(pid < 0){
    3ec4:	85 c0                	test   %eax,%eax
    3ec6:	0f 88 9a 01 00 00    	js     4066 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    3ecc:	0f 84 72 01 00 00    	je     4044 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3ed2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    3ed8:	e8 cd 09 00 00       	call   48aa <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3edd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    3ee3:	75 d3                	jne    3eb8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    3ee5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3ee8:	83 ec 0c             	sub    $0xc,%esp
    3eeb:	50                   	push   %eax
    3eec:	e8 c1 09 00 00       	call   48b2 <pipe>
    3ef1:	83 c4 10             	add    $0x10,%esp
    3ef4:	85 c0                	test   %eax,%eax
    3ef6:	0f 85 34 01 00 00    	jne    4030 <sbrktest+0x310>
    3efc:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    3eff:	8d 7d e8             	lea    -0x18(%ebp),%edi
    3f02:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    3f04:	e8 91 09 00 00       	call   489a <fork>
    3f09:	85 c0                	test   %eax,%eax
    3f0b:	89 06                	mov    %eax,(%esi)
    3f0d:	0f 84 a1 00 00 00    	je     3fb4 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    3f13:	83 f8 ff             	cmp    $0xffffffff,%eax
    3f16:	74 14                	je     3f2c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    3f18:	8d 45 b7             	lea    -0x49(%ebp),%eax
    3f1b:	83 ec 04             	sub    $0x4,%esp
    3f1e:	6a 01                	push   $0x1
    3f20:	50                   	push   %eax
    3f21:	ff 75 b8             	pushl  -0x48(%ebp)
    3f24:	e8 91 09 00 00       	call   48ba <read>
    3f29:	83 c4 10             	add    $0x10,%esp
    3f2c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3f2f:	39 f7                	cmp    %esi,%edi
    3f31:	75 d1                	jne    3f04 <sbrktest+0x1e4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3f33:	83 ec 0c             	sub    $0xc,%esp
    3f36:	68 00 10 00 00       	push   $0x1000
    3f3b:	e8 ea 09 00 00       	call   492a <sbrk>
    3f40:	83 c4 10             	add    $0x10,%esp
    3f43:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    3f45:	8b 03                	mov    (%ebx),%eax
    3f47:	83 f8 ff             	cmp    $0xffffffff,%eax
    3f4a:	74 11                	je     3f5d <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    3f4c:	83 ec 0c             	sub    $0xc,%esp
    3f4f:	50                   	push   %eax
    3f50:	e8 7d 09 00 00       	call   48d2 <kill>
    wait();
    3f55:	e8 50 09 00 00       	call   48aa <wait>
    3f5a:	83 c4 10             	add    $0x10,%esp
    3f5d:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3f60:	39 fb                	cmp    %edi,%ebx
    3f62:	75 e1                	jne    3f45 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    3f64:	83 fe ff             	cmp    $0xffffffff,%esi
    3f67:	0f 84 ab 00 00 00    	je     4018 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    3f6d:	83 ec 0c             	sub    $0xc,%esp
    3f70:	6a 00                	push   $0x0
    3f72:	e8 b3 09 00 00       	call   492a <sbrk>
    3f77:	83 c4 10             	add    $0x10,%esp
    3f7a:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    3f7d:	73 1a                	jae    3f99 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    3f7f:	83 ec 0c             	sub    $0xc,%esp
    3f82:	6a 00                	push   $0x0
    3f84:	e8 a1 09 00 00       	call   492a <sbrk>
    3f89:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    3f8c:	29 c6                	sub    %eax,%esi
    3f8e:	89 34 24             	mov    %esi,(%esp)
    3f91:	e8 94 09 00 00       	call   492a <sbrk>
    3f96:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    3f99:	83 ec 08             	sub    $0x8,%esp
    3f9c:	68 ec 5b 00 00       	push   $0x5bec
    3fa1:	ff 35 28 6e 00 00    	pushl  0x6e28
    3fa7:	e8 54 0a 00 00       	call   4a00 <printf>
}
    3fac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3faf:	5b                   	pop    %ebx
    3fb0:	5e                   	pop    %esi
    3fb1:	5f                   	pop    %edi
    3fb2:	5d                   	pop    %ebp
    3fb3:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    3fb4:	83 ec 0c             	sub    $0xc,%esp
    3fb7:	6a 00                	push   $0x0
    3fb9:	e8 6c 09 00 00       	call   492a <sbrk>
    3fbe:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3fc3:	29 c2                	sub    %eax,%edx
    3fc5:	89 14 24             	mov    %edx,(%esp)
    3fc8:	e8 5d 09 00 00       	call   492a <sbrk>
      write(fds[1], "x", 1);
    3fcd:	83 c4 0c             	add    $0xc,%esp
    3fd0:	6a 01                	push   $0x1
    3fd2:	68 ad 56 00 00       	push   $0x56ad
    3fd7:	ff 75 bc             	pushl  -0x44(%ebp)
    3fda:	e8 e3 08 00 00       	call   48c2 <write>
    3fdf:	83 c4 10             	add    $0x10,%esp
    3fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3fe8:	83 ec 0c             	sub    $0xc,%esp
    3feb:	68 e8 03 00 00       	push   $0x3e8
    3ff0:	e8 3d 09 00 00       	call   4932 <sleep>
    3ff5:	83 c4 10             	add    $0x10,%esp
    3ff8:	eb ee                	jmp    3fe8 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3ffa:	83 ec 0c             	sub    $0xc,%esp
    3ffd:	50                   	push   %eax
    3ffe:	53                   	push   %ebx
    3fff:	57                   	push   %edi
    4000:	68 4f 5b 00 00       	push   $0x5b4f
    4005:	ff 35 28 6e 00 00    	pushl  0x6e28
    400b:	e8 f0 09 00 00       	call   4a00 <printf>
      exit();
    4010:	83 c4 20             	add    $0x20,%esp
    4013:	e8 8a 08 00 00       	call   48a2 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    4018:	83 ec 08             	sub    $0x8,%esp
    401b:	68 d1 5b 00 00       	push   $0x5bd1
    4020:	ff 35 28 6e 00 00    	pushl  0x6e28
    4026:	e8 d5 09 00 00       	call   4a00 <printf>
    exit();
    402b:	e8 72 08 00 00       	call   48a2 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    4030:	83 ec 08             	sub    $0x8,%esp
    4033:	68 8d 50 00 00       	push   $0x508d
    4038:	6a 01                	push   $0x1
    403a:	e8 c1 09 00 00       	call   4a00 <printf>
    exit();
    403f:	e8 5e 08 00 00       	call   48a2 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    4044:	0f be 03             	movsbl (%ebx),%eax
    4047:	50                   	push   %eax
    4048:	53                   	push   %ebx
    4049:	68 b8 5b 00 00       	push   $0x5bb8
    404e:	ff 35 28 6e 00 00    	pushl  0x6e28
    4054:	e8 a7 09 00 00       	call   4a00 <printf>
      kill(ppid);
    4059:	89 3c 24             	mov    %edi,(%esp)
    405c:	e8 71 08 00 00       	call   48d2 <kill>
      exit();
    4061:	e8 3c 08 00 00       	call   48a2 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    4066:	83 ec 08             	sub    $0x8,%esp
    4069:	68 95 5c 00 00       	push   $0x5c95
    406e:	ff 35 28 6e 00 00    	pushl  0x6e28
    4074:	e8 87 09 00 00       	call   4a00 <printf>
      exit();
    4079:	e8 24 08 00 00       	call   48a2 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    407e:	50                   	push   %eax
    407f:	53                   	push   %ebx
    4080:	68 98 63 00 00       	push   $0x6398
    4085:	ff 35 28 6e 00 00    	pushl  0x6e28
    408b:	e8 70 09 00 00       	call   4a00 <printf>
    exit();
    4090:	e8 0d 08 00 00       	call   48a2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    4095:	83 ec 08             	sub    $0x8,%esp
    4098:	68 68 63 00 00       	push   $0x6368
    409d:	ff 35 28 6e 00 00    	pushl  0x6e28
    40a3:	e8 58 09 00 00       	call   4a00 <printf>
    exit();
    40a8:	e8 f5 07 00 00       	call   48a2 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    40ad:	57                   	push   %edi
    40ae:	53                   	push   %ebx
    40af:	68 40 63 00 00       	push   $0x6340
    40b4:	ff 35 28 6e 00 00    	pushl  0x6e28
    40ba:	e8 41 09 00 00       	call   4a00 <printf>
    exit();
    40bf:	e8 de 07 00 00       	call   48a2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    40c4:	50                   	push   %eax
    40c5:	53                   	push   %ebx
    40c6:	68 08 63 00 00       	push   $0x6308
    40cb:	ff 35 28 6e 00 00    	pushl  0x6e28
    40d1:	e8 2a 09 00 00       	call   4a00 <printf>
    exit();
    40d6:	e8 c7 07 00 00       	call   48a2 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    40db:	83 ec 08             	sub    $0x8,%esp
    40de:	68 9d 5b 00 00       	push   $0x5b9d
    40e3:	ff 35 28 6e 00 00    	pushl  0x6e28
    40e9:	e8 12 09 00 00       	call   4a00 <printf>
    exit();
    40ee:	e8 af 07 00 00       	call   48a2 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    40f3:	83 ec 08             	sub    $0x8,%esp
    40f6:	68 c8 62 00 00       	push   $0x62c8
    40fb:	ff 35 28 6e 00 00    	pushl  0x6e28
    4101:	e8 fa 08 00 00       	call   4a00 <printf>
    exit();
    4106:	e8 97 07 00 00       	call   48a2 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    410b:	e8 92 07 00 00       	call   48a2 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    4110:	83 ec 08             	sub    $0x8,%esp
    4113:	68 81 5b 00 00       	push   $0x5b81
    4118:	ff 35 28 6e 00 00    	pushl  0x6e28
    411e:	e8 dd 08 00 00       	call   4a00 <printf>
    exit();
    4123:	e8 7a 07 00 00       	call   48a2 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    4128:	83 ec 08             	sub    $0x8,%esp
    412b:	68 6a 5b 00 00       	push   $0x5b6a
    4130:	ff 35 28 6e 00 00    	pushl  0x6e28
    4136:	e8 c5 08 00 00       	call   4a00 <printf>
    exit();
    413b:	e8 62 07 00 00       	call   48a2 <exit>

00004140 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    4140:	55                   	push   %ebp
    4141:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    4143:	5d                   	pop    %ebp
    4144:	c3                   	ret    
    4145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004150 <validatetest>:

void
validatetest(void)
{
    4150:	55                   	push   %ebp
    4151:	89 e5                	mov    %esp,%ebp
    4153:	56                   	push   %esi
    4154:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    4155:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    4157:	83 ec 08             	sub    $0x8,%esp
    415a:	68 fa 5b 00 00       	push   $0x5bfa
    415f:	ff 35 28 6e 00 00    	pushl  0x6e28
    4165:	e8 96 08 00 00       	call   4a00 <printf>
    416a:	83 c4 10             	add    $0x10,%esp
    416d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    4170:	e8 25 07 00 00       	call   489a <fork>
    4175:	85 c0                	test   %eax,%eax
    4177:	89 c6                	mov    %eax,%esi
    4179:	74 63                	je     41de <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    417b:	83 ec 0c             	sub    $0xc,%esp
    417e:	6a 00                	push   $0x0
    4180:	e8 ad 07 00 00       	call   4932 <sleep>
    sleep(0);
    4185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    418c:	e8 a1 07 00 00       	call   4932 <sleep>
    kill(pid);
    4191:	89 34 24             	mov    %esi,(%esp)
    4194:	e8 39 07 00 00       	call   48d2 <kill>
    wait();
    4199:	e8 0c 07 00 00       	call   48aa <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    419e:	58                   	pop    %eax
    419f:	5a                   	pop    %edx
    41a0:	53                   	push   %ebx
    41a1:	68 09 5c 00 00       	push   $0x5c09
    41a6:	e8 57 07 00 00       	call   4902 <link>
    41ab:	83 c4 10             	add    $0x10,%esp
    41ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    41b1:	75 30                	jne    41e3 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    41b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    41b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    41bf:	75 af                	jne    4170 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    41c1:	83 ec 08             	sub    $0x8,%esp
    41c4:	68 2d 5c 00 00       	push   $0x5c2d
    41c9:	ff 35 28 6e 00 00    	pushl  0x6e28
    41cf:	e8 2c 08 00 00       	call   4a00 <printf>
}
    41d4:	83 c4 10             	add    $0x10,%esp
    41d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    41da:	5b                   	pop    %ebx
    41db:	5e                   	pop    %esi
    41dc:	5d                   	pop    %ebp
    41dd:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    41de:	e8 bf 06 00 00       	call   48a2 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    41e3:	83 ec 08             	sub    $0x8,%esp
    41e6:	68 14 5c 00 00       	push   $0x5c14
    41eb:	ff 35 28 6e 00 00    	pushl  0x6e28
    41f1:	e8 0a 08 00 00       	call   4a00 <printf>
      exit();
    41f6:	e8 a7 06 00 00       	call   48a2 <exit>
    41fb:	90                   	nop
    41fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004200 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    4200:	55                   	push   %ebp
    4201:	89 e5                	mov    %esp,%ebp
    4203:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    4206:	68 3a 5c 00 00       	push   $0x5c3a
    420b:	ff 35 28 6e 00 00    	pushl  0x6e28
    4211:	e8 ea 07 00 00       	call   4a00 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    4216:	83 c4 10             	add    $0x10,%esp
    4219:	80 3d e0 6e 00 00 00 	cmpb   $0x0,0x6ee0
    4220:	75 35                	jne    4257 <bsstest+0x57>
    4222:	b8 e1 6e 00 00       	mov    $0x6ee1,%eax
    4227:	89 f6                	mov    %esi,%esi
    4229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4230:	80 38 00             	cmpb   $0x0,(%eax)
    4233:	75 22                	jne    4257 <bsstest+0x57>
    4235:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    4238:	3d f0 95 00 00       	cmp    $0x95f0,%eax
    423d:	75 f1                	jne    4230 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    423f:	83 ec 08             	sub    $0x8,%esp
    4242:	68 55 5c 00 00       	push   $0x5c55
    4247:	ff 35 28 6e 00 00    	pushl  0x6e28
    424d:	e8 ae 07 00 00       	call   4a00 <printf>
}
    4252:	83 c4 10             	add    $0x10,%esp
    4255:	c9                   	leave  
    4256:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    4257:	83 ec 08             	sub    $0x8,%esp
    425a:	68 44 5c 00 00       	push   $0x5c44
    425f:	ff 35 28 6e 00 00    	pushl  0x6e28
    4265:	e8 96 07 00 00       	call   4a00 <printf>
      exit();
    426a:	e8 33 06 00 00       	call   48a2 <exit>
    426f:	90                   	nop

00004270 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    4270:	55                   	push   %ebp
    4271:	89 e5                	mov    %esp,%ebp
    4273:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    4276:	68 62 5c 00 00       	push   $0x5c62
    427b:	e8 72 06 00 00       	call   48f2 <unlink>
  pid = fork();
    4280:	e8 15 06 00 00       	call   489a <fork>
  if(pid == 0){
    4285:	83 c4 10             	add    $0x10,%esp
    4288:	85 c0                	test   %eax,%eax
    428a:	74 3f                	je     42cb <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    428c:	0f 88 c2 00 00 00    	js     4354 <bigargtest+0xe4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    4292:	e8 13 06 00 00       	call   48aa <wait>
  fd = open("bigarg-ok", 0);
    4297:	83 ec 08             	sub    $0x8,%esp
    429a:	6a 00                	push   $0x0
    429c:	68 62 5c 00 00       	push   $0x5c62
    42a1:	e8 3c 06 00 00       	call   48e2 <open>
  if(fd < 0){
    42a6:	83 c4 10             	add    $0x10,%esp
    42a9:	85 c0                	test   %eax,%eax
    42ab:	0f 88 8c 00 00 00    	js     433d <bigargtest+0xcd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    42b1:	83 ec 0c             	sub    $0xc,%esp
    42b4:	50                   	push   %eax
    42b5:	e8 10 06 00 00       	call   48ca <close>
  unlink("bigarg-ok");
    42ba:	c7 04 24 62 5c 00 00 	movl   $0x5c62,(%esp)
    42c1:	e8 2c 06 00 00       	call   48f2 <unlink>
}
    42c6:	83 c4 10             	add    $0x10,%esp
    42c9:	c9                   	leave  
    42ca:	c3                   	ret    
    42cb:	b8 40 6e 00 00       	mov    $0x6e40,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    42d0:	c7 00 bc 63 00 00    	movl   $0x63bc,(%eax)
    42d6:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    42d9:	3d bc 6e 00 00       	cmp    $0x6ebc,%eax
    42de:	75 f0                	jne    42d0 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    42e0:	51                   	push   %ecx
    42e1:	51                   	push   %ecx
    42e2:	68 6c 5c 00 00       	push   $0x5c6c
    42e7:	ff 35 28 6e 00 00    	pushl  0x6e28
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    42ed:	c7 05 bc 6e 00 00 00 	movl   $0x0,0x6ebc
    42f4:	00 00 00 
    printf(stdout, "bigarg test\n");
    42f7:	e8 04 07 00 00       	call   4a00 <printf>
    exec("echo", args);
    42fc:	58                   	pop    %eax
    42fd:	5a                   	pop    %edx
    42fe:	68 40 6e 00 00       	push   $0x6e40
    4303:	68 39 4e 00 00       	push   $0x4e39
    4308:	e8 cd 05 00 00       	call   48da <exec>
    printf(stdout, "bigarg test ok\n");
    430d:	59                   	pop    %ecx
    430e:	58                   	pop    %eax
    430f:	68 79 5c 00 00       	push   $0x5c79
    4314:	ff 35 28 6e 00 00    	pushl  0x6e28
    431a:	e8 e1 06 00 00       	call   4a00 <printf>
    fd = open("bigarg-ok", O_CREATE);
    431f:	58                   	pop    %eax
    4320:	5a                   	pop    %edx
    4321:	68 00 02 00 00       	push   $0x200
    4326:	68 62 5c 00 00       	push   $0x5c62
    432b:	e8 b2 05 00 00       	call   48e2 <open>
    close(fd);
    4330:	89 04 24             	mov    %eax,(%esp)
    4333:	e8 92 05 00 00       	call   48ca <close>
    exit();
    4338:	e8 65 05 00 00       	call   48a2 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    433d:	50                   	push   %eax
    433e:	50                   	push   %eax
    433f:	68 a2 5c 00 00       	push   $0x5ca2
    4344:	ff 35 28 6e 00 00    	pushl  0x6e28
    434a:	e8 b1 06 00 00       	call   4a00 <printf>
    exit();
    434f:	e8 4e 05 00 00       	call   48a2 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    4354:	52                   	push   %edx
    4355:	52                   	push   %edx
    4356:	68 89 5c 00 00       	push   $0x5c89
    435b:	ff 35 28 6e 00 00    	pushl  0x6e28
    4361:	e8 9a 06 00 00       	call   4a00 <printf>
    exit();
    4366:	e8 37 05 00 00       	call   48a2 <exit>
    436b:	90                   	nop
    436c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004370 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    4370:	55                   	push   %ebp
    4371:	89 e5                	mov    %esp,%ebp
    4373:	57                   	push   %edi
    4374:	56                   	push   %esi
    4375:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    4376:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    4378:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    437b:	68 b7 5c 00 00       	push   $0x5cb7
    4380:	6a 01                	push   $0x1
    4382:	e8 79 06 00 00       	call   4a00 <printf>
    4387:	83 c4 10             	add    $0x10,%esp
    438a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    4390:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    4395:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    4397:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    4399:	f7 eb                	imul   %ebx
    439b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    439e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    43a0:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    43a3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    43a7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    43ab:	c1 fa 06             	sar    $0x6,%edx
    43ae:	29 f2                	sub    %esi,%edx
    43b0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    43b3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    43b9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    43bc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    43c1:	29 d1                	sub    %edx,%ecx
    43c3:	f7 e9                	imul   %ecx
    43c5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    43c8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    43cd:	c1 fa 05             	sar    $0x5,%edx
    43d0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    43d2:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    43d7:	83 c2 30             	add    $0x30,%edx
    43da:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    43dd:	f7 eb                	imul   %ebx
    43df:	c1 fa 05             	sar    $0x5,%edx
    43e2:	29 f2                	sub    %esi,%edx
    43e4:	6b d2 64             	imul   $0x64,%edx,%edx
    43e7:	29 d7                	sub    %edx,%edi
    43e9:	89 f8                	mov    %edi,%eax
    43eb:	c1 ff 1f             	sar    $0x1f,%edi
    43ee:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    43f0:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    43f2:	c1 fa 02             	sar    $0x2,%edx
    43f5:	29 fa                	sub    %edi,%edx
    43f7:	83 c2 30             	add    $0x30,%edx
    43fa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    43fd:	f7 e9                	imul   %ecx
    43ff:	89 d9                	mov    %ebx,%ecx
    4401:	c1 fa 02             	sar    $0x2,%edx
    4404:	29 f2                	sub    %esi,%edx
    4406:	8d 04 92             	lea    (%edx,%edx,4),%eax
    4409:	01 c0                	add    %eax,%eax
    440b:	29 c1                	sub    %eax,%ecx
    440d:	89 c8                	mov    %ecx,%eax
    440f:	83 c0 30             	add    $0x30,%eax
    4412:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    4415:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4418:	50                   	push   %eax
    4419:	68 c4 5c 00 00       	push   $0x5cc4
    441e:	6a 01                	push   $0x1
    4420:	e8 db 05 00 00       	call   4a00 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    4425:	58                   	pop    %eax
    4426:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4429:	5a                   	pop    %edx
    442a:	68 02 02 00 00       	push   $0x202
    442f:	50                   	push   %eax
    4430:	e8 ad 04 00 00       	call   48e2 <open>
    if(fd < 0){
    4435:	83 c4 10             	add    $0x10,%esp
    4438:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    443a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    443c:	78 50                	js     448e <fsfull+0x11e>
    443e:	31 f6                	xor    %esi,%esi
    4440:	eb 08                	jmp    444a <fsfull+0xda>
    4442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    4448:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    444a:	83 ec 04             	sub    $0x4,%esp
    444d:	68 00 02 00 00       	push   $0x200
    4452:	68 00 96 00 00       	push   $0x9600
    4457:	57                   	push   %edi
    4458:	e8 65 04 00 00       	call   48c2 <write>
      if(cc < 512)
    445d:	83 c4 10             	add    $0x10,%esp
    4460:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    4465:	7f e1                	jg     4448 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    4467:	83 ec 04             	sub    $0x4,%esp
    446a:	56                   	push   %esi
    446b:	68 e0 5c 00 00       	push   $0x5ce0
    4470:	6a 01                	push   $0x1
    4472:	e8 89 05 00 00       	call   4a00 <printf>
    close(fd);
    4477:	89 3c 24             	mov    %edi,(%esp)
    447a:	e8 4b 04 00 00       	call   48ca <close>
    if(total == 0)
    447f:	83 c4 10             	add    $0x10,%esp
    4482:	85 f6                	test   %esi,%esi
    4484:	74 22                	je     44a8 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    4486:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    4489:	e9 02 ff ff ff       	jmp    4390 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    448e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4491:	83 ec 04             	sub    $0x4,%esp
    4494:	50                   	push   %eax
    4495:	68 d0 5c 00 00       	push   $0x5cd0
    449a:	6a 01                	push   $0x1
    449c:	e8 5f 05 00 00       	call   4a00 <printf>
      break;
    44a1:	83 c4 10             	add    $0x10,%esp
    44a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    44a8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    44ad:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    44af:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    44b1:	f7 eb                	imul   %ebx
    44b3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    44b6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    44b8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    44bb:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    44bf:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    44c3:	c1 fa 06             	sar    $0x6,%edx
    44c6:	29 f2                	sub    %esi,%edx
    44c8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    44cb:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    44d1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    44d4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    44d9:	29 d1                	sub    %edx,%ecx
    44db:	f7 e9                	imul   %ecx
    44dd:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    44e0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    44e5:	c1 fa 05             	sar    $0x5,%edx
    44e8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    44ea:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    44ef:	83 c2 30             	add    $0x30,%edx
    44f2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    44f5:	f7 eb                	imul   %ebx
    44f7:	c1 fa 05             	sar    $0x5,%edx
    44fa:	29 f2                	sub    %esi,%edx
    44fc:	6b d2 64             	imul   $0x64,%edx,%edx
    44ff:	29 d7                	sub    %edx,%edi
    4501:	89 f8                	mov    %edi,%eax
    4503:	c1 ff 1f             	sar    $0x1f,%edi
    4506:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    4508:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    450a:	c1 fa 02             	sar    $0x2,%edx
    450d:	29 fa                	sub    %edi,%edx
    450f:	83 c2 30             	add    $0x30,%edx
    4512:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    4515:	f7 e9                	imul   %ecx
    4517:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    4519:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    451c:	c1 fa 02             	sar    $0x2,%edx
    451f:	29 f2                	sub    %esi,%edx
    4521:	8d 04 92             	lea    (%edx,%edx,4),%eax
    4524:	01 c0                	add    %eax,%eax
    4526:	29 c1                	sub    %eax,%ecx
    4528:	89 c8                	mov    %ecx,%eax
    452a:	83 c0 30             	add    $0x30,%eax
    452d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    4530:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4533:	50                   	push   %eax
    4534:	e8 b9 03 00 00       	call   48f2 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    4539:	83 c4 10             	add    $0x10,%esp
    453c:	83 fb ff             	cmp    $0xffffffff,%ebx
    453f:	0f 85 63 ff ff ff    	jne    44a8 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    4545:	83 ec 08             	sub    $0x8,%esp
    4548:	68 f0 5c 00 00       	push   $0x5cf0
    454d:	6a 01                	push   $0x1
    454f:	e8 ac 04 00 00       	call   4a00 <printf>
}
    4554:	83 c4 10             	add    $0x10,%esp
    4557:	8d 65 f4             	lea    -0xc(%ebp),%esp
    455a:	5b                   	pop    %ebx
    455b:	5e                   	pop    %esi
    455c:	5f                   	pop    %edi
    455d:	5d                   	pop    %ebp
    455e:	c3                   	ret    
    455f:	90                   	nop

00004560 <uio>:

void
uio()
{
    4560:	55                   	push   %ebp
    4561:	89 e5                	mov    %esp,%ebp
    4563:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    4566:	68 06 5d 00 00       	push   $0x5d06
    456b:	6a 01                	push   $0x1
    456d:	e8 8e 04 00 00       	call   4a00 <printf>
  pid = fork();
    4572:	e8 23 03 00 00       	call   489a <fork>
  if(pid == 0){
    4577:	83 c4 10             	add    $0x10,%esp
    457a:	85 c0                	test   %eax,%eax
    457c:	74 1b                	je     4599 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    457e:	78 3d                	js     45bd <uio+0x5d>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    4580:	e8 25 03 00 00       	call   48aa <wait>
  printf(1, "uio test done\n");
    4585:	83 ec 08             	sub    $0x8,%esp
    4588:	68 10 5d 00 00       	push   $0x5d10
    458d:	6a 01                	push   $0x1
    458f:	e8 6c 04 00 00       	call   4a00 <printf>
}
    4594:	83 c4 10             	add    $0x10,%esp
    4597:	c9                   	leave  
    4598:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    4599:	ba 70 00 00 00       	mov    $0x70,%edx
    459e:	b8 09 00 00 00       	mov    $0x9,%eax
    45a3:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    45a4:	ba 71 00 00 00       	mov    $0x71,%edx
    45a9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    45aa:	52                   	push   %edx
    45ab:	52                   	push   %edx
    45ac:	68 9c 64 00 00       	push   $0x649c
    45b1:	6a 01                	push   $0x1
    45b3:	e8 48 04 00 00       	call   4a00 <printf>
    exit();
    45b8:	e8 e5 02 00 00       	call   48a2 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    45bd:	50                   	push   %eax
    45be:	50                   	push   %eax
    45bf:	68 95 5c 00 00       	push   $0x5c95
    45c4:	6a 01                	push   $0x1
    45c6:	e8 35 04 00 00       	call   4a00 <printf>
    exit();
    45cb:	e8 d2 02 00 00       	call   48a2 <exit>

000045d0 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    45d0:	55                   	push   %ebp
    45d1:	89 e5                	mov    %esp,%ebp
    45d3:	53                   	push   %ebx
    45d4:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    45d7:	6a 00                	push   $0x0
    45d9:	68 1f 5d 00 00       	push   $0x5d1f
    45de:	e8 ff 02 00 00       	call   48e2 <open>
  if (fd < 0) {
    45e3:	83 c4 10             	add    $0x10,%esp
    45e6:	85 c0                	test   %eax,%eax
    45e8:	78 39                	js     4623 <argptest+0x53>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    45ea:	83 ec 0c             	sub    $0xc,%esp
    45ed:	89 c3                	mov    %eax,%ebx
    45ef:	6a 00                	push   $0x0
    45f1:	e8 34 03 00 00       	call   492a <sbrk>
    45f6:	83 c4 0c             	add    $0xc,%esp
    45f9:	83 e8 01             	sub    $0x1,%eax
    45fc:	6a ff                	push   $0xffffffff
    45fe:	50                   	push   %eax
    45ff:	53                   	push   %ebx
    4600:	e8 b5 02 00 00       	call   48ba <read>
  close(fd);
    4605:	89 1c 24             	mov    %ebx,(%esp)
    4608:	e8 bd 02 00 00       	call   48ca <close>
  printf(1, "arg test passed\n");
    460d:	58                   	pop    %eax
    460e:	5a                   	pop    %edx
    460f:	68 31 5d 00 00       	push   $0x5d31
    4614:	6a 01                	push   $0x1
    4616:	e8 e5 03 00 00       	call   4a00 <printf>
}
    461b:	83 c4 10             	add    $0x10,%esp
    461e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4621:	c9                   	leave  
    4622:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    4623:	51                   	push   %ecx
    4624:	51                   	push   %ecx
    4625:	68 24 5d 00 00       	push   $0x5d24
    462a:	6a 02                	push   $0x2
    462c:	e8 cf 03 00 00       	call   4a00 <printf>
    exit();
    4631:	e8 6c 02 00 00       	call   48a2 <exit>
    4636:	8d 76 00             	lea    0x0(%esi),%esi
    4639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004640 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    4640:	69 05 24 6e 00 00 0d 	imul   $0x19660d,0x6e24,%eax
    4647:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    464a:	55                   	push   %ebp
    464b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    464d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    464e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    4653:	a3 24 6e 00 00       	mov    %eax,0x6e24
  return randstate;
}
    4658:	c3                   	ret    
    4659:	66 90                	xchg   %ax,%ax
    465b:	66 90                	xchg   %ax,%ax
    465d:	66 90                	xchg   %ax,%ax
    465f:	90                   	nop

00004660 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4660:	55                   	push   %ebp
    4661:	89 e5                	mov    %esp,%ebp
    4663:	53                   	push   %ebx
    4664:	8b 45 08             	mov    0x8(%ebp),%eax
    4667:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    466a:	89 c2                	mov    %eax,%edx
    466c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4670:	83 c1 01             	add    $0x1,%ecx
    4673:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    4677:	83 c2 01             	add    $0x1,%edx
    467a:	84 db                	test   %bl,%bl
    467c:	88 5a ff             	mov    %bl,-0x1(%edx)
    467f:	75 ef                	jne    4670 <strcpy+0x10>
    ;
  return os;
}
    4681:	5b                   	pop    %ebx
    4682:	5d                   	pop    %ebp
    4683:	c3                   	ret    
    4684:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    468a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004690 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4690:	55                   	push   %ebp
    4691:	89 e5                	mov    %esp,%ebp
    4693:	56                   	push   %esi
    4694:	53                   	push   %ebx
    4695:	8b 55 08             	mov    0x8(%ebp),%edx
    4698:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    469b:	0f b6 02             	movzbl (%edx),%eax
    469e:	0f b6 19             	movzbl (%ecx),%ebx
    46a1:	84 c0                	test   %al,%al
    46a3:	75 1e                	jne    46c3 <strcmp+0x33>
    46a5:	eb 29                	jmp    46d0 <strcmp+0x40>
    46a7:	89 f6                	mov    %esi,%esi
    46a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    46b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    46b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    46b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    46b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    46bd:	84 c0                	test   %al,%al
    46bf:	74 0f                	je     46d0 <strcmp+0x40>
    46c1:	89 f1                	mov    %esi,%ecx
    46c3:	38 d8                	cmp    %bl,%al
    46c5:	74 e9                	je     46b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    46c7:	29 d8                	sub    %ebx,%eax
}
    46c9:	5b                   	pop    %ebx
    46ca:	5e                   	pop    %esi
    46cb:	5d                   	pop    %ebp
    46cc:	c3                   	ret    
    46cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    46d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    46d2:	29 d8                	sub    %ebx,%eax
}
    46d4:	5b                   	pop    %ebx
    46d5:	5e                   	pop    %esi
    46d6:	5d                   	pop    %ebp
    46d7:	c3                   	ret    
    46d8:	90                   	nop
    46d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000046e0 <strlen>:

uint
strlen(char *s)
{
    46e0:	55                   	push   %ebp
    46e1:	89 e5                	mov    %esp,%ebp
    46e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    46e6:	80 39 00             	cmpb   $0x0,(%ecx)
    46e9:	74 12                	je     46fd <strlen+0x1d>
    46eb:	31 d2                	xor    %edx,%edx
    46ed:	8d 76 00             	lea    0x0(%esi),%esi
    46f0:	83 c2 01             	add    $0x1,%edx
    46f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    46f7:	89 d0                	mov    %edx,%eax
    46f9:	75 f5                	jne    46f0 <strlen+0x10>
    ;
  return n;
}
    46fb:	5d                   	pop    %ebp
    46fc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    46fd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    46ff:	5d                   	pop    %ebp
    4700:	c3                   	ret    
    4701:	eb 0d                	jmp    4710 <memset>
    4703:	90                   	nop
    4704:	90                   	nop
    4705:	90                   	nop
    4706:	90                   	nop
    4707:	90                   	nop
    4708:	90                   	nop
    4709:	90                   	nop
    470a:	90                   	nop
    470b:	90                   	nop
    470c:	90                   	nop
    470d:	90                   	nop
    470e:	90                   	nop
    470f:	90                   	nop

00004710 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4710:	55                   	push   %ebp
    4711:	89 e5                	mov    %esp,%ebp
    4713:	57                   	push   %edi
    4714:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    4717:	8b 4d 10             	mov    0x10(%ebp),%ecx
    471a:	8b 45 0c             	mov    0xc(%ebp),%eax
    471d:	89 d7                	mov    %edx,%edi
    471f:	fc                   	cld    
    4720:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    4722:	89 d0                	mov    %edx,%eax
    4724:	5f                   	pop    %edi
    4725:	5d                   	pop    %ebp
    4726:	c3                   	ret    
    4727:	89 f6                	mov    %esi,%esi
    4729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004730 <strchr>:

char*
strchr(const char *s, char c)
{
    4730:	55                   	push   %ebp
    4731:	89 e5                	mov    %esp,%ebp
    4733:	53                   	push   %ebx
    4734:	8b 45 08             	mov    0x8(%ebp),%eax
    4737:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    473a:	0f b6 10             	movzbl (%eax),%edx
    473d:	84 d2                	test   %dl,%dl
    473f:	74 1d                	je     475e <strchr+0x2e>
    if(*s == c)
    4741:	38 d3                	cmp    %dl,%bl
    4743:	89 d9                	mov    %ebx,%ecx
    4745:	75 0d                	jne    4754 <strchr+0x24>
    4747:	eb 17                	jmp    4760 <strchr+0x30>
    4749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4750:	38 ca                	cmp    %cl,%dl
    4752:	74 0c                	je     4760 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4754:	83 c0 01             	add    $0x1,%eax
    4757:	0f b6 10             	movzbl (%eax),%edx
    475a:	84 d2                	test   %dl,%dl
    475c:	75 f2                	jne    4750 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    475e:	31 c0                	xor    %eax,%eax
}
    4760:	5b                   	pop    %ebx
    4761:	5d                   	pop    %ebp
    4762:	c3                   	ret    
    4763:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004770 <gets>:

char*
gets(char *buf, int max)
{
    4770:	55                   	push   %ebp
    4771:	89 e5                	mov    %esp,%ebp
    4773:	57                   	push   %edi
    4774:	56                   	push   %esi
    4775:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4776:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    4778:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    477b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    477e:	eb 29                	jmp    47a9 <gets+0x39>
    cc = read(0, &c, 1);
    4780:	83 ec 04             	sub    $0x4,%esp
    4783:	6a 01                	push   $0x1
    4785:	57                   	push   %edi
    4786:	6a 00                	push   $0x0
    4788:	e8 2d 01 00 00       	call   48ba <read>
    if(cc < 1)
    478d:	83 c4 10             	add    $0x10,%esp
    4790:	85 c0                	test   %eax,%eax
    4792:	7e 1d                	jle    47b1 <gets+0x41>
      break;
    buf[i++] = c;
    4794:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    4798:	8b 55 08             	mov    0x8(%ebp),%edx
    479b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    479d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    479f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    47a3:	74 1b                	je     47c0 <gets+0x50>
    47a5:	3c 0d                	cmp    $0xd,%al
    47a7:	74 17                	je     47c0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    47a9:	8d 5e 01             	lea    0x1(%esi),%ebx
    47ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    47af:	7c cf                	jl     4780 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    47b1:	8b 45 08             	mov    0x8(%ebp),%eax
    47b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    47b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47bb:	5b                   	pop    %ebx
    47bc:	5e                   	pop    %esi
    47bd:	5f                   	pop    %edi
    47be:	5d                   	pop    %ebp
    47bf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    47c0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    47c3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    47c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    47c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47cc:	5b                   	pop    %ebx
    47cd:	5e                   	pop    %esi
    47ce:	5f                   	pop    %edi
    47cf:	5d                   	pop    %ebp
    47d0:	c3                   	ret    
    47d1:	eb 0d                	jmp    47e0 <stat>
    47d3:	90                   	nop
    47d4:	90                   	nop
    47d5:	90                   	nop
    47d6:	90                   	nop
    47d7:	90                   	nop
    47d8:	90                   	nop
    47d9:	90                   	nop
    47da:	90                   	nop
    47db:	90                   	nop
    47dc:	90                   	nop
    47dd:	90                   	nop
    47de:	90                   	nop
    47df:	90                   	nop

000047e0 <stat>:

int
stat(char *n, struct stat *st)
{
    47e0:	55                   	push   %ebp
    47e1:	89 e5                	mov    %esp,%ebp
    47e3:	56                   	push   %esi
    47e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    47e5:	83 ec 08             	sub    $0x8,%esp
    47e8:	6a 00                	push   $0x0
    47ea:	ff 75 08             	pushl  0x8(%ebp)
    47ed:	e8 f0 00 00 00       	call   48e2 <open>
  if(fd < 0)
    47f2:	83 c4 10             	add    $0x10,%esp
    47f5:	85 c0                	test   %eax,%eax
    47f7:	78 27                	js     4820 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    47f9:	83 ec 08             	sub    $0x8,%esp
    47fc:	ff 75 0c             	pushl  0xc(%ebp)
    47ff:	89 c3                	mov    %eax,%ebx
    4801:	50                   	push   %eax
    4802:	e8 f3 00 00 00       	call   48fa <fstat>
    4807:	89 c6                	mov    %eax,%esi
  close(fd);
    4809:	89 1c 24             	mov    %ebx,(%esp)
    480c:	e8 b9 00 00 00       	call   48ca <close>
  return r;
    4811:	83 c4 10             	add    $0x10,%esp
    4814:	89 f0                	mov    %esi,%eax
}
    4816:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4819:	5b                   	pop    %ebx
    481a:	5e                   	pop    %esi
    481b:	5d                   	pop    %ebp
    481c:	c3                   	ret    
    481d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    4820:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4825:	eb ef                	jmp    4816 <stat+0x36>
    4827:	89 f6                	mov    %esi,%esi
    4829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004830 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    4830:	55                   	push   %ebp
    4831:	89 e5                	mov    %esp,%ebp
    4833:	53                   	push   %ebx
    4834:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4837:	0f be 11             	movsbl (%ecx),%edx
    483a:	8d 42 d0             	lea    -0x30(%edx),%eax
    483d:	3c 09                	cmp    $0x9,%al
    483f:	b8 00 00 00 00       	mov    $0x0,%eax
    4844:	77 1f                	ja     4865 <atoi+0x35>
    4846:	8d 76 00             	lea    0x0(%esi),%esi
    4849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    4850:	8d 04 80             	lea    (%eax,%eax,4),%eax
    4853:	83 c1 01             	add    $0x1,%ecx
    4856:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    485a:	0f be 11             	movsbl (%ecx),%edx
    485d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    4860:	80 fb 09             	cmp    $0x9,%bl
    4863:	76 eb                	jbe    4850 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    4865:	5b                   	pop    %ebx
    4866:	5d                   	pop    %ebp
    4867:	c3                   	ret    
    4868:	90                   	nop
    4869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004870 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4870:	55                   	push   %ebp
    4871:	89 e5                	mov    %esp,%ebp
    4873:	56                   	push   %esi
    4874:	53                   	push   %ebx
    4875:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4878:	8b 45 08             	mov    0x8(%ebp),%eax
    487b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    487e:	85 db                	test   %ebx,%ebx
    4880:	7e 14                	jle    4896 <memmove+0x26>
    4882:	31 d2                	xor    %edx,%edx
    4884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    4888:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    488c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    488f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4892:	39 da                	cmp    %ebx,%edx
    4894:	75 f2                	jne    4888 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    4896:	5b                   	pop    %ebx
    4897:	5e                   	pop    %esi
    4898:	5d                   	pop    %ebp
    4899:	c3                   	ret    

0000489a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    489a:	b8 01 00 00 00       	mov    $0x1,%eax
    489f:	cd 40                	int    $0x40
    48a1:	c3                   	ret    

000048a2 <exit>:
SYSCALL(exit)
    48a2:	b8 02 00 00 00       	mov    $0x2,%eax
    48a7:	cd 40                	int    $0x40
    48a9:	c3                   	ret    

000048aa <wait>:
SYSCALL(wait)
    48aa:	b8 03 00 00 00       	mov    $0x3,%eax
    48af:	cd 40                	int    $0x40
    48b1:	c3                   	ret    

000048b2 <pipe>:
SYSCALL(pipe)
    48b2:	b8 04 00 00 00       	mov    $0x4,%eax
    48b7:	cd 40                	int    $0x40
    48b9:	c3                   	ret    

000048ba <read>:
SYSCALL(read)
    48ba:	b8 05 00 00 00       	mov    $0x5,%eax
    48bf:	cd 40                	int    $0x40
    48c1:	c3                   	ret    

000048c2 <write>:
SYSCALL(write)
    48c2:	b8 10 00 00 00       	mov    $0x10,%eax
    48c7:	cd 40                	int    $0x40
    48c9:	c3                   	ret    

000048ca <close>:
SYSCALL(close)
    48ca:	b8 15 00 00 00       	mov    $0x15,%eax
    48cf:	cd 40                	int    $0x40
    48d1:	c3                   	ret    

000048d2 <kill>:
SYSCALL(kill)
    48d2:	b8 06 00 00 00       	mov    $0x6,%eax
    48d7:	cd 40                	int    $0x40
    48d9:	c3                   	ret    

000048da <exec>:
SYSCALL(exec)
    48da:	b8 07 00 00 00       	mov    $0x7,%eax
    48df:	cd 40                	int    $0x40
    48e1:	c3                   	ret    

000048e2 <open>:
SYSCALL(open)
    48e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    48e7:	cd 40                	int    $0x40
    48e9:	c3                   	ret    

000048ea <mknod>:
SYSCALL(mknod)
    48ea:	b8 11 00 00 00       	mov    $0x11,%eax
    48ef:	cd 40                	int    $0x40
    48f1:	c3                   	ret    

000048f2 <unlink>:
SYSCALL(unlink)
    48f2:	b8 12 00 00 00       	mov    $0x12,%eax
    48f7:	cd 40                	int    $0x40
    48f9:	c3                   	ret    

000048fa <fstat>:
SYSCALL(fstat)
    48fa:	b8 08 00 00 00       	mov    $0x8,%eax
    48ff:	cd 40                	int    $0x40
    4901:	c3                   	ret    

00004902 <link>:
SYSCALL(link)
    4902:	b8 13 00 00 00       	mov    $0x13,%eax
    4907:	cd 40                	int    $0x40
    4909:	c3                   	ret    

0000490a <mkdir>:
SYSCALL(mkdir)
    490a:	b8 14 00 00 00       	mov    $0x14,%eax
    490f:	cd 40                	int    $0x40
    4911:	c3                   	ret    

00004912 <chdir>:
SYSCALL(chdir)
    4912:	b8 09 00 00 00       	mov    $0x9,%eax
    4917:	cd 40                	int    $0x40
    4919:	c3                   	ret    

0000491a <dup>:
SYSCALL(dup)
    491a:	b8 0a 00 00 00       	mov    $0xa,%eax
    491f:	cd 40                	int    $0x40
    4921:	c3                   	ret    

00004922 <getpid>:
SYSCALL(getpid)
    4922:	b8 0b 00 00 00       	mov    $0xb,%eax
    4927:	cd 40                	int    $0x40
    4929:	c3                   	ret    

0000492a <sbrk>:
SYSCALL(sbrk)
    492a:	b8 0c 00 00 00       	mov    $0xc,%eax
    492f:	cd 40                	int    $0x40
    4931:	c3                   	ret    

00004932 <sleep>:
SYSCALL(sleep)
    4932:	b8 0d 00 00 00       	mov    $0xd,%eax
    4937:	cd 40                	int    $0x40
    4939:	c3                   	ret    

0000493a <uptime>:
SYSCALL(uptime)
    493a:	b8 0e 00 00 00       	mov    $0xe,%eax
    493f:	cd 40                	int    $0x40
    4941:	c3                   	ret    

00004942 <shm_open>:
SYSCALL(shm_open)
    4942:	b8 16 00 00 00       	mov    $0x16,%eax
    4947:	cd 40                	int    $0x40
    4949:	c3                   	ret    

0000494a <shm_close>:
SYSCALL(shm_close)	
    494a:	b8 17 00 00 00       	mov    $0x17,%eax
    494f:	cd 40                	int    $0x40
    4951:	c3                   	ret    
    4952:	66 90                	xchg   %ax,%ax
    4954:	66 90                	xchg   %ax,%ax
    4956:	66 90                	xchg   %ax,%ax
    4958:	66 90                	xchg   %ax,%ax
    495a:	66 90                	xchg   %ax,%ax
    495c:	66 90                	xchg   %ax,%ax
    495e:	66 90                	xchg   %ax,%ax

00004960 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    4960:	55                   	push   %ebp
    4961:	89 e5                	mov    %esp,%ebp
    4963:	57                   	push   %edi
    4964:	56                   	push   %esi
    4965:	53                   	push   %ebx
    4966:	89 c6                	mov    %eax,%esi
    4968:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    496b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    496e:	85 db                	test   %ebx,%ebx
    4970:	74 7e                	je     49f0 <printint+0x90>
    4972:	89 d0                	mov    %edx,%eax
    4974:	c1 e8 1f             	shr    $0x1f,%eax
    4977:	84 c0                	test   %al,%al
    4979:	74 75                	je     49f0 <printint+0x90>
    neg = 1;
    x = -xx;
    497b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    497d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    4984:	f7 d8                	neg    %eax
    4986:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    4989:	31 ff                	xor    %edi,%edi
    498b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    498e:	89 ce                	mov    %ecx,%esi
    4990:	eb 08                	jmp    499a <printint+0x3a>
    4992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    4998:	89 cf                	mov    %ecx,%edi
    499a:	31 d2                	xor    %edx,%edx
    499c:	8d 4f 01             	lea    0x1(%edi),%ecx
    499f:	f7 f6                	div    %esi
    49a1:	0f b6 92 f4 64 00 00 	movzbl 0x64f4(%edx),%edx
  }while((x /= base) != 0);
    49a8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    49aa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    49ad:	75 e9                	jne    4998 <printint+0x38>
  if(neg)
    49af:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    49b2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    49b5:	85 c0                	test   %eax,%eax
    49b7:	74 08                	je     49c1 <printint+0x61>
    buf[i++] = '-';
    49b9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    49be:	8d 4f 02             	lea    0x2(%edi),%ecx
    49c1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    49c5:	8d 76 00             	lea    0x0(%esi),%esi
    49c8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    49cb:	83 ec 04             	sub    $0x4,%esp
    49ce:	83 ef 01             	sub    $0x1,%edi
    49d1:	6a 01                	push   $0x1
    49d3:	53                   	push   %ebx
    49d4:	56                   	push   %esi
    49d5:	88 45 d7             	mov    %al,-0x29(%ebp)
    49d8:	e8 e5 fe ff ff       	call   48c2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    49dd:	83 c4 10             	add    $0x10,%esp
    49e0:	39 df                	cmp    %ebx,%edi
    49e2:	75 e4                	jne    49c8 <printint+0x68>
    putc(fd, buf[i]);
}
    49e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    49e7:	5b                   	pop    %ebx
    49e8:	5e                   	pop    %esi
    49e9:	5f                   	pop    %edi
    49ea:	5d                   	pop    %ebp
    49eb:	c3                   	ret    
    49ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    49f0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    49f2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    49f9:	eb 8b                	jmp    4986 <printint+0x26>
    49fb:	90                   	nop
    49fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004a00 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4a00:	55                   	push   %ebp
    4a01:	89 e5                	mov    %esp,%ebp
    4a03:	57                   	push   %edi
    4a04:	56                   	push   %esi
    4a05:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4a06:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4a09:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4a0c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4a0f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4a12:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4a15:	0f b6 1e             	movzbl (%esi),%ebx
    4a18:	83 c6 01             	add    $0x1,%esi
    4a1b:	84 db                	test   %bl,%bl
    4a1d:	0f 84 b0 00 00 00    	je     4ad3 <printf+0xd3>
    4a23:	31 d2                	xor    %edx,%edx
    4a25:	eb 39                	jmp    4a60 <printf+0x60>
    4a27:	89 f6                	mov    %esi,%esi
    4a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    4a30:	83 f8 25             	cmp    $0x25,%eax
    4a33:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    4a36:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    4a3b:	74 18                	je     4a55 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4a3d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    4a40:	83 ec 04             	sub    $0x4,%esp
    4a43:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    4a46:	6a 01                	push   $0x1
    4a48:	50                   	push   %eax
    4a49:	57                   	push   %edi
    4a4a:	e8 73 fe ff ff       	call   48c2 <write>
    4a4f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4a52:	83 c4 10             	add    $0x10,%esp
    4a55:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4a58:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    4a5c:	84 db                	test   %bl,%bl
    4a5e:	74 73                	je     4ad3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    4a60:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    4a62:	0f be cb             	movsbl %bl,%ecx
    4a65:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    4a68:	74 c6                	je     4a30 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    4a6a:	83 fa 25             	cmp    $0x25,%edx
    4a6d:	75 e6                	jne    4a55 <printf+0x55>
      if(c == 'd'){
    4a6f:	83 f8 64             	cmp    $0x64,%eax
    4a72:	0f 84 f8 00 00 00    	je     4b70 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    4a78:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    4a7e:	83 f9 70             	cmp    $0x70,%ecx
    4a81:	74 5d                	je     4ae0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4a83:	83 f8 73             	cmp    $0x73,%eax
    4a86:	0f 84 84 00 00 00    	je     4b10 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4a8c:	83 f8 63             	cmp    $0x63,%eax
    4a8f:	0f 84 ea 00 00 00    	je     4b7f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    4a95:	83 f8 25             	cmp    $0x25,%eax
    4a98:	0f 84 c2 00 00 00    	je     4b60 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4a9e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    4aa1:	83 ec 04             	sub    $0x4,%esp
    4aa4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    4aa8:	6a 01                	push   $0x1
    4aaa:	50                   	push   %eax
    4aab:	57                   	push   %edi
    4aac:	e8 11 fe ff ff       	call   48c2 <write>
    4ab1:	83 c4 0c             	add    $0xc,%esp
    4ab4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    4ab7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    4aba:	6a 01                	push   $0x1
    4abc:	50                   	push   %eax
    4abd:	57                   	push   %edi
    4abe:	83 c6 01             	add    $0x1,%esi
    4ac1:	e8 fc fd ff ff       	call   48c2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4ac6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4aca:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4acd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4acf:	84 db                	test   %bl,%bl
    4ad1:	75 8d                	jne    4a60 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4ad3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4ad6:	5b                   	pop    %ebx
    4ad7:	5e                   	pop    %esi
    4ad8:	5f                   	pop    %edi
    4ad9:	5d                   	pop    %ebp
    4ada:	c3                   	ret    
    4adb:	90                   	nop
    4adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    4ae0:	83 ec 0c             	sub    $0xc,%esp
    4ae3:	b9 10 00 00 00       	mov    $0x10,%ecx
    4ae8:	6a 00                	push   $0x0
    4aea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    4aed:	89 f8                	mov    %edi,%eax
    4aef:	8b 13                	mov    (%ebx),%edx
    4af1:	e8 6a fe ff ff       	call   4960 <printint>
        ap++;
    4af6:	89 d8                	mov    %ebx,%eax
    4af8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4afb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    4afd:	83 c0 04             	add    $0x4,%eax
    4b00:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4b03:	e9 4d ff ff ff       	jmp    4a55 <printf+0x55>
    4b08:	90                   	nop
    4b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    4b10:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4b13:	8b 18                	mov    (%eax),%ebx
        ap++;
    4b15:	83 c0 04             	add    $0x4,%eax
    4b18:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    4b1b:	b8 ec 64 00 00       	mov    $0x64ec,%eax
    4b20:	85 db                	test   %ebx,%ebx
    4b22:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    4b25:	0f b6 03             	movzbl (%ebx),%eax
    4b28:	84 c0                	test   %al,%al
    4b2a:	74 23                	je     4b4f <printf+0x14f>
    4b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4b30:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4b33:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    4b36:	83 ec 04             	sub    $0x4,%esp
    4b39:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    4b3b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4b3e:	50                   	push   %eax
    4b3f:	57                   	push   %edi
    4b40:	e8 7d fd ff ff       	call   48c2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4b45:	0f b6 03             	movzbl (%ebx),%eax
    4b48:	83 c4 10             	add    $0x10,%esp
    4b4b:	84 c0                	test   %al,%al
    4b4d:	75 e1                	jne    4b30 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4b4f:	31 d2                	xor    %edx,%edx
    4b51:	e9 ff fe ff ff       	jmp    4a55 <printf+0x55>
    4b56:	8d 76 00             	lea    0x0(%esi),%esi
    4b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4b60:	83 ec 04             	sub    $0x4,%esp
    4b63:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    4b66:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    4b69:	6a 01                	push   $0x1
    4b6b:	e9 4c ff ff ff       	jmp    4abc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    4b70:	83 ec 0c             	sub    $0xc,%esp
    4b73:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4b78:	6a 01                	push   $0x1
    4b7a:	e9 6b ff ff ff       	jmp    4aea <printf+0xea>
    4b7f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4b82:	83 ec 04             	sub    $0x4,%esp
    4b85:	8b 03                	mov    (%ebx),%eax
    4b87:	6a 01                	push   $0x1
    4b89:	88 45 e4             	mov    %al,-0x1c(%ebp)
    4b8c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4b8f:	50                   	push   %eax
    4b90:	57                   	push   %edi
    4b91:	e8 2c fd ff ff       	call   48c2 <write>
    4b96:	e9 5b ff ff ff       	jmp    4af6 <printf+0xf6>
    4b9b:	66 90                	xchg   %ax,%ax
    4b9d:	66 90                	xchg   %ax,%ax
    4b9f:	90                   	nop

00004ba0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4ba0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4ba1:	a1 c0 6e 00 00       	mov    0x6ec0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    4ba6:	89 e5                	mov    %esp,%ebp
    4ba8:	57                   	push   %edi
    4ba9:	56                   	push   %esi
    4baa:	53                   	push   %ebx
    4bab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4bae:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4bb0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4bb3:	39 c8                	cmp    %ecx,%eax
    4bb5:	73 19                	jae    4bd0 <free+0x30>
    4bb7:	89 f6                	mov    %esi,%esi
    4bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4bc0:	39 d1                	cmp    %edx,%ecx
    4bc2:	72 1c                	jb     4be0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4bc4:	39 d0                	cmp    %edx,%eax
    4bc6:	73 18                	jae    4be0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    4bc8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4bca:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4bcc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4bce:	72 f0                	jb     4bc0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4bd0:	39 d0                	cmp    %edx,%eax
    4bd2:	72 f4                	jb     4bc8 <free+0x28>
    4bd4:	39 d1                	cmp    %edx,%ecx
    4bd6:	73 f0                	jae    4bc8 <free+0x28>
    4bd8:	90                   	nop
    4bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    4be0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    4be3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    4be6:	39 d7                	cmp    %edx,%edi
    4be8:	74 19                	je     4c03 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    4bea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    4bed:	8b 50 04             	mov    0x4(%eax),%edx
    4bf0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4bf3:	39 f1                	cmp    %esi,%ecx
    4bf5:	74 23                	je     4c1a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    4bf7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    4bf9:	a3 c0 6e 00 00       	mov    %eax,0x6ec0
}
    4bfe:	5b                   	pop    %ebx
    4bff:	5e                   	pop    %esi
    4c00:	5f                   	pop    %edi
    4c01:	5d                   	pop    %ebp
    4c02:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    4c03:	03 72 04             	add    0x4(%edx),%esi
    4c06:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4c09:	8b 10                	mov    (%eax),%edx
    4c0b:	8b 12                	mov    (%edx),%edx
    4c0d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    4c10:	8b 50 04             	mov    0x4(%eax),%edx
    4c13:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4c16:	39 f1                	cmp    %esi,%ecx
    4c18:	75 dd                	jne    4bf7 <free+0x57>
    p->s.size += bp->s.size;
    4c1a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    4c1d:	a3 c0 6e 00 00       	mov    %eax,0x6ec0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    4c22:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4c25:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4c28:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    4c2a:	5b                   	pop    %ebx
    4c2b:	5e                   	pop    %esi
    4c2c:	5f                   	pop    %edi
    4c2d:	5d                   	pop    %ebp
    4c2e:	c3                   	ret    
    4c2f:	90                   	nop

00004c30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4c30:	55                   	push   %ebp
    4c31:	89 e5                	mov    %esp,%ebp
    4c33:	57                   	push   %edi
    4c34:	56                   	push   %esi
    4c35:	53                   	push   %ebx
    4c36:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4c39:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    4c3c:	8b 15 c0 6e 00 00    	mov    0x6ec0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4c42:	8d 78 07             	lea    0x7(%eax),%edi
    4c45:	c1 ef 03             	shr    $0x3,%edi
    4c48:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    4c4b:	85 d2                	test   %edx,%edx
    4c4d:	0f 84 a3 00 00 00    	je     4cf6 <malloc+0xc6>
    4c53:	8b 02                	mov    (%edx),%eax
    4c55:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    4c58:	39 cf                	cmp    %ecx,%edi
    4c5a:	76 74                	jbe    4cd0 <malloc+0xa0>
    4c5c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    4c62:	be 00 10 00 00       	mov    $0x1000,%esi
    4c67:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    4c6e:	0f 43 f7             	cmovae %edi,%esi
    4c71:	ba 00 80 00 00       	mov    $0x8000,%edx
    4c76:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    4c7c:	0f 46 da             	cmovbe %edx,%ebx
    4c7f:	eb 10                	jmp    4c91 <malloc+0x61>
    4c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4c88:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    4c8a:	8b 48 04             	mov    0x4(%eax),%ecx
    4c8d:	39 cf                	cmp    %ecx,%edi
    4c8f:	76 3f                	jbe    4cd0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4c91:	39 05 c0 6e 00 00    	cmp    %eax,0x6ec0
    4c97:	89 c2                	mov    %eax,%edx
    4c99:	75 ed                	jne    4c88 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    4c9b:	83 ec 0c             	sub    $0xc,%esp
    4c9e:	53                   	push   %ebx
    4c9f:	e8 86 fc ff ff       	call   492a <sbrk>
  if(p == (char*)-1)
    4ca4:	83 c4 10             	add    $0x10,%esp
    4ca7:	83 f8 ff             	cmp    $0xffffffff,%eax
    4caa:	74 1c                	je     4cc8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    4cac:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    4caf:	83 ec 0c             	sub    $0xc,%esp
    4cb2:	83 c0 08             	add    $0x8,%eax
    4cb5:	50                   	push   %eax
    4cb6:	e8 e5 fe ff ff       	call   4ba0 <free>
  return freep;
    4cbb:	8b 15 c0 6e 00 00    	mov    0x6ec0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    4cc1:	83 c4 10             	add    $0x10,%esp
    4cc4:	85 d2                	test   %edx,%edx
    4cc6:	75 c0                	jne    4c88 <malloc+0x58>
        return 0;
    4cc8:	31 c0                	xor    %eax,%eax
    4cca:	eb 1c                	jmp    4ce8 <malloc+0xb8>
    4ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    4cd0:	39 cf                	cmp    %ecx,%edi
    4cd2:	74 1c                	je     4cf0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    4cd4:	29 f9                	sub    %edi,%ecx
    4cd6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    4cd9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    4cdc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    4cdf:	89 15 c0 6e 00 00    	mov    %edx,0x6ec0
      return (void*)(p + 1);
    4ce5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    4ce8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4ceb:	5b                   	pop    %ebx
    4cec:	5e                   	pop    %esi
    4ced:	5f                   	pop    %edi
    4cee:	5d                   	pop    %ebp
    4cef:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    4cf0:	8b 08                	mov    (%eax),%ecx
    4cf2:	89 0a                	mov    %ecx,(%edx)
    4cf4:	eb e9                	jmp    4cdf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    4cf6:	c7 05 c0 6e 00 00 c4 	movl   $0x6ec4,0x6ec0
    4cfd:	6e 00 00 
    4d00:	c7 05 c4 6e 00 00 c4 	movl   $0x6ec4,0x6ec4
    4d07:	6e 00 00 
    base.s.size = 0;
    4d0a:	b8 c4 6e 00 00       	mov    $0x6ec4,%eax
    4d0f:	c7 05 c8 6e 00 00 00 	movl   $0x0,0x6ec8
    4d16:	00 00 00 
    4d19:	e9 3e ff ff ff       	jmp    4c5c <malloc+0x2c>
    4d1e:	66 90                	xchg   %ax,%ax

00004d20 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    4d20:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    4d21:	b9 01 00 00 00       	mov    $0x1,%ecx
    4d26:	89 e5                	mov    %esp,%ebp
    4d28:	8b 55 08             	mov    0x8(%ebp),%edx
    4d2b:	90                   	nop
    4d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4d30:	89 c8                	mov    %ecx,%eax
    4d32:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    4d35:	85 c0                	test   %eax,%eax
    4d37:	75 f7                	jne    4d30 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    4d39:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    4d3e:	5d                   	pop    %ebp
    4d3f:	c3                   	ret    

00004d40 <urelease>:

void urelease (struct uspinlock *lk) {
    4d40:	55                   	push   %ebp
    4d41:	89 e5                	mov    %esp,%ebp
    4d43:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    4d46:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    4d4b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    4d51:	5d                   	pop    %ebp
    4d52:	c3                   	ret    
