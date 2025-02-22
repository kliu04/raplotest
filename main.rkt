#lang racket/base
(require racket/file)

(provide start-repl)
;; must take in path to write to
;; TODO: make filepath a parameter?
(define (start-repl filepath)
  ;; previous repl io
  (define last-prompt #f)
  (define last-output #f)
  (parameterize ([current-prompt-read 
                  (λ ()
                    (display "raplotest> ")
                    (flush-output)
                    (define input (read))
                    (cond
                      ;; ignore eof
                      [(eof-object? input) input]
                      ;; TODO: possible for prompt/output to fall out of sync
                      [(eq? input '!) (write-test last-prompt last-output filepath)
                                       (void)] 
                      ;; TODO: take in more than 1 last command
                      [else (set! last-prompt input) input]))]
                
                 [current-print 
                  (λ (result)
                    (set! last-output result)
                    (unless (void? result) 
                      (writeln result)))])
    (read-eval-print-loop)))

(define (write-test prompt output filepath)
  (display-to-file (format "\n(check-equal? ~a ~a)\n" prompt output) filepath #:exists 'append))