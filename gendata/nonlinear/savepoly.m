for i=1:1
    path0=['D:\Data\nonlinear\polycsv\' num2str(i) '.csv'];
    A=importdata(path0);
    plot(A);
    hold on
    B=fliplr(A);
    plot(B);
    path1=['D:\Data\nonlinear\polycsv\' num2str(i+1000) '.csv'];
    writematrix(B,path1);
end