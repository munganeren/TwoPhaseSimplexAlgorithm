% Input format
% Objective function needs to be in minimization form. 
% For constraints, last row indicates type of the constraint
%  -1: <=, 0: =, 1: >=
% Second last row indicates the value in the RHS.
% Input sign shows basic variable signs. 
% 1: >0, 0: unrestricted in sign. 

function SimplexAlgorithm(func, constraints, inputSign)
%% Get the standard form
[cons, func] = convert2StandardForm(func, constraints, inputSign);

%% Add slack variables
[slackIndex, consWSlack] = addSlackVariables(cons);

%% Add artificial variables
[nonArtificialIndex, artificialIndex, consWArtificial] = ...
            addArtificialVariables(consWSlack, size(cons,2)-2, size(slackIndex,2));

%% Calculate W
W = calculateW(consWArtificial, artificialIndex);

%% Create variables table
[index, T] = createVariablesTable(func, consWArtificial, W, artificialIndex, nonArtificialIndex);

%% Phase I-II iterations
[message, index, T] = phase1(index, T);
disp('Result table for the 1st phase is:')
disp(T)

% Check if W value is 0. If value is not 0 then display result,
% otherwise move to second phase. 

if(T(end,end) ~= 0)
    if(~isempty(message))
        disp(message);
    else
        disp(['Artificial cost function (the last row) has value different than 0. ', ...
        'There is no feasible solution. Solution for the 1st phase:']);
    end
    displayResult(index, T, inputSign, 1);

else
    [message, index, T] = phase2(index, T, artificialIndex);
    if(~isempty(message))
        disp(message);
    else
        disp('Result table for the 2nd phase is:')
        disp(T)
        displayResult(index, T, inputSign, 0);
    end
end



end