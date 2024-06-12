for i=1001:3000
    pathepr=['D:\Data\nonlinear\bi_pic\' num2str(i) '.mat'];
    pathpoly=['D:\Data\nonlinear\polycsv\' num2str(i) '.csv'];
    [num,epr_int]=gen_poly;
    save(pathepr,'epr_int');
    writematrix(num,pathpoly)
end