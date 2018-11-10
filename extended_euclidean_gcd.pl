eegcd(A, 0, M, N, U, V, A, X, Y):-
	X is M,
	Y is N.

eegcd(A, B, M, N, U, V, OUT, X, Y):-
	B > 0,
	R is mod(A, B),
	Q is A // B,
	X1 is M - (U * Q),
	Y1 is N - (V * Q),
	eegcd(B, R, U, V, X1, Y1, OUT, X2, Y2),
	X is X2,
	Y is Y2.

extended_euclidean_gcd(A, B, OUT, X, Y):-
	M is 1,
	N is 0,
	U is 0,
	V is 1,
	eegcd(A, B, M, N, U, V, OUT, X, Y).

