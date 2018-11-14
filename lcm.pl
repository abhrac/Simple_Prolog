gcd(A, 0, A).

gcd(A, B, GCD):-
	B > 0,
	M is mod(A, B),
	gcd(B, M, GCD).

lcm(A, B, LCM):-
	gcd(A, B, GCD),
	LCM is ((A * B) // GCD).

array_lcm(LIST, LCM):-
	length(LIST, L),
	L =:= 2,
	[A | B] = LIST,
	lcm(A, B, LCM).

array_lcm(LIST, LCM):-
	length(LIST, L),
	L > 2,
	[L0, L1 | T] = LIST,
	lcm(L0, L1, LCM_HEAD),
	PARTIAL = [LCM_HEAD | T],
	array_lcm(PARTIAL, LCM).

