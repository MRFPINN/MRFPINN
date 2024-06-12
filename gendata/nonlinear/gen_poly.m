function [num,img]=gen_poly()

D=128;
img=zeros(D,D);

while 1
    N=randi(20)+2;
    theta=rand(N,1).*360;
    theta=sort(theta);
    dif=diff(theta);
    if (min(dif)<=15)
        continue
    end
%     r=round(rand(N,1).*D/sqrt(2));
    r=randi(round(D/3));
%     r(r>D/2)=D/2;
    num=[r.*cos(theta/180*pi)+D/2, r.*sin(theta/180*pi)+D/2];
    z=zeros(N,1);
    
    for x=1:D
        for y=1:D
            count=0;
            for i=1:N
                if i<N
                    z(i)=(x-num(i,1))*(y-num(i+1,2))-(y-num(i,2))*(x-num(i+1,1));
                else
                    z(i)=(x-num(i,1))*(y-num(1,2))-(y-num(i,2))*(x-num(1,1));
                end
                if z(i)>0
                    count=count+1;
                end
            end
            if (count==N||count==0)
                img(x,y)=1;
            end
        end
    end
    square=sum(sum(img))/D^2;
    if ((square>0.08) &&(square<0.15))
        %img=1-img;
        break
    end
    img=zeros(D,D);
end
num=num-64.5;
%imshow(img)