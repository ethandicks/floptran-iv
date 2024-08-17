#!/usr/bin/perl

# replace addresses in floptran compiler template with value from symbol table
#

# symbol table file format
#
# LABEL      1.0     2.0     4.0     VIC20   C64     COMMENT
# LINWID     ----    000F    ----    ----    ----   Screen line width (set in INIT but never used)
# USRPOK     0000    0000    0000    0000    0310   $4C constant = JMP
# LINNUM     0008    0011    0011    0014    0014   Line # storage Lo/Hi
# INDEX      0071    001F    001F    0022    0022   Indirect index #1 - Lo/Hi
# FAC        00B0    005E    005E    0061    0061   Main floating-point accumulator (Mantissa - 5 bytes)
# FACMO      00B3    0061    0061    0064    0064   Middle order of mantissa
#

# BASIC listing format with symbols to be replaced
#
# Symbols are read in as 16-bit quantities and broken into
# high (.h) and low (.l) bytes in decimal for substitution
#
#54100 print#1,32:print#1,{GETIN.l}:print#1,{GETIN.h}:print#1,168:print#1,169:print#1,0
#59300 print#1,32:print#1,{BSOUT.l}:print#1,{BSOUT.h}:pc=pc+3:return
#59600 print#1,162:print#1,0:print#1,32:print#1,{BASIN.l}:print#1,{BASIN.h}

# Just use a fixed symbol table for now, generated programmatically with some hand edits
$symbols = "./all_labels.txt";

# debug/quiet flag
$quiet = 1;

# grab the name of the symbol column we intend to match
$column = shift @ARGV;

# Provide debugging info if requested
print stderr "Reading symbols from $symbols\n" unless $quiet;
print stderr "Looking for symbols for '$column'\n" unless $quiet;

# Open symbol file and pull in header line for column names
open SFH, "<${symbols}";
$header = <SFH>;
chomp $header;

print stderr "Header is '$header'\n" unless $quiet;

# break down header line into list entities for searching and match against first arg
@rom_options = split(/\s+/, $header);
($index) = grep $rom_options[$_] eq $column, 0 .. $#rom_options;

print stderr "Found it at pos $index\n" unless $quiet;

# Ensure a valid column name was requested or exit with error
die "Did not find '$column' in the symbol file\n" unless (defined($index) and $index);

# read in remaining lines of symbol file and capture as list of alternating
# symbol/matching address key/value pairs

@array = ();

foreach (<SFH>) {
	push @array, (split(/\s+/))[0,$index]
}

close SFH;

# Convert symbol list into hash
%romwords = @array;

# Create hash of high/low decimal byte values with X.h and X.l as keys
%rombytes = {};

# Inject specific symbols to prettify targets
$varname = ($column =~ /^[0-9]/) ? "pet " . $column : $column;
$rombytes{'VARIANT.x'} = lc($varname);

# Build hi-byte+lo-byte symbols/values from 16-bit symbols/values
foreach my $symbol (keys(%romwords)) {
	my $addr = hex($romwords{$symbol});
	my $hkey = $symbol . '.h';
	my $lkey = $symbol . '.l';
	print stderr "$symbol => $hkey / $lkey = $addr\n" unless $quiet < 2;
	$rombytes{$lkey} = $addr & 0xff;
	$rombytes{$hkey} = $addr >> 8;
}

# Match and capture symbol names of the form 'ABCD[_n].h' and 'ABCD[_n].l'
# as well as ABCD[_n].x for non-byte symbols.
$regex = '{([A-Z0-9_]*\.[hlx])}';

# Run through template program (via stdio) and subsitute each symbol with decimal value
foreach (<>) {
	# skip line if it has a variant tag but doesn't match our ROMs
	next if (/:rem match/) and !(/:rem match.*$column/);

	# match on symbolic tags and replace with calculated values
	s/$regex/$rombytes{$1}/g;

	# remove all variant tags from output stream
	s/:rem match.*$//;

	# emit the literal line for the target machine
	print;
}
