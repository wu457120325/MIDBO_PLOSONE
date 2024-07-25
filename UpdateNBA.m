function [NBA,NBA_objs] = UpdateNBA(NBA, NBA_objs,n_NBA,PBA,PBA_objs)
% Update NBA


    for i = 1:length(NBA)
        if i == 1
            tempNBA = [PBA{end};PBA{1};PBA{2}];
            tempNBA_ojbs = [PBA_objs{end};PBA_objs{1};PBA_objs{2}];
        elseif i == length(NBA)
            tempNBA = [PBA{end-1};PBA{end};PBA{1}];
            tempNBA_ojbs = [PBA_objs{end-1};PBA_objs{end};PBA_objs{1}];
        else
            tempNBA = [PBA{i-1};PBA{i};PBA{i+1}];
            tempNBA_ojbs = [PBA_objs{i-1};PBA_objs{i};PBA_objs{i+1}];
        end
        tempNBA = [tempNBA;NBA{i}];
        tempNBA_ojbs = [tempNBA_ojbs;NBA_objs{i}];
        [tempNBA,tempNBA_ojbs,FrontNo,SpCrowdDis] = non_domination_scd_sort(tempNBA,tempNBA_ojbs,n_NBA);
        [~,index] = sortrows([FrontNo;-SpCrowdDis]');
        NBA{i} = tempNBA(index,:);
        NBA_objs{i} = tempNBA_ojbs(index,:);
    end
end