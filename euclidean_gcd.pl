gcd(A, 0, A).

gcd(A, B, OUT):-
	B > 0,
	M is mod(A, B),
	gcd(B, M, OUT).

