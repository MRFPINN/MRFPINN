for i=1:3000
    pathepr=['D:\Data\chiral\bi_pic\' num2str(i) '.mat'];
    pathpoly=['D:\Data\chiral\polycsv\' num2str(i) '.csv'];
    [num,epr_int]=gen_poly;
    save(pathepr,'epr_int');
    writematrix(num,pathpoly)
end