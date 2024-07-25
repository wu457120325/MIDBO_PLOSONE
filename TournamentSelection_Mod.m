function index = TournamentSelection_Mod(K,N,PopDec,varargin)


    varargin = cellfun(@(S)reshape(S,length(varargin{1}),1),varargin,'UniformOutput',false);
    [~,rank] = sortrows([varargin{:}]);
    [~,rank] = sort(rank);    
    Parents  = randi(length(varargin{1}),K,N);
    for i = 1 : N
        [~,min_index] = min(pdist2(PopDec(Parents(1,i),:),PopDec(Parents(2:K,i),:)));
        Parents(2,i)  = Parents(min_index+1,i);
    end 
    Parents  = Parents(1:2,:);
    [~,best] = min(rank(Parents),[],1);
    index    = Parents(best+(0:N-1)*2);
end