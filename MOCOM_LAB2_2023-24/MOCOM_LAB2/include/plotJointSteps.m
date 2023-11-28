function plotJointSteps(q,configTree,linkType)
numberOfSteps=100;
numberOfLinks=size(linkType,2);
qi=zeros(1,7);
%compute bounds for the plot
 joint_positions=stepJointPositions(qi,q,configTree,numberOfSteps,linkType);
    %bounds 
    bounds_m=zeros(3,2);
    for i=1:3
        coords=joint_positions(i,:,:);
        bounds_m(i,:)=[min(coords,[],'all')-200,max(coords,[],'all')+200];
    end
% the complete movement is done one joint at a time
for j=1:numberOfLinks
    q_step=qi; q_step(j)=q(j);
    %computing intermediate steps from initial to final configuration
    joint_positions=stepJointPositions(qi,q_step,configTree,numberOfSteps,linkType);
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
    %update of configuration tree
    configTree=GetDirectGeometry(q_step,configTree,linkType);
    
end
end