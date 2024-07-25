function MultiObj = GetFunInfo_MMF(TestProblem) % CEEC2020测试函数MMF
%% Add path


switch TestProblem
    case 1
        name='MMF1';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF1(x);
        xl=[1 -1];     % the low bounds of the decision variables
        xu=[3 1];      % the up bounds of the decision variables
        repoint=[1.1,1.1]; % reference point used to calculate the Hypervolume, it is set to 1.1*(max value of f_i)
        N_ops=2;
        load('./Reference_PSPF_data/MMF1_Reference_PSPF_data.mat');
        truPS(:,1) = linspace(1,3,400)';
        truPS(:,2) = sin(6*pi*abs(truPS(:,1)-2)+pi);
        MultiObj.truePF = PF;
        MultiObj.truePS = truPS;
    case 2
        name='MMF2';
        numOfObj=2;
        nVar=2;
        CostFunction=@(x) MMF2(x);
        xl=[0 0];
        xu=[1 2];
        repoint=[1.1,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF2_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 3
        name='MMF4';
        numOfObj=2;
        nVar=2;
        CostFunction=@(x) MMF4(x);
        xl=[-1 0];
        xu=[1 2];
        repoint=[1.1,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF4_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 4
        name='MMF5';
        numOfObj=2;
        nVar=2;
        CostFunction=@(x) MMF5(x);
        xl=[1 -1];
        xu=[3 3];
        repoint=[1.1,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF5_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 5
        name='MMF7';
        numOfObj=2;
        nVar=2;
        CostFunction=@(x) MMF7(x);
        xl=[1 -1];
        xu=[3 1];
        repoint=[1.1,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF7_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 6
        name='MMF8';
        numOfObj=2;
        nVar=2;
        CostFunction=@(x) MMF8(x);
        xl=[-pi 0];
        xu=[pi 9];
        repoint=[1.1,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF8_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 7
        name='MMF10';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF10(x);
        xl=[0.1 0.1];     % the low bounds of the decision variables
        xu=[1.1 1.1];      % the up bounds of the decision variables
        repoint=[1.21,13.2]; % reference point used to calculate the Hypervolume
        N_ops=1;
        load('./Reference_PSPF_data/MMF10_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 8
        name='MMF11';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF11(x);
        xl=[0.1 0.1];     % the low bounds of the decision variables
        xu=[1.1 1.1];      % the up bounds of the decision variables
        repoint=[1.21,15.4];
        N_ops=1;
        load('./Reference_PSPF_data/MMF11_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 9
        name='MMF12';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF12(x);
        xl=[0 0];     % the low bounds of the decision variables
        xu=[1 1];      % the up bounds of the decision variables
        repoint=[1.54,1.1];
        N_ops=1;
        load('./Reference_PSPF_data/MMF12_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 10
        %*need to be modified
        name='MMF13';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=3;       % the dimensions of the objective space
        CostFunction=@(x) MMF13(x);
        xl=[0.1 0.1 0.1];     % the low bounds of the decision variables
        xu=[1.1 1.1 1.1];      % the up bounds of the decision variables
        repoint=[1.54,15.4];
        N_ops=1;
        load('./Reference_PSPF_data/MMF13_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 11
        name='MMF14';  % function name
        numOfObj=3;       % the dimensions of the decision space
        nVar=3;       % the dimensions of the objective space
        CostFunction=@(x) MMF14(x);
        xl=[0 0 0];     % the low bounds of the decision variables
        xu=[1 1 1];      % the up bounds of the decision variables
        repoint=[2.2,2.2,2.2];
        N_ops=2;
        load('./Reference_PSPF_data/MMF14_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 12
        name='MMF15';  % function name
        numOfObj=3;       % the dimensions of the decision space
        nVar=3;       % the dimensions of the objective space
        CostFunction=@(x) MMF15(x);
        xl=[0 0 0];     % the low bounds of the decision variables
        xu=[1 1 1];      % the up bounds of the decision variables
        repoint=[2.5,2.5,2.5];
        N_ops=1;
        load('./Reference_PSPF_data/MMF15_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 13
        name='MMF1_e';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF1_e(x);
        xl=[1 -20];     % the low bounds of the decision variables
        xu=[3 20];      % the up bounds of the decision variables
        repoint=[1.1,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF1_e_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 14
        name='MMF14_a';  % function name
        numOfObj=3;
        nVar=3;
        CostFunction=@(x) MMF14_a(x);
        xl=[0 0 0];
        xu=[1 1 1];
        repoint=[2.2,2.2,2.2];
        N_ops=2;
        load('./Reference_PSPF_data/MMF14_a_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 15
        name='MMF15_a';  % function name
        numOfObj=3;
        nVar=3;
        CostFunction=@(x) MMF15_a(x);
        xl=[0 0 0];
        xu=[1 1 1];
        repoint=[2.5,2.5,2.5];
        N_ops=1;
        load('./Reference_PSPF_data/MMF15_a_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 16
        name='MMF10_l';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF10_l(x);
        xl=[0.1 0.1];     % the low bounds of the decision variables
        xu=[1.1 1.1];      % the up bounds of the decision variables
        repoint=[1.21,13.2]; % reference point used to calculate the Hypervolume
        N_ops=2;
        load('./Reference_PSPF_data/MMF10_l_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 17
        name='MMF11_l';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF11_l(x);
        xl=[0.1 0.1];     % the low bounds of the decision variables
        xu=[1.1 1.1];      % the up bounds of the decision variables
        repoint=[1.21,15.4];
        N_ops=2;
        load('./Reference_PSPF_data/MMF11_l_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 18
        name='MMF12_l';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=2;       % the dimensions of the objective space
        CostFunction=@(x) MMF12_l(x);
        xl=[0 0];     % the low bounds of the decision variables
        xu=[1 1];      % the up bounds of the decision variables
        repoint=[1.54,1.1];
        N_ops=2;
        load('./Reference_PSPF_data/MMF12_l_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 19
        %*need to be modified
        name='MMF13_l';  % function name
        numOfObj=2;       % the dimensions of the decision space
        nVar=3;       % the dimensions of the objective space
        CostFunction=@(x) MMF13_l(x);
        xl=[0.1 0.1 0.1];     % the low bounds of the decision variables
        xu=[1.1 1.1 1.1];      % the up bounds of the decision variables
        repoint=[1.54,15.4];
        N_ops=2;
        load('./Reference_PSPF_data/MMF13_l_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 20
        name='MMF15_l';  % function name
        numOfObj=3;       % the dimensions of the decision space
        nVar=3;       % the dimensions of the objective space
        CostFunction=@(x) MMF15_l(x);
        xl=[0 0 0];     % the low bounds of the decision variables
        xu=[1 1 1];      % the up bounds of the decision variables
        repoint=[2.5,2.5,2.5];
        N_ops=2;
        load('./Reference_PSPF_data/MMF15_l_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 21
        name='MMF15_a_l';  % function name
        numOfObj=3;
        nVar=3;
        CostFunction=@(x) MMF15_a_l(x);
        xl=[0 0 0];
        xu=[1 1 1];
        repoint=[2.5,2.5,2.5];
        N_ops=2;
        load('./Reference_PSPF_data/MMF15_a_l_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 22
        name='MMF16_l1';  % function name
        numOfObj=3;
        nVar=3;
        CostFunction=@(x) MMF16_l1(x);
        xl=[0 0 0];
        xu=[1 1 1];
        repoint=[2.5,2.5,2.5];
        N_ops=3;
        load('./Reference_PSPF_data/MMF16_l1_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 23
        name='MMF16_l2';  % function name
        numOfObj=3;
        nVar=3;
        CostFunction=@(x) MMF16_l2(x);
        xl=[0 0 0];
        xu=[1 1 1];
        repoint=[2.5,2.5,2.5];
        N_ops=3;
        load('./Reference_PSPF_data/MMF16_l2_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
    case 24
        name='MMF16_l3';  % function name
        numOfObj=3;
        nVar=3;
        CostFunction=@(x) MMF16_l3(x);
        xl=[0 0 0];
        xu=[1 1 1];
        repoint=[2.5,2.5,2.5];
        N_ops=4;
        load('./Reference_PSPF_data/MMF16_l3_Reference_PSPF_data.mat');
        MultiObj.truePF = PF;
        MultiObj.truePS = PS;
end
MultiObj.nVar=nVar;
MultiObj.var_min = xl;
MultiObj.var_max =xu;
MultiObj.fun=CostFunction;
MultiObj.repoint = repoint;
MultiObj.numOfObj=numOfObj;
MultiObj.name=name;
end
