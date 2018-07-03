function [Distance] = Cal_Distance(Data)
%first normalize data, then calculate their relative distance.
%Data should be ranged as K*N;


[row,column]=size(Data);
Norm_Data=zeros(row,column);
Distance=zeros(column);
temp=0;
for i=1:1:row;

    for j=1:1:column
        temp=temp+Data(i,j);
    end
    
    for j=1:1:column
        Norm_Data(i,j)=Data(i,j)/temp;
    end
    
        
end
    

for i=1:1:column
    
    for j=1:1:column
        
        temp=0;
        for k=1:1:row
        
            temp=temp+(Norm_Data(k,i)-Norm_Data(k,j))^2;
            
        end
        
        
        Distance(i,j)=temp^0.5;
        
        if (i==j)
            Distance(i,j)=10000;    
        end
        
        
        
    end


end




