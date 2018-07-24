function [updatedDataLabels, updatedDataIcon]= DataClassify(datas,dataLabels,DataIcon)
%%
%ʱ�䣺2018��7��22��
%���ܣ��������ͼ�������Զ�����
%���룺datas��ʾ�и�õ�ͼ���
%�����dataLabels��ʾͼ���ǿ�
%��д��wp
%%

len_inputs = length(datas);
for i = 1:len_inputs
    [rg_1,rg_2] = size(datas{i});
    for j = 1:rg_1
        for k = 1:rg_2
            temp_block = datas{i}{j,k};
            [brow,bcol]=size(temp_block);
            if sum(temp_block(:))<35*brow*bcol %���û��ͼ��Ͳ�������
            else
                [dataLabels,DataIcon] = updateLabels(temp_block,dataLabels,DataIcon);%����ͼ����
            end
        end
    end
end
updatedDataLabels = dataLabels;
updatedDataIcon = DataIcon;
function [updatedDataLabels, updatedDataIcon]= updateLabels(temp_block,dataLabels,DataIcon)
%�������ݱ��
updatedDataLabels = dataLabels;
updatedDataIcon = DataIcon;
len = length(dataLabels);
threshold = 128;%�ж�����
[brow,bcol]=size(temp_block);
temp= temp_block>threshold;
flag = true;
if 0 ==len
    updatedDataLabels{1} = temp;
    updatedDataIcon{1} = temp_block;
else
    for i = 1:len
        temp1= ~xor(temp,dataLabels{i});
        if(sum(temp1(:))>0.96*brow*bcol)%�����ͼ����Ѿ�����
            flag = false;
            break
        end
    end
    if flag %�����ͼ����Ѿ�������
        updatedDataLabels{len+1} = temp;
        updatedDataIcon{len+1} = temp_block;
    end
end


