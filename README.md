# some-fun-ctions

function [ImgMax, ImgMin] = imgmaxmin(data, varargin)

The function finds max and min of intensity distribution using the histogram
function or evaluates the value distribution of a matrix/ vector. 

E.g. where is 95% of the int value of my image? 
[max, min] = imgmaxmin(myImage,[],0.95)

inputs: 2D matrix, lower bound, upper bound [non-integers 0-1]
if no lo-up bound are added, the function finds the min/max

language: MATLAB

> andrea3vs@gmail.com
