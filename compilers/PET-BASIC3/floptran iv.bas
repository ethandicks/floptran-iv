49000 x=                                                                     :return
49100 tp=tp+1:ch=peek(tp):ifch=32then49100
49120 return
49190 if(ch>64)and(ch<91)then49300
49200 print"{down}{down}{down}?syntax error in"li"{up}":goto61000
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
50100 xl=p+6:gosub49600:input"compiled file name";c$:open1,1,1,c$
50120 input"origin for code";oc:print#1,oc:pc=oc
50140 input"variable table origin";ov:tp=1028
50200 li=peek(tp-1)+256*peek(tp):ifli>255then60000
50220 ln%(li)=pc-32767:print"compiling line"li"{up}"
50240 gosub49100
50260 ifch=0thentp=tp+4:goto50200
50280 ifch=58then50240
50300 ifch=136then58000
50320 ifch=153then59000
50340 ifch=133then59500
50360 ifch=139then58500
50380 if(ch=137)or(ch=141)then58700
50400 ifch=143then56500
50410 ifch=151thenpk=ch:gosub49100:goto50440
50420 if(ch=128)or(ch=142)thenprint#1,96:pc=pc+1:goto50240
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
51080 gosub59970:print#1,32:print#1,ml%(fu,0):print#1,ml%(fu,1):pc=pc+3
51100 gosub59990:wl=94:wh=0:gosub59900:goto50240
55600 gosub49100:gosub49190:gosub49400:gosub59950:goto51100
56500 gosub49100:ifch>0thenprint#1,234:pc=pc+1:goto56500
56540 goto50260
58000 gosub49100:gosub49190:gosub49100:vl=tp+1:ifch<>178then49200
58080 gosub49100:if(ch<>58)and(ch<>0)then58080
58100 iftp-vl>60thenprint"line too long error{up}":goto49200
58120 forl=vltotp-1:wl=peek(l):pokexl+l-vl,wl:next
58160 gosub49000:forl=vltotp-1:pokexl+l-vl,32:next
58180 print#1,24:print#1,144:print#1,5:pc=pc+3:vl=256*peek(43)+peek(42)+2
58220 forl=vltovl+4:print#1,peek(l):next:wh=int(pc/256):wl=pc-256*wh
58240 vl=zl:vh=zh:pc=pc+5
58300 gosub59900:goto50260
58500 gosub49100:gosub49190:print#1,173:print#1,zl:print#1,zh:print#1,240
58580 print#1,3:pc=pc+5:gosub49100:if(ch<>137)and(ch<>141)then49200
58700 ifch=141thenprint#1,32:goto58760
58740 print#1,76
58760 g%(gc,0)=pc-32766:print#1,0:print#1,0:pc=pc+3:tl=0
58800 gosub49100:if(ch<48)or(ch>57)then58840
58820 tl=10*tl+ch-48:goto58800
58840 g%(gc,1)=tl:gc=gc+1:goto50260
59000 gosub49100:if(ch=0)or(ch=58)then59400
59040 if(ch=44)or(ch=59)then59000
59050 ifch=34thengosub49100:print#1,169:print#1,ch:gosub59300:pc=pc+5:gosub49100:goto59000
59080 gosub49190:gosub49400:print#1,32:print#1,233:print#1,220
59100 print#1,162:print#1,0:print#1,189:print#1,0:print#1,1
59120 print#1,240:print#1,6:gosub59300:print#1,232:print#1,208:print#1,245
59160 print#1,169:print#1,32:gosub59300:pc=pc+21:goto59000
59300 print#1,32:print#1,210:print#1,255:return
59400 print#1,169:print#1,13:gosub59300:pc=pc+5:goto50260
59500 gosub49100:if(ch=0)or(ch=58)then50260
59540 if(ch=44)or(ch=59)then59500
59560 gosub49190:print#1,169:print#1,ch:gosub59300
59580 print#1,169:print#1,63:gosub59300
59600 print#1,162:print#1,0:print#1,32:print#1,207:print#1,255
59620 print#1,157:print#1,0:print#1,2:print#1,232:print#1,201:print#1,13
59660 print#1,208:print#1,245:gosub59300
59670 print#1,202:print#1,169:print#1,32:print#1,157:print#1,0:print#1,2
59671 print#1,232:print#1,224:print#1,80:print#1,208:print#1,248:pc=pc+11
59680 print#1,169:print#1,255:print#1,133:print#1,119:print#1,169:print#1,1
59700 print#1,133:print#1,120:print#1,32:print#1,112:print#1,0:print#1,32:print#1,255:print#1,219
59780 gosub59990:vl=zl:vh=zh:wl=94:wh=0:gosub59900:pc=pc+40:goto59500
59900 print#1,162:print#1,4:print#1,189:print#1,wl:print#1,wh
59910 print#1,157:print#1,vl:print#1,vh:print#1,202
59920 print#1,16:print#1,247:pc=pc+11:return
59950 print#1,169:print#1,255
59960 print#1,69:print#1,99:print#1,133:print#1,99:pc=pc+6:return
59970 print#1,169:print#1,128
59980 print#1,5:print#1,95:print#1,133:print#1,95:pc=pc+6:return
59990 print#1,165:print#1,99:print#1,41:print#1,128:print#1,73:print#1,128:print#1,69:print#1,95
59991 print#1,133:print#1,95
59992 pc=pc+10:return
60000 print"{down}first pass finished":print"{down}program occupies"oc" through"pc-1
60020 print"{down}variables occupy"ov" through"ov+129
60060 print#1,-1:ifgc=0then61000
60080 forx=0togc-1:print#1,g%(x,0)+32767:l=g%(x,1):z=ln%(l)+32767
60100 ifz=0thenprint"{down}{down}{down}?undef'd statement error in"l:goto61000
60120 zh=int(z/256):zl=z-256*zh:print#1,zl:print#1,zh:next
61000 print#1,-1:close1:end
