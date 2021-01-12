clc;
clear all;
x=rand(2,2);
Y=rand(2,2);
a=2;
r=2;
s=3;
m=2;
c1=0;
f=@(x) x^(1/2);
g=@(x) x^(1/4);
if(max(eig(f(x))<=(exp(r*a))/m))
    c1=c1+1;
end
c2=0;
if(max(eig(g(x))<=(exp(r*a))/m))
    c1=c1+1;
end
if(max(eig(inv(f(x)))<=(exp(r*a))*m))
    c1=c1+1;
end
if(max(eig(inv(g(x)))<=(exp(r*a))*m))
    c1=c1+1;
end
if (c1==4)
    display('condition_A satisfied');
end

l1=(Y^(-1/2))*x*(Y^(-1/2));
l=0.03;
h=(1/(m*2^3));
if(max(eig(f(x)))<=h*(max(eig(l1)))^l)
    c2=1;
end
if(max(eig(g(x)))<=h*(max(eig(l1)))^l)
    c2=1;
end
l1=(x^(-1/2))*Y*(x^(-1/2));
if(max(eig(inv(f(x))))<=h*(max(eig(l1)))^l)
    c2=1;
end
if (c2==1)
       display('condition_B satisfied');
end
if ((c1+c2)==5)
        display('given non linear matrix equation has unique common positive solution');
end 