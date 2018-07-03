[NUM,TXT,RAW]=xlsread('ForestData.xls');
Data=NUM(:,1:6)';
Label=NUM(:,7)';
%Label=Label*2-1;
Train_Data=Data(:,1:2:end);
Train_Label=Label(1:2:end);

Test_Data=Data(:,2:2:end);
Test_Label=Label(2:2:end);


[Error_Rate,Validation_Vector] = Boost_Validate(Train_Data,Train_Label,Test_Data,Test_Label,600);



