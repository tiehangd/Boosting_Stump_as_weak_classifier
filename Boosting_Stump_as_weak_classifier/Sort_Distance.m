function [ Sorttable ] = Sort_Distance(Data,k)
%sort the k nearest distance near each node;

column=size(Data,2);

Distance=Cal_Distance(Data);
Index=zeros(column);
Sorttable=zeros(column,k);


for i=1:1:column
    
    for j=1:1:column
        Index(i,j)=j;
    end
end

for i=1:1:column

        Sorttable(i,:)=Sortedsb(Distance(i,:),Index(i,:),k);

end



end

