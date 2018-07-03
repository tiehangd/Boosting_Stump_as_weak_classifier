function [Data,Label] = data_generator()
%create training data;

mu_1 = [1,1];
Sigma_1 = [1,0;0,1];
R_1=chol(Sigma_1);
Z_1 = repmat(mu_1,50,1) + randn(50,2)*R_1;

Label_1=ones(50,1);

mu_2 = [2,2];
Sigma_2 = [1,0;0,1];
R_2=chol(Sigma_2);
Z_2 = repmat(mu_2,50,1) + randn(50,2)*R_2;

Label_2=ones(50,1)*(-1);

Data=[Z_1;Z_2];
Label=[Label_1;Label_2];
A=[Data,Label];

k=int16(rand(1,6)*49);
for i=1:1:6
    Label(2*k(i)+1)=Label(2*k(i)+1)*(-1);
end


xlswrite('Book8.xls',A,'sheet8');


end


