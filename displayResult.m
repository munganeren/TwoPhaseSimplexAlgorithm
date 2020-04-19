% The function is used to display results in a correct form. It uses 
% finalized table and indices matrix and outputs found variable values 
% and function value. 

function displayResult(index, T, inputSign, phase)
    
    resultArray = zeros(1,size(inputSign,2));
    for i=1:size(index,1)
       resultArray(index(i,2)) = T(index(i,1),end);
    end
    
    resultArray = resultArray(:,1:size(inputSign,2));
    
    fprintf("\nX = %s \t f = %.4f\n", mat2str(resultArray,5), abs(T(end-phase,end)));
    
end