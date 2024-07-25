% Function that updates the repository given a new population and its fitness
function REP = updateRepository(REP,POS,POS_fit)
    % Domination between particles
%     DOMINATED  = checkDomination(POS_fit);  
    Front  = NDSort(POS_fit,inf)';
    DOMINATED = (Front ~= 1);
    REP.pos    = [REP.pos; POS(~DOMINATED,:)];  
    REP.pos_fit= [REP.pos_fit; POS_fit(~DOMINATED,:)]; 
    % Domination between nondominated particles and the last repository
    
    
%     DOMINATED  = checkDomination(REP.pos_fit); 
    Front  = NDSort(REP.pos_fit,inf)';
    DOMINATED = (Front ~= 1);
    REP.pos_fit= REP.pos_fit(~DOMINATED,:);     
    REP.pos    = REP.pos(~DOMINATED,:);         
    % Updating the grid
%     REP        = updateGrid(REP,ngrid);
end


