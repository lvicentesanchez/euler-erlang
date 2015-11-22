-module(euler).
-export([problem1/1, problem2/1]).

% Problem 1 from Euler project
%
problem1(N) ->
    lists:sum([X || X <- lists:seq(1, N-1), (X rem 3 =:= 0) or (X rem 5 =:= 0)]).

% Problem 2 from Euler project
%
problem2(Lim) ->
    problem2(Lim, 1, 2, 0, fun(N) -> N rem 2 =:= 0 end).

problem2(Lim,  _, N1, Sum, _) when N1 >= Lim -> Sum;
problem2(Lim, N0, N1, Sum, F)                ->
    N2 = N0 + N1,
    case F(N1) of
        true  -> problem2(Lim, N1, N2, Sum+N1, F);
        false -> problem2(Lim, N1, N2, Sum   , F)
    end.

