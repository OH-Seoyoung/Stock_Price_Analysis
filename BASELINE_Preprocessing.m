clear; clc; close all;
list = ls('dataset'); dir_list = list(3:23,:);

%% load original stock price dataset
[data, header] = xlsread(strjoin({'dataset/',dir_list(1,:)},''));
allname = header(1,:);
name = allname(4:2:size(data,2));

matrix = data(:,3:2:size(data, 2));

%% derivative -> normalize -> fft
deri_mat = deri(matrix);  % calculating a(i+1)-a(i) / a(i)

norm_mat = normalize(deri_mat);   % z score normalization

fft_mat = fft(norm_mat);  % fourier transform

row = size(fft_mat, 1); col = size(fft_mat, 2);
pow = abs(fft_mat(1:floor(row/2),:));  % power of first half of transform data

n = (1:row/2);
plot(n,pow(:,1));
title('Magnitude');