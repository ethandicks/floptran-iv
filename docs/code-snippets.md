# Code Snippets

Examples of what Floptran code translates to 6502 machine code

## LET
The Floptran compiler uses the BASIC formula evaluator to convert whatever expression into a simple floating-point value which is copied into the output stream as a constant.  A simple loop copies the constant into a pre-determined variable slot (in order of declaration in the Floptran source).

```
10 LET A=0

4000  18          CLC
4001  90 05       BCC $4008
4003  00          .BYTE 0,0,0,0,0
4008  A2 04       LDX #$04
400A  BD 03 40    LDA $4003,X
400D  9D 3A 03    STA $033A,X
4010  CA          DEX
4011  10 F7       BPL $400A

```

## Assignment
To copy one variable to another it's just a quick copy look from one fixed place in the variable list to another (position determined by order of declaration in the Floptran source)

```
10 A=B

4000  A2 04       LDX #$04
4002  BD 3F 03    LDA $033F,X
4005  9D 44 03    STA $0344,X
4008  CA          DEX
4009  10 F7       BPL $4002
```

## Monadic operator

```
10 A=-B
20 A=RND(B)
30 A=SIN(B)

```

## Binary operator

```
10 A=B+C

```

## GOTO
Implemented in the original version, GOTO just uses a 6502 JMP instruction to jump to the address of the compiled line of target code (tracked via an array populated by the compiler and poked over top of the code during the second pass).
```
10 GOTO 100

4000  4C 3E 40    JMP $403E
```

## GOSUB
Implemented in the original version, GOSUB is implemented like GOTO except it uses the 6502 JSR instruction to work with the RETURN/RTS at the end of the subroutine to resume at the next Floptran instruction.
```
10 GOSUB 100

4000  20 3E 40    JSR $403E
```

## Simple IF
The original IF implementation allowed just for the checking of a variable against non-zero and either jumping to a new line (GOTO) or calling a subroutine (GOSUB).  The addition of NOT was a simple variation to invert the sense of the test and branch on zero, though the source expression does not behave the same way as CBM BASIC (which uses -1 as 'true' and all other values as 'false')
```
10 IF A GOTO 20

4000  AD 3A 03    LDA $033A   ; Get first byte of variable A
4003  F0 03       BEQ $4008   ; BNE for "IF NOT"
4005  4C 0D 40    JMP $400D
4008

```

## IF equal

```
10 IF A=B GOTO 20

4000  A0 03       LDY #$03   ; Get address of variable B in A/Y
4002  A9 3F       LDA #$3F
4004  20 AE DA    JSR $DAAE  ; MOVFM - copy value to primary FAC
4007  A0 03       LDY #$03   ; Get address of variable A in A/Y
4009  A9 3A       LDA #$3A
400B  20 33 D7    JSR $D733  ; FSUB - move A to secondary FAC and subtract
400E  A5 5E       LDA $5E    ; Check first byte of result
4010  D0 03       BNE $4015  ; BEQ for "IF NOT ="
4012  4C 16 40    JMP $4016
4015
```

## IF with comparison
In the original BYTE article, there was a technique provided for comparing two variables by taking the sign of the difference and adding one, but it meant that you were required to stuff a "1" in a variable and there was extra shuffling of intermediate values between the steps.  It was an early enhancement to encapsulate that method into a single source expression and to save the extra variable by pointing to a value of '1' in floating-point format already in ROM in all version of BASIC (labeled "FONE")
```
10 IF A < B GOTO 20

4000  A0 03       LDY #$03   ; Get address of variable A in A/Y
4002  A9 3A       LDA #$3A
4004  20 AE DA    JSR $DAAE  ; MOVFM - copy value to primary FAC
4007  A0 03       LDY #$03   ; Get address of variable B in A/Y
4009  A9 3F       LDA #$3F
400B  20 33 D7    JSR $D733  ; FSUB - move B to secondary FAC and subtract
400E  20 45 DB    JSR $DB45  ; SGN - take sign of primary FAC
4011  A0 D8       LDY #$D8   ; Get address of FONE in A/Y
4013  A9 C8       LDA #$C8
4015  20 33 D7    JSR $D733  ; FSUB - move value of 1.0 to secondary FAC and subtract
4018  A5 5E       LDA $5E    ; Check first byte of result
401A  D0 03       BNE $401F  ;
401C  4C 20 40    JMP $4020
401F
```

