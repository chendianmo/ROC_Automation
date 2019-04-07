#coding=utf-8


import math
from PIL import Image
from functools import reduce
import operator

class ImgCampare():
    def compare(self, pic1, pic2):
        '''
        :param pic1: 图片1路径
        :param pic2: 图片2路径
        :return: 返回对比的结果
        '''
        image1 = Image.open(pic1)
        image2 = Image.open(pic2)

        histogram1 = image1.histogram()
        histogram2 = image2.histogram()

        differ = math.sqrt(reduce(operator.add, list(map(lambda a, b: (a - b) ** 2, histogram1, histogram2))) / len(histogram1))
        print(differ)
        if differ > 0:
            print('图片对比不一致，请检查细节')
            return False
        else:
            print('pass')
            return True

if __name__ == '__main__':
    case = ImgCampare()
    print case.compare(r'D:\learn\test\blur.jpg', r'D:\learn\test\meinv.jpg')




