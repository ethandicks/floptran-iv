#!/usr/bin/perl

# replace addresses in floptran compiler template with value from symbol table
#

# symbol table file format
#
# LABEL, BASIC1, BASIC3, BASIC4, VIC-20, C64,    C128,  COMMENT
# ATN,   E048,   E08C,   0,      E30B,   C30B,   0,     ATN(P)
# BASIN, FFCF,   FFCF,   FFCF,   FFCF,   FFCF,   FFCF,  X

$symbols = "./table.txt";

#54100 print#1,32:print#1,{GETIN.l}:print#1,{GETIN.h}:print#1,168:print#1,169:print#1,0
#59300 print#1,32:print#1,{BSOUT.l}:print#1,{BSOUT.h}:pc=pc+3:return
#59600 print#1,162:print#1,0:print#1,32:print#1,{BASIN.l}:print#1,{BASIN.h}

# BASIC3 values for testing (some values are slightly off in my 1982 code)
#  (special notes: LINWID only exists in BASIC V2)
@array = qw(
 USRPOK   0000
 LINWID   000F
 LINNUM   0011
 INDEX    001F
 INDEX_1  0020
 FAC      005E
 FACMO    0061
 FACLO    0062
 FACSGN   0063
 CHRGOT   0076
 TXTPTR   0077
 TXTPTR_1 0078
 TRMPOS   00C6
 BUF      0210
 READY    C389
 STROUT   CA1C
 FRE      D259
 GIVAYF   D26D
 POS      D27A
 SNGFLT   D27C
 PEEK     D6E8
 VAL      D687
 VAL_8    D68F
 GETADR   D6D2
 FADD     D773
 FADDT    D776
 FSUB     D733
 FSUBT    D736
 FMULT    D93C
 FDIVT    DA1E
 LOG      D8F6
 SGN      DB45
 ABS      DB64
 INT      DBD8
 CONUPK   D998
 MOVFM    DAAE
 MOVMF    DAE0
 FIN      DBFF
 FOUT     DCE9
 SQR      DE5E
 FPWRT    DE68
 EXP      DEDA
 RND      DF7F
 COS      DFD8
 SIN      DFDF
 TAN      E028
 ATN      E08C
 SPACE    FDCD
 CRLF     FDD0
 BASIN    FFCF
 BSOUT    FFD2
 GETIN    FFE4
);

%romwords = @array;

%rombytes = {};

foreach my $symbol (keys(%romwords)) {
	my $addr = hex($romwords{$symbol});
	my $hkey = $symbol . '.h';
	my $lkey = $symbol . '.l';
#	print "$symbol => $hkey / $lkey = $addr\n";
	$rombytes{$lkey} = $addr & 0xff;
	$rombytes{$hkey} = $addr >> 8;
}

# Match and capture symbol names of the form 'ABCD[_n].h' and 'ABCD[_n].l'
$regex = '{([A-Z0-9_]*\.[hl])}';

# Run through template and subsitute each symbol with decimal value
foreach (<>) {
	s/$regex/$rombytes{$1}/g;
	print;
}
