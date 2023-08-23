# Flow-Free-PDDL

This project looks at using automated planning to solve the mobile game flow-free.
We also look at using computer vision (OpenCV) to convert images of flow levels into a json format
that we can convert to PDDL problems.
The majority of our problems come from json problem encodings in `/problem-json` from
[AndraCoteanu/Flow-Free-Solver](https://github.com/AndraCoteanu/Flow-Free-Solver). 

### Other Solvers 
This solver isn't great at the moment, check out these optimized solvers
* [mzucker/flow_solver](https://github.com/mzucker/flow_solver) (Custom heuristic search with fast forwarding)
* [Torvaney/flow-solver](https://github.com/Torvaney/flow-solver) (SAT Based)
* [AndraCoteanu/Flow-Free-Solver](https://github.com/AndraCoteanu/Flow-Free-Solver) (SAT Based)

## Extraction of Problems using OpenCV

We use a lightly modified modified version of 
[KananVyas/BoxDetection](https://github.com/KananVyas/BoxDetection)
procedure to segment the game board. We check for the presence of a circle using 
HoughCircles  


