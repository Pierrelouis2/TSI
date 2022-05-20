clear variables, close all;

image = im2double(imread('chat.jpg'));
image = rgb2gray(image);
V_deriv_x = [-1,0,1];
V_lissage_x = [1,2,1]';

h_x = V_lissage_x*V_deriv_x;

h_y = h_x';

im_filter_gv = imfilter(image,h_x);

im_filter_gh = imfilter(image,h_y);

g = sqrt((im_filter_gh.^2)+(im_filter_gv.^2));



figure(1);
subplot(131);imshow(im_filter_gv,[]);title('sobel x');
subplot(132);imshow(im_filter_gh,[]);title('sobel y');
subplot(133);imshow(g,[]);title('G');


I_bruit = image+0.1*randn(768,1024);

im_bruit_filter_gv = imfilter(I_bruit,h_x);

im_bruit_filter_gh = imfilter(I_bruit,h_y);

g_bruit = sqrt((im_bruit_filter_gh.^2)+(im_bruit_filter_gv.^2));


figure(2);
subplot(141);imshow(im_bruit_filter_gv,[]);title('sobel x bruit');
subplot(142);imshow(im_bruit_filter_gh,[]);title('sobel y bruit');
subplot(143);imshow(g_bruit,[]);title('G bruit');
subplot(144);imshow(I_bruit,[]);title('image bruitée');
