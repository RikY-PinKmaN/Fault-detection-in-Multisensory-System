%% KNN algorithm
%clear all;
%load("Faults.mat") % Whole Fault data from lab
k = [1 3 5 7 11 19]; % Nearest Neighbours
numberOfTrainingCases = 35;
numberOfTestingCases = length(Fault_1) - numberOfTrainingCases;
% Specify the number of training and testing cases:
trainingSet = [Fault_1(1:35,:); Fault_2(1:35,:); Fault_3(1:35,:); Fault_4(1:35,:); Fault_5(1:35,:)];
testingSet = [Fault_1(36:end,:); Fault_2(36:end,:);Fault_3(36:end,:); Fault_4(36:end,:); Fault_5(36:end,:)];
% Specifying labels
trainingTarget= [ones(1,numberOfTrainingCases) ones(1,numberOfTrainingCases)*2 ones(1,numberOfTrainingCases)*3 ones(1,numberOfTrainingCases)*4 ones(1,numberOfTrainingCases)*5];
testingTarget= [ones(1,numberOfTestingCases) ones(1,numberOfTestingCases)*2 ones(1,numberOfTestingCases)*3 ones(1,numberOfTestingCases)*4 ones(1,numberOfTestingCases)*5];
% Calculate the total number of test and train classes
totalNumberOfTestingCases = numberOfTestingCases * 5;
totalNumberOfTrainingCases = numberOfTrainingCases * 5;
% This loop cycles through each unlabelled item:
for unlabelledCaseIdx = 1:totalNumberOfTestingCases
    unlabelledCase = testingSet(unlabelledCaseIdx, :);
    % This loop cycles through each labelled item:
    for labelledCaseIdx = 1:totalNumberOfTrainingCases
        labelledCase = trainingSet(labelledCaseIdx, :);
        % Calculate the Euclidean distance:
        currentDist = euc(unlabelledCase, labelledCase); 
        Dist(labelledCaseIdx, unlabelledCaseIdx) = currentDist; % Putting the distance in an array
    end
    [Dist_s, idx] = sort(Dist,1); % Sorting the distance array in ascending order
end
% This loop cylcles through each choice of neighbours
for i = 1 : length(k)
    DistanceLabel = trainingTarget(idx(1:k(i),:)); % Assigning Lable
    shortestDistanceLabel = mode(DistanceLabel,1); % Taking mode of the distance labels.
    Nc(i) = length(find(shortestDistanceLabel==testingTarget));
    Na = totalNumberOfTestingCases;
    Accuracy(i) = 100*(Nc(i)/Na); % Accuracy
end
% Accuracy Table
Number_of_Nearest_Neighbours = {'1'; '3'; '5'; '7'; '11'; '19'};
Accuracies = {Accuracy(1,1); Accuracy(1,2); Accuracy(1,3); Accuracy(1,4); Accuracy(1,5); Accuracy(1,6)};
T = table(Number_of_Nearest_Neighbours, Accuracies);
figure('Name','Accuracy Table')
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
     'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
