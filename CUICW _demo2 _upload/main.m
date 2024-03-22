clear;close all;clc; 
% addpath('./flow_code_v2');
% addpath('./flow_code_v2/utils/');
addpath('./OpticalFlow');
addpath('./OpticalFlow/mex');
path = './';  
imFileDir1 = [path filesep 'result' filesep  'Elephantresult' filesep]; 
imFileDir = [path filesep 'datawater' filesep  'centroid_Elephant' filesep]; 
imFileDir2 = [path filesep 'datawater' filesep  'Elephant' filesep];
N=61;
Image_data = cell(1, N);
Image_data2 = cell(1, N);
for j=1:N
    Image_data2{j} = im2double(imread([imFileDir2 'y_',num2str(j),'.png']));
end
for j = 1:N
    ref = Image_data2{j};
    Image_data{j} = centroid(Image_data2,ref);
    imwrite(Image_data{j},[imFileDir 'centroid_y_', num2str(j),'.png']);
end
lamda = 1.8;
%lamda=\mu_1
beta = 0.8;
%beta=\mu_2
[r,b,pd]=size(Image_data{1});
u =restoration(Image_data,Image_data2,lamda,N,r,b,pd,beta);
figure
imshow(uint8(u))
imwrite(uint8(u),[imFileDir1 'wes_61_beta0.8lambda_1.8.png']);

