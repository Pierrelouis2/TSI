clear variables, close all;


image =  im2double(imread('journal.png'));

[h,w] = size(image);

im_fourier = fftshift(fft2(image,h,w));

%La particularité du spectre est que toutes les etoiles correspondent aux
%bruits sauf celle au centre qui correspond aux lettres

%Pour enlever l'effet de trame il faudrait filtre les hautes fq donc mettre
%en place un passe bas

[U, V] = meshgrid(-w/2+1/2:w/2-1/2,-h/2+1/2:h/2-1/2);

D= sqrt(U.^2+V.^2);
p=2000;
nc=100;
H = 1./(1 + (D./nc).^(2*p));

im_fourier_filtre = H.*im_fourier;
im_filtre = ifft2(ifftshift(im_fourier_filtre));


figure(1);
subplot(221);imshow(image);title('image de base');
subplot(222);imshow(log10(abs(im_fourier)),[]);title('transformée de fourier image de base');

subplot(223);imshow(real(im_filtre));title('image filtre');
subplot(224);imshow(H.*log10(abs(im_fourier)),[]);title('transformée de fourier image filtre');
