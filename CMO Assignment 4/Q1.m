% Mohit Kumar SR No.- 19825
% CMO Assignment 4
% Question 1

clear all;
clc;
close all;

M=readmatrix('a4q1.csv'); % reading data from excel file
x=M(1:2,:); % arranging the data
y=M(3,:);
w0=[1,-1]'; % initial point
points=[w0]; % array to store the points
red=[]; blue=[];A=[];
b=-1*ones(10,1); % b matrix
for i=1:10 % construcing the A matrix
    if(y(i)==1)
        red=[red,x(:,i)];
        A=[A;-x(:,i)'];
    else
        blue=[blue,x(:,i)];
        A=[A;x(:,i)'];
    end
end

H=eye(2); % hessian matrix
maxiter=2; % maximum iterations
k=0;
stop=0; % stop flag
val=A*w0;
W=[];
w=w0;
for i=1:10 % constructing initial working set
    if(val(i)==b(i))
        W=union(W,i);
    end
end
while((stop~=1)&(k<maxiter)) % active set algorithm
    Aeq=[];beq=[];
    bt=[];
    for j=1:size(W)
        Aeq=[Aeq;A(W(j),:)];
        beq=[beq;0];
    end
    
    d=quadprog(H,w,[],[],Aeq,beq); % calculating descent direction
    if(d==0)
        lamdba=-inv(A*A')*b;
        lq=lambda(W(1));idx=W(1);
        for k=2:size(W)
            if(lq>lambda(W(k)))
                lq=lambda(W(k));
                idx=W(k);
            end
        end
        if(lq>=0)
            stop=1;
        else
            W=setdiff(W,idx); % updating working set
        end
    else
        temp=10e3;
        for m=1:10
            if(A(m,:)*d>0)
                val=((b(m)-A(m,:)*w)/(A(m,:)*d));
                if((val<temp)&(val>0))
                    temp=val;
                    id2=m;
                end
            end
        end
        alpha=min(temp,1); % step size
        w=w+alpha*d; % new point
        points=[points,w]; % storing the new point
        if(temp<1)
            W=union(W,id2); % updating the working set
        end
    end
    if(stop==0)
        k=k+1;
    end
end
% plotting
plot(red(1,:),red(2,:),'rx',blue(1,:),blue(2,:),'bo',points(1,:),points(2,:),'gd');
xlabel('x');ylabel('y');