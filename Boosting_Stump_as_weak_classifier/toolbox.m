%using the Adaboost Toolbox;
[NUM,TXT,RAW]=xlsread('UniversityData2.xls');
Data=NUM(:,3:5)';
Labels=NUM(:,6)';
Labels=Labels*2-1;

MaxIter=50;

Traindata=Data(:,1:2:end);
Trainlabels=Labels(1:2:end);

Controldata=Data(:,2:2:end);
Controllabels=Labels(2:2:end);

weak_learner=tree_node_w(3);


[RLearners,RWeights]=GentleAdaBoost(weak_learner,Traindata,Trainlabels,MaxIter);
[MLearners,MWeights]=ModestAdaBoost(weak_learner,Traindata,Trainlabels,MaxIter);


ResultR=sign(Classify(RLearners,RWeights,Controldata));
ResultM=sign(Classify(MLearners,MWeights,Controldata));

ErrorR=sum(Controllabels~=ResultR);
ErrorM=sum(Controllabels~=ResultM);





