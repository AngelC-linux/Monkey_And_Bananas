(defrule MAIN::monkey
   (monkey en habitacion)
   (silla en habitacion)
   =>
   (printout t "Monkey va a la silla." crlf))


(defrule MAIN::la-silla
   ?q <- (monkey en habitacion)
   (silla en habitacion)
   =>
   (retract ?q)
   (assert (monkey en silla))
   (printout t "Monkey se sube a la silla." crlf))

(defrule MAIN::movimiento
   ?q <- (monkey en silla)
   (escritorio en habitacion)
   =>
   (retract ?q)
   (assert (monkey sobre escritorio))
   (assert (acercar silla))
   (printout t "Monkey sube desde la silla al escritorio. " crlf))

(defrule MAIN::escritorio-primero
   (monkey sobre escritorio)
   ?q <- (acercar silla)
   =>
   (retract ?q)
   (assert (silla sobre escritorio))
   (printout t "Monkey acerca y sube la silla al escitorio." crlf))

(defrule MAIN::monkey-baja-de-ahi
   ?q <- (monkey sobre escritorio)
   (silla sobre escritorio)
   =>
   (retract ?q)
   (assert (monkey sobre silla))
   (printout t "Monkey se sube a la silla que a su vez está en el escritorio." crlf))

(defrule MAIN::tomar-banana
   (silla sobre escritorio)
   (monkey sobre silla)
   =>
   (assert (banana))
   (printout t "Monkey alcanza a tomar la banana." crlf))

(defrule MAIN::comer
   (banana)
   =>
   (printout t "Monkey come la banana." crlf))
