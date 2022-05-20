clear variables, close all;


Iss = imresize(I,0.25);
Ios_b = imresize(Iss,4,'bilinear') ;
Ios_c = imresize(Iss,4,'bicubic') ;