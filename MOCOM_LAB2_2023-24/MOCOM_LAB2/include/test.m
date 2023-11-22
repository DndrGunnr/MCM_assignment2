% Create figure
figure;

% Define initial data for the line
t = linspace(0, 2*pi, 1000); % Increase the number of points
x = sin(t);
y = cos(t);
z = t;

% Create an initial plot with plot3
plot3(x, y, z);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Improved Smoothness - 3D Plot Animation');
hold on;

% Create a line object
line_handle = line('XData', x(1), 'YData', y(1), 'ZData', z(1), 'Marker', 'o', 'Color', 'red');

% Set axis limits
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);
zlim([0, 2*pi]);

% Set up the animation
numFrames = 1000; % Increase the number of frames

for i = 1:numFrames
    % Update data for the line
    new_x = sin(t + i * 0.1); % Change the function as needed for animation
    new_y = cos(t + i * 0.1);
    new_z = t + i * 0.1;

    % Update line data
    set(line_handle, 'XData', new_x, 'YData', new_y, 'ZData', new_z);
    
    % Reduce pause time for smoother animation
    pause(0.01); % Decreased pause time
    
    % Refresh the plot
    drawnow;
end