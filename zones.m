function [on] =zones(i)
% i=imread('AI.jpg');
i=imresize(i,[10,10]);
% i=rgb2gray(i);
% threshold = graythresh(i);
% i=im2bw(i,threshold);
im=imresize(i,[90 60]);
parts={};
on=[];
m=[];
n=[];
no=[];
c=[10 18 16 14 12 10 8 6 4 2];
for i=1:9
    for j=1:6
        parts{i,j}=im((i-1)*10+1:i*10,(j-1)*10+1:j*10);
        x=parts{i,j};
        k=zeros(1,10);
        for r=1:10
            for p=1:10
                if r+p==11 && x(r,p)==1
                k(1)=k(1)+1;
                end
                if (r+p==10 || r+p==12) && x(r,p)==1
                k(2)=k(2)+1;
                end
                if (r+p==9 || r+p==13) && x(r,p)==1
                k(3)=k(3)+1;
                end
                if (r+p==8 || r+p==14) && x(r,p)==1
                k(4)=k(4)+1;
                end
                if (r+p==7 || r+p==15) && x(r,p)==1
                k(5)=k(5)+1;
                end
                if (r+p==6 || r+p==16) && x(r,p)==1
                k(6)=k(6)+1;
                end
                if (r+p==5 || r+p==17) && x(r,p)==1
                k(7)=k(7)+1;
                end
                if (r+p==4 || r+p==18) && x(r,p)==1
                k(8)=k(8)+1;
                end
                if (r+p==3 || r+p==19) && x(r,p)==1
                k(9)=k(9)+1;
                end
                if (r+p==2 || r+p==20) && x(r,p)==1
                k(10)=k(10)+1;
                end
            end
        end
        no(i,j)=sum(k)/100;
        k=k./c;
        s=mean(k);
        on((i-1)*6+j)=s;
    end
end
m=mean(no);
n=mean(no,2);
on=[on m];
n=n';
on=[on n];
on=on';