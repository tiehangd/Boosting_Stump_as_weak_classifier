function [Dico,sign,Minerror] = Appr_Dico(Data,Label,Weights)
% To calculate the appropriate dicotomy value;

leng=length(Data);
Min=Data(1);
Max=Data(1);

for i=1:1:leng
    
    if(Min>Data(i))
        Min=Data(i);
    end
    
    if(Max<Data(i))
        Max=Data(i);
    end
    
    
end

Dico=Min;
Minerror=1000000;
sign=1;
for j=Min:((Max-Min)/200):Max

    Error1=0;
    Error2=0;
    for i=1:1:leng
        if(((Data(i)>j)&&(Label(i)<0))||((Data(i)<j)&&(Label(i)>0)))
            Error1=Error1+Weights(i);
        end
        if(((Data(i)>j)&&(Label(i)>0))||((Data(i)<j)&&(Label(i)<0)))
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



end

