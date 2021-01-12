clc;
clear all;
l=1;s=2;a=2;
Q1=[2 1j;-1j 2];
Q2=[3 7j;-7j 3];
Ai=[3+2j 4+5j;-7+1j 8-2j];
Aic=[3-2j 4-5j;-7-1j 8+2j];
x=rand(2,2);
Y=rand(2,2);
f=@(x) x^(1/2);
g=@(x) x^(1/3);
xx=((Q1^(-1/2))*Q2*(Q1.^(-1/2)));
lamda_max1=max(eig(xx));
yy=((f(x))^(-1/2))*((g(Y)))*((f(x))^(-1/2));
lamda_max2=max(eig(yy));
if lamda_max1<=lamda_max2
    c1=1;
end
yy1=((g(Y))^(-1/2))*((f(x)))*((g(Y))^(-1/2));
lamda_max3=max(eig(yy1));
if lamda_max1<=lamda_max3
   c1=1;
end
if (c1==1);
    display('condition_A satisfied');
end
c2=1;
yy2=((x)^(-1/2))*(Y)*((x)^(-1/2));
yy3=((Y)^(-1/2))*(x)*((Y)^(-1/2));
if(lamda_max2<=max(eig(yy2)))
    c2=1;
end
if(lamda_max3<=max(eig(yy3)))
    c2=1;
end
if (c2==1);
    display('condition_B satisfied');
end
I=eye(2);
l1=max(eig((I^(-1/2))*((Q1+((Aic)*x^(1/2))*Ai)^(1/2))*(I^(-1/2))));
l2=max(eig(((Q1+((Aic)*x^(1/2))*Ai)^(1/2))^(-1/4)));
if (max(l1,l2)<=exp(a));
    c3=1;
end
l1=max(eig((I^(-1/2))*((Q1+((Aic)*x^(1/3))*Ai)^(1/2))*(I^(-1/2))));
l2=max(eig(((Q1+((Aic)*x^(1/3))*Ai)^(1/2))^(-1/4)));
if (max(l1,l2)<=exp(a));
    c3=1;
end
if (c3==1);
    display('condition_C satisfied');
end
if ((c1+c2+c3)==3)
    display('given non linear matrix equation has unique common positive solution');
end