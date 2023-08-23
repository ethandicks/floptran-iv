# FLOPTRAN IV for Upgrade ROM (BASIC3) PET with Cassette Drive or Disk Drive

This is my own adaptation of Mark Zimmermann's original version from "FLOPTRAN-IV: A Tiny Compiler," BYTE, October 1980, page 196 et al, but modified to jump to Upgrade ROM entrypoints, and to conform to the matching Zero Page layout.  Like its ancestor, the oldest version uses Tape #1 as the compiled program save/load device.

One thing to keep in mind about just changing the OPEN statement to point to a disk drive: prior to BASIC 4.0, sequential files on disk use CRLF as a default record separator not CR-only as tape files do.  The added LF will confuse the INPUT#1,A in the published loader program.  This can be worked around by either changing all the PRINT#1 statements in the compiler to not emit a LF, or by modifying the input statements on the loader (the technique employed by 'floptran dloader'), or by employing an external filter on the data file.

As described in the Byte article, you load the bare floptran iv program from tape, prepend your code to be compiled (with line numbers under 49000) then RUN 50000 and answer the prompts.  After successful compilation, load floptran loader, position your tape from the compilation step, then RUN and answer the prompt to choose the memory address to load the data file into.  Start the program with SYS nnnnnn, where nnnnnn is the address you provided to the loader program.  Upgrade ROMs have a built-in machine language monitor, so it's fairly easy to load the compiled program into a handy offset in RAM, say, $140F, then move the program down to 1039 ($040F) and have just the 10 SYS(1039) BASIC shim waiting, and then use the machine language monitor save to tape (or disk) everything from $0401 to the end of your compiled program.

Several pre-compiled and saved examples have been provided in $(TOP)/progs/PET-BASIC3.  These happen to use several additional language features that were added after the initial conversion from the original version published in Byte (printing text strings, printing single characters, printing at a variable-defined column, a GET routine, STOP and END, numeric comparision on IF statement (not just is/is not 0).  As a result, these programs will not compile with an unexpanded version of FLOPTRAN, but the binaries will run as is on a machine with the correct ROM version.

Provided programs:
  * floptran iv - original compiler modified by me in 1981 for BASIC3
  * floptran iv+ - extended compiler with features I added along the way
  * floptran iv udel - original compiler with updates applied from George Watson Jr of the University of Delaware, published in BYTE Magazine, July 1981
  * floptran loader - original tape-only loader program from 1980
  * floptran dloader - updated version with LF filter for disk files
  * *.bas - ASCII versions of tokenized programs to aid with tracking changes/additions

My version of floptran iv from 1981 is likely to not be bug-free.  In particular, FRE(0) probably doesn't point to the best entry point in ROM, INPUT seems to leave zero page in a state that throws a ?SYNTAX ERROR on exiting to BASIC, and the implementation of POKE appears to be incomplete.

Language features added to 1980 published version:
  * floptran iv
    * PRINT "X" for single chars
    * REM statement adds one NOP for every non-blank char after REM in source
    * END token produces RTS instruction (same as original RETURN token)
  * floptran iv+
    * Added default numeric values to compiler prompts
      * 16384/$4000 for code (useful on 32K machines)
      * 826/$033A for variables (second cassette buffer)
      * 0/$0000 for loading offset (to POKE binaries to hi-mem to later move down to 1039/$040F)
    * Integrated floptran dloader after compilation (CONT to load after compile)
    * POKE with constant or numeric variable arguments
    * PRINT of floating point variables refactored to use more in-ROM routines
    * PRINT supports more formats than just floating point variable output
      * PRINT A (original implementation of PRINT)
      * PRINT "X" (single character)
      * PRINT "XYZ" (multiple characters) *NEW*
      * PRINT A; (trailing semi-colon/comma: do not print CR at the end) *NEW*
      * PRINT TAB(A) (move printing position right to column A) *NEW*
      * PRINT SPC(A) (move printing position right by A chars) *NEW*
      * PRINT CHR$(A) (print character value 'A') *NEW*
    * REM now adds one NOP ($EA) for each '-' and accepts hex digit pairs to emit raw bytes. Other chars are ignored *NEW*
  * floptran dloader
    * read SEQ files from disk
    * filter LF out of disk-based SEQ files (pre-BASIC4.0 file format)
    * ask for optional memory offset to not let low-RAM programs clobber loader

