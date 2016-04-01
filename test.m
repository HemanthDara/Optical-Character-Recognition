im=imread('A2.jpg');
if size(im,3)==3 
    im=rgb2gray(im);
    %figure,imshow(im);
end
threshold = graythresh(im);
i=~im2bw(im,threshold);
i = bwareaopen(i,30);
imshow(i);
[f co]=find(i==1);
i=i(min(f):max(f),min(co):max(co));
[L N] = bwlabel(i);  
features=[];
k=i;
for n=1:N
    im=k;
    [f co]=find(L==n);
    inew=im(min(f):max(f),min(co):max(co));
    features(:,n)=zones(inew);
end