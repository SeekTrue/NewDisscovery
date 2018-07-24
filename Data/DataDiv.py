# -*- coding: utf-8 -*-
"""
Created on Sun Jul 22 19:28:20 2018

@author: Administrator
"""
import cv2
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt



# 添加中文字体支持
#img = cv2.imread('1.jpg')
#cv2.imshow('src',img)
#print(img.shape) # (h,w,c)
#print(img.size) # 像素总数目
#print(img.dtype)
#print(img)
#
#plt.gcf().set_facecolor(np.ones(3))   # 生成画布的大小
#plt.grid()  # 生成网格
#plt.show(img)

img = Image.open('1.jpg')

plt.figure("Image") # 图像窗口名称
plt.imshow(img)
plt.axis('on') # 关掉坐标轴为 off
plt.title('image') # 图像题目
plt.grid('on')
plt.show()
