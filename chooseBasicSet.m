% The function takes the table and finds pivot row and column. The function
% finds the smallest negative number in the last row (which is artificial 
% cost function in the first phase and originial cost function in the 
% second phase) and chooses it as pivot column. The function finds pivot 
% row by choosing smallest ratio between latest column and pivot column. 
% If there is no positive ratio find in any of rows (unbounded condition), 
% function returns 0 for the row value. 

function [row, column] = chooseBasicSet(T, rowCount)
    
    [~,column] = min(T(end,1:end-1));

    ratio = T(1:rowCount,end)./T(1:rowCount, column);
    ratio(ratio<0) = inf;
    [~,row] = min(ratio(ratio>=0));
    
    if(isempty(row))
        row = 0;
    end
    
end