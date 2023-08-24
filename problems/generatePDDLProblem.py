
import json

from utils import percentDif, absoluteFilePaths

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
    ;We avoid using forall due to the translator implementation generating axioms which 
    ;make it so we can't use many good planner heuristics.
    ;(forall (?c - color) (flow-complete ?c))
    ;(forall (?l - location) (not-empty ?l))
    {nl.join(f"(flow-complete {c})" for c in colors)}
    {nl.join(f"(not-empty {p})" for p in points)}
))

)'''

def genProblemFile(n : int, m : int, flows: dict[str, tuple[tuple[int, int], tuple[int, int]]], name=None):
    if name == None:
        name = f"flowproblem{n}x{m}.pddl"
    with open(name, "w") as file:
        file.write(problemGen(n, m, flows))

def sameColor(c1, c2, threshold = 3):
    """
    Checks if two colors are the same by checking their RGB
    components are within threshold % of each other.
    """
    for cp1, cp2 in zip(c1, c2):
        if percentDif(c1[0], c2[0]) > threshold:
            return False
    return True

def colorStr(color : tuple[int, int, int]) -> str:
    """https://stackoverflow.com/a/3380739/6342516"""
    return "color_%02x%02x%02x" % color

def genProblemFromJson(json_path, pddl_path):
    """
    Generate a PDDL problem file from a json file
    """
    with open(json_path, "r") as json_file:
        problem = json.load(json_file)
        rows = len(problem)
        cols = len(problem[0])
        #Keep a running set of unmatched colors
        #This could be optimized with a custom set for
        #threshold based equality, not worth the time sink.
        unmatchedColors : set[tuple[tuple[int,int,int], int, int]] = set()
        matchedColors : dict[str, tuple[tuple[int, int], tuple[int, int]]] = {}
        for i in range(rows):
            for j in range(cols):
                color = problem[i][j]
                if color == None:
                    continue
                found = False
                for (c, cr, cc) in unmatchedColors:
                    if sameColor(c, color):
                        unmatchedColors.remove((c, cr, cc))
                        matchedColors[colorStr(c)] = ((cr, cc), (i, j))
                        found = True
                        break
                if not found:
                    unmatchedColors.add((tuple(color), i, j))
        genProblemFile(rows, cols, matchedColors, pddl_path)

#Generate a pddl problem for every problem in ./problem-json
if __name__ == "__main__":
    for json_path in absoluteFilePaths("problem-json"):
        try:
            json_path_parts = json_path.split("/")
            pdd_file_name = json_path_parts[-2] + "-" + json_path_parts[-1].split(".")[0] + ".pddl"
            pddl_path = "problem-PDDL/" + pdd_file_name
            genProblemFromJson(json_path, pddl_path)
        except Exception as e:
            print(str(e))