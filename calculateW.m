% The function calculates artificial cost function by taking constraints 
% and artificial variable indices. The function takes each artificial 
% variable and derive their corresponding equation with respect to other 
% variables and returns W matrix.

function W = calculateW(cons, artificialVariablesIndex)
    
    count = size(artificialVariablesIndex,1);
    arrayW = zeros(count, size(cons,2));
    for i=1:count
        for j=1:size(cons,1)
            if(cons(j,end-1-i) == 1)
                for k=1:size(arrayW,2)
                    if(k <= size(arrayW,2)-2-count)
                        arrayW(i,k) = -1 * cons(j,k);
                    elseif(k == size(arrayW,2)-1)
                        arrayW(i,k) = cons(j,end-1);
                    else
                        arrayW(i,k) = 0;
                    end
                end
            end
        end
    end
    
    W = zeros(1,size(arrayW,2));
    for i=1:size(arrayW,2)
        W(1,i) = sum(arrayW(:,i));
    end
end