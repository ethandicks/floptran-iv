1 LET F=0:LET G=0:LET H=0:LET I=0:LET A=7:LET B=6:LET C=6:LET O=1
3 A=A-O:IF A GOTO 9
4 GOTO 100
5 LET B=6
7 LET A=6
9 LET D=7:LET E=6
11 D=D-O:IF D GOTO 21
13 E=E-O:IF E GOTO 17
15 GOTO 3
17 LET D=6
21 I=I+O
23 V=A:W=B:X=C:Y=D:Z=E 
25 Q=X-W:Q=SGN(Q):Q=Q+O:IF Q GOTO 29 
27 T=W:X=W:W=T 
29 Q=W-V:Q=SGN(Q):Q=Q+O:IF Q GOTO 39 
31 T=W:W=V:V=T 
33 Q=X-W:Q=SGN(Q):Q=Q+O:IF Q GOTO 39 
35 T=X:X=W:W=T 
39 Q=Z-Y:Q=SGN(Q):Q=Q+O:IF Q GOTO 43 
41 T=Z:Z=Y:Y=T 
43 Q=Z-X:Q=SGN(Q):Q=Q+O:IF Q GOTO 51 
45 Q=V-W:Q=SGN(Q):Q=Q+O:IF Q GOTO 53 
47 GOTO 61 
51 Q=Y-W:Q=SGN(Q):Q=Q+O:IF Q GOTO 71 
53 G=G+O:GOTO 11 
61 F=F+O:GOTO 11 
71 H=H+O:GOTO 11 
100 B=B-O:IF B GOTO 7 
110 C=C-O:IF C GOTO 5 
120 PRINT F,G,H:F=F/I:G=G/I:H=H/I:PRINT F,G,H:RETURN
