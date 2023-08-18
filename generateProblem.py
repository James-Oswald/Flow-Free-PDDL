

def problemGen(n : int, m : int, flows: dict[str, tuple[tuple[int, int], tuple[int, int]]]):
    points = []
    connections = []
    for i in range(n):
        for j in range(m):
            points.append(f"p_{i}_{j}")
            if i < n-1 : connections.append((f"p_{i}_{j}", f"p_{i+1}_{j}"))
            if j < m-1 : connections.append((f"p_{i}_{j}", f"p_{i}_{j+1}"))
            if i > 0 : connections.append((f"p_{i}_{j}", f"p_{i-1}_{j}"))
            if j > 0 : connections.append((f"p_{i}_{j}", f"p_{i}_{j-1}")) 
    
    colors = []
    colorLocs = []
    for color, ((x1,y1), (x2,y2)) in flows.items():
        assert not " " in color
        colors.append(color)
        assert 0 <= x1 < n and 0 <= y1 < m 
        colorLocs.append((color, f"p_{x1}_{y1}"))
        assert 0 <= x2 < n and 0 <= y2 < m 
        colorLocs.append((color, f"p_{x2}_{y2}"))

    nl = "\n\t"
    return f'''
(define (problem flow_{n}_{m}) (:domain flow_free)
(:objects 
    {nl.join(colors)} - color
    {nl.join(points)} - location
)

(:init
    (offboard)
    {nl.join(f"(empty {p})" for p in points)}
    {nl.join(f"(adjacent {x} {y})" for (x,y) in connections)}
    {nl.join(f"(flow-end {l} {c})" for (c, l) in colorLocs)}
)

(:goal (and
    ;(forall (?c - color) (flow-complete ?c))
    ;(forall (?l - location) (not-empty ?l))
    {nl.join(f"(flow-complete {c})" for c in colors)}
    {nl.join(f"(not-empty {p})" for p in points)}
))

)'''

def genProblemFile(n : int, m : int, flows: dict[str, tuple[tuple[int, int], tuple[int, int]]]):
    with open(f"flowproblem{n}x{m}.pddl", "w") as file:
        file.write(problemGen(n, m, flows))

#Some hand coded problems
if __name__ == "__main__":
    genProblemFile(3, 1, {
        "red": ((0,0), (2, 0))
    })
    
    genProblemFile(5, 5, {
        "red": ((0,0), (1, 4)),
        "green": ((1,3), (2, 0)),
        "blue": ((2, 1), (2, 4)),
        "yellow": ((3,3), (4,0)),
        "orange": ((3,4), (4,1)),
    })

    genProblemFile(8, 8, {
        "orange": ((1, 1),(7,5)),
        "yellow": ((0,7), (3, 4)),
        "blue" : ((4,5), (7, 7)),
        "green": ((7,4), (7,6)),
        "red" : ((1, 5), (5,3)),
    })

    genProblemFile(15, 18, {
        "yellow": ((0,1), (7, 17)),
        "cyan": ((2,2), (7, 9)),
        "rust": ((4,1), (13, 14)),
        "green": ((0,9), (12,5)),
        "pink": ((6,6), (12,15)),
        "white": ((7,7),(5,13)),
        "orange": ((8, 10),(6,17)),
        "gray" : ((2,15),(10,5)),
        "blue" : ((11,5), (11, 14)),
        "purple" : ((11,6),(13,16)),
        "red" : ((4, 16), (12,16)),
    })
