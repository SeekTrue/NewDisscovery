%ʱ�䣺2018��7��22��
%���ܣ��и�ͼ��׼����������
%��д�����
%%
ims = cell(1,8);
DataSource = cell(1,8);
blockRg = 108;%ÿ��ͼ���ĳߴ�
rg = 1:blockRg;
% 209:1504;%�����ݷ�Χ
% 108:1079;%�����ݷ�Χ

for i = 1:8
    temp = cell(14,9);
    ims{i} = imread([num2str(i) '.jpg']);
    ims{i} = ims{i}(:,:,1);
    for j = 1:14
        for k = 1:9
            rows = 208+rg+(j-1)*blockRg;
            cols = 107+rg+(k-1)*blockRg;
            temp{j,k}=ims{i}(rows,cols);
        end
    end
    DataSource{i} = temp;
end

% figure
% imshow(im1)
axis on
grid on
%%

for i = 1:1
    figure,
    count = 1;
    for j = 1:9
        for k = 1:14
            subplot(9,14,count);
            count = count+1;
            imshow(DataSource{i}{k,j})
        end
    end
end
%%
%�����Զ�����
tic
dataLabels = {};
DataIcon = {};
[updatedDataLabels,DataIcon]= DataClassify(DataSource,dataLabels,DataIcon);
toc
save DataIcon.mat DataIcon
%%
figure,
for i = 1:length(updatedDataLabels)
    subplot(9,7,i)
    imshow(updatedDataLabels{i})
end