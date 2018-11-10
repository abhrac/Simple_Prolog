fibonacci(1, 1).
fibonacci(2, 1).

fibonacci(X, Y):-
	X > 0,
	X1 is X - 1,
	X2 is X - 2,
	fibonacci(X1, Y1),
	fibonacci(X2, Y2),
	Y is Y1 + Y2.

fibonacci_sum(1, 1).

fibonacci_sum(X, Y):-
	X > 0,
	fibonacci(X, Y_fib),
	X1 is X - 1,
	fibonacci_sum(X1, Y1),
	Y is Y1 + Y_fib.

