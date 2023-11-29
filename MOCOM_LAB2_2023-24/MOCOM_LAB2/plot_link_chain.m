function plot_link_chain(qi,qf,iTj_q,linkType)
    numberOfSteps=100;

    %computing intermediate steps from initial to final configuration
    joint_positions=stepJointPositions(qi,qf,iTj_q,numberOfSteps,linkType);
    %bounds for the plot
    bounds_m=zeros(3,2);
    for i=1:3
        coords=joint_positions(i,:,:);
        bounds_m(i,:)=[min(coords,[],'all')-1,max(coords,[],'all')+1];
    end

    %init plot
    h=plot3(0,0,0,'-o','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
    xlim(bounds_m(1,:));
    ylim(bounds_m(2,:));
    zlim(bounds_m(3,:));
    xlabel('x-axis');
    ylabel('y-axis');
    zlabel('z-axis');
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