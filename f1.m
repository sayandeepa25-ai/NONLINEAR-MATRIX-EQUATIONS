clc;
clear all;
Ai=[3+2j 4+5j;-7+1j 8-2j];
Aic=[3-2j 4-5j;-7-1j 8+2j];
Q1=[2 1j;-1j 2];
Q2=[3 7j;-7j 3];
s=2;
iter=10;
x=ones(2,2);


for K=1:35
    A1=x;
    if (rem(K,2)~=0)
    x=(Q1+((Aic)*x^(1/2))*Ai)^(1/2);
    error1(K)=sum(sum(abs(x-((Q1+((Aic)*x^(1/2))*Ai)^(1/2)))))/4;
    end
    if (rem(K,2)==0)
    x=(Q2+(((Aic)*x^(1/3))*Ai))^(1/2);
     error2(K)=sum(sum(abs(x-((Q2+((Aic)*x^(1/3))*Ai)^(1/2)))))/4;
    end
    A2=x;
      
end
jj=1;
jj1=1;
t=find(error1==0);
error1(t)=[];
t=find(error2==0);
error2(t)=[];

for i=1:35
if (rem(i,2)~=0)
    kp1(i)=i;
    jj=jj+1;
end
if (rem(i,2)==0)
    kp2(jj1)=i;
    jj1=jj1+1;
end
end
a=find(kp1==0);
kp1(a)=[];
b=find(kp2==0);
kp2(b)=[];
figure;
plot(kp1,error1);
hold on;
plot(kp1,error1,'o');
grid on
legend();
hold on;
plot(kp2,error2);
hold on;
plot(kp2,error2,'o');
grid on
xlabel('iterations');
ylabel('error');
legend('curve1','points1','curve2','points2');
display('solution is');
disp(x);

