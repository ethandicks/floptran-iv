# Examples
  * risk-odds.bas - example program given in original article
  * featuretest.bas - example usage of statements to test code generation
  * poketest.bas - example to test POKE with different types of arguments (which generate different binary code streams)
  * chemist-1982.bas - reconstructed FLOPTRAN source for 1982 version of CHEMIST (uses POKE, IF NOT and expanded PRINT)
  * chemist.bas - tidier version of CHEMIST with updates to use expanded IF features and REM BASIC start code
  * chief.bas - updated FLOPTRAN source of CHIEF with improved text formatting (uses POKE, IF NOT, expanded PRINT, CHR$, and GET)
  * chief-1982.bas - reconstructed FLOPTRAN source for 1982 version of CHIEF (uses POKE, IF NOT, expanded PRINT, CHR$, and GET)
  * sine wave.bas - reconstructed FLOPTRAN source for 1982 version of SINE WAVE (uses POKE, expanded IF and expanded PRINT)
  * boga2-1982.bas - reconstructed FLOPTRAN source for 1982 version of BOGA ][ (uses expanded IF and expanded PRINT and has large line numbers)
  * victest1.bas - test program for Heitronic compiler for VIC-20
  * victest1.dat - object file output from Heitronic compiler for VIC-20
  * victest1.lst - listing file from Heitronic compiler for VIC-20
  * victest1.prg - loadable binary from Heitronic compiler for VIC-20 (SYS 5632)

# Comments

sine wave.bas uses POKE to play sounds on a speaker hooked up to User Port CB2 pin.  These POKEs should be removed if porting to another platforms (VIC-20, C64).

sine wave.bas uses constants for a 40 column screen.  These constants should be adjusted for an 8032.

chemist has specially crafted print strings that wrap around on a 40 column screen.  These print statements should be edited for an 8032. 

chief depends on the FLOPTRAN implementation of GET that does not work the same way as CBM BASIC (returns ASCII value for keypress).  Its yes/no subroutine also uses a POKE to manipulate the length of the keyboard queue with a value that works for PET BASIC 3.0 only and would have to be changed to the correct zero page for the target machine.
