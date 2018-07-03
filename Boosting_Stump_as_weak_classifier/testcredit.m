[NUM,TXT,RAW]=xlsread('ModifiedCreditData.xls');
Data=NUM(:,1:6)';
Labels=NUM(:,7)';
[row,column]=size(Data);
Init_Weights=ones(1,column)/column;
Train_Data=Data(:,1:2:end);
Validation_Data=Data(:,2:2:end);
Train_Labels=Labels(1:2:end);
Validation_Labels=Labels(2:2:end);
Init_Weights=ones(1,column)/column;



%[Dicovalue_Vector,Position_Vector,sign_vector,Alpha_Vector,Mini_Error_Vector,Dico_Result_Vector] = Error_Train(Data,Labels,200);
%[Dicovalue,Position,fina_sign,Min_Error,Error_Points,Dico_Result] = Error_Compute(Data,Labels,Init_Weights);
[Error_Rate,Error_Num,Position_Vector,Alpha_Vector,Validation_Vector] = Boost_Validate(Train_Data,Train_Labels,Validation_Data,Validation_Labels,5);

