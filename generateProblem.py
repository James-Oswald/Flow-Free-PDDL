

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
    (forall (?c - color) (flow-complete ?c))
    (forall (?l - location) (not-empty ?l))
))

)'''

if __name__ == "__main__":
    with open("flowproblem.pddl", "w") as file:
        file.write(problemGen(5, 5, {
            "red": ((0,0), (1, 4)),
            "green": ((1,3), (2, 0)),
            "blue": ((2, 1), (2, 4)),
            "yellow": ((3,3), (4,0)),
            "orange": ((3,4), (4,1)),
        }))
