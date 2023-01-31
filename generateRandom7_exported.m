classdef generateRandom7_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        textResult       matlab.ui.control.TextArea
        buttonGetNumber  matlab.ui.control.Button
    end

    
    methods (Access = private)
   
    % Function that generates random number between 1 and 7
        function nRandom = generateRandom(app)
            
            num = randi(5)+randi(5);
            nRandom = mod(num,7)+1;

            return 
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: buttonGetNumber
        function getNumber(app, event)
            num = generateRandom(app);
            app.textResult.Value = string(num); % Set number in text field
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [450 350 488 299];
            app.UIFigure.Name = 'MATLAB App';

            % Create buttonGetNumber
            app.buttonGetNumber = uibutton(app.UIFigure, 'push');
            app.buttonGetNumber.ButtonPushedFcn = createCallbackFcn(app, @getNumber, true);
            app.buttonGetNumber.WordWrap = 'on';
            app.buttonGetNumber.FontSize = 14;
            app.buttonGetNumber.FontWeight = 'bold';
            app.buttonGetNumber.Position = [295 112 135 95];
            app.buttonGetNumber.Text = 'Generar número aleatorio';

            % Create textResult
            app.textResult = uitextarea(app.UIFigure);
            app.textResult.HorizontalAlignment = 'center';
            app.textResult.FontSize = 132;
            app.textResult.FontWeight = 'bold';
            app.textResult.Position = [76 71 181 177];
            app.textResult.Value = {'-'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = generateRandom7_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end