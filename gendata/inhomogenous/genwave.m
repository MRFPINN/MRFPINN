function [B] = genwave(A)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
B=zeros(size(A));
for i=1:128
    for j=1:128
        if(A(i,j)>=0)
            B(i,j)=1;
        end
    end
end