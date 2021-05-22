clc;clear;close all;

load racoon_hw1;

img = render(vertices_2d,faces,vertex_colors,depth,'flat');

imwrite(img,'racoon_flat.png');

fprintf('Please check your files for\na beautiful flat racoon image.\n');