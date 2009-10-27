% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (identity_handler).
-export ([
	behaviour_info/1, get_user/0, set_user/1, clear/0
]).



% get_user(State) -> User.
% Retrieve an Erlang term representing the current user.
get_user() ->
	_User = wf_handler:call_readonly(user_handler, get_user).
	
% set_user(User, State) -> {ok, NewState}.
% Set an Erlang term representing the current user.
set_user(User) ->
	ok = wf_handler:call(user_handler, set_user, [User]).
	
% clear(State) -> {ok, NewState}.
% Set the user to undefined.
clear() ->
	ok = wf_handler:call(user_handler, clear).



behaviour_info(callbacks) -> [
	{init, 1},      
	{finish, 1},
	{get_user, 1},	
	{set_user, 2},
	{clear, 1}	
];
behaviour_info(_) -> undefined.