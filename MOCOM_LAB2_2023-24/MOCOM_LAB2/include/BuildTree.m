function [iTj] = BuildTree()
% This function should build the tree of frames for the chosen manipulator.
% Inputs: 'None'
% Outputs: The tree of frames.

% iTj is a 3-dimensional matlab matrix, suitable for defining tree of
% frames. iTj should represent the transformation matrix between the i-th and j-th
% frames. iTj(row,col,link_idx)

iTj(1,1,1) = 0; iTj(1,2,1) = 0; iTj(1,3,1) = 0; iTj(1,4,1) = 0;
iTj(2,1,1) = 0; iTj(2,2,1) = 0; iTj(2,3,1) = 0; iTj(2,4,1) = 0;
iTj(3,1,1) = 0; iTj(3,2,1) = 0; iTj(3,3,1) = 0; iTj(3,4,1) = 0;
iTj(4,1,1) = 0; iTj(4,2,1) = 0; iTj(4,3,1) = 0; iTj(4,4,1) = 0;

%... for all the links of the manipulator%

iTj(1,1,5) = -1; iTj(1,2,5) = 0;  iTj(1,3,5) = 0;  iTj(1,4,5) = 0;
iTj(2,1,5) = 0;  iTj(2,2,5) = 0;  iTj(2,3,5) = -1; iTj(2,4,5) = -35;
iTj(3,1,5) = 0;  iTj(3,2,5) = -1; iTj(3,3,5) = 0;  iTj(3,4,5) = 0;
iTj(4,1,5) = 0;  iTj(4,2,5) = 0;  iTj(4,3,5) = 0;  iTj(4,4,5) = 1;


iTj(1,1,6) = 1; iTj(1,2,6) = 0; iTj(1,3,6) = 0;  iTj(1,4,6) = 0;
iTj(2,1,6) = 0; iTj(2,2,6) = 0; iTj(2,3,6) = -1; iTj(2,4,6) = 0;
iTj(3,1,6) = 0; iTj(3,2,6) = 1; iTj(3,3,6) = 0;  iTj(3,4,6) = 385;
iTj(4,1,6) = 0; iTj(4,2,6) = 0; iTj(4,3,6) = 0;  iTj(4,4,6) = 1;


iTj(1,1,7) = 1; iTj(1,2,7) = 0;  iTj(1,3,7) = 0;  iTj(1,4,7) = 0;
iTj(2,1,7) = 0; iTj(2,2,7) = 0;  iTj(2,3,7) = 1;  iTj(2,4,7) = 153;
iTj(3,1,7) = 0; iTj(3,2,7) = -1; iTj(3,3,7) = 0;  iTj(3,4,7) = 0;
iTj(4,1,7) = 0; iTj(4,2,7) = 0;  iTj(4,3,7) = 0;  iTj(4,4,7) = 1;
end

