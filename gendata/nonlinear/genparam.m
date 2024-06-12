for i=1:1000
    disp(i);
    path='D:\Data\nonlinear\data.txt';
    a=rand+1;
    b=rand+1;
    Em=rand+1;
    theta=rand*2*pi-pi;
    f=rand*2e6+3e6;
    fileID=fopen(path,"w");
    fprintf(fileID,'a %f\n',a);
    fprintf(fileID,'b %f\n',b);
    fprintf(fileID,'Em %f\n',Em);
    fprintf(fileID,'theta %f\n',theta);
    fprintf(fileID,'f %f\n',f);
    fclose(fileID);
    pause(30);
    
end