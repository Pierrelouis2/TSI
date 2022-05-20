clear variables, close all;
image =  im2double(imread('pieces.png'));
[h,w] = size(image);

I = Kmeans(image,2);
% figure(1);
% imshow(I);

H = imhist(image);
Hcum = cumsum(H);
% figure(2); hold on;
% bar(H);
% plot(Hcum);

Hnorm = H./(h*w);
% figure(3);
% bar(Hnorm);

egI = zeros(h,w);
for i = 1:h
    for j = 1:w
      egI(i,j) = Hcum(round(image(i,j)*256))./(h*w);
    end
end


H_eg = imhist(egI);
Hcum_eg = cumsum(H_eg);
% figure(4);
% subplot(211);imshow(egI);
% subplot(212);bar(H_eg);hold on;plot(Hcum_eg); 

I_egmeans = Kmeans(egI,2);
% figure(5);
% imshow(I_egmeans) ;

% GRANULOMETRIE
SE = strel('octagon',6);
I_ouv = imopen(I_egmeans,SE);
figure(6);
imshow(I_ouv);

%Methode 1
I_clear = imclearborder(I_ouv);
figure(7);
imshow(I_clear);

%Methode2
marker = zeros(221,261);
marker(1,1:261) = 1;
marker(221,1:261) = 1;
marker(1:221,1) = 1;
marker(1:221,261) = 1;
marker = marker.*I_ouv;
I_bord = imreconstruct( marker,I_ouv);
figure(8);
imshow(I_ouv-I_bord);

nbr_pieces = bweuler(I_clear);
k = 6;
while nbr_pieces == 7
    SE = strel('disk',k);
    I_bw = imerode(I_clear,SE);
    nbr_pieces = bweuler(I_bw);
    k = k+1;
end
figure(9);
imshow(I_bw);

