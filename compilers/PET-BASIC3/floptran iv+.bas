49000 x=                                                                     :return
49100 tp=tp+1:ch=peek(tp):ifch=32then49100
49120 return
49130 tp=tp+1:ch=peek(tp):return
49190 if(ch>64)and(ch<91)then49300
49200 print"{down}{down}{down}?syntax error";
49210 print" in"li"{up}":goto61000
49300 z=5*(ch-65)+ov:zh=int(z/256):zl=z-256*zh:return
49400 print#1,160:print#1,zh:print#1,169:print#1,zl
49420 print#1,32:print#1,174:print#1,218:pc=pc+7:return
49600 data69,219,216,219,100,219,0,0,89,210,122,210
49640 data94,222,127,223,246,216,218,222,216,223,223,223
49680 data40,224,140,224,232,214,118,215,54,215,60,217,30,218,104,222
49720 forx=0to19:readml%(x,0),ml%(x,1):next
49740 forx=0to255:ln%(x)=-32767:next:return
50000 x=0:dimln%(255),g%(127,1),ml%(19,1):p=1025:gc=0
50040 l=peek(p+2)+256*peek(p+3):ifl<>49000thenp=peek(p)+256*peek(p+1):goto50040
50100 xl=p+6:gosub49600:input"compiled file name";c$:open1,8,2,c$+",s,w"
50120 print"origin for code? 16384{left}{left}{left}{left}{left}{left}{left}";:inputoc:print#1,oc:pc=oc
50140 print"variable table origin? 826{left}{left}{left}{left}{left}";:inputov:tp=1028
50200 li=peek(tp-1)+256*peek(tp):ifli>255then60000
50220 ln%(li)=pc-32767:print"compiling line"li"{up}"
50240 gosub49100
50260 ifch=0thentp=tp+4:goto50200
50280 ifch=58then50240
50300 ifch=136then58000
50320 ifch=153then59000
50340 ifch=133then59500
50360 ifch=139then58500
50370 ifch=151then53000
50380 if(ch=137)or(ch=141)then58700
50400 ifch=143then56500
50420 ifch=142thenprint#1,96:pc=pc+1:goto50240
50425 ifch=128thenprint#1,76:print#1,137:print#1,195:pc=pc+3:goto50240
50430 ifch=144thenprint#1,0:goto50240
50440 gosub49190:vl=zl:vh=zh
50460 gosub49100:ifch<>178then49200
50480 gosub49100:if(ch>179)and(ch<195)then51000
50500 ifch=171then55600
50520 gosub49190:wl=zl:wh=zh
50540 gosub49100:if(ch=0)or(ch=58)then58300
50560 if(ch<170)or(ch>174)then49200
50580 fu=ch-155:gosub49100:gosub49190:gosub49400
50660 print#1,169:print#1,wl:print#1,160:print#1,wh:pc=pc+4
50720 print#1,32:print#1,152:print#1,217:pc=pc+3:goto51080
51000 fu=ch-180:gosub49100:ifch<>40then49200
51040 gosub49100:gosub49190:gosub49400
51060 gosub49100:ifch<>41then49200
51080 print#1,32:print#1,ml%(fu,0):print#1,ml%(fu,1):pc=pc+3
51100 print#1,162:print#1,vl:print#1,160:print#1,vh
51120 print#1,32:print#1,224:print#1,218:pc=pc+7:goto50240
52000 a=0:ifpeek(tp+2)<>34then52020
52010 gosub49130:print#1,169:print#1,ch:gosub59300:pc=pc+5:gosub49100:goto59000
52020 zh=int((pc+7)/256):zl=(pc+7)-256*zh:tp=tp+1
52030 print#1,169:print#1,zl:print#1,160:print#1,zh
52040 print#1,24:print#1,144
52045 ifpeek(tp+a)<>34thena=a+1:goto52045
52046 print#1,a+1
52050 ch=peek(tp):ifch<>34thenprint#1,ch:tp=tp+1:goto52050
52060 print#1,0
52070 print#1,32:print#1,28:print#1,202:pc=pc+a+11
52080 goto59000
53000 a$=""
53005 gosub49100:ifch<>58andch<>0thena$=a$+chr$(ch):goto53005
53010 forx=1tolen(a$):ifmid$(a$,x,1)<>","thennext
53020 pa$=left$(a$,x-1):pv$=right$(a$,len(a$)-x)
53030 a=val(pa$):l=val(pv$)
53040 ifasc(pv$)<>48andl=0then53500
53050 ifasc(pa$)<>48anda=0then53100
53060 ifl>255then49200
53070 zh=int(a/256):zl=a-256*zh
53080 print#1,169:print#1,l:print#1,141:print#1,zl:print#1,zh:pc=pc+5:goto50260
53100 ch=asc(pa$):gosub49190:gosub49400
53110 print#1,32:print#1,210:print#1,214
53115 print#1,165:print#1,97:print#1,133:print#1,99:print#1,169:print#1,l
53120 print#1,160:print#1,0:print#1,145:print#1,98:pc=pc+13:ch=peek(tp):goto50260
53500 ch=asc(pv$):gosub49190:gosub49400:print#1,32:print#1,210:print#1,214
53510 print#1,165:print#1,98:pc=pc+5
53520 ifasc(pa$)<>48anda=0thenprint#1,133:print#1,15:pc=pc+2:goto53700
53530 zh=int(a/256):zl=a-256*zh:print#1,141:print#1,zl:print#1,zh:pc=pc+3:ch=peek(tp)
53540 goto50260
53700 ch=asc(pa$):gosub49190:gosub49400
53710 print#1,32:print#1,210:print#1,214
53715 print#1,165:print#1,97:print#1,133:print#1,99
53719 print#1,165:print#1,15
53720 print#1,160:print#1,0:print#1,145:print#1,98:pc=pc+13:ch=peek(tp):goto50260
54000 x=(ch=166):gosub49100:gosub49190:gosub49400
54005 print#1,32:print#1,210:print#1,214
54010 print#1,165:print#1,17:ifxthenprint#1,24:print#1,101:print#1,198:pc=pc+3
54020 print#1,133:print#1,198:pc=pc+7:gosub49100:ifch<>41then49200
54030 goto59000
54200 gosub49100:ifch<>40then49200
54205 gosub49100:gosub49190:gosub49400
54210 print#1,32:print#1,210:print#1,214:print#1,165:print#1,17
54220 print#1,32:print#1,210:print#1,255:pc=pc+8:gosub49100:ifch<>41then49200
54230 goto59000
55600 gosub49100:gosub49190:gosub49400:gosub59950:goto51100
56500 gosub49100:ifch=45thenprint#1,234:pc=pc+1:goto56500
56510 ifch=0then50260
56520 if(ch<48)or(ch>70)or(ch>57andch<65)then56500
56530 x=(ch-48)+7*(ch>64):gosub49100:ifch=0then49200
56540 if(ch<48)or(ch>70)or(ch>57andch<65)then49200
56550 x=x*16+(ch-48)+7*(ch>64):print#1,x:pc=pc+1:goto56500
58000 gosub49100:gosub49190:gosub49100:vl=tp+1:ifch<>178then49200
58080 gosub49100:if(ch<>58)and(ch<>0)then58080
58100 iftp-vl>60thenprint"line too long error";:goto49210
58120 forl=vltotp-1:wl=peek(l):pokexl+l-vl,wl:next
58160 gosub49000:forl=vltotp-1:pokexl+l-vl,32:next
58180 print#1,24:print#1,144:print#1,5:pc=pc+3:vl=256*peek(43)+peek(42)+2
58220 forl=vltovl+4:print#1,peek(l):next:wh=int(pc/256):wl=pc-256*wh
58240 vl=zl:vh=zh:pc=pc+5
58300 gosub59900:goto50260
58500 x=0:gosub49100:ifch=168thengosub49100:x=-32
58520 gosub49190:gosub49100:ifch=137orch=141then58680
58530 vl=zl:vh=zh:ifch<180andch>176then58540
58535 goto49200
58540 tl=ch-176:gosub49100:gosub49190
58550 iftl=3thenwl=zl:zl=vl:vl=wl:wh=zh:zh=vh:vh=wh
58560 gosub49400:print#1,160:print#1,vh:print#1,169:print#1,vl
58570 print#1,32:print#1,51:print#1,215:pc=pc+7:iftl=2then58580
58575 print#1,32:print#1,69:print#1,219:print#1,160:print#1,216
58577 print#1,169:print#1,200:print#1,32:print#1,51:print#1,215:pc=pc+10
58580 print#1,165:print#1,94:print#1,208-x:print#1,3:pc=pc+4
58590 gosub49100:if(ch<>137)and(ch<>141)then49200
58595 goto58700
58680 print#1,173:print#1,zl:print#1,zh:print#1,240+x:print#1,3:pc=pc+5
58700 ifch=141thenprint#1,32:goto58760
58740 print#1,76
58760 g%(gc,0)=pc-32766:print#1,0:print#1,0:pc=pc+3:tl=0
58800 gosub49100:if(ch<48)or(ch>57)then58840
58820 tl=10*tl+ch-48:goto58800
58840 g%(gc,1)=tl:gc=gc+1:goto50260
59000 gosub49100:if(ch=0)or(ch=58)then59400
59040 if(ch<>44)and(ch<>59)then59050
59045 nc=peek(tp+1):if(nc=0)or(nc=58)thengosub49100:goto50260
59047 goto59000
59050 ifch=34thengoto52000
59060 if(ch=163)or(ch=166)then54000
59070 ifch=199then54200
59080 gosub49190:gosub49400:print#1,32:print#1,233:print#1,220
59100 print#1,32:print#1,28:print#1,202
59160 print#1,32:print#1,205:print#1,253:pc=pc+9:goto59000
59300 print#1,32:print#1,210:print#1,255:return
59400 print#1,32:print#1,208:print#1,253:pc=pc+3:goto50260
59500 gosub49100:if(ch=0)or(ch=58)then50260
59540 if(ch=44)or(ch=59)then59500
59560 gosub49190
59580 print#1,169:print#1,63:gosub59300
59600 print#1,162:print#1,0:print#1,32:print#1,207:print#1,255
59620 print#1,157:print#1,16:print#1,2:print#1,232:print#1,201:print#1,13
59660 print#1,208:print#1,245:gosub59300
59680 print#1,224:print#1,1:print#1,208:print#1,3:print#1,76:print#1,137
59700 print#1,195:print#1,169:print#1,16:print#1,133:print#1,31:print#1,169
59720 print#1,2:print#1,133:print#1,32:print#1,202:print#1,138:print#1,32
59740 print#1,143:print#1,214:print#1,162:print#1,zl:print#1,160:print#1,zh
59760 print#1,32:print#1,224:print#1,218
59780 pc=pc+48:goto59500
59900 print#1,162:print#1,4:print#1,189:print#1,wl:print#1,wh
59910 print#1,157:print#1,vl:print#1,vh:print#1,202
59920 print#1,16:print#1,247:pc=pc+11:return
59950 print#1,169:print#1,255
59960 print#1,69:print#1,99:print#1,133:print#1,99:pc=pc+6:return
60000 print"{down}first pass finished":print"{down}program occupies"oc" through"pc-1
60020 print"{down}variables occupy"ov" through"ov+129
60060 print#1,-1:ifgc=0then61000
60080 forx=0togc-1:print#1,g%(x,0)+32767:l=g%(x,1):z=ln%(l)+32767
60100 ifz=0thenprint"{down}{down}{down}?undef'd statement error in"l:goto61000
60120 zh=int(z/256):zl=z-256*zh:print#1,zl:print#1,zh:next
61000 print#1,-1:close1:stop
63000 rem attached loader
63005 if c$=""theninput"file name";c$
63010 open1,8,2,c$+",s,r":input#1,a$:pc=val(a$):print"begin at "pc:p0=pc
63012 ifpc=0thenprint"?bad read, st=";st:close1:end
63015 ifpc<16384thenpc=pc+16384
63017 p1=pc
63020 input#1,a$:a=val(mid$(a$,2)):ifa>=0thenpokepc,a:pc=pc+1:goto63020
63030 print"end at"pc-1:p2=pc-1
63040 input#1,a$:pc=val(mid$(a$,2)):ifpc<0thenclose1:goto63399
63045 ifpc<16384thenpc=pc+16384
63050 input#1,a$:pokepc,val(mid$(a$,2))
63060 input#1,a$:pokepc+1,val(mid$(a$,2)):goto63040
63399 end
63400 rem attached writer
63410 open2,9,2,"cc.prg,p,w"
63420 print"writing prg, start @";p0;"(";p1;"-";p2;")"
63430 print#2,chr$(p0and255)chr$(p0/256);
63440 forn=p1top2:print#2,chr$(peek(n));:next
63450 close2
