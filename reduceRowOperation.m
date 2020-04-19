% The function takes table (complete matrix) and pivot row-column 
% information and tries to make that element 1 and any other variable 0 at 
% the same column. Returns new basic/non-basic variable indices and modified table.

function T = reduceRowOperation(object, T)
    
    objectRow = object(1);
    objectCol = object(2);
    
    T(objectRow,:) = T(objectRow,:) / T(objectRow,objectCol);
    
    for i=1:size(T,1)
        if(i == objectRow || T(i,objectCol) == 0)
            continue;
        end

        constant = T(i,objectCol) / T(objectRow,objectCol);
        T(i,:) = T(i,:) - T(objectRow,:)*constant;
    end    
end