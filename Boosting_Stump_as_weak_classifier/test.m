[A,B]=data_generator();
Data=A(:,1:2)';
Labels=B(:,1)';
Train_Data=Data(:,1:2:end);
Validation_Data=Data(:,2:2:end);
Train_Labels=Labels(1:2:end);
Validation_Labels=Labels(2:2:end);
[row,column]=size(Data);
Init_Weights=ones(1,column)/column;


%Distance=Cal_Distance(Data);
%Sorttable = Sort_Distance(Data,6);
%[Dico,clas_sign,Minerror] = Appr_Dico(Data,Labels,Init_Weights);
%[Dicovalue,Position,fina_sign,Min_Error,Error_Points,Dico_Result] = Error_Compute(Data,Labels,Init_Weights);
%[Dicovalue_Vector,Position_Vector,sign_vector,Alpha_Vector,Mini_Error_Vector,Dico_Result_Vector] = Error_Train(Data,Labels,50);
[Error_Rate,Error_Num,Position_Vector,Alpha_Vector,Validation_Vector] = Boost_Validate(Train_Data,Train_Labels,Validation_Data,Validation_Labels,50);
