
(define (problem flow_5_5) (:domain flow_free)
(:objects 
    red
	green
	blue
	yellow
	orange - color
    p_0_0
	p_0_1
	p_0_2
	p_0_3
	p_0_4
	p_1_0
	p_1_1
	p_1_2
	p_1_3
	p_1_4
	p_2_0
	p_2_1
	p_2_2
	p_2_3
	p_2_4
	p_3_0
	p_3_1
	p_3_2
	p_3_3
	p_3_4
	p_4_0
	p_4_1
	p_4_2
	p_4_3
	p_4_4 - location
)

(:init
    (offboard)
    (empty p_0_0)
	(empty p_0_1)
	(empty p_0_2)
	(empty p_0_3)
	(empty p_0_4)
	(empty p_1_0)
	(empty p_1_1)
	(empty p_1_2)
	(empty p_1_3)
	(empty p_1_4)
	(empty p_2_0)
	(empty p_2_1)
	(empty p_2_2)
	(empty p_2_3)
	(empty p_2_4)
	(empty p_3_0)
	(empty p_3_1)
	(empty p_3_2)
	(empty p_3_3)
	(empty p_3_4)
	(empty p_4_0)
	(empty p_4_1)
	(empty p_4_2)
	(empty p_4_3)
	(empty p_4_4)
    (adjacent p_0_0 p_1_0)
	(adjacent p_0_0 p_0_1)
	(adjacent p_0_1 p_1_1)
	(adjacent p_0_1 p_0_2)
	(adjacent p_0_1 p_0_0)
	(adjacent p_0_2 p_1_2)
	(adjacent p_0_2 p_0_3)
	(adjacent p_0_2 p_0_1)
	(adjacent p_0_3 p_1_3)
	(adjacent p_0_3 p_0_4)
	(adjacent p_0_3 p_0_2)
	(adjacent p_0_4 p_1_4)
	(adjacent p_0_4 p_0_3)
	(adjacent p_1_0 p_2_0)
	(adjacent p_1_0 p_1_1)
	(adjacent p_1_0 p_0_0)
	(adjacent p_1_1 p_2_1)
	(adjacent p_1_1 p_1_2)
	(adjacent p_1_1 p_0_1)
	(adjacent p_1_1 p_1_0)
	(adjacent p_1_2 p_2_2)
	(adjacent p_1_2 p_1_3)
	(adjacent p_1_2 p_0_2)
	(adjacent p_1_2 p_1_1)
	(adjacent p_1_3 p_2_3)
	(adjacent p_1_3 p_1_4)
	(adjacent p_1_3 p_0_3)
	(adjacent p_1_3 p_1_2)
	(adjacent p_1_4 p_2_4)
	(adjacent p_1_4 p_0_4)
	(adjacent p_1_4 p_1_3)
	(adjacent p_2_0 p_3_0)
	(adjacent p_2_0 p_2_1)
	(adjacent p_2_0 p_1_0)
	(adjacent p_2_1 p_3_1)
	(adjacent p_2_1 p_2_2)
	(adjacent p_2_1 p_1_1)
	(adjacent p_2_1 p_2_0)
	(adjacent p_2_2 p_3_2)
	(adjacent p_2_2 p_2_3)
	(adjacent p_2_2 p_1_2)
	(adjacent p_2_2 p_2_1)
	(adjacent p_2_3 p_3_3)
	(adjacent p_2_3 p_2_4)
	(adjacent p_2_3 p_1_3)
	(adjacent p_2_3 p_2_2)
	(adjacent p_2_4 p_3_4)
	(adjacent p_2_4 p_1_4)
	(adjacent p_2_4 p_2_3)
	(adjacent p_3_0 p_4_0)
	(adjacent p_3_0 p_3_1)
	(adjacent p_3_0 p_2_0)
	(adjacent p_3_1 p_4_1)
	(adjacent p_3_1 p_3_2)
	(adjacent p_3_1 p_2_1)
	(adjacent p_3_1 p_3_0)
	(adjacent p_3_2 p_4_2)
	(adjacent p_3_2 p_3_3)
	(adjacent p_3_2 p_2_2)
	(adjacent p_3_2 p_3_1)
	(adjacent p_3_3 p_4_3)
	(adjacent p_3_3 p_3_4)
	(adjacent p_3_3 p_2_3)
	(adjacent p_3_3 p_3_2)
	(adjacent p_3_4 p_4_4)
	(adjacent p_3_4 p_2_4)
	(adjacent p_3_4 p_3_3)
	(adjacent p_4_0 p_4_1)
	(adjacent p_4_0 p_3_0)
	(adjacent p_4_1 p_4_2)
	(adjacent p_4_1 p_3_1)
	(adjacent p_4_1 p_4_0)
	(adjacent p_4_2 p_4_3)
	(adjacent p_4_2 p_3_2)
	(adjacent p_4_2 p_4_1)
	(adjacent p_4_3 p_4_4)
	(adjacent p_4_3 p_3_3)
	(adjacent p_4_3 p_4_2)
	(adjacent p_4_4 p_3_4)
	(adjacent p_4_4 p_4_3)
    (flow-end p_0_0 red)
	(flow-end p_1_4 red)
	(flow-end p_1_3 green)
	(flow-end p_2_0 green)
	(flow-end p_2_1 blue)
	(flow-end p_2_4 blue)
	(flow-end p_3_3 yellow)
	(flow-end p_4_0 yellow)
	(flow-end p_3_4 orange)
	(flow-end p_4_1 orange)
)

(:goal (and
    (forall (?c - color) (flow-complete ?c))
    (forall (?l - location) (not-empty ?l))
))

)