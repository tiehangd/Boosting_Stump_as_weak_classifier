function [Sorted] = Sortedsb(Distancesb,Ind,k)
% sort the k smallest elements of the table Distance.

leng=size(Distancesb,2);
Sorted=zeros(1,k);
for i=1:1:k
    tempdistance=Distancesb(i);
    for j=(i+1):1:leng
       if (tempdistance>Distancesb(j))
           tempdistance=Distancesb(j);
           Distancesb(j)=Distancesb(i);
           Distancesb(i)=tempdistance;
           
           tempindex=Ind(j);
           Ind(j)=Ind(i);
           Ind(i)=tempindex;
          

       
       end
    end
   Sorted(i)=Ind(i);
    
end
    

end

