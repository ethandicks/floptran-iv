# FLOPTRAN IV for Upgrade ROM (BASIC3) PET with Cassette Drive

This is my own adaptation of Mark Zimmerman's original version from "FLOPTRAN-IV: A Tiny Compiler," BYTE, October 1980, page 196 et al, but modified to jump to Upgrade ROM entrypoints, and to conform to the matching Zero Page layout.  Like its ancestor, the oldest version uses Tape #1 as the compiled program save/load device.

One thing to keep in mind about just changing the OPEN statement to point to a disk drive: prior to BASIC 4.0, sequential files on disk use CRLF as a default record separator not CR-only as tape files do.  The added LF will confuse the INPUT#1,A in the published loader program.  This can be worked around by either changing all the PRINT#1 statements in the compiler to not emit a LF, or by modifying the input statements on the loader (the technique employed by 'floptran dloader'), or by employing an external filter on the data file.

As described in the Byte article, you load the bare floptran iv program from tape, prepend your code to be compiled (with line numbers under 49000) then RUN 50000 and answer the prompts.  After successful compilation, load floptran loader, position your tape from the compilation step, then RUN and answer the prompt to choose the memory address to load the data file into.  Start the program with SYS nnnnnn, where nnnnnn is the address you provided to the loader program.  Upgrade ROMs have a built-in machine language monitor, so it's fairly easy to load the compiled program into a handy offset in RAM, say, $140F, then move the program down to 1039 ($040F) and have just the 10 SYS(1039) BASIC shim waiting, and then use the machine language monitor save to tape (or disk) everything from $0401 to the end of your compiled program.

Several pre-compiled and saved examples have been provided in $(TOP)/progs/PET-BASIC3.  These happen to use several additional language features that were added after the initial conversion from the original version published in Byte (printing text strings, printing single characters, printing at a variable-defined column, a GET routine, STOP and END, numeric comparision on IF statement (not just is/is not 0).  As a result, these programs will not compile with an unexpanded version of FLOPTRAN, but the binaries will run as is on a machine with the correct ROM version. 

Provided programs:
  * floptran loader - original tape-only loader program
  * floptran dloader - updated version with LF filter for disk files
