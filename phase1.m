% This function represents the first phase of the simplex algorithm and 
% continuously uses reduce row operations to find the optimum solution. 
% The function ends if there is no negative value in the last row or the 
% output of the chooseBasicSet function is 0. 

function [message, index, T] = phase1(index, T)
    T_1 = T;
    T_2 = T;
    message = [];
    while(any(T(end,1:end-1)<0))
        [r, c] = chooseBasicSet(T, size(index,1));
        if(r==0)
            if(any(T(end,1:end-1)<0))
                message = "There is no solution or problem is unbounded";
            end
            break;
        end
        T = reduceRowOperation([r,c], T);
        index(r,2) = c;
        
        % Check if it stuck in the loop. 
        if(T_2 == T)
            message = "There is no solution or problem is unbounded";
            break;
        end
        
        T_2 = T_1;
        T_1 = T;
    end
    
end