function [ImgMax, ImgMin] = imgmaxmin(data, varargin)
% function to find max and min of intensity distribution using histogram
% function to evaluate the value distribution of a matrix or vector. 
% E.g. where is 95% of the int value of my image? 
% [max, min] = imgmaxmin(myImage,[],0.95)
% inputs: 2D matrix, lower bound, upper bound [non-integers 0-1]
% if no lo-up bound are added, the function finds the min/max

    image2D  = data;            % 2D image or vector
    minBound = varargin{1};     % eg. 0.01 for 1%
    maxBound = varargin{2};     % eg. 0.95 for 95%
    if minBound<0 && minBound>1
        error('lower bound error: only non-integers 0-1')
    elseif maxBound<0 && maxBound>1
        error('upper bound error: only non-integers 0-1')
    end
    if minBound > maxBound
        a = maxBound;
        maxBound = minBound;
        minBound = a;
    end
    minVal = min(image2D,[],'all');
    maxVal = max(image2D,[],'all');
    image2D = double(image2D);
    image2D(image2D ==0) = NaN;
    [N,edges] = histcounts(image2D,linspace(0,maxVal,1e3));
    allBin = sum(N);
    i = 2;
    if ~isempty(maxBound)
        Acc = N(1)/allBin;
        while Acc <= maxBound
            Acc = sum(N(1:i))/allBin;
            i = i +1;
        end
        ImgMax = edges(i);
    else
        ImgMax = maxVal;
    end
    i = 2;
    if ~isempty(minBound)
        Acc = N(1)/allBin;
        while Acc <= minBound
            Acc = sum(N(1:i))/allBin;
            i = i+1;
        end
        ImgMin = edges(i);
    else
        ImgMin = minVal;
    end
end