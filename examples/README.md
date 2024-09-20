# Examples
  * risk-odds.bas - example program given in original article
  * poketest.bas - example to test POKE with different types of arguments (which generate different binary code streams)
  * chemist-1982.bas - reconstructed FLOPTRAN source for 1982 version of CHEMIST (uses POKE, IF NOT and expanded PRINT)
  * chemist.bas - tidier version of CHEMIST with updates to use expanded IF features and REM BASIC start code
  * sine wave.bas - reconstructed FLOPTRAN source for 1982 version of SINE WAVE (uses POKE, expanded IF and expanded PRINT)
  * victest1.bas - test program for Heitronic compiler for VIC-20
  * victest1.dat - object file output from Heitronic compiler for VIC-20
  * victest1.lst - listing file from Heitronic compiler for VIC-20
  * victest1.prg - loadable binary from Heitronic compiler for VIC-20 (SYS 5632)

# Comments

sine wave.bas uses POKE to play sounds on a speaker hooked up to User Port CB2 pin.  These POKEs should be removed if porting to another platforms (VIC-20, C64).

sine wave.bas uses constants for a 40 column screen.  These constants should be adjusted for an 8032.

chemist has specially crafted print strings that wrap around on a 40 column screen.  These print statements should be edited for an 8032. 
