% Adds artificial variables by checking condition (<=, >=, ==) of the 
% constraint. Returns new constraints and indices for artificial and 
% non-artificial variables.  

function [nonArtificialIndex, artificialIndex, cons] = addArtificialVariables(cons, basicCount, slackCount)
    nonArtificialIndex = [];
    artificialIndex = [];
    for i=1:size(cons,1)
        if(cons(i,end) ~= -1 || cons(i, end-1) < 0)
            artificialColumn = zeros(size(cons,1),1);
            cons = [cons(:,1:end-2) artificialColumn cons(:,end-1:end)];
            cons(i,end-2) = 1;
            artificialIndex = [artificialIndex; [i,size(cons,2)-2]]; 
        else
            for j=basicCount+1:basicCount+slackCount
                if(cons(i,j) == 1)
                    nonArtificialIndex = [nonArtificialIndex; [i,j]];
                end
            end
        end
    end
end