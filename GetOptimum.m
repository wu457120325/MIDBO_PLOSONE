%1-5:ZDT1、ZDT2、ZDT3、ZDT4、ZDT6
%6-12：DTLZ1-DTLZ7
%13-22：wfg1-wfg9,10
%23-32：uf1-uf10
%33-42：cf1-cf10
%43-46:Viennet1-4
function R = GetOptimum(TestProblem,N,M)
addpath('./small_func')
switch TestProblem
    case 1
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^0.5;
    case 2
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^2;
    case 3
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^0.5 - R(:,1).*sin(10*pi*R(:,1));
        R      = R(NDSort(R,1)==1,:);
    case 4
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^0.5;
    case 5
        minf1  = 0.280775;
        R(:,1) = linspace(minf1,1,N)';
        R(:,2) = 1 - R(:,1).^2;
    case 6
        R = UniformPoint(N,M)/2;
    case 7
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
    case 8
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
    case 9
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
    case 10
        R = [0:1/(N-1):1;1:-1/(N-1):0]';
        R = R./repmat(sqrt(sum(R.^2,2)),1,size(R,2));
        R = [R(:,ones(1,M-2)),R];
        R = R./sqrt(2).^repmat([M-2,M-2:-1:0],size(R,1),1);
    case 11
        R = [0:1/(N-1):1;1:-1/(N-1):0]';
        R = R./repmat(sqrt(sum(R.^2,2)),1,size(R,2));
        R = [R(:,ones(1,M-2)),R];
        R = R./sqrt(2).^repmat([M-2,M-2:-1:0],size(R,1),1);
    case 12
        interval     = [0,0.251412,0.631627,0.859401];
        median       = (interval(2)-interval(1))/(interval(4)-interval(3)+interval(2)-interval(1));
        X            = UniformPoint(N,M-1,'grid');
        X(X<=median) = X(X<=median)*(interval(2)-interval(1))/median+interval(1);
        X(X>median)  = (X(X>median)-median)*(interval(4)-interval(3))/(1-median)+interval(3);
        R            = [X,2*(M-sum(X/2.*(1+sin(3*pi.*X)),2))];
    case 13
        R = UniformPoint(N,M);
        c = ones(size(R,1),M);
        for i = 1 : size(R,1)
            for j = 2 : M
                temp = R(i,j)/R(i,1)*prod(1-c(i,M-j+2:M-1));
                c(i,M-j+1) = (temp^2-temp+sqrt(2*temp))/(temp^2+1);
            end
        end
        x = acos(c)*2/pi;
        temp = (1-sin(pi/2*x(:,2))).*R(:,M)./R(:,M-1);
        a = 0 : 0.0001 : 1;
        E = abs(temp*(1-cos(pi/2*a))-1+repmat(a+cos(10*pi*a+pi/2)/10/pi,size(x,1),1));
        [~,rank] = sort(E,2);
        for i = 1 : size(x,1)
            x(i,1) = a(min(rank(i,1:10)));
        end
        R      = convex(x);
        R(:,M) = mixed(x);
        R      = repmat(2:2:2*M,size(R,1),1).*R;
    case 14
        M = M;
        R = UniformPoint(N,M);
        c = ones(size(R,1),M);
        for i = 1 : size(R,1)
            for j = 2 : M
                temp = R(i,j)/R(i,1)*prod(1-c(i,M-j+2:M-1));
                c(i,M-j+1) = (temp^2-temp+sqrt(2*temp))/(temp^2+1);
            end
        end
        x = acos(c)*2/pi;
        temp = (1-sin(pi/2*x(:,2))).*R(:,M)./R(:,M-1);
        a = 0 : 0.0001 : 1;
        E = abs(temp*(1-cos(pi/2*a))-1+repmat(a.*cos(5*pi*a).^2,size(x,1),1));
        [~,rank] = sort(E,2);
        for i = 1 : size(x,1)
            x(i,1) = a(min(rank(i,1:10)));
        end
        R      = convex(x);
        R(:,M) = disc(x);
        R      = R(NDSort(R,1)==1,:);
        R      = repmat(2:2:2*M,size(R,1),1).*R;
    case 15
        X = linspace(0,1,N)';
        X = [X,zeros(N,M-2)+0.5,zeros(N,1)];
        R = linear2(X);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 16
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 17
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 18
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 19
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 20
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 21
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 22
        R = UniformPoint(N,M);
        R = R./repmat(sqrt(sum(R.^2,2)),1,M);
        R = repmat(2:2:2*M,size(R,1),1).*R;
    case 23
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^0.5;
    case 24
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^0.5;
    case 25
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^0.5;
    case 26
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^2;
    case 27
        R(:,1) = (0:1:20)'/20;
        R(:,2) = 1 - R(:,1);
    case 28
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1);
        R(R(:,1)>0 & R(:,1)<1/4 | R(:,1)>1/2 & R(:,1)<3/4,:) = [];
    case 29
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1);
    case 30
        R = UniformPoint(N,3);
        R = R./repmat(sqrt(sum(R.^2,2)),1,3);
    case 31
        R = UniformPoint(N,3);
        R(R(:,1)>(1-R(:,3))/4 & R(:,1)<(1-R(:,3))*3/4,:) = [];
    case 32
        R = UniformPoint(N,3);
        R = R./repmat(sqrt(sum(R.^2,2)),1,3);
    case 33
        R(:,1) = (0:1/20:1)';
        R(:,2) = 1 - R(:,1);
    case 34
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - sqrt(R(:,1));
        R(0<R(:,1) & R(:,1)<1/16 | 1/4<R(:,1) & R(:,1)<9/16,:) = [];
    case 35
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1).^2;
        R(0<R(:,1) & R(:,1)<1/2 | sqrt(1/2)<R(:,1) & R(:,1)<sqrt(3/4),:) = [];
    case 36
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1);
        temp1  = 0.5<R(:,1) & R(:,1)<=0.75;
        temp2  = 0.75<R(:,1);
        R(temp1,2) = -0.5*R(temp1,1) + 3/4;
        R(temp2,2) = 1 - R(temp2,1) + 0.125;
    case 37
        R(:,1) = linspace(0,1,N)';
        R(:,2) = 1 - R(:,1);
        temp1  = 0.5<R(:,1) & R(:,1)<=0.75;
        temp2  = 0.75<R(:,1);
        R(temp1,2) = -0.5*R(temp1,1) + 3/4;
        R(temp2,2) = 1 - R(temp2,1) + 0.125;
    case 38
        R(:,1) = linspace(0,1,N)';
        R(:,2) = (1-R(:,1)).^2;
        temp1  = 0.5<R(:,1) & R(:,1)<=0.75;
        temp2  = 0.75<R(:,1);
        R(temp1,2) = 0.5*(1-R(temp1,1));
        R(temp2,2) = 0.25*sqrt(1-R(temp2,1));
    case 39
        R(:,1) = linspace(0,1,N)';
        R(:,2) = (1-R(:,1)).^2;
        temp1  = 0.5<R(:,1) & R(:,1)<=0.75;
        temp2  = 0.75<R(:,1);
        R(temp1,2) = 0.5*(1-R(temp1,1));
        R(temp2,2) = 0.25*sqrt(1-R(temp2,1));
    case 40
        N      = ceil(N/5)*5;
        R      = zeros(N,3);
        R(:,3) = repmat(sin((0:1/(N/5-1):1).*pi/2)',5,1);
        for i = 0 : 4
            R(i*N/5+1:(i+1)*N/5,1) = sqrt(i/4*(1-R(i*N/5+1:(i+1)*N/5,3).^2));
        end
        R(:,2) = sqrt(max(1-R(:,1).^2-R(:,3).^2,0));
    case 41
        R = UniformPoint(N,3);
        R = R./repmat(sqrt(sum(R.^2,2)),1,3);
        R(1e-5<R(:,1) & R(:,1)<sqrt((1-R(:,3).^2)/4) | sqrt((1-R(:,3).^2)/2)<R(:,1) & R(:,1)<sqrt(3*(1-R(:,3).^2)/4),:) = [];
    case 42
        R = UniformPoint(N,3);
        R = R./repmat(sqrt(sum(R.^2,2)),1,3);
        R(1e-5<R(:,1) & R(:,1)<sqrt((1-R(:,3).^2)/4) | sqrt((1-R(:,3).^2)/2)<R(:,1) & R(:,1)<sqrt(3*(1-R(:,3).^2)/4),:) = [];
end

