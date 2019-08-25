%%%-------------------------------------------------------------------
%% @doc todo_list public API
%% @end
%%%-------------------------------------------------------------------

-module(todo_list_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    todo_list_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
