;;; aliasing helper procedures to their modern counterparts in Scheme
(define princ display)

(define read-from-keyboard read)


;;; Problem 2

(define (stop-at n)
  (lambda (own-hand opponent-up-card)
    (< (hand-total own-hand) n)))


;;; Problem 3
(define (test-strategy player-strategy house-strategy n)
  (cond ((= n 0) 0)
  (else (+ (twenty-one player-strategy house-strategy)
           (test-strategy player-strategy house-strategy (-1+ n)))))) 

;; Sample results
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 5)
; 
; ;Value: 3
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 10)
; 
; ;Value: 3
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 5)
; 
; ;Value: 3
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 10)
; 
; ;Value: 3
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 10)
; 
; ;Value: 5
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 10)
; 
; ;Value: 5
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 10)
; 
; ;Value: 7
; 
; 1 ]=> (test-strategy (stop-at 16) (stop-at 15) 10)
; 
; ;Value: 6


;;; Problem 4

(define (watch-player strategy)
  (lambda (own-hand opponent-up-card)
    (display "Opponent up card ")
    (display opponent-up-card)
    (newline)
    (display "Your total: ")
    (display (hand-total own-hand))
    (newline)
    (let ((hit-me (strategy own-hand opponent-up-card)))
      (cond (hit-me (display "HIT"))
	    (else (display "STAY")))
      (newline))
    (strategy own-hand opponent-up-card)))

;; Sample results
; 1 ]=> (test-strategy (watch-player (stop-at 16)) (watch-player (stop-at 15)) 2)
; Opponent up card 3
; Your total: 2
; HIT
; Opponent up card 3
; Your total: 3
; HIT
; Opponent up card 3
; Your total: 5
; HIT
; Opponent up card 3
; Your total: 10
; HIT
; Opponent up card 3
; Your total: 20
; STAY
; Opponent up card 2
; Your total: 3
; HIT
; Opponent up card 2
; Your total: 11
; HIT
; Opponent up card 2
; Your total: 19
; STAY
; Opponent up card 1
; Your total: 1
; HIT
; Opponent up card 1
; Your total: 2
; HIT
; Opponent up card 1
; Your total: 12
; HIT
; Opponent up card 1
; Your total: 21
; STAY
; Opponent up card 1
; Your total: 1
; HIT
; Opponent up card 1
; Your total: 8
; HIT
; Opponent up card 1
; Your total: 14
; HIT
; Opponent up card 1
; Your total: 16
; STAY
;Value: 2

;;; Problem 5

(define (louis own-hand opponent-up-card)
  (let ((own-total (hand-total own-hand)))
    (cond ((< own-total 12) #t)
	  ((> own-total 16) #f)
	  ((= own-total 12) (< opponent-up-card 4))
	  ((= own-total 16) (not (= opponent-up-card 10)))
	  (else (> opponent-up-card 6)))))

;; Sample results
; ;Loading "ps2tw1.scm"... done
; ;Loading "ps2_ans.scm"... done
; 
; 1 ]=> (test-strategy louis (stop-at 15) 10)
; 
; ;Value: 4
; 
; 1 ]=> (test-strategy louis (stop-at 16) 10)
; 
; ;Value: 3
; 
; 1 ]=> (test-strategy louis (stop-at 17) 10)
; 
; ;Value: 3


;;; Problem 6

(define (both strategy1 strategy2)
  (lambda (own-hand opponent-up-card)
    (and (strategy1 own-hand opponent-up-card)
	 (strategy2 own-hand opponent-up-card))))

;; Sample results
;Loading "ps2tw1.scm"... done
;Loading "ps2_ans.scm"... done

; 1 ]=> (twenty-one (both (stop-at 12) hit?) (watch-player (stop-at 15)))
; 
; Opponent up card 1
; Your Total: 3
; Hit? y
; Opponent up card 3
; Your total: 1
; HIT
; Opponent up card 3
; Your total: 2
; HIT
; Opponent up card 3
; Your total: 4
; HIT
; Opponent up card 3
; Your total: 12
; HIT
; Opponent up card 3
; Your total: 18
; STAY
; ;Value: 0
; 
; 1 ]=> (twenty-one (both (stop-at 12) hit?) (watch-player (stop-at 15)))
; 
; Opponent up card 5
; Your Total: 3
; Hit? y
; 
; Opponent up card 5
; Your Total: 11
; Hit? y
; Opponent up card 3
; Your total: 5
; HIT
; Opponent up card 3
; Your total: 11
; HIT
; Opponent up card 3
; Your total: 20
; STAY
; ;Value: 0
; 
; 1 ]=> (twenty-one (both (stop-at 12) hit?) (watch-player (stop-at 15)))
; 
; Opponent up card 3
; Your Total: 7
; Hit? y
; Opponent up card 7
; Your total: 3
; HIT
; Opponent up card 7
; Your total: 13
; HIT
; Opponent up card 7
; Your total: 19
; STAY
; ;Value: 0
; 
; 1 ]=> (twenty-one (both (stop-at 20) hit?) (watch-player (stop-at 15)))
; 
; Opponent up card 2
; Your Total: 10
; Hit? y
; 
; Opponent up card 2
; Your Total: 18
; Hit? n
; Opponent up card 10
; Your total: 2
; HIT
; Opponent up card 10
; Your total: 3
; HIT
; Opponent up card 10
; Your total: 8
; HIT
; Opponent up card 10
; Your total: 17
; STAY
;Value: 1
