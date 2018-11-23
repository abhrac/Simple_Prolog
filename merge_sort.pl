midpoint(L, OUT):-
	length(L, LEN),
	OUT is ((LEN // 2) - 1).

split_list(L, POS, MID, L1, L2):-
	POS =:= MID,
	[MID_EL | L2] = L,
	L1 = [MID_EL].

split_list(L, POS, MID, L1, L2):-
	POS \= MID,
	[H | T] = L,
	NEXT is (POS + 1),
	split_list(T, NEXT, MID, PARTIAL, L2),
	L1 = [H | PARTIAL].

split_list(L, L1, L2):-
	midpoint(L, MID),
	split_list(L, 0, MID, L1, L2).

slice_out(L, POS, OUT):-
	length(L, LEN),
	POS >= LEN,
	OUT = [].

slice_out(L, POS, OUT):-
	nth0(POS, L, H),
	NEXT is (POS + 1),
	slice_out(L, NEXT, PARTIAL),
	append([H], PARTIAL, OUT).

merge(L, R, L_POS, R_POS, PARTIAL, OUT):-
	length(L, L_LEN),
	length(R, R_LEN),
	L_LEN =:= L_POS
	->
		slice_out(R, R_POS, T_R),
		append(PARTIAL, T_R, OUT);
	length(R, R_LEN),
	R_LEN =:= R_POS
	->
		slice_out(L, L_POS, T_L),
		append(PARTIAL, T_L, OUT).

merge(L, R, L_POS, R_POS, PARTIAL, OUT):-
	nth0(L_POS, L, L_EL),
	nth0(R_POS, R, R_EL),
	R_EL >= L_EL
	->
		append(PARTIAL, [L_EL], L_SORTED),
		L_NEXT is (L_POS + 1),
		merge(L, R, L_NEXT, R_POS, L_SORTED, OUT);
	nth0(R_POS, R, R_EL),
	append(PARTIAL, [R_EL], R_SORTED),
	R_NEXT is (R_POS + 1),
	merge(L, R, L_POS, R_NEXT, R_SORTED, OUT).

merge_sort(L, OUT):-
	length(L, LEN),
	LEN =< 1,
	OUT = L.

merge_sort(L, OUT):-
	length(L, LEN),
	LEN > 1,
	split_list(L, LEFT, RIGHT),
	merge_sort(LEFT, L_SORT),
	merge_sort(RIGHT, R_SORT),
	merge(L_SORT, R_SORT, OUT).

