#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 27 11:49:42 2018

@author: Dianmo

"""
from gtts import gTTS
import pyautogui as pyui
import time
import subprocess
import tempfile
import os
import random
import platform
from PIL import Image
import pytesseract

class Utils(object):


    def convert_img_path(self, filename):
        """
        make cross OS
        """
        if filename.find('WinImgs') != -1 or filename.find('LinuxImgs') != -1:
            return filename
        else:
            image = ""
            if platform.system() == "Windows":
                image = "WinImgs" + os.sep + filename
            else:
                image = "LinuxImgs" + os.sep + filename
            return image

    def get_picture_location(self, image, timeout=15):
        """
        get location(x,y) for picture available on screen, using
        :param image:  image path
        :param timeout: 15 seconds
        :return:
        """
        print ('get picture location of', image)
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        pyui.PAUSE = 1.0
        timeout=int(timeout)
        start = time.time()
        while time.time() - start < timeout:
            print 'wait appear'
            location = pyui.locateCenterOnScreen(image)
            if location == None:
                #time.time(1) #wait 1 seconds to anther try
                continue
            else:
                return location


    def click_coordinate(self, x, y):
        """
        Click coordinate on screen (x, y)
        """
        x = int(x)
        y = int(y)
        pyui.click(x, y)
        pyui.moveTo(1, 1)

    def verify_picture_exists(self, image, timeout=15):
        """
        Verify the picture exists on screen and return flase when does not exists
        """
        print ('start verify the picture exists')
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        timeout = int(timeout)
        return self.get_picture_location(image, timeout) != None

    def wait_picture_gone(self, image, timeout=10):
        """
        Wait picture disappear...
        """
        timeout = int(timeout)
        start = time.time()
        while time.time() - start < timeout:
            print ('start wait', image)
            if self.verify_picture_exists(image, 5):
                print ('Picture exists')
                continue
            else:
                print ('Picture gone')
                return True
        else:
            return False

    def click_picture_on_screen(self, image, timeout=10):
        """
        Click picture location
        x, y =self.get_picture_location(image,timeout)
        pyui.click(x, y)
        pyui.moveTo(1, 1)

        """
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        timeout = int(timeout)
        x, y = pyui.locateCenterOnScreen(image)
        pyui.click(x, y)
        pyui.moveTo(1, 1)

if __name__ == "__main__":
    u = Utils()
    print u.wait_picture_gone(u'confirm.png')







