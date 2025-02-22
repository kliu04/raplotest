# raplotest
=========
Automatically convert REPL outputs to unit tests with rackunit.

Notes: 

TODO: think of some way to remove this...
In the caller, must have this line somewhere, otherwise your definitions won't be available.
`(current-namespace (variable-reference->namespace (#%variable-reference)))`

Start the custom REPL with `start-repl` followed by the path to write to, e.g.,
`(start-repl "/Users/wevie/Documents/test/out.rkt")`
