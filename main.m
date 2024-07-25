clear all 
clc
addpath('./functions')

% TestProblem测试问题说明：
% CEC2020测试函数说明

%1-5 MMF 1,2,4,5,7
%6-10 MMF 8,10,11,12,13
%11-15 MMF 14,15,1e,14a,15a
%16-20 MMF 10_1, 11_1, 12_1, 13_1, 14_1
%21-24 MMF 15_a_1, 16_11, 16_12, 16_13

%1-5:ZDT1、ZDT2、ZDT3、ZDT4、ZDT6
%6-12：DTLZ1-DTLZ7
%13-22：wfg1-wfg9,10
%23-32：uf1-uf10
%33-42：cf1-cf10

%问题名
params.Np = 200;      
params.Nr = 400;        % Repository size   
params.maxgen =1000;    % Maximum number of generations  
params.ngrid = 30;      % Number of grids in each dimension  
%% 保存指标  从这里开始集体复制
i_func = 1
MultiObj = GetFunInfo_MMF(i_func);            %MultiObj  
MultiObjFnc=MultiObj.name;

REP = MODBO(params,MultiObj);  




if(size(REP.pos_fit,2)==2)
    h_rep = plot(REP.pos_fit(:,1),REP.pos_fit(:,2),'bo', 'MarkerSize', 10, 'LineWidth', 1.5);
    hold on;
%     h_ref2 = plot(REP2.pos_fit(:,1),REP2.pos_fit(:,2),'bo', 'MarkerSize', 10, 'LineWidth', 1.5);
%     hold on;
       if(isfield(MultiObj,'truePF'))
            h_pf = plot(MultiObj.truePF(:,1),MultiObj.truePF(:,2),'g+', 'MarkerSize', 5, 'LineWidth', 1.5);
            hold on;
            title(MultiObj.name);
            legend('MODBO','Real PF', 'FontName', 'Times New Roman', 'FontSize', 12);
       else
           legend('MODBO','Real PF', 'FontName', 'Times New Roman', 'FontSize', 12);
       end

        grid on;
        xlabel('f1');
        ylabel('f2');
end

if(size(REP.pos_fit,2)==3)
    h_rep = plot3(REP.pos_fit(:,1),REP.pos_fit(:,2),REP.pos_fit(:,3),'bo', 'MarkerSize', 5, 'LineWidth', 1.5);
%     hold on;
%     h_ref2 = plot3(REP2.pos_fit(:,1),REP2.pos_fit(:,2),REP2.pos_fit(:,3),'bo', 'MarkerSize', 10);
    view(125,30);
    hold on;
      if(isfield(MultiObj,'truePF'))
            h_pf = plot3(MultiObj.truePF(:,1),MultiObj.truePF(:,2),MultiObj.truePF(:,3),'g+', 'MarkerSize', 5, 'LineWidth', 1.5);
            hold on;
            title(MultiObj.name);
            legend('MODBO','Real PF', 'FontName', 'Times New Roman', 'FontSize', 12);
      else
          legend('MODBO','Real PF', 'FontName', 'Times New Roman', 'FontSize', 12);
      end
        grid on;
        xlabel('f1');
        ylabel('f2');
        zlabel('f3');
end




