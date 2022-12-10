	org $1000
START:
	JSR SCREENSIZE
* -->[GOTO, null, null, run]
	JMP run
* -->[SKIP, null, null, factorial]
factorial:
* -->[PMB, null, null, factorial]
	MOVE.W 6(A7),num_1
* -->[MENORIGU, num_1, 1, e2]
	MOVE.W num_1,D1
	MOVE.W #1,D0
	CMP.W D0,D1
	BLE e2
* -->[SKIP, null, null, e1]
e1:
* -->[ASIG, -1, null, t2]
	MOVE.B #-1,t2
* -->[GOTO, null, null, e3]
	JMP e3
* -->[SKIP, null, null, e2]
e2:
* -->[ASIG, 0, null, t2]
	MOVE.B #0,t2
* -->[SKIP, null, null, e3]
e3:
* -->[MAYORIGU, num_1, 8, e5]
	MOVE.W num_1,D1
	MOVE.W #8,D0
	CMP.W D0,D1
	BGE e5
* -->[SKIP, null, null, e4]
e4:
* -->[ASIG, -1, null, t4]
	MOVE.B #-1,t4
* -->[GOTO, null, null, e6]
	JMP e6
* -->[SKIP, null, null, e5]
e5:
* -->[ASIG, 0, null, t4]
	MOVE.B #0,t4
* -->[SKIP, null, null, e6]
e6:
* -->[AND, t2, t4, e7]
	MOVE.B t2,D0
	MOVE.B t4,D1
	AND.B D0,D1
	BMI e7
* -->[GOTO, null, null, e8]
	JMP e8
* -->[SKIP, null, null, e7]
e7:
* -->[ASIG, -1, null, t5]
	MOVE.B #-1,t5
* -->[GOTO, null, null, e9]
	JMP e9
* -->[SKIP, null, null, e8]
e8:
* -->[ASIG, 0, null, t5]
	MOVE.B #0,t5
* -->[SKIP, null, null, e9]
e9:
* -->[NIGUALES, t5, -1, e11]
	MOVE.B t5,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e11
* -->[SKIP, null, null, e10]
e10:
* -->[ASIG, num_1, null, aux_1]
	MOVE.W num_1,aux_1
* -->[RESTA, num_1, 1, t7]
	MOVE.W num_1,D1
	MOVE.W #1,D0
	JSR IRESTA
	MOVE.W D1,t7
* -->[ASIG, t7, null, num_1]
	MOVE.W t7,num_1
* -->[SKIP, null, null, e12]
e12:
* -->[MENORIGU, num_1, 0, e14]
	MOVE.W num_1,D1
	MOVE.W #0,D0
	CMP.W D0,D1
	BLE e14
* -->[SKIP, null, null, e13]
e13:
* -->[ASIG, -1, null, t9]
	MOVE.B #-1,t9
* -->[GOTO, null, null, e15]
	JMP e15
* -->[SKIP, null, null, e14]
e14:
* -->[ASIG, 0, null, t9]
	MOVE.B #0,t9
* -->[SKIP, null, null, e15]
e15:
* -->[NIGUALES, t9, -1, e17]
	MOVE.B t9,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e17
* -->[SKIP, null, null, e16]
e16:
* -->[MULT, aux_1, num_1, t10]
	MOVE.W aux_1,D0
	EXT.L D0
	MOVE.W num_1,D1
	EXT.L D1
	MULS.W D0,D1
	MOVE.W D1,t10
* -->[ASIG, t10, null, aux_1]
	MOVE.W t10,aux_1
* -->[RESTA, num_1, 1, t12]
	MOVE.W num_1,D1
	MOVE.W #1,D0
	JSR IRESTA
	MOVE.W D1,t12
* -->[ASIG, t12, null, num_1]
	MOVE.W t12,num_1
* -->[GOTO, null, null, e12]
	JMP e12
* -->[SKIP, null, null, e17]
e17:
* -->[RTN, null, null, aux_1]
	MOVE.W aux_1,4(A7)
	RTS
* -->[SKIP, null, null, e11]
e11:
* -->[MAYORIGU, num_1, 0, e19]
	MOVE.W num_1,D1
	MOVE.W #0,D0
	CMP.W D0,D1
	BGE e19
* -->[SKIP, null, null, e18]
e18:
* -->[ASIG, -1, null, t14]
	MOVE.B #-1,t14
* -->[GOTO, null, null, e20]
	JMP e20
* -->[SKIP, null, null, e19]
e19:
* -->[ASIG, 0, null, t14]
	MOVE.B #0,t14
* -->[SKIP, null, null, e20]
e20:
* -->[MENORQUE, num_1, 8, e22]
	MOVE.W num_1,D1
	MOVE.W #8,D0
	CMP.W D0,D1
	BLT e22
* -->[SKIP, null, null, e21]
e21:
* -->[ASIG, -1, null, t16]
	MOVE.B #-1,t16
* -->[GOTO, null, null, e23]
	JMP e23
* -->[SKIP, null, null, e22]
e22:
* -->[ASIG, 0, null, t16]
	MOVE.B #0,t16
* -->[SKIP, null, null, e23]
e23:
* -->[OR, t14, t16, e24]
	MOVE.B t14,D0
	MOVE.B t16,D1
	OR.B D0,D1
	BMI e24
* -->[GOTO, null, null, e25]
	JMP e25
* -->[SKIP, null, null, e24]
e24:
* -->[ASIG, -1, null, t17]
	MOVE.B #-1,t17
* -->[GOTO, null, null, e26]
	JMP e26
* -->[SKIP, null, null, e25]
e25:
* -->[ASIG, 0, null, t17]
	MOVE.B #0,t17
* -->[SKIP, null, null, e26]
e26:
* -->[NIGUALES, t17, -1, e28]
	MOVE.B t17,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e28
* -->[SKIP, null, null, e27]
e27:
* -->[ASIG, -1, null, t18]
	MOVE.W #-1,t18
* -->[RTN, null, null, t18]
	MOVE.W t18,4(A7)
	RTS
* -->[SKIP, null, null, e28]
e28:
* -->[ASIG, 1, null, t19]
	MOVE.W #1,t19
* -->[RTN, null, null, t19]
	MOVE.W t19,4(A7)
	RTS
* -->[SKIP, null, null, run]
run:
* -->[IN, null, null, t20]
	SUBA.L #2,A7
	JSR GETINT
	MOVE.W (A7)+,t20
* -->[ASIG, t20, null, i_0]
	MOVE.W t20,i_0
* -->[PARAM, null, null, i_0]
	MOVE.W i_0,-(A7)
* -->[CALL, t21, null, factorial]
	SUBA.L #2,A7
	JSR factorial
	MOVE.W (A7)+,t21
	ADDA.L #2,A7
* -->[OUT, t21, null, null]
	MOVE.W t21,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
	SIMHALT
 
num_1: DS.W 1
t2: DS.B 1
t4: DS.B 1
t5: DS.B 1
	DC.W 0
aux_1: DS.W 1
t7: DS.W 1
t9: DS.B 1
	DC.W 0
t10: DS.W 1
t12: DS.W 1
t14: DS.B 1
t16: DS.B 1
t17: DS.B 1
	DC.W 0
t18: DS.W 1
t19: DS.W 1
i_0: DS.W 1
t20: DS.W 1
t21: DS.W 1
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
