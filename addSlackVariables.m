% This function takes constraints matrix and adds slack or suppress 
% variables to the equations. Function returns new constraints matrix and 
% index of the slack variables.

function [slackIndex,cons] = addSlackVariables(cons)
    
    slackIndex = [];
    for i=1:size(cons,1)
        if(cons(i,end) ~= 0)
            slackColumn = zeros(size(cons,1),1);
            cons = [cons(:,1:end-2) slackColumn cons(:,end-1:end)];
            value = 1;
            if(cons(i,end) == 1)
                value = -1;
            end
            cons(i,end-2) = value;
            slackIndex(end+1) = size(cons,2)-2;
        end
    end
end