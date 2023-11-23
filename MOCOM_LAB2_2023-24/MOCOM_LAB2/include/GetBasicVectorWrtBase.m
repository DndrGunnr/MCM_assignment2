function [r]=GetBasicVectorWrtBase(biTei, linkNumber)
%%% GetBasicVectorWrtBase function
% input :
% biTei: trasnformation matrix in between frame i and frame j
% linkNumber: link number
% output
% r : basic vector from frame i to the robot base frame <0>
r=[0;0;0];
for i=1:linkNumber
    %r=r+ 0;
    T = GetTransformationWrtBase(biTei,i);
    r = T(1:3,4);
end

end