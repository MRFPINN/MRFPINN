i=1;
x=linspace(-63.5,63.5,128);
y=x;
[xx,yy]=meshgrid(x,y);
while(i<=10)
    disp(i);
    try
    a=rand*5;
    b=rand*5;
    c=rand*5;
    d=rand*5;
    e=rand*5;
    x0=rand*1-0.5;
    y0=rand*1-0.5;
    ki=rand*3.5+0.5;
    theta=randn*2*pi;
    f=3e6+rand*2e6;
    k=2*pi*f/299792458;
    gendata(a,b,c,d,e,x0,y0,ki,theta,f,i);
    param=[a,b,c,d,e,x0,y0,ki,theta,f];
    wave=real(exp(1j*k*(xx*cos(theta)+yy*sin(theta))));
    epr=1+ki*exp(-a*(xx/64-x0).^4-b*(xx/64-x0).^2.*(yy/64-y0).^2-c*(yy/64-y0).^4-d*(xx/64-x0).^2-e*(yy/64-y0).^2);
    k2=k.^2.*epr;
    % % % %
    path=['D:\inhomogeneous\Hz0\' num2str(i) '.csv'];
    Hzdata=readmatrix(path);
    Hz0=reshape(Hzdata(:,3),148,148);
    xx0=reshape(Hzdata(:,1),148,148);
    yy0=reshape(Hzdata(:,2),148,148);
    xx=xx0(11:138,11:138);
    yy=yy0(11:138,11:138);
    Hz=Hz0(11:138,11:138)*120*pi;

    % % % % % % %
    pathk2=['D:\inhomogeneous\k2\' num2str(i) '.mat'];
    save(pathk2,'k2');
    pathHz=['D:\inhomogeneous\Hz\' num2str(i) '.mat'];
    save(pathHz,"Hz");
    pathparam=['D:\inhomogeneous\param\' num2str(i) '.mat'];
    save(pathparam,"param");
    patheps=['D:\inhomogeneous\eps\' num2str(i) '.mat'];
    save(patheps,"epr");
    pathwave=['D:\inhomogeneous\wave\' num2str(i) '.mat'];
    save(pathwave,"wave");

    catch
    i=i-1;
    end
    i=i+1;
end

%%
figure
pcolor(xx,yy,real(Hz));
shading interp
colormap("jet")
axis square
colorbar


Ks=[0 0 -1 0 0;
    0 0 16 0 0;
    -1 16 -60 16 -1;
    0 0 16 0 0;
    0 0 -1 0 0]/12;

L1=1./epr.*nabladot(epr,Hz);
L2=conv2(Hz,Ks,'same')+k2.*Hz;
Lx=abs(L2);
loss1=sum(sum(Lx));
L=abs(L1+L2);
loss2=sum(sum(L));

figure
pcolor(xx(3:126,3:126),yy(3:126,3:126),abs(L(3:126,3:126)));
colormap("jet")
shading interp
axis square
colorbar

figure
pcolor(xx,yy,epr);
colormap("jet")
shading interp
axis square
colorbar
function [out] = nabladot(epr,Hz)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
Ky=[1 -8 0 8 -1]'/12;
Kx=[1 -8 0 8 -1]/12;
epr_y=conv2(epr,Ky,'same');
epr_x=conv2(epr,Kx,'same');
Hz_y=conv2(Hz,Ky,'same');
Hz_x=conv2(Hz,Kx,'same');
out=epr_y.*Hz_y+epr_x.*Hz_x;
end