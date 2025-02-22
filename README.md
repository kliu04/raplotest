# raplotest

Automatically convert REPL outputs to unit tests with rackunit.

Notes: 

TODO: think of some way to remove this...

In the caller, must include this line somewhere, otherwise your definitions won't be available.
`(current-namespace (variable-reference->namespace (#%variable-reference)))`

Start the custom REPL with `start-repl` followed by the path to write to, e.g.,
`(start-repl "/Users/wevie/Documents/test/out.rkt")`

Enter `!` in the custom REPL to create a new unit test from the last statement. 

TODO: probably want make sure last command doesn't error...

TODO: make up/down arrow work in REPL.

TODO: output is always a symbol