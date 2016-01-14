%this function receives a set of real and predictedvalues. The values order starts with the controul group in frist position
function [ TPRATE, FPRATE, PRECISION, ACCURACY, F_SCORE, ConfMatrix ] = cfmatrix(labels)


TN = sum(labels(:,2) == 0 & labels(:,2) == labels(:,3));
FP = sum(labels(:,2) == 0 & labels(:,2) != labels(:,3));
TP = sum(labels(:,2) == 1 & labels(:,2) == labels(:,3));
FN = sum(labels(:,2) == 1 & labels(:,2) != labels(:,3));


ConfMatrix = [TP FN;FP TN];

TP = ConfMatrix(1);
FP = ConfMatrix(2);
FN = ConfMatrix(3);
TN = ConfMatrix(4);

P = TP + FN;
N = FP + TN;

%% Metrics
TPRATE =  TP/P;
FPRATE =  FP/N;
PRECISION = TP/(TP +FP);
ACCURACY = (TP+TN)/(P+N);
F_SCORE = 2 * (PRECISION * TPRATE)/(PRECISION + TPRATE);
end
