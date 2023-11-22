function [iTj] = GetTransformationWrtBase(biTei, linkNumber)
%%% GetTransformatioWrtBase function
% inputs :
% biTei vector of matrices containing the transformation matrices from link i to link i +1 for the current joint position q.
% The size of biTei is equal to (4,4,numberOfLinks)
% linkNumber for which computing the transformation matrix
% outputs
% bTi : transformation matrix from the manipulator base to the ith joint in
% the configuration identified by biTei.
p=0;
R=eye(3);

for i=1:linkNumber

    T = biTei(:,:,i);

    pi = T(1:end-1,end);
    p = p+R*pi; %vettore da i a j

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