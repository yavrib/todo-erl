-module(todo).
-export([start_link/0]).
-export([list/1]).

start_link() ->
  {ok, self()}.

find_next_index(List) ->
  case List of
    [] -> 0;
    _ -> maps:get(id, lists:last(List)) + 1
  end.

list(Operation) ->
  case Operation of
    {create_list} -> [];
    {add_item, List, Item} ->
      lists:append(List, [
        #{id => find_next_index(List), value => Item, status => not_done}
      ]);
    {remove_item, List, Id} ->
      Fun = fun(Elem) -> Id =/= Elem end,
      lists:filter(Fun, List);
    {toggle_status, List, Id} ->
      Fun = fun(Map, ItemId) ->
        case maps:get(id, Map) of
          CurrentId when CurrentId == ItemId ->
            CurrentStatus = maps:get(status, Map),
            case CurrentStatus of
              done -> maps:merge(Map, #{status => not_done});
              not_done -> maps:merge(Map, #{status => done})
            end;
          _ -> Map
        end
      end,
      [Fun(X, Id) || X <- List];
    {toggle_done, List} ->
      [maps:merge(X, #{status => done}) || X <- List];
    {toggle_undone, List} ->
      [maps:merge(X, #{status => not_done}) || X <- List]
  end.
