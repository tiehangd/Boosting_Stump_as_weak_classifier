function [output_class] = Weak_Classifyer(Sample,Coeffs)
%To classify the output through the weak classifier;

leng=size(Sample,1);
temp=0;

for i=1:1:leng
    temp=temp+Coeffs(i)*Sample(i);
end




end

