-module(euler).
-export([problem1/1, problem2/1]).

% Problem 1 from Euler project
%
problem1(N) -> lists:sum([X || X <- lists:seq(1, N-1), (X rem 3 == 0) or (X rem 5 == 0)]).

% Problem 2 from Euler project
%
problem2(Limit) -> problem2(Limit, 1, 2, 0, fun(N) -> N rem 2 == 0 end).

problem2(Limit,  _, N1, Sum, _) when N1 >= Limit-> Sum;
problem2(Limit, N0, N1, Sum, F) ->
  case F(N1) of
    true  -> problem2(Limit, N1, N0+N1, Sum+N1, F);
    false -> problem2(Limit, N1, N0+N1, Sum   , F)
  end.
