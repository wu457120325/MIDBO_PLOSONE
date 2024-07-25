


function REP = MODBO(params,MultiObj)



        pop      = params.Np;           %
        Nr      = params.Nr;           % Repository size  
        MaxIter  = params.maxgen;       % Maximum number of generations   
        fobj     = MultiObj.fun;        % 
        dim    = MultiObj.nVar;        % 
        var_min = MultiObj.var_min(:); %
        var_max = MultiObj.var_max(:); 
        name=MultiObj.name;            
           
        PballRolling = 0.2;  
        PbroodBall = 0.2;               
        PSmall = 0.35;                     
        Pthief = 0.25;                  
        
        
        
        BallRollingNum = pop*PballRolling;     
        BroodBallNum = pop*PbroodBall;         
        SmallNum = pop*PSmall;                 
        ThiefNum = pop*Pthief;                 
        
        fitness = zeros(pop, MultiObj.numOfObj);
        POS = initialization(pop, dim, var_max', var_min');
        for i=1:pop
            fitness(i,:)  = fobj(POS(i,:));
        end
        DOMINATED= checkDomination(fitness);             
        REP.pos  = POS(~DOMINATED,:);
        REP.pos_fit = fitness(~DOMINATED,:); 
        %%

        cFit=fitness;
        r2=rand;
        Front = NDSort(fitness,inf);
        [~,rank]  = sortrows([Front',-CrowdingDistance(fitness,Front)']);
        LeaderSet = rank(1:10);
        
        EndSet = rank(length(rank)-9:length(rank));
        
        winner = LeaderSet(randperm(length(LeaderSet),2));
        Loser = EndSet(randperm(length(EndSet),1));
        

        Xl = POS; %
        cX = POS;
        cFit = fitness;
        for t=1:MaxIter

            Front = NDSort(fitness,inf);
            
            [~,rank]  = sortrows([Front',-CrowdingDistance(fitness,Front)']);
            LeaderSet = rank(1:10);
            
            EndSet = rank(length(rank)-9:length(rank));
            
            winner = LeaderSet(randperm(length(LeaderSet),1));
            Loser = EndSet(randperm(length(EndSet),1));
            
            bestXX = POS(winner,:);    
            GbestScore = fobj(bestXX);    
            worse = POS(Loser, :);
            %% 
            for i=1:BallRollingNum
                w1 = 2 - (exp(t/MaxIter) - 1)/(exp(1)-1);
                r11 = 1-(t/MaxIter) ;
                r22 = rand(1)*2*pi;
                r33 = rand(1)*2*pi;   
                
                if r2<0.9
                    if rand>0.5
                        alpha=1;
                    else
                        alpha=-1;
                    end
                    b=0.3;
                    k=0.1;
                    POS(i, :) = w1 * POS(i,:) + r11 * sin(r22) * abs(r33 * bestXX - POS(i, :));
                else
                    theta=randi(180);
                    if(theta == 0 || theta == 90 || theta==180)
                        POS(i,:)=cX(i,:);
                    else
                        theta = theta*pi/180;
                        POS(i, :) = w1 * POS(i,:) + r11 * cos(r22) * abs(r33 * bestXX - POS(i, :));
                    end
                end
                %% 
                for j=1:dim
                    if POS(i,j) > var_max(j)
                        POS(i,j) = var_max(j);
                    end
                    if POS(i,j) < var_min(j)
                        POS(i,j) = var_min(j);
                    end
                end
                fitness(i,:) = fobj(POS(i,:));
            end
            %% 
            R = 1-t/MaxIter;
            
            X1 = REP.pos(1,:) * (1 - R);
            X2 = REP.pos(1,:) * (1 + R);
            Lb = max(X1, var_min');
            Ub = min(X2, var_max');
            for i = BallRollingNum+1:BallRollingNum+BroodBallNum
                b1=rand(1, dim);
                b2=rand(1, dim);

                for j=1:dim
                    if POS(i,j) > var_max(j)
                        POS(i,j) = var_max(j);
                    end
                    if POS(i,j) < var_min(j)
                        POS(i,j) = var_min(j);
                    end
                end
                fitness(i,:)=fobj(POS(i,:));
            end

            %
            R=1-t/MaxIter;
            X1=bestXX * (1 - R);
            X2=bestXX * (1 + R);
            Lb = max(X1, var_min');
            Ub = min(X2, var_max');
        
            for i=BallRollingNum+BroodBallNum+1:BallRollingNum+BroodBallNum+SmallNum
                sigma = 1; %
                mu = 0; 
                C1 = mu + sigma * randn(1, dim); 
                C2 = rand(1, dim); 
                POS(i,:)=REP.pos(1,:) + C1.*(cX(i,:)-Lb) + C2.*(cX(i,:)-Ub);  
                for j=1:dim
                    if POS(i,j)> var_max(j)
                        POS(i,j)= var_max(j);
                    end
                    if POS(i,j)<var_min(j)
                        POS(i,j)=var_min(j);
                    end
                end
                fitness(i,:)=fobj(POS(i,:));

            end
            %% 
            for i=pop-ThiefNum:pop
                g=randn();
                S=0.5;
                POS(i,:) = bestXX+g.*S.*(abs(cX(i,:)-bestXX)+abs(cX(i,:)-bestXX));
                for j=1:dim
                    if POS(i,j)> var_max(j)
                        POS(i,j)= var_max(j);
                    end
                    if POS(i,j)<var_min(j)
                        POS(i,j)=var_min(j);
                    end
                end
                fitness(i,:)=fobj(POS(i,:));
            end
            
            proM = 1;
            disM = 20;
            Lower = repmat(var_min',pop,1);
            Upper = repmat(var_max',pop,1);
            Site  = rand(pop,dim) < proM/dim;
            mu    = rand(pop,dim);
            temp  = Site & mu<=0.5;
            POS = min(max(POS,Lower),Upper);
            POS(temp) = POS(temp)+(Upper(temp)-Lower(temp)).*((2.*mu(temp)+(1-2.*mu(temp)).*...
                (1-(POS(temp)-Lower(temp))./(Upper(temp)-Lower(temp))).^(disM+1)).^(1/(disM+1))-1);
            temp = Site & mu>0.5;
            POS(temp) = POS(temp)+(Upper(temp)-Lower(temp)).*(1-(2.*(1-mu(temp))+2.*(mu(temp)-0.5).*...
                (1-(Upper(temp)-POS(temp))./(Upper(temp)-Lower(temp))).^(disM+1)).^(1/(disM+1)));
            
            %记录t代种群

            for i = 1: pop
                for j=1:dim
                    if POS(i,j)> var_max(j)
                        POS(i,j) = var_max(j);
                    end
                    if POS(i,j)<var_min(j)
                        POS(i,j)=var_min(j);
                    end
                end
            end

            Xl=cX;
            for i=1:pop
  
                    cX(i,:) = POS(i,:);
            end

            REP = updateRepository(REP,POS,fitness); 
            if(size(REP.pos,1)>Nr)
                REP = deleteFromRepository(REP,size(REP.pos,1)-Nr);
            end
            
        end
end

