    numberOfSteps=1000;
    numberOfLinks=size(linkType,2);
    %computing intermediate steps from initial to final configuration
    for i=1:numberOfLinks
        q_intermediate(i,:)=linspace(qi(i),qf(i),numberOfSteps);
    end

    %compute corresponding position vector of each joint
    for i=1:numberOfSteps
        %this contains the vectors of q's associated to i-th time step
        config_tree=GetDirectGeometry(q_intermediate(:,i),iTj_q,linkType );
        for j=1:numberOfLinks
            %filling joint position vectors matrix
            joint_positions(:,j,i)=GetBasicVectorWrtBase(config_tree,j);
            
        end
    end
    %bounds 
    bounds_m=zeros(3,2);

    for i=1:3
        coords=joint_positions(i,:,:);
        for j=1:size(joint_positions,3)
            cc(j,:)=coords(:,:,j);
        end
        bounds_m(i,:)=[min(cc,[],'all'),max(cc,[],'all')];
        if bounds_m(i,1)==bounds(i,2)
            bounds_m(i,2)=bounds_m(i,2)+1;
        end
    end
