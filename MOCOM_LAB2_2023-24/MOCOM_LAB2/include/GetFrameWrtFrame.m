function [iTj]=GetFrameWrtFrame(biTei,linkNumber_i, linkNumber_j)
%%% GetFrameWrtFrame function 
% inputs : 
% linkNumber_i : number of ith link 
% linkNumber_j: number of jth link 
% biTei vector of matrices containing the transformation matrices from link i to link i +1 for the current q.
% The size of biTei is equal to (4,4,numberOfLinks)
% outputs:
% iTj : transformationMatrix in between link i and link j for the
% configuration described in biTei

T = eye(4);

if linkNumber_j > linkNumber_i
    for i = (linkNumber_i+1) : (linkNumber_j)
        
        Ti = biTei(:,:,i);
        T = T * Ti;

    end
iTj = T;

elseif linkNumber_j < linkNumber_i
    while linkNumber_i ~= linkNumber_j
        
        Ti = inv(biTei(:,:,linkNumber_i));
        T = T*Ti;

        linkNumber_i = linkNumber_i - 1;
    end
iTj = T;

end

end