## POKE
Added in the expanded version of Floptran, POKE is useful on PETs for changing to lower case and for implementing CB2 music and sound effects, and on later machines for changing screen and border colors.  For code efficiency, the compiler logic for POKE looks for constants or variables in either address or value arguments to choose one of four different blocks of code.

```
10 POKE 59468,12

4000  A9 0C       LDA #$0C   ; Constant value stored in constant address
4002  8D 4C E8    STA $E84C
```

```
10 POKE A,B

4000  A0 03       LDY #$03    ; Get address of variable B in A/Y
4002  A9 3F       LDA #$3F
4004  20 AE DA    JSR $DAAE   ; MOVFM - copy value to primary FAC
4007  20 D2 D6    JSR $D6D2   ; GETADR - convert FAC to integer
400a  A5 62       LDA $62     ; Get low byte of integer result
400c  85 0F       STA $0F     ; Save in temp location
400e  A0 03       LDY #$03    ; Get address of variable A in A/Y
4010  A9 3A       LDA #$3A
4012  20 AE DA    JSR $DAAE   ; MOVFM - copy value to primary FAC
4015  20 D2 D6    JSR $D6D2   ; GETADR - convert FAC to integer
4018  A5 61       LDA $61     ; Get high byte of integer result
401a  85 63       STA $63     ; Put it after low byte to make a pointer
401c  A5 0F       LDA $0F     ; Grab POKE value from temp location
401e  A0 00       LDY #$00    ; Zero offset
4020  91 62       STA ($62),Y ; Use variable POKE address as pointer
```

```
10 POKE 32768,A

4000  A0 03       LDY #$03   ; Get address of variable A in A/Y
4002  A9 3A       LDA #$3A
4004  20 AE DA    JSR $DAAE  ; MOVFM - copy value to primary FAC
4007  20 D2 D6    JSR $D6D2  ; GETADR - convert FAC to integer
400a  A5 62       LDA $62    ; Get low byte of integer result
400c  8D 00 80    STA $8000  ; Store value to constant location
```

```
10 POKE A, 170

4000  A0 03       LDY #$03    ; Get address of variable A in A/Y
4002  A9 3A       LDA #$3A
4004  20 AE DA    JSR $DAAE   ; MOVFM - copy value to primary FAC
4007  20 D2 D6    JSR $D6D2   ; GETADR - convert FAC to integer
400A  A5 61       LDA $61     ; Get high byte of integer result
400C  85 63       STA $63     ; Put it after low byte to make a pointer
400E  A9 AA       LDA #$AA    ; Get constant value to store
4010  A0 00       LDY #$00    ; Zero offset
4012  91 62       STA ($62),Y ; Use variable POKE address as pointer
```

## END
The original Floptran compiler didn't offer END.  Jumping to the BASIC Warm Start vector seemed to be the obvious way to implement this.

```
10 END

4000  4C xx xx    JMP $xxxx
```

## STOP
The original Floptran compiler didn't offer STOP.  Executing a BRK instruction (which will jump into the Machine Language monitor on those machines that have one in ROM or loaded into RAM) was the obvious result.

```
10 STOP

4000  00          BRK
```

## RETURN
The original Floptran compiler offered RETURN to both return from a subroutine and to exit the program back to BASIC.  It's just a simple 6502 RTS.

```
10 RETURN

4000  60          RTS
```

## REM (original use)
The original use of REM in Floptran was just like BASIC - adding comments.  No output bytes were generated

```
10 REM this is a remark and nothing more

4000

```

## REM (NOP injector)

## REM (hex byte injector)


