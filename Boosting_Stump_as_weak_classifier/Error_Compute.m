function [Dicovalue,Position,fina_sign,Min_Error,Error_Points] = Error_Compute(Data,Label,Weights)
%Compute the error for a weak classifier

a=(length(Weights)/5);
end_num=5*floor(a);
Data1=Data(:,1:5:end_num);
Data2=Data(:,2:5:end_num);
Data3=Data(:,3:5:end_num);
Data4=Data(:,4:5:end_num);
Data5=Data(:,5:5:end_num);

Label1=Label(:,1:5:end_num);
Label2=Label(:,2:5:end_num);
Label3=Label(:,3:5:end_num);
Label4=Label(:,4:5:end_num);
Label5=Label(:,5:5:end_num);

Weight1=Weights(:,1:5:end_num);
Weight2=Weights(:,2:5:end_num);
Weight3=Weights(:,3:5:end_num);
Weight4=Weights(:,4:5:end_num);
Weight5=Weights(:,5:5:end_num);

Data_Group=[Data1;Data2;Data3;Data4;Data5];
Label_Group=[Label1;Label2;Label3;Label4;Label5];
Weight_Group=[Weight1;Weight2;Weight3;Weight4;Weight5];

Validation_Dico=10000;
Validation_Minierror=1000000;
Vali_Position=10000;
Validation_Sign=1;

fina_column=size(Data,2);

for va=1:1:5

    Train_Data=[Data_Group(mod(va,5)+1,:),Data_Group(mod(va+1,5)+1,:),Data_Group(mod(va+2,5)+1,:),Data_Group(mod(va+3,5)+1,:)];
    Train_Label=[Label_Group(mod(va,5)+1,:),Label_Group(mod(va+1,5)+1,:),Label_Group(mod(va+2,5)+1,:),Label_Group(mod(va+3,5)+1,:)];
    Train_Weight=[Weight_Group(mod(va,5)+1,:),Weight_Group(mod(va+1,5)+1,:),Weight_Group(mod(va+2,5)+1,:),Weight_Group(mod(va+3,5)+1,:)];
    
    Validation_Data=Data_Group(mod(va+4,5)+1,:);
    Validation_Label=Label_Group(mod(va+4,5)+1,:);
    Validation_Weight=Weight_Group(mod(va+4,5)+1,:);

    Leng_Validation=length(Validation_Data);

    
    [row,column]=size(Train_Data);
    Dico=zeros(1,row); %The values to divide the input space;
    Dico_Result=zeros(1,column);     %Record the result of the dicotomy;
    sign=zeros(1,row);
    Minerror=zeros(1,row);

    
    for i=1:1:row
    

        [Dico(i),sign(i),Minerror(i)]=Appr_Dico(Train_Data(i,:),Train_Label,Train_Weight); %Return the most appropriate dicotomy value;

    
    end
    

    for i=1:1:row
        Minerror(i)=0;
        for ii=1:1:Leng_Validation
            if(((Validation_Label(ii)>0)&&(Validation_Data(ii)>Dico(i)))&&(sign(i)==0)||((Validation_Label(ii)<0)&&(Validation_Data(ii)<Dico(i))&&(sign(i)==0))||((Validation_Label(ii)<0)&&(Validation_Data(ii)>Dico(i))&&(sign(i)==1))||((Validation_Label(ii)>0)&&(Validation_Data(ii)<Dico(i))&&(sign(i)==1)))
                Minerror(i)=Minerror(i)+Validation_Weight(ii);
                              
            end
        end
        
        
        
        
        
    end

    [Min_Error,Position]=min(Minerror);
    Dicovalue=Dico(Position);
    fina_sign=sign(Position);


   

    Validation_Error=0;
    Leng_Validation=length(Validation_Data);
    for ii=1:1:Leng_Validation
        
        if(fina_sign==1)
           if(((Validation_Label(ii)>0)&&(Validation_Data(ii)<Dicovalue))||((Validation_Label(ii)<0)&&(Validation_Data(ii)>Dicovalue)))
                Validation_Error=Validation_Error+Validation_Weight(ii);
               
           end
        end
        
        
        if(fina_sign==0)
            if(((Validation_Label(ii)>0)&&(Validation_Data(ii)>Dicovalue))||((Validation_Label(ii)<0)&&(Validation_Data(ii)<Dicovalue)))
                Validation_Error=Validation_Error+Validation_Weight(ii);
                
                
            end
        end
        
        
    end

    if(Validation_Minierror>Validation_Error)
         Validation_Minierror=Validation_Error;
         Validation_Sign=fina_sign;
         Validation_Dico=Dicovalue;
         Vali_Position=Position;
         
    end
    
    
end


Dicovalue=Validation_Dico;
Position=Vali_Position;
fina_sign=Validation_Sign;

Error_Points=zeros(1,fina_column);    %Record the points which are misclassified by the appropriate dicotomy;
Minerror=0;
if(fina_sign==1)
    for j=1:1:fina_column
            
        if(Data(Position,j)<Dicovalue)
            Dico_Result(j)=-1;
        else
            Dico_Result(j)=1;
        end
            
        
        if((Data(Position,j)<Dicovalue)&&(Label(j)==1)||(Data(Position,j)>Dicovalue)&&(Label(j)==-1))
            Error_Points(j)=1;
            Minerror=Minerror+Weights(j);
        end
        
        
    end
        
elseif(fina_sign==0)
        
    for j=1:1:fina_column
        
        if(Data(Position,j)<Dicovalue)
            Dico_Result(j)=1;
        else
            Dico_Result(j)=-1;
        end
        
            
            
        if((Data(Position,j)<Dicovalue)&&(Label(j)==-1)||(Data(Position,j)>Dicovalue)&&(Label(j)==1))
            Error_Points(j)=1;
            Minerror=Minerror+Weights(j);
        end
        
        
    end
        
        
        
end




Min_Error=Minerror;



end

