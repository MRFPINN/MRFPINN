n=1;
while(n<=1)
    disp(n);
    try
    pathepr=['D:\Data\chiral\bi_pic\' num2str(n) '.mat'];
    pathpoly=['D:\Data\chiral\polycsv\' num2str(n) '.csv'];
    [num,epr_int]=gen_poly;
    save(pathepr,'epr_int');
    writematrix(num,pathpoly)
    %pathepr=['D:\Data\chiral\bi_pic\' num2str(n) '.mat'];
    load(pathepr);
    c=299792458;
    theta=rand*2*pi;
    eps=2*rand+1;
    eps_mat=(eps-1)*epr_int+1;
    save(['eps\' num2str(n) '.mat'],"eps_mat");
    mu=2*rand+1;
    mu_mat=(mu-1)*epr_int+1;
    save(['mu\' num2str(n) '.mat'],'mu_mat');
    kai=0.5*rand;
    kai_mat=kai*epr_int;
    save(['kai\' num2str(n) '.mat'],'kai_mat');

    f=3e6+1e6*rand;
    k=2*pi*f/c;

    eps_RCP=eps*(1+kai);
    eps_RCP_mat=(eps_RCP-1)*epr_int+1;
    mu_RCP=mu*(1+kai);
    mu_RCP_mat=(mu_RCP-1)*epr_int+1;
    k2_RCP_mat=k^2.*eps_RCP_mat.*mu_RCP_mat;
    save(['k2_RCP\' num2str(n) '.mat'],'k2_RCP_mat');
    genRCP(eps_RCP,mu_RCP,theta,f,n);
    dataR=table2array(readtable(['D:\Data\chiral\data_RCP\' num2str(n) '.csv'],'VariableNamingRule','preserve'));
    x0=reshape(dataR(:,1),148,148);
    x=x0(11:138,11:138);
    y0=reshape(dataR(:,2),148,148);
    y=y0(11:138,11:138);
    ExR0=reshape(dataR(:,3),148,148);
    ExR=ExR0(11:138,11:138);
    EyR0=reshape(dataR(:,4),148,148);
    EyR=EyR0(11:138,11:138);
    EzR0=reshape(dataR(:,5),148,148);
    EzR=EzR0(11:138,11:138);
    HzR0=reshape(dataR(:,6),148,148);
    HzR=HzR0(11:138,11:138);
    save(['E_RCP\' num2str(n) '.mat'],"EzR","HzR");

    eps_LCP=eps*(1-kai);
    eps_LCP_mat=(eps_LCP-1)*epr_int+1;
    mu_LCP=mu*(1-kai);
    mu_LCP_mat=(mu_LCP-1)*epr_int+1;
    k2_LCP_mat=k^2.*eps_LCP_mat.*mu_LCP_mat;
    save(['k2_LCP\' num2str(n) '.mat'],'k2_LCP_mat');
    genLCP(eps_LCP,mu_LCP,theta,f,n);
    dataL=table2array(readtable(['D:\Data\chiral\data_LCP\' num2str(n) '.csv'],'VariableNamingRule','preserve'));
    % x0=reshape(dataL(:,1),148,148);
    % x=x0(11:138,11:138);
    % y0=reshape(dataL(:,2),148,148);
    % y=y0(11:138,11:138);
    ExL0=reshape(dataL(:,3),148,148);
    ExL=ExL0(11:138,11:138);
    EyL0=reshape(dataL(:,4),148,148);
    EyL=EyL0(11:138,11:138);
    EzL0=reshape(dataL(:,5),148,148);
    EzL=EzL0(11:138,11:138);
    HzL0=reshape(dataL(:,6),148,148);
    HzL=HzL0(11:138,11:138);
    save(['E_LCP\' num2str(n) '.mat'],"EzL","HzL");

    %[x,y]=meshgrid(-63.5:63.5,-63.5:63.5);
    w=exp(-1j*k*(x*cos(theta)+y*sin(theta)));
    wave=sign(angle(w));
    save(['D:\Data\chiral\wave\' num2str(n) '.mat'],'wave');

    catch
    n=n-1;
    end
    n=n+1;
    
end