<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>CodeMirror: Erlang mode</title>
    <link rel="stylesheet" href="../CodeMirror/lib/codemirror.css">
    <script src="../CodeMirror/lib/codemirror.js"></script>
    <script src="../CodeMirror/addon/edit/matchbrackets.js"></script>
    <script src="../CodeMirror/mode/erlang/erlang.js"></script>
    <link rel="stylesheet" href="../CodeMirror/theme/erlang-dark.css">
    <style type="text/css">.CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black;}</style>
    <link rel="stylesheet" href="../CodeMirror/doc/docs.css">
  </head>
  <body>
    <h1>CodeMirror: Erlang mode</h1>

<form><textarea id="code" name="code">
%% -*- mode: erlang; erlang-indent-level: 2 -*-
%%% Created :  8 Jan 2014 by mats cronqvist <masse@klarna.com>

%% @doc
%% @end

-module('test_tricky').
-author('mats cronqvist').
-export([tricky0/0,tricky1/0,tricky2/0,tricky3/0,
         tricky3/1,tricky4/0,tricky4/1]).

tricky0() ->
  3+
    3.2+
    3.2e+2+
    3,
  erlang:now(a,
      1+2,
      1.0e-2
      ,123,
      12+
        2).

tricky1() ->
  catch tricky2().

tricky2() ->
  $(, aaaa, begin
    "begin",
    'begin'
    %begin
    %`begin'
           end,
  ok.

-type general_type() :: any()   %% The top type, the set of all Erlang terms
                      | none()  %% The bottom type, contains no terms
                      | pid()
                      | port()
                      | reference()
                      | []                    %% nil
                      | float()
                      | atom()
                      | <<>>
                      | <<_:M>>          %% M is a positive integer
                      | <<_:_*N>>        %% N is a positive integer
                      | <<_:M, _:_*N>>
                      | fun()                  %% any function
                      | fun((...) -> Type)     %% any arity, returning Type
                      | fun(() -> Type)
                      | fun((TList) -> Type)
                      | integer()
                      | list(Type)          %% Proper list ([]-terminated)
                      | improper_list(Type1, Type2)
                      | maybe_improper_list(Type1, Type2)
                      | nonempty_list(Type)  %% Proper non-empty list
                      | tuple()              %% stands for a tuple of any size
                      | {}
                      | {TList}
                      | term()
                      | binary()
                      | bitstring()
                      | boolean()
                      | byte()
                      | char()
                      | number()
                      | list()
                      | maybe_improper_list()
                      | nonempty_list()
                      | string()
                      | nonempty_string()
                      | iodata()
                      | iolist()
                      | module()
                      | mfa()
                      | arity()
                      | node()
                      | timeout()
                      | no_return().

-type my_fun_type() :: fun()                  %% any function
                     | fun((...) -> Type)     %% any arity, returning Type
                     | fun(() -> Type)
                     | fun((A) -> Type)
                     | fun((A, B) -> {A,B}).

-spec tricky3(list()) -> {general_type()}
           ; (tuple()) -> {my_fun_type()}.


tricky3() ->
  case now() of
    {signal, _What, _From, _To} ->
      true;
    {signal, _What, _To} ->
      true;
    _Else ->
      false
  end.

tricky3(T) ->
  ok, receive
      after
        T -> T
      end.

tricky4() -> ok.

tricky4(X) when is_integer(X) ->
  tricky4(case X of
            A -> tricky4(case X of
                           A -> A
                         end)
          end),
  ok;
tricky4(A) ->
    try A band (catch A)
    catch
        X -> X
    end.


</textarea></form>

    <script>
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        matchBrackets: true,
        extraKeys: {"Tab":  "indentAuto"},
        theme: "erlang-dark"
      });
    </script>

    <p><strong>MIME types defined:</strong> <code>text/x-erlang</code>.</p>
  </body>
</html>
