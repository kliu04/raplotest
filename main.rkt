#lang racket/base
(require racket/file)

(provide start-repl)
  (define last-prompt #f)
  (define last-output #f)
;; must take in path to write to
;; TODO: make filepath a parameter?
(define (start-repl filepath)
  ;; previous repl io

  (parameterize ([current-prompt-read 
                  (λ ()
                    (print "raplotest> ")
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
                    (if (list? result)
                        (set! last-output `(quote ,result))
                        (set! last-output result))
                    (unless (void? result) 
                      (println result)))])
    (read-eval-print-loop)))

(define (write-test prompt output filepath)
  (define out (open-output-file filepath #:exists 'append))
  (writeln `(check-equal? ,prompt ,output) out)
  (close-output-port out))