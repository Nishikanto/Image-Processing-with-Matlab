%% Edge Detection

%Read image
I = imread('checker.jpg');  
figure, imshow(I);
title('Original Image');

%% Convert rgb to gray image

row = size(I,1);
coloumn = size(I,2);
N = double(zeros(size(I,1),size(I,2)));

for r = 1:row
for c = 1:coloumn
   N(r,c,1) = abs(0.3*I(r,c,1) + 0.6*I(r,c,2) + 0.11*I(r,c,3));
end
end

imshow(uint8(N));
title('Grayscale Image');
%% sobel mask 

h = [-1 0 1; -2 0 2; -1 0 1]; % horizontal 
v = [1 2 1; 0 0 0; -1 -2 -1]; % vertical 

M = (zeros(size(I,1),size(I,2)));
Gx = (zeros(size(I,1),size(I,2)));
Gy = (zeros(size(I,1),size(I,2)));


%% Detect Edge 
for i=1:size(N,1)-2
for j=1:size(N,2)-2
    %Gradient operations
    Gx(i+1, j+1)=sum(sum(v.*N(i:i+2,j:j+2)));
    Gy(i+1, j+1)=sum(sum(h.*N(i:i+2,j:j+2)));
    %Magnitude of vector
    M(i+1,j+1)=Gx(i+1,j+1).^2*Gy(i+1,j+1).^2;
end
end

Gx = Gx.^2;
Gy = Gy.^2;


for r = 1:row
for c = 1:coloumn
  if M(r,c)>175
    M(r,c)=255;
  else
    M(r,c)=0;
  end
end
end


figure, imshow(M);

figure, imshow(Gx);
figure, imshow(Gy);
figure, imshow(M);

h= fspecial('gaussian',[10 10],2); 
Gx = filter2(h,Gx);
Gy = filter2(h,Gy);
M = filter2(h,M);



N = uint8(N);



height = size(N,1);
width = size(N,2);
result = zeros(height,width); 
R = zeros(height,width);

Rmax = 0; 
for i = 1:height
for j = 1:width
M2 = [Gx(i,j) M(i,j);M(i,j) Gy(i,j)]; 
R(i,j) = det(M2)-0.01*(trace(M2))^2;
if R(i,j) > Rmax
Rmax = R(i,j);
end;
end;
end;

cnt = 0;
a = 0;
b = 0;

for i = 3:height-3
for j = 3:width-3
if R(i,j) > 0.05*Rmax && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
   
        result(i,j) = 1;
        cnt = cnt+1;
   
end;
end;
end;

[posc, posr] = find(result == 1);

n = sqrt(size(posr,1));


cnt;
figure, imshow(N);
hold on;
plot(posr,posc,'*');


title((n-1)+(n/4)*(n-3)+(n/4)*((n/2)-1)+(n/4)*((n/4)-1));
figure, imshow(N);



% disp('The number of black box = '); 
% disp((n-1)+(n/4)*(n-3)+(n/4)*((n/2)-1)+(n/4)*((n/4)-1));
 




