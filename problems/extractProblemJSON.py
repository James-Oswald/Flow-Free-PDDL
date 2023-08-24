
"""
This script uses OpenCV to extract a Flow-Free problem from a screenshot of a flow free board.
"""

import os
import json
import argparse

import cv2
import numpy as np

from utils import percentDif, absoluteFilePaths

def _sortContours(contours, method="left-to-right"):
    """
    Sorts a list of contours in a particular direction.
    Code from https://pyimagesearch.com/2015/04/20/sorting-contours-using-python-and-opencv/ 
    """
    # initialize the reverse flag and sort index
    reverse = False
    i = 0
    # handle if we need to sort in reverse
    if method == "right-to-left" or method == "bottom-to-top":
        reverse = True
    # handle if we are sorting against the y-coordinate rather than
    # the x-coordinate of the bounding box
    if method == "top-to-bottom" or method == "bottom-to-top":
        i = 1
    # construct the list of bounding boxes and sort them from top to
    # bottom
    boundingBoxes = [cv2.boundingRect(c) for c in contours]
    (contours, boundingBoxes) = zip(*sorted(zip(contours, boundingBoxes), 
                                            key=lambda b:b[1][i], reverse=reverse))
    # return the list of sorted contours and bounding boxes
    return (contours, boundingBoxes)


def extractProblem(img_path : str) -> list[list[tuple[int, int, int]]]:
    """
    Given an image, extract the Flow-Free problem representation as a matrix of
    triples with colors for cells with a starting dot or None for empty cells.
    Most of this algorithm comes from https://github.com/KananVyas/BoxDetection

    Ex.
    [
        [[255,0,0], None, [255,0,0]]
    ]
    Is a 3x1 flow free board with two red dots on either side and a blank spot
    in the middle.
    """
    #Magic Numbers
    #Lines have to have to be at least img_width/K_RATIO pixels long for us to detect them
    K_RATIO = 20
    
    BOX_ERR = 10 #Max % error when detecting cells
    ROW_ERR = 4 #Max % error when detecting new row
    #Weighting parameters, this will decide the quantity of an image to be added to make a new image.
    ALPHA = 0.5
    BETA = 1.0 - ALPHA

    img_bgr = cv2.imread(img_path)
    img_rgb = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB)
    img_g = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2GRAY)
    (_, img_bin) = cv2.threshold(img_g, 128, 255, cv2.THRESH_BINARY|cv2.THRESH_OTSU)
    # Defining a kernel length
    kernel_length = np.array(img_g).shape[1]//K_RATIO
    # A vertical kernel of (1 X kernel_length), which will detect all the v lines from the image.
    v_kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (1, kernel_length))
    # A horizontal kernel of (kernel_length X 1), which will help to detect all the horizontal line from the image.
    h_kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (kernel_length, 1))
    # A kernel of (3 X 3) ones.
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    # Morphological operation to detect vertical lines from an image
    img_temp1 = cv2.erode(img_bin, v_kernel, iterations=3)
    v_lines_img = cv2.dilate(img_temp1, v_kernel, iterations=3)
    # Morphological operation to detect horizontal lines from an image
    img_temp2 = cv2.erode(img_bin, h_kernel, iterations=3)
    h_lines_img = cv2.dilate(img_temp2, h_kernel, iterations=3)

    
    # This function helps to add two image with specific weight parameter to get a third image as summation of two image.
    img_final_bin = cv2.addWeighted(v_lines_img, ALPHA, h_lines_img, BETA, 0.0)
    img_final_bin = cv2.erode(~img_final_bin, kernel, iterations=2)
    (_, img_final_bin) = cv2.threshold(img_final_bin, 128,255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)
    # Find contours for image, which will detect all the boxes
    contours, _ = cv2.findContours(img_final_bin, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    if len(contours) == 0:
        raise RuntimeError("Extraction Error: Could not detect cells") 

    # Sort all the contours by top to bottom.
    (contours, boundingBoxes) = _sortContours(contours, method="top-to-bottom")
    
    #Loop over all cells and detect their contents
    cell_imgs = []
    cur_row = []
    last_y = 0
    for bbox in boundingBoxes:
        # Returns the location and width,height for every contour
        x, y, w, h = bbox
        #An elevation change of more than ROW_ERR likely means we're on a new row
        if percentDif(y, last_y) > ROW_ERR:
            cell_imgs.append(cur_row.copy())
            cur_row = []
        #if the width and height of the box are within BOX_ERR of each other (its a square)
        if percentDif(w, h) < BOX_ERR:
            cell_img = img_rgb[y:y+h, x:x+w]
            cell_img_g = cv2.cvtColor(cell_img, cv2.COLOR_BGR2GRAY)
            circles = cv2.HoughCircles(cell_img_g, cv2.HOUGH_GRADIENT, 1, cell_img_g.shape[0]/2)
            if not np.any(circles):
                cur_row.append(None)
            elif len(circles) == 1:
                #get the color in the middle of the circle
                cur_row.append(cell_img[cell_img.shape[0]//2][cell_img.shape[1]//2])
            else:
                #there should never be 2 circles in a cell
                raise RuntimeError("Extraction Error: Detected More than two circles in cell")
        last_y = y
    cell_imgs = cell_imgs[1:]
    #Convert NP arrays to lists of ints
    cell_imgs = [[cell.tolist() if cell is not None else None for cell in row] for row in cell_imgs]
    return cell_imgs

def extractProblemToJson(img_path : str, json_path : str) -> None:
    """
    Extracts the problem contained in the img at img_path and 
    writes it to a json file at json_path
    """
    with open(json_path, "w") as json_file:
        problem_repr = extractProblem(img_path)
        json.dump(problem_repr, json_file, indent=4)

if __name__=="__main__":
    for img_file in absoluteFilePaths("problem-images"):
        try:
            json_path = "problem-image-json/" + img_file.split("/")[-1].split(".")[0] + ".json"
            extractProblemToJson(img_file, json_path)
        except Exception as e:
            print(str(e))