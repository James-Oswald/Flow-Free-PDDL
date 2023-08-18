
(define (problem flow_8_8) (:domain flow_free)
(:objects 
    orange
	yellow
	blue
	green
	red - color
    p_0_0
	p_0_1
	p_0_2
	p_0_3
	p_0_4
	p_0_5
	p_0_6
	p_0_7
	p_1_0
	p_1_1
	p_1_2
	p_1_3
	p_1_4
	p_1_5
	p_1_6
	p_1_7
	p_2_0
	p_2_1
	p_2_2
	p_2_3
	p_2_4
	p_2_5
	p_2_6
	p_2_7
	p_3_0
	p_3_1
	p_3_2
	p_3_3
	p_3_4
	p_3_5
	p_3_6
	p_3_7
	p_4_0
	p_4_1
	p_4_2
	p_4_3
	p_4_4
	p_4_5
	p_4_6
	p_4_7
	p_5_0
	p_5_1
	p_5_2
	p_5_3
	p_5_4
	p_5_5
	p_5_6
	p_5_7
	p_6_0
	p_6_1
	p_6_2
	p_6_3
	p_6_4
	p_6_5
	p_6_6
	p_6_7
	p_7_0
	p_7_1
	p_7_2
	p_7_3
	p_7_4
	p_7_5
	p_7_6
	p_7_7 - location
)

(:init
    (offboard)
    (empty p_0_0)
	(empty p_0_1)
	(empty p_0_2)
	(empty p_0_3)
	(empty p_0_4)
	(empty p_0_5)
	(empty p_0_6)
	(empty p_0_7)
	(empty p_1_0)
	(empty p_1_1)
	(empty p_1_2)
	(empty p_1_3)
	(empty p_1_4)
	(empty p_1_5)
	(empty p_1_6)
	(empty p_1_7)
	(empty p_2_0)
	(empty p_2_1)
	(empty p_2_2)
	(empty p_2_3)
	(empty p_2_4)
	(empty p_2_5)
	(empty p_2_6)
	(empty p_2_7)
	(empty p_3_0)
	(empty p_3_1)
	(empty p_3_2)
	(empty p_3_3)
	(empty p_3_4)
	(empty p_3_5)
	(empty p_3_6)
	(empty p_3_7)
	(empty p_4_0)
	(empty p_4_1)
	(empty p_4_2)
	(empty p_4_3)
	(empty p_4_4)
	(empty p_4_5)
	(empty p_4_6)
	(empty p_4_7)
	(empty p_5_0)
	(empty p_5_1)
	(empty p_5_2)
	(empty p_5_3)
	(empty p_5_4)
	(empty p_5_5)
	(empty p_5_6)
	(empty p_5_7)
	(empty p_6_0)
	(empty p_6_1)
	(empty p_6_2)
	(empty p_6_3)
	(empty p_6_4)
	(empty p_6_5)
	(empty p_6_6)
	(empty p_6_7)
	(empty p_7_0)
	(empty p_7_1)
	(empty p_7_2)
	(empty p_7_3)
	(empty p_7_4)
	(empty p_7_5)
	(empty p_7_6)
	(empty p_7_7)
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
	(adjacent p_0_4 p_0_5)
	(adjacent p_0_4 p_0_3)
	(adjacent p_0_5 p_1_5)
	(adjacent p_0_5 p_0_6)
	(adjacent p_0_5 p_0_4)
	(adjacent p_0_6 p_1_6)
	(adjacent p_0_6 p_0_7)
	(adjacent p_0_6 p_0_5)
	(adjacent p_0_7 p_1_7)
	(adjacent p_0_7 p_0_6)
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
	(adjacent p_1_4 p_1_5)
	(adjacent p_1_4 p_0_4)
	(adjacent p_1_4 p_1_3)
	(adjacent p_1_5 p_2_5)
	(adjacent p_1_5 p_1_6)
	(adjacent p_1_5 p_0_5)
	(adjacent p_1_5 p_1_4)
	(adjacent p_1_6 p_2_6)
	(adjacent p_1_6 p_1_7)
	(adjacent p_1_6 p_0_6)
	(adjacent p_1_6 p_1_5)
	(adjacent p_1_7 p_2_7)
	(adjacent p_1_7 p_0_7)
	(adjacent p_1_7 p_1_6)
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
	(adjacent p_2_4 p_2_5)
	(adjacent p_2_4 p_1_4)
	(adjacent p_2_4 p_2_3)
	(adjacent p_2_5 p_3_5)
	(adjacent p_2_5 p_2_6)
	(adjacent p_2_5 p_1_5)
	(adjacent p_2_5 p_2_4)
	(adjacent p_2_6 p_3_6)
	(adjacent p_2_6 p_2_7)
	(adjacent p_2_6 p_1_6)
	(adjacent p_2_6 p_2_5)
	(adjacent p_2_7 p_3_7)
	(adjacent p_2_7 p_1_7)
	(adjacent p_2_7 p_2_6)
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
	(adjacent p_3_4 p_3_5)
	(adjacent p_3_4 p_2_4)
	(adjacent p_3_4 p_3_3)
	(adjacent p_3_5 p_4_5)
	(adjacent p_3_5 p_3_6)
	(adjacent p_3_5 p_2_5)
	(adjacent p_3_5 p_3_4)
	(adjacent p_3_6 p_4_6)
	(adjacent p_3_6 p_3_7)
	(adjacent p_3_6 p_2_6)
	(adjacent p_3_6 p_3_5)
	(adjacent p_3_7 p_4_7)
	(adjacent p_3_7 p_2_7)
	(adjacent p_3_7 p_3_6)
	(adjacent p_4_0 p_5_0)
	(adjacent p_4_0 p_4_1)
	(adjacent p_4_0 p_3_0)
	(adjacent p_4_1 p_5_1)
	(adjacent p_4_1 p_4_2)
	(adjacent p_4_1 p_3_1)
	(adjacent p_4_1 p_4_0)
	(adjacent p_4_2 p_5_2)
	(adjacent p_4_2 p_4_3)
	(adjacent p_4_2 p_3_2)
	(adjacent p_4_2 p_4_1)
	(adjacent p_4_3 p_5_3)
	(adjacent p_4_3 p_4_4)
	(adjacent p_4_3 p_3_3)
	(adjacent p_4_3 p_4_2)
	(adjacent p_4_4 p_5_4)
	(adjacent p_4_4 p_4_5)
	(adjacent p_4_4 p_3_4)
	(adjacent p_4_4 p_4_3)
	(adjacent p_4_5 p_5_5)
	(adjacent p_4_5 p_4_6)
	(adjacent p_4_5 p_3_5)
	(adjacent p_4_5 p_4_4)
	(adjacent p_4_6 p_5_6)
	(adjacent p_4_6 p_4_7)
	(adjacent p_4_6 p_3_6)
	(adjacent p_4_6 p_4_5)
	(adjacent p_4_7 p_5_7)
	(adjacent p_4_7 p_3_7)
	(adjacent p_4_7 p_4_6)
	(adjacent p_5_0 p_6_0)
	(adjacent p_5_0 p_5_1)
	(adjacent p_5_0 p_4_0)
	(adjacent p_5_1 p_6_1)
	(adjacent p_5_1 p_5_2)
	(adjacent p_5_1 p_4_1)
	(adjacent p_5_1 p_5_0)
	(adjacent p_5_2 p_6_2)
	(adjacent p_5_2 p_5_3)
	(adjacent p_5_2 p_4_2)
	(adjacent p_5_2 p_5_1)
	(adjacent p_5_3 p_6_3)
	(adjacent p_5_3 p_5_4)
	(adjacent p_5_3 p_4_3)
	(adjacent p_5_3 p_5_2)
	(adjacent p_5_4 p_6_4)
	(adjacent p_5_4 p_5_5)
	(adjacent p_5_4 p_4_4)
	(adjacent p_5_4 p_5_3)
	(adjacent p_5_5 p_6_5)
	(adjacent p_5_5 p_5_6)
	(adjacent p_5_5 p_4_5)
	(adjacent p_5_5 p_5_4)
	(adjacent p_5_6 p_6_6)
	(adjacent p_5_6 p_5_7)
	(adjacent p_5_6 p_4_6)
	(adjacent p_5_6 p_5_5)
	(adjacent p_5_7 p_6_7)
	(adjacent p_5_7 p_4_7)
	(adjacent p_5_7 p_5_6)
	(adjacent p_6_0 p_7_0)
	(adjacent p_6_0 p_6_1)
	(adjacent p_6_0 p_5_0)
	(adjacent p_6_1 p_7_1)
	(adjacent p_6_1 p_6_2)
	(adjacent p_6_1 p_5_1)
	(adjacent p_6_1 p_6_0)
	(adjacent p_6_2 p_7_2)
	(adjacent p_6_2 p_6_3)
	(adjacent p_6_2 p_5_2)
	(adjacent p_6_2 p_6_1)
	(adjacent p_6_3 p_7_3)
	(adjacent p_6_3 p_6_4)
	(adjacent p_6_3 p_5_3)
	(adjacent p_6_3 p_6_2)
	(adjacent p_6_4 p_7_4)
	(adjacent p_6_4 p_6_5)
	(adjacent p_6_4 p_5_4)
	(adjacent p_6_4 p_6_3)
	(adjacent p_6_5 p_7_5)
	(adjacent p_6_5 p_6_6)
	(adjacent p_6_5 p_5_5)
	(adjacent p_6_5 p_6_4)
	(adjacent p_6_6 p_7_6)
	(adjacent p_6_6 p_6_7)
	(adjacent p_6_6 p_5_6)
	(adjacent p_6_6 p_6_5)
	(adjacent p_6_7 p_7_7)
	(adjacent p_6_7 p_5_7)
	(adjacent p_6_7 p_6_6)
	(adjacent p_7_0 p_7_1)
	(adjacent p_7_0 p_6_0)
	(adjacent p_7_1 p_7_2)
	(adjacent p_7_1 p_6_1)
	(adjacent p_7_1 p_7_0)
	(adjacent p_7_2 p_7_3)
	(adjacent p_7_2 p_6_2)
	(adjacent p_7_2 p_7_1)
	(adjacent p_7_3 p_7_4)
	(adjacent p_7_3 p_6_3)
	(adjacent p_7_3 p_7_2)
	(adjacent p_7_4 p_7_5)
	(adjacent p_7_4 p_6_4)
	(adjacent p_7_4 p_7_3)
	(adjacent p_7_5 p_7_6)
	(adjacent p_7_5 p_6_5)
	(adjacent p_7_5 p_7_4)
	(adjacent p_7_6 p_7_7)
	(adjacent p_7_6 p_6_6)
	(adjacent p_7_6 p_7_5)
	(adjacent p_7_7 p_6_7)
	(adjacent p_7_7 p_7_6)
    (flow-end p_1_1 orange)
	(flow-end p_7_5 orange)
	(flow-end p_0_7 yellow)
	(flow-end p_3_4 yellow)
	(flow-end p_4_5 blue)
	(flow-end p_7_7 blue)
	(flow-end p_7_4 green)
	(flow-end p_7_6 green)
	(flow-end p_1_5 red)
	(flow-end p_5_3 red)
)

(:goal (and
    (forall (?c - color) (flow-complete ?c))
    (forall (?l - location) (not-empty ?l))
))

)