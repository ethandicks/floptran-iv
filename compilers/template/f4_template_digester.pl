#!/usr/bin/perl

# replace addresses in floptran compiler template with value from symbol table
#

# symbol table file format
#
# LABEL, BASIC1, BASIC3, BASIC4, VIC-20, C64,    C128,  COMMENT
# ATN,   E048,   E08C,   0,      E30B,   C30B,   0,     ATN(P)
# BASIN, FFCF,   FFCF,   FFCF,   FFCF,   FFCF,   FFCF,  X

$symbols = "./table.txt";

#@n_header = qw( PN Q QX Short Color Description Comments URL);

#@words = (
# 'KDSEAV',
# 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#);

#54100 print#1,32:print#1,{GETIN.l}:print#1,{GETIN.h}:print#1,168:print#1,169:print#1,0
#59300 print#1,32:print#1,{BSOUT.l}:print#1,{BSOUT.h}:pc=pc+3:return
#59600 print#1,162:print#1,0:print#1,32:print#1,{BASIN.l}:print#1,{BASIN.h}

#@array = qw( GETIN.l 228 GETIN.h 255 BSOUT.l 210 BSOUT.h 255 BASIN.l 207 BASIN.h 255);

# BASIC3 values for testing (FRE has an error in my 1982 code)
@array = qw(
 USRPOK 0000
 FRE    D259
 POS    D27A
 PEEK   D6E8
 FADD   D776
 FSUB   D736
 FMULT  D93C
 FDIVT  DA1E
 LOG    D8F6
 SGN    DB45
 ABS    DB64
 INT    DBD8
 SQR    DE5E
 FPWRT  DE68
 EXP    DEDA
 RND    DF7F
 COS    DFD8
 SIN    DFDF
 TAN    E028
 ATN    E08C
 BASIN  FFCF
 BSOUT  FFD2
 GETIN  FFE4
);

%romwords = @array;

%rombytes = ();

foreach my $symbol (keys(%romwords)) {
	my $addr = hex($romwords{$symbol});
	my $hkey = $symbol . '.h';
	my $lkey = $symbol . '.l';
#	print "$symbol => $hkey / $lkey = $addr\n";
	$rombytes{$lkey} = $addr & 0xff;
	$rombytes{$hkey} = $addr >> 8;
}

# Match and capture symbol names of the form 'ABCD.h' and 'ABCD.l'
$regex = '{([A-Z]*\.[hl])}';

# Run through template and subsitute each symbol with decimal value
foreach (<>) {
	s/$regex/$rombytes{$1}/g;

	print;
}
