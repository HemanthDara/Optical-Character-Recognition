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
end
