function [PBA,PBA_objs] = UpdatePBA(Population,fitness,PBA,PBA_objs,n_PBA)
% Update PBA


    for i = 1 : length(PBA)
        tempPBA = [PBA{i}; Population(i,:)];
        tempPBA_objs = [PBA_objs{i}; fitness(i,:)];
        [tempPBA,tempPBA_objs,FrontNo,SpCrowdDis] = non_domination_scd_sort(tempPBA,tempPBA_objs,n_PBA);
        
        [~,index] = sortrows([FrontNo;-SpCrowdDis]');
        PBA{i} = tempPBA(index,:);
        PBA_objs{i} = tempPBA_objs(index,:);
    end
end