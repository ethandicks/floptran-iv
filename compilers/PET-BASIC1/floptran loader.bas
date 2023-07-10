 2564 open1:input#1,pc:print"begin at ";pc
   20 input#1,a:ifa>=0thenpokepc,a:pc=pc+1:goto20
   30 print"end at"pc-1
   40 input#1,pc:ifpc<0thenclose1:end
   50 input#1,a:pokepc,a:input#1,a:pokepc+1,a:goto40
