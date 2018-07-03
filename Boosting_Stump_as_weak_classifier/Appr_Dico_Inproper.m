function [Dico,sign,Minerror] = Appr_Dico(Data,Label,Weights)
% To calculate the appropriate dicotomy value;
Data1=Data(:,1:5:end);
Data2=Data(:,2:5:end);
Data3=Data(:,3:5:end);
Data4=Data(:,4:5:end);
Data5=Data(:,5:5:end);

Label1=Label(:,1:5:end);
Label2=Label(:,2:5:end);
Label3=Label(:,3:5:end);
Label4=Label(:,4:5:end);
Label5=Label(:,5:5:end);

Data_Group=[Data1;Data2;Data3;Data4;Data5];
Label_Group=[Label1;Label2;Label3;Label4;Label5];

Validation_Dico=1000000;
Validation_Sign=1;
Validation_Minierror=1000000;



for va=1:1:5

Train_Data=[Data_Group(mod(va,5)+1,:),Data_Group(mod(va+1,5)+1,:),Data_Group(mod(va+2,5)+1,:),Data_Group(mod(va+3,5)+1,:)];
Train_Label=[Label_Group(mod(va,5)+1,:),Label_Group(mod(va+1,5)+1,:),Label_Group(mod(va+2,5)+1,:),Label_Group(mod(va+3,5)+1,:)];
    
Validation_Data=Data_Group(mod(va+4,5)+1,:);
Validation_Label=Label_Group(mod(va+4,5)+1,:);

Leng_Train=length(Train_Data);
Leng_Validation=length(Validation_Data);


Min=Train_Data(1);
Max=Train_Data(1);

for i=1:1:Leng_Train
    
    if(Min>Train_Data(i))
        Min=Train_Data(i);
    end
    
    if(Max<Train_Data(i))
        Max=Train_Data(i);
    end
    
    
end

Dico=Min;
Minerror=1000000;
sign=1;

for j=Min:((Max-Min)/200):Max

    Error1=0;
    Error2=0;
    for i=1:1:Leng_Train
        if(((Train_Data(i)>j)&&(Train_Label(i)<0))||((Train_Data(i)<j)&&(Train_Label(i)>0)))
            Error1=Error1+Weights(i);
        end
        if(((Train_Data(i)>j)&&(Train_Label(i)>0))||((Train_Data(i)<j)&&(Train_Label(i)<0)))
            Error2=Error2+Weights(i);
        end    
    end
    
    Error=min(Error1,Error2);
    if(Minerror>Error)
        Minerror=Error;
        Dico=j;
        
        
        if(Error1>Error2)
            sign=0;
        else
            sign=1;
        end
    
    end
    
  
    
    
    
    
end

    Validation_Error=0;
    for ii=1:1:Leng_Validation
        
        if(sign==1)
           if(((Validation_Label(ii)>0)&&(Validation_Data(ii)<j))||((Validation_Label(ii)<0)&&(Validation_Data(ii)>j)))
                Validation_Error=Validation_Error+1;
               
           end
        end
        
        
        if(sign==0)
            if(((Validation_Label(ii)>0)&&(Validation_Data(ii)>j))||((Validation_Label(ii)<0)&&(Validation_Data(ii)<j)))
                Validation_Error=Validation_Error+1;
                
                
            end
        end
        
        
    end

    if(Validation_Minierror>Validation_Error)
         Validation_Minierror=Validation_Error;
         Validation_Sign=sign;
         Validation_Dico=Dico;
    end

end

Dico=Validation_Dico;
sign=Validation_Sign;
Minerror=Validation_Minierror;


end
