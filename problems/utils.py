"""
Utilities
"""

import os

def percentDif(a : int, b : int):
    """
    Return the % difference between two numbers a and b
    """
    if b + a == 0:
        return 0
    return 100 * (abs(a - b) / ((a + b) / 2))

def absoluteFilePaths(directory):
    """
    From https://stackoverflow.com/a/9816863/6342516
    """
    for dirpath,_,filenames in os.walk(directory):
        for f in filenames:
            yield os.path.abspath(os.path.join(dirpath, f))