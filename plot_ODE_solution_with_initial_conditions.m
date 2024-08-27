function plot_ODE_solution_with_initial_conditions
    % Create a figure
    fig = uifigure('Name', 'ODE Solution with Initial Conditions', 'Position', [100, 100, 800, 600]);
    
    % Create labels and value boxes for b, w, and initial conditions
    uilabel(fig, 'Position', [50, 550, 100, 22], 'Text', 'Parameter b:');
    value_box_b = uieditfield(fig, 'numeric', 'Position', [50, 520, 100, 22], 'Value', 1);
    
    uilabel(fig, 'Position', [200, 550, 100, 22], 'Text', 'Parameter w:');
    value_box_w = uieditfield(fig, 'numeric', 'Position', [200, 520, 100, 22], 'Value', 1);
    
    uilabel(fig, 'Position', [50, 470, 100, 22], 'Text', 'Initial x(0):');
    value_box_x0 = uieditfield(fig, 'numeric', 'Position', [50, 440, 100, 22], 'Value', 0);
    
    uilabel(fig, 'Position', [200, 470, 100, 22], 'Text', 'Initial dx/dt(0):');
    value_box_dx0 = uieditfield(fig, 'numeric', 'Position', [200, 440, 100, 22], 'Value', 0);
    
    % Create a button to update the plot
    update_button = uibutton(fig, 'push', 'Text', 'Update Plot', 'Position', [350, 440, 100, 22], 'ButtonPushedFcn', @(btn, event) update_plot());

    
    % Initial plot
    update_plot();
    
    function update_plot()
        % Get values from value boxes
        b = value_box_b.Value;
        w = value_box_w.Value;
        x0 = value_box_x0.Value;
        dx0 = value_box_dx0.Value;
        
        % Define time vector
        t = linspace(0, 10, 500);
        
        % Compute the expression inside the exponential
        discriminant = b^2 - w^2;
        
        % Initialize x
        x = zeros(size(t));
        
        if discriminant > 0
            sqrt_discriminant = sqrt(discriminant);
            % Compute the homogeneous solution
            A = (b*x0 + sqrt_discriminant + dx0) / (2 * sqrt_discriminant);
            B = (b*x0 - sqrt_discriminant + dx0) / (2 * sqrt_discriminant);
            x = exp(-b * t) .* (A * exp(sqrt_discriminant * t) + B * exp(-sqrt_discriminant * t));
        elseif discriminant == 0
            x = x0 .* exp((-dx0 / x0) * t);
        else
            % Handle case where the discriminant is negative
            sqrt_discriminant = sqrt(abs(discriminant));
            % Compute the homogeneous solution using complex exponentials
             A = x0;
             B = (dx0 + b*x0) / sqrt_discriminant;
            x = exp(-b * t) .* (A * cos(sqrt_discriminant*t) + B * sin(sqrt_discriminant*t));
        end 
        
        % Plot
        plot(t,x)
        xlabel('Time t');
        ylabel('x(t)');
        title(sprintf('Solution x(t) with b = %.2f, w = %.2f, x(0) = %.2f, dx/dt(0) = %.2f', b, w, x0, dx0));
        grid on;
    end
end
