function [features] = Attributes(im)
%%im=imread('B.png');
%%im=rgb2gray(im);
%%threshold = graythresh(im);
%%im=im2bw(im,threshold);
[r co]=find(im==1);
im=im(min(r):max(r),min(co):max(co));
[p q]=size(im);
a=(min(co)+max(co))/2;
b=(min(r)+max(r))/2;
c=q;
d=p;
e=0;
edges_ver=0;
edges_hor=0;
b2=0;
d2=0;
x_mean=[];
y_mean=[];
for i=1:p
    for j=1:q
        if im(i,j)==1
            e=e+1;
            x_mean=[x_mean (j-a)];
            y_mean=[y_mean (i-b)];
            if (j~=1)&&(im(i,j-1)==0)  
                edges_ver=edges_ver+1;
                b2=b2+i;
            end   
            if (i~=p)&&(im(i+1,j)==0) 
                edges_hor=edges_hor+1;
                d2=d2+j;
            end
        end
    end
    if im(i,1)==1
        edges_ver=edges_ver+1;
        b2=b2+i;
    end    
end
for j=1:q
    if im(p,j)==1
        edges_hor=edges_hor+1;
        d2=d2+j;
    end
end
f=(mean(x_mean))/c;
a1=(mean(y_mean))/d;
x_sqr=x_mean.^2;
y_sqr=y_mean.^2;
b1=(mean(x_sqr));
c1=(mean(y_sqr));
xy=x_mean.*y_mean;
d1=(mean(xy));
x2y=x_sqr.*y_mean;
e1=(mean(x2y));
y2x=y_sqr.*x_mean;
f1=(mean(y2x));
a2=edges_ver/c;
c2=edges_hor/d;
features=[f a1 b1 c1 d1 e1 f1 a2 b2 c2 d2];
features=features';
end