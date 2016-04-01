no=[107 48 70 96 228 69 46 77 115 49 34 98 73 120 192 67 42 148 166 184 98 74 63 35 69 32];
t=0;
y=0;
real_inputs=[];
real_targets=[];
for m=1:26
im=imread(strcat(num2str(m),'.jpeg'));
if size(im,3)==3 
    im=rgb2gray(im);
    %figure,imshow(im);
end
threshold = graythresh(im);
i=~im2bw(im,threshold);
i = bwareaopen(i,30);
imshow(i);
fl=[];
re=i;
k=0;
g=0;
x=0;
comp={};
while k==0
    [fl re]=lines(re);
    [L Ne] = bwlabel(fl);
    for n=1:Ne
        i=fl;
        [f co]=find(L==n);
        inew=i(min(f):max(f),min(co):max(co));
        %figure,imshow(inew);
        %inew1=imresize(inew,[42 24]);
        comp{1,x+n}=inew;
    end
    x=x+Ne;
    if size(re,1)==0
        k=k+1;
    end
g=g+1;    
end
for i=1:x
    real_inputs(:,y+i)=zones(comp{1,i});
end
for i=y+1:y+no(m) 
    real_targets(m,i)=1;
    t=t+1;
end
y=t;
% for i=x:x+no(2) 
%     real_targets(2,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(3)
%     real_targets(3,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(4)
%     real_targets(4,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(5)
%     real_targets(5,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(6)
%     real_targets(6,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(7)
%     real_targets(7,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(8)
%     real_targets(8,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(9)
%     real_targets(9,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(10)
%     real_targets(10,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(11)
%     real_targets(11,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(12)
%     real_targets(12,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(13)
%     real_targets(13,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(14)
%     real_targets(14,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(15)
%     real_targets(15,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(16)
%     real_targets(16,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(17)
%     real_targets(17,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(18)
%     real_targets(18,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(19)
%     real_targets(19,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(20)
%     real_targets(20,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(21)
%     real_targets(21,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(22)
%     real_targets(22,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(23)
%     real_targets(23,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(24)
%     real_targets(24,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(25)
%     real_targets(25,i)=1;
%     t=t+1;
% end
% x=t;
% for i=x:x+no(26)
%     real_targets(26,i)=1;
%     t=t+1;
end