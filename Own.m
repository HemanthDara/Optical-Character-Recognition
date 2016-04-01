im=imread('A2Z2.jpg');
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
    [fl re] = lines(re);
    [L Ne] = bwlabel(fl);
    for n=1:Ne
        i=fl;
        [f co]=find(L==n);
        inew=i(min(f):max(f),min(co):max(co));
        %figure,imshow(inew);
        %inew1=imresize(inew,[42 24]);
        comp{1,Ne*g+n}=inew;
    end
    x=x+Ne;
    if size(re,1)==0
        k=k+1;
    end
g=g+1;    
end
real_inputs=[];
real_targets=zeros(26,x);
for i=1:x
    real_inputs(:,i)=zones(comp{1,i});
    if (mod(i,26))==1
        real_targets(1,i)=1;
    end
    if (mod(i,26))==2
        real_targets(2,i)=1;
    end
    if (mod(i,26))==3
        real_targets(3,i)=1;
    end
    if (mod(i,26))==4
        real_targets(4,i)=1;
    end
    if (mod(i,26))==5
        real_targets(5,i)=1;
    end
    if (mod(i,26))==6
        real_targets(6,i)=1;
    end
    if (mod(i,26))==7
        real_targets(7,i)=1;
    end
    if (mod(i,26))==8
        real_targets(8,i)=1;
    end
    if (mod(i,26))==9
        real_targets(9,i)=1;
    end
    if (mod(i,26))==10
        real_targets(10,i)=1;
    end
    if (mod(i,26))==11
        real_targets(11,i)=1;
    end
    if (mod(i,26))==12
        real_targets(12,i)=1;
    end
    if (mod(i,26))==13
        real_targets(13,i)=1;
    end
    if (mod(i,26))==14
        real_targets(14,i)=1;
    end
    if (mod(i,26))==15
        real_targets(15,i)=1;
    end
    if (mod(i,26))==16
        real_targets(16,i)=1;
    end
    if (mod(i,26))==17
        real_targets(17,i)=1;
    end
    if (mod(i,26))==18
        real_targets(18,i)=1;
    end
    if (mod(i,26))==19
        real_targets(19,i)=1;
    end
    if (mod(i,26))==20
        real_targets(20,i)=1;
    end
    if (mod(i,26))==21
        real_targets(21,i)=1;
    end
    if (mod(i,26))==22
        real_targets(22,i)=1;
    end
    if (mod(i,26))==23
        real_targets(23,i)=1;
    end
    if (mod(i,26))==24
        real_targets(24,i)=1;
    end
    if (mod(i,26))==25
        real_targets(25,i)=1;
    end
    if (mod(i,26))==0
        real_targets(26,i)=1;
    end
end
