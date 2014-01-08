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
-export([tricky0/0,tricky1/0,tricky2/0,tricky4/1]).

tricky0() ->
  3.

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
