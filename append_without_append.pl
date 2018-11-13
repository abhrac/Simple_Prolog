append_without_append(L1, L2, OUT):-
	length(L1, L),
	L =< 1,
	[H | _] = L1,
	OUT = [H | L2].

append_without_append(L1, L2, OUT):-
	[H | T] = L1,
	append_without_append(T, L2, PARTIAL),
	OUT = [H | PARTIAL].

