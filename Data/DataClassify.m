function [updatedDataLabels, updatedDataIcon]= DataClassify(datas,dataLabels,DataIcon)
%%
%时间：2018年7月22日
%功能：将输入的图像块进行自动分类
%输入：datas表示切割好的图像块
%输出：dataLabels表示图像标记块
%编写：wp
%%

len_inputs = length(datas);
for i = 1:len_inputs
    [rg_1,rg_2] = size(datas{i});
    for j = 1:rg_1
        for k = 1:rg_2
            temp_block = datas{i}{j,k};
            [brow,bcol]=size(temp_block);
            if sum(temp_block(:))<35*brow*bcol %如果没有图像就不做处理
            else
                [dataLabels,DataIcon] = updateLabels(temp_block,dataLabels,DataIcon);%更新图像标记
            end
        end
    end
end
updatedDataLabels = dataLabels;
updatedDataIcon = DataIcon;
function [updatedDataLabels, updatedDataIcon]= updateLabels(temp_block,dataLabels,DataIcon)
%更新数据标记
updatedDataLabels = dataLabels;
updatedDataIcon = DataIcon;
len = length(dataLabels);
threshold = 128;%判断门限
[brow,bcol]=size(temp_block);
temp= temp_block>threshold;
flag = true;
if 0 ==len
    updatedDataLabels{1} = temp;
    updatedDataIcon{1} = temp_block;
else
    for i = 1:len
        temp1= ~xor(temp,dataLabels{i});
        if(sum(temp1(:))>0.96*brow*bcol)%如果该图像块已经存在
            flag = false;
            break
        end
    end
    if flag %如果该图像块已经不存在
        updatedDataLabels{len+1} = temp;
        updatedDataIcon{len+1} = temp_block;
    end
end


