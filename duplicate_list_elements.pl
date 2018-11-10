duplicate([], []).

duplicate(LIST, OUT):-
	[H|T] = LIST,
	duplicate(T, D_T),
	D_H = [H|[H]],
	append(D_H, D_T, OUT).

