% The function takes table, artificial variable indices and basic/non-basic
% variable indices and deletes row and columns of the artificial variables.
% It returns a new table with updated indices matrix which shows 
% basic variable names.
function [index, T] = removeArtificialLines(index, T, artificialIndex)

    T = T(1:end-1,:);
    lines2Remove = [];
    for i=1:size(index,1)
        for j=1:size(artificialIndex,1)
            if(index(i,2) == artificialIndex(j,2))
                lines2Remove(end+1) = i;
            end
        end
    end
    
    T(lines2Remove,:) = [];   
    T(:,artificialIndex(:,2)) = [];
end