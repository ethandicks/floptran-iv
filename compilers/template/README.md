# Template

In this area is a template of the newest version of the floptran iv compiler with the constants for memory locations replaced with symbols.  This template is meant to be used with the Perl program to emit platform-specific versions of the compiler with all the memory references pointing to the correct plates.

Working from the PET BASIC3 compiler, the goal is to be able to generate runnable compilers for PET BASIC4, the VIC-20, and the Commodore 64, from one common template to allow bugfixes and feature enhancements to be available to all.  Because the input buffer for BASIC1 is in zero page, and because there are IEEE-488 bugs with talking to disk devices, it is a special case and not intended to be generated from this template.

As of May, 2024, it is still a work in progress.
