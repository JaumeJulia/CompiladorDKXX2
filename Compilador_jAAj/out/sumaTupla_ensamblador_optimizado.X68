	org $1000
START:
	JSR SCREENSIZE
* -->[GOTO, null, null, run]
	JMP run
* -->[SKIP, null, null, run]
run:
* -->[ASIG, 3, null, t1]
	MOVE.W #3,t1
* -->[ASIG, true, null, t2]
	MOVE.B #-1,t2
* -->[ASIG, t1, null, tupla_0_0]
	MOVE.W t1,tupla_0_0
* -->[ASIG, t2, null, tupla_1_0]
	MOVE.B t2,tupla_1_0
* -->[ASIG, 3, null, a_0]
	MOVE.W #3,a_0
* -->[ASIG, true, null, b_0]
	MOVE.B #-1,b_0
* -->[OUT, a_0, null, null]
	MOVE.W a_0,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[OUT, tupla_0_0, null, null]
	MOVE.W tupla_0_0,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SUMA, 5, tupla_0_0, t6]
	MOVE.W #5,D0
	MOVE.W tupla_0_0,D1
	JSR ISUMA
	MOVE.W D1,t6
* -->[OUT, t6, null, null]
	MOVE.W t6,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
	SIMHALT
 
tupla_0: DS.B 1
	DC.W 0
t1: DS.W 1
t2: DS.B 1
	DC.W 0
tupla_0_0: DS.W 1
tupla_1_0: DS.B 1
	DC.W 0
a_0: DS.W 1
b_0: DS.B 1
	DC.W 0
t6: DS.W 1
	DC.W 0
 
SCREENSIZE:
	MOVE.L #1024*$10000+768,D1
	MOVE.B  #33,D0
	TRAP    #15
	RTS
ISUMA:
	BTST.L #15,D0
	BEQ ADD2
	NOT.W D0
	ADDQ.W #1,D0
	BTST.L #15,D1
	BEQ ADD1
	NOT.W D1
	ADDQ.W #1,D1
	ADD.W D0,D1
	NOT.W D1
	ADDQ.W #1,D1
	RTS
ADD1:
	SUB.W D0,D1
	RTS
ADD2:
	BTST.L #15,D1
	BEQ ADD3
	NOT.W D1
	ADDQ.W #1,D1
	SUB.W D1,D0
	MOVE.W  D0,D1
	RTS
ADD3:
	ADD.W D0,D1
	RTS
IRESTA:
	BTST.L #15,D1
	BEQ SUB2
	NOT.W D1
	ADDQ.W #1,D1
	BTST.L #15,D0
	BEQ SUB1
	NOT.W D0
	ADDQ.W #1,D0
	SUB.W D0,D1
	NOT.W D1
	ADDQ.W #1,D1
	RTS
SUB1:
	ADD.W D0,D1
	NOT.W D1
	ADDQ.W #1,D1
	RTS
SUB2:
	BTST.L #15,D0
	BEQ SUB3
	NOT.W D0
	ADDQ.W #1,D0
	ADD.W D0,D1
	RTS
SUB3:
	SUB.W D0,D1
	RTS
PRINTINT:
	MOVE.W 4(A7),D1
	EXT.L D1
	MOVE.L #3,D0
	TRAP #15
	MOVE.L #11,D0
	MOVE.W #$00FF,D1
	TRAP #15
	ADD.W #1,D1
	AND.W #$00FF,D1
	TRAP #15
	RTS
GETINT:
	MOVE.L #4,D0
	TRAP #15
	MOVE.W D1,4(A7)
	RTS
	END START
