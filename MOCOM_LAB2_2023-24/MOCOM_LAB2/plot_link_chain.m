function plot_link_chain(qi,qf,iTj_q,linkType)
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
        bounds_m(i,:)=[min(coords,[],'all')-1,max(coords,[],'all')+1];
        if bounds_m(i,1)==bounds(i,2)
            bounds_m(i,2)=bounds_m(i,2)+1;
        end
    end

    %init plot
    h=plot3(0,0,0,'-o','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
    xlim(bounds_m(1,:));
    ylim(bounds_m(2,:));
    zlim(bounds_m(3,:));
    grid on;
    for i=1:numberOfSteps
        % Update line data
        set(h, 'XData', joint_positions(1,:,i), 'YData', joint_positions(2,:,i), 'ZData',joint_positions(3,:,i));
        % Reduce pause time for smoother animation
        pause(0.005); 
        % Refresh the plot
        drawnow;
    end
end