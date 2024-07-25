function [POS,fitness,FrontNo,SpCrowdDis_Obj] = EnvironmentalSelection(POS,fitness,N)
% The environmental selection of DN-NSGA-II-------------------------------------------------------------------

    %% Non-dominated sorting
    [FrontNo,MaxFNo] = NDSort(fitness, N);
    Next = FrontNo < MaxFNo;
    
    %% Calculate the crowding distance of each solution
    SpCrowdDis_Obj = CrowdingDistance(fitness,FrontNo);
    SpCrowdDis_Dec = CrowdingDistance(POS,FrontNo);
    
    %% Select the solutions in the last front based on their crowding distances
    Last     = find(FrontNo==MaxFNo);
    [~,Rank] = sort(SpCrowdDis_Dec(Last),'descend');
    Next(Last(Rank(1:N-sum(Next)))) = true;
    
    %% Population for next generation
    POS = POS(Next,:);
    fitness = fitness(Next,:);
    FrontNo    = FrontNo(Next);
    SpCrowdDis_Obj = SpCrowdDis_Obj(Next);
end