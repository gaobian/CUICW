clear;close all;clc; 
% addpath('./flow_code_v2');
% addpath('./flow_code_v2/utils/');
addpath('./OpticalFlow');
addpath('./OpticalFlow/mex');
path = './';  
SeqName = {'centroid_middle','centroid_brick','centroid_cheakboard','centroid_large','centroid_small','centroid_syntest1','centroid_brickWall','centroid_blue','centroid_Elephant','centroid_HandWritten'};
iSequence   =9;
imFileDir   = [path filesep 'datawater' filesep  SeqName{iSequence} filesep];
SeqName1 = {'middleresult','brickresult','cheakboardresult','largeresult','smallresult','syntest1result','BrickWallresult','Blueresult','Elephantresult','HandWrittenresult'};
imFileDir1= [path filesep 'result' filesep  SeqName1{iSequence} filesep]; 
SeqName2 = {'expdata_middle','expdata_brick','expdata_cheakboard','expdata_large','expdata_small','expdata_syntest1','BrickWall','Blue','Elephant','HandWritten'};
imFileDir2   = [path filesep 'datawater' filesep  SeqName2{iSequence} filesep];
N=61;
Image_data = cell (1, N);
Image_data2 = cell (1, N);
for j=1:N
    Image_data2{j} =  im2double(imread([imFileDir2 'y_',num2str(j),'.png']));
end
filename=[imFileDir 'centroid_y_1.png'];
if exist(filename, 'file')
    for j=1:N
       Image_data{j} =  im2double(imread([imFileDir 'centroid_y_', num2str(j),'.png']));
    %    Image_data{j}=(double(Image_data{j}));
    end 
else
    for j = 1:N
        ref = Image_data2{j};
        Image_data{j} = centroid(Image_data2,ref);
        imwrite(Image_data{j} ,[imFileDir 'centroid_y_', num2str(j),'.png']);
    end 
end
umean=float_weisz(Image_data);
lamda =1.8;
%lamda=\mu_1
beta=0.8;
%beta=\mu_2
[r,b,pd]=size(Image_data{1});
u =Restration(Image_data,Image_data2,umean,lamda,N,r,b,pd,beta);
figure
imshow(uint8(u))
imwrite(uint8(u),[imFileDir1 'wes_61_beta0.8lambda_1.8.png']);

