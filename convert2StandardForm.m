% Checks if constraints have negative value in the RHS, and converts them
% to positive by multiplying by -1. Also checks for variables unrestricted 
% in sign and replaces them with the +/- approached variables.
% Returns new func and constraints array.  

function [constraints, func] = convert2StandardForm(func, constraints, inputSign)
    
    if(~isempty(constraints))
        % Check RHS and make it positive if necessary. 
        for i=1:size(constraints,1)
            if(constraints(i,end-1) < 0)
                constraints(i,1:end-1) = -1 * constraints(i,1:end-1);
                constraints(i,end) = -1 * constraints(i,end);
            end
        end
        
        % Check for unrestricted sign and add variables. 
        changedCol = [];
        for i=1:size(inputSign,2)
           if(inputSign(i) == 0)
               constraints = [constraints(:,1:end-2) constraints(:,i) -1*constraints(:,i) constraints(:,end-1:end)];
               func = [func func(:,i) -1*func(:,i)];
               changedCol(end+1) = i;
           end
        end
        constraints(:,[changedCol]) = [];
        func(:,[changedCol]) = [];
    else
        error("There is no constraint defined for the problem.");
    end
    
end