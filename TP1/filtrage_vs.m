clear variables, close all;


image = im2double(imread('chat2.png'));
image = rgb2gray(image);
[h,w] = size(image);

i_g = image+0.1*randn(h,w);
i_sp = imnoise(image,'salt & pepper',0.2);

figure(1);
subplot(131);imshow(image);title('image de base');
subplot(132);imshow(i_g);title('image g');
subplot(133);imshow(i_sp);title('image sp');

%Filtre moyenneur
n = 9;
H_moy=1/n*ones(n);

i_g_film = imfilter(i_g,H_moy);
i_sp_film = imfilter(i_sp,H_moy);

%Mse

Mse_g_m = 1/(h*w)*(norm((i_g-i_g_film),'fro'));
Mse_sp_m = 1/(h*w)*(norm((i_sp-i_sp_film),'fro'));


%Filtre Butterworth

i_g_f = fftshift(fft2(i_g,h,w));
i_sp_f = fftshift(fft2(i_sp,h,w));

[U, V] = meshgrid(-w/2+1/2:w/2-1/2,-h/2+1/2:h/2-1/2);

D= sqrt(U.^2+V.^2);
p=5;
nc=60;
H = 1./(1 + (D./nc).^(2*p));

i_g_f_fil= H.*i_g_f;
i_g_filb = ifft2(ifftshift(i_g_f_fil));


i_sp_f_fil= H.*i_sp_f;
i_sp_filb = ifft2(ifftshift(i_sp_f_fil));

%Mse

Mse_g_b = 1/(h*w)*(norm((i_g-i_g_filb),'fro'));
Mse_sp_b = 1/(h*w)*(norm((i_sp-i_sp_filb),'fro'));


%Filtre median
y=5;
n=ones(y,y);
p=1+((y.^2)-1)/2;

i_sp_filmed = ordfilt2(i_sp,p,n);
i_g_filmed = ordfilt2(i_g,p,n);

%Mse

Mse_g_med = 1/(h*w)*(norm((i_g-i_g_filmed),'fro'));
Mse_sp_med = 1/(h*w)*(norm((i_sp-i_sp_filmed),'fro'));


%MSE

figure(2);
subplot(321);imshow(i_g_film,[]);title(['image fil g ',num2str(Mse_g_m)]);
subplot(322);imshow(i_sp_film,[]);title(['image fil sp ',num2str(Mse_sp_m)]);

subplot(323);imshow(i_g_filb,[]);title(['image fil b g ',num2str(Mse_g_b)]);
subplot(324);imshow(i_sp_filb,[]);title(['image fil b sp ',num2str(Mse_sp_b)]);

subplot(325);imshow(i_g_filmed,[]);title(['image fil med g ',num2str(Mse_g_med)]);
subplot(326);imshow(i_sp_filmed,[]);title(['image fil med sp ',num2str(Mse_sp_med)]);

