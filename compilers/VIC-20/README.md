# Heitronic Tiny BASIC Compiler for VIC-20

This version appears to be an extended version of the 1980 FLOPTRAN IV primarily aimed at the VIC-20 (but with a commented place to mod to cross-compile on the PET).  It emits the usual byte stream for readback by the included Object Loader, and can optionally print source listings to an attached printer (device #4).  Even though it's clearly derivative of Mark Zimmerman's work, Vic Compiler prints:

TINY BASIC COMPILER

BY HEITRONIC SOFTWARE


(C)1983    EINDHOVEN


CORDIS

Much like its ancestor, you load Vic Compiler and add your code to be compiled as line number below 256, then RUN 62000 and answer the prompts.  After successful compilation, load Object Loader, RUN and answer the prompts.  Unlike the PET version, this one jumps right to the start of the compiled program, so it's even more important to choose a program load address that won't get stepped on.

