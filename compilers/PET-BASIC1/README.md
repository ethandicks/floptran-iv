# FLOPTRAN IV for BASIC1 PET with Cassette Drive

This is Mark Zimmerman's original version from "FLOPTRAN-IV: A Tiny Compiler," BYTE, October 1980, page 196 et al, written to use Tape #1 as the compiled program save/load device.
i

Two things to keep in mind about just changing the OPEN statement to point to a disk drive: first, the original ROMs have a bug related to LOAD and SAVE with IEEE-488 storage devices, and second, prior to BASIC 4.0, sequential files on disk use CRLF as a default record separator not CR-only as tape files do.  The added LF will confuse the INPUT#1,A in the published loader program.  This can be worked around by either changing all the PRINT#1 statements in the compiler to not emit a LF, or by modifying the input statements on the loader.

As described in the Byte article, you load the bare floptran iv program from tape, prepend your code to be compiled (with line numbers under 256) then RUN 50000 and answer the prompts.  After successful compilation, load floptran loader, position your tape from the compilation step, then RUN and answer the prompt to choose the memory address to load the data file into.  Start the program with SYS nnnnnn, where nnnnnn is the address you provided to the loader program.  Without a machine language monitor in ROM it will be difficult to reloate the program to $040F, the common start address for machine language programs intended to be started with the 10 SYS(1039) BASIC shim.  The usual pattern on a BASIC1 machine is to load your code above 1280 ($0500) with the loader program, then run your compiled progam there.
