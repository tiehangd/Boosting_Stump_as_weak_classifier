function [Dicovalue_Vector,Position_Vector,sign_vector,Alpha_Vector,Mini_Error_Vector] = Error_Train(Data,Label,MaxIter)
%To calculate the error rate with the training data;

column=size(Data,2);
Weights=ones(1,column)/column;
Dicovalue_Vector=ones(1,MaxIter)*100;
Position_Vector=zeros(1,MaxIter);
Mini_Error_Vector=ones(1,MaxIter)*100;
Alpha_Vector=ones(1,MaxIter)*100;
sign_vector=ones(1,MaxIter)*(-1);

for i=1:1:MaxIter
    
    [Dicovalue_Vector(i),Position_Vector(i),sign_vector(i),Mini_Error_Vector(i),Error_Points]=Error_Compute(Data,Label,Weights);
    E_m=Mini_Error_Vector(i)/sum(Weights);
    Alpha_Vector(i)=log((1-E_m)/E_m);
    for j=1:1:column
        
        if(Error_Points(j)==1)
            Weights(j)=Weights(j)*exp(Alpha_Vector(i));
                        
        end
        
    end
    
    Weights=Weights/sum(Weights);
    
    
    
end




end

