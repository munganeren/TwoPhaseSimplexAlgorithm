% The function takes function, constraints and artificial cost function 
% (W) and combines them. The function returns the basic and non-basic 
% variable indices alongside with the table. 

function [index, T] = createVariablesTable(func, cons, W, artIndex, nonArtIndex)

    cons = cons(:,1:end-1);
    W = W(:,1:end-1);
    func = [func zeros(size(func,1),size(W,2)-size(func,2))];
    
    W(end,end) = -1 * W(end,end);
    func(end,end) = -1 * func(end,end);
    
    T = [cons; func; W];
    index = [nonArtIndex; artIndex];
    
end