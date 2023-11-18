function [iTj]=GetFrameWrtFrame(linkNumber_i, linkNumber_j,biTei)
%%% GetFrameWrtFrame function 
% inputs : 
% linkNumber_i : number of ith link 
% linkNumber_j: number of jth link 
% biTei vector of matrices containing the transformation matrices from link i to link i +1 for the current q.
% The size of biTei is equal to (4,4,numberOfLinks)
% outputs:
% iTj : transformationMatrix in between link i and link j for the
% configuration described in biTei

p=0;
R = ones(size(biTei)-1);

for i = link_number_i+1:link_number_j

    T = biTei(:,:,i);

    pi = T(1:end-1,end);
    p = p+pi; %vettore da i a j

    Ri = T(1:end-1,1:end-1);
    R = R * Ri;
    
end

%uno = [R p];
%due = [uno  0 0 0 1];
%iTj = due;
iTj(1:3,1:3) = R;
iTj(1:3,4) = p;
iTj(4,:) = [0 0 0 1];

end