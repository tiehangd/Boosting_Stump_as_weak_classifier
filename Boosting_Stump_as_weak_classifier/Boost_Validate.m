function [Error_Rate,Error_Num,Position_Vector,Alpha_Vector,Validation_Vector] = Boost_Validate(Train_Data,Train_Label,Validation_Data,Validation_Label,MaxIter)
%Calculate the validation error rate;

[Dicovalue_Vector,Position_Vector,sign_vector,Alpha_Vector,Mini_Error_Vector] = Error_Train(Train_Data,Train_Label,MaxIter);


column_V=size(Validation_Data,2);
Validation_Vector=zeros(1,column_V);
Predict_Vector=zeros(1,MaxIter);

for i=1:1:column_V
    
    for j=1:1:MaxIter
        Position=Position_Vector(j);
        predic_sign=sign_vector(j);
        Dico_Value=Dicovalue_Vector(j);
        
        if(((Validation_Data(Position,i)<Dico_Value)&&(predic_sign==1))||((Validation_Data(Position,i)>Dico_Value)&&(predic_sign==0)))
            Predict_Vector(j)=-1;
            
        elseif(((Validation_Data(Position,i)<Dico_Value)&&(predic_sign==0))||((Validation_Data(Position,i)>Dico_Value)&&(predic_sign==1)))
            Predict_Vector(j)=1;
            
        end
        
    end
    
    Predict_Value=0;
    for j=1:1:MaxIter
        Predict_Value=Predict_Value+Alpha_Vector(j)*Predict_Vector(j);
        
    end
    
    Validation_Vector(i)=sign(Predict_Value);
    
    
    
end

    Error_Num=0;
    for i=1:1:column_V
        if(Validation_Vector(i)~=Validation_Label(i))
           Error_Num=Error_Num+1; 
        end
        
    end

    Error_Rate=Error_Num/column_V;

end

