clear variables, close all;

iso = [100,200,400,800,1600,3200,6400,12800];

for i = 1:8
    frame = sprintf('iso%d.jpg',iso(i));
    I= imread(frame);
    Ig=rgb2gray(I);
    region = Ig(834:985,1243:1460);
    moy = mean2(region);
    et = std2(region);
    SNR(i) = 20*log10(moy/et);
    figure(1);
    subplot(2,4,i);imshow(Ig);title([moy,et]);
    
end

figure(2);
plot(iso,SNR);



Iss = imresize(I,0.25);
Ios_b = imresize(Iss,4,'bilinear') ;
Ios_c = imresize(Iss,4,'bicubic') ;
figure(3);
subplot(211);imshow(Ios_b);title('Ios_b');
subplot(212);imshow(Ios_c);title('Ios_c');


%% RGB
mire = imread('mire.jpg');
iso100 = imread('iso100.jpg');

mireR = mire;
mireR(:,:,2:3) = 0;
mireRB(:,:,1) = 0;

figure(4);
subplot(221);imshow(rgb2gray(mire));title('gris');
subplot(222);imshow(mireR);title('rouge');
subplot(223);imshow(rgb2hsv(mire));title('hsv');
subplot(224);imshow(mireRB);title('RB');

