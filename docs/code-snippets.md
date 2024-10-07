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

```
10 GOTO 100

4000  4C 3E 40    JMP $403E
```

## GOSUB

```
10 GOSUB 100

4000  20 3E 40    JSR $403E
```

## Simple IF

```
10 IF A GOTO 20

```

## IF equal

```
10 IF A=B GOTO 20


```

## IF with comparison

```
10 IF A < B GOTO 20


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


