[NUM,TXT,RAW]=xlsread('UniversityData2.xls');
Data=NUM(:,3:5)';
Label=NUM(:,6)';
Label=Label*2-1;
Train_Data=Data(:,1:2:end);
Train_Label=Label(1:2:end);

Test_Data=Data(:,2:2:end);
Test_Label=Label(2:2:end);

%Train_Data1=Data(:,1:6:end);
%Train_Data2=Data(:,2:6:end);]
%Train_Data3=Data(:,3:6:end);
%Train_Data4=Data(:,4:6:end);
%Train_Data5=Data(:,5:6:end);
%Test_Data=Data(:,6:6:end);

%Train_Label1=Labels(1:6:end);
%Train_Label2=Labels(2:6:end);
%Train_Label3=Labels(3:6:end);
%Train_Label4=Labels(4:6:end);
%Train_Label5=Labels(5:6:end);
%Test_Label=Labels(6:6:end);


[row,column]=size(Data);

Init_Weights=ones(1,column)/column;

%[Dicovalue_Vector,Position_Vector,sign_vector,Alpha_Vector,Mini_Error_Vector,Dico_Result_Vector] = Error_Train(Data,Label,50);
[Error_Rate,Validation_Vector] = Boost_Validate(Train_Data,Train_Label,Test_Data,Test_Label,200);








