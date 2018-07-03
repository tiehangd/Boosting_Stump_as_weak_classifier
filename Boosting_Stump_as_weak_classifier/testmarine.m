[NUM,TXT,RAW]=xlsread('MarineData.xls');
Data=NUM(:,2:8)';
Label=NUM(:,9)';
Label=Label*2-1;
Train_Data=Data(:,1:2:end);
Train_Label=Label(1:2:end);

Test_Data=Data(:,2:2:end);
Test_Label=Label(2:2:end);


[Error_Rate,Validation_Vector] = Boost_Validate(Train_Data,Train_Label,Test_Data,Test_Label,600);