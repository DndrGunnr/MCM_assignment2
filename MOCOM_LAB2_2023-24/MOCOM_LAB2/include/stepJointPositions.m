function joint_positions=stepJointPositions(qi,qf,startingTree,numberOfSteps,linkType)
numberOfLinks=7;
for i=1:numberOfLinks
    q_intermediate(i,:)=linspace(qi(i),qf(i),numberOfSteps);
end

%compute corresponding position vector of each joint
for i=1:numberOfSteps
    %this contains the vectors of q's associated to i-th time step
    config_tree=GetDirectGeometry(q_intermediate(:,i),startingTree,linkType);
    for j=1:numberOfLinks
        %filling joint position vectors matrix
        joint_positions(:,j,i)=GetBasicVectorWrtBase(config_tree,j);

    end
end
end