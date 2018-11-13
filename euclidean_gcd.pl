gcd(A, 0, A).

gcd(A, B, OUT):-
	B > 0,
	M is mod(A, B),
	gcd(B, M, OUT).

array_gcd(L, GCD):-
	length(L, LEN),
	LEN =:= 2,
	[A|B] = L,
	gcd(A, B, GCD).

array_gcd(L, GCD):-
	[L0,L1|T] = L,
	gcd(L0, L1, G0),
	PARTIAL = [G0|T],
	array_gcd(PARTIAL, GCD).

