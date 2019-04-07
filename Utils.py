#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 27 11:49:42 2018

@author: alex
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


def param_to_property(*props, **kwprops):
    if props and kwprops:
        raise SyntaxError("Can not set both props and kwprops at the same time.")

    class Wrapper(object):

        def __init__(self, func):
            self.func = func
            self.kwargs, self.args = {}, []

        def __getattr__(self, attr):
            if kwprops:
                for prop_name, prop_values in kwprops.items():
                    if attr in prop_values and prop_name not in self.kwargs:
                        self.kwargs[prop_name] = attr
                        return self
            elif attr in props:
                self.args.append(attr)
                return self
            raise AttributeError("%s parameter is duplicated or not allowed!" % attr)

        def __call__(self, *args, **kwargs):
            if kwprops:
                kwargs.update(self.kwargs)
                self.kwargs = {}
                return self.func(*args, **kwargs)
            else:
                new_args, self.args = self.args + list(args), []
                return self.func(*new_args, **kwargs)
    return Wrapper

class Utils(object):
    def create_mp3_from_text(self, mp3file, text, lang='en', slow = False):
        """
        Create mp3 file from text
        Parameters:
        mp3file - path of mp3
        text  -  text of to translate
        lang  -  languge to convert, support String - ISO 639-1 language code
        (supported by the Google Text to Speech API) to speak in
        Supported Languages
            'af' : 'Afrikaans'
            'sq' : 'Albanian'
            'ar' : 'Arabic'
            'hy' : 'Armenian'
            'bn' : 'Bengali'
            'ca' : 'Catalan'
            'zh' : 'Chinese'
            'zh-cn' : 'Chinese (Mandarin/China)'
            'zh-tw' : 'Chinese (Mandarin/Taiwan)'
            'zh-yue' : 'Chinese (Cantonese)'
            'hr' : 'Croatian'
            'cs' : 'Czech'
            'da' : 'Danish'
            'nl' : 'Dutch'
            'en' : 'English'
            'en-au' : 'English (Australia)'
            'en-uk' : 'English (United Kingdom)'
            'en-us' : 'English (United States)'
            'eo' : 'Esperanto'
            'fi' : 'Finnish'
            'fr' : 'French'
            'de' : 'German'
            'el' : 'Greek'
            'hi' : 'Hindi'
            'hu' : 'Hungarian'
            'is' : 'Icelandic'
            'id' : 'Indonesian'
            'it' : 'Italian'
            'ja' : 'Japanese'
            'km' : 'Khmer (Cambodian)'
            'ko' : 'Korean'
            'la' : 'Latin'
            'lv' : 'Latvian'
            'mk' : 'Macedonian'
            'no' : 'Norwegian'
            'pl' : 'Polish'
            'pt' : 'Portuguese'
            'ro' : 'Romanian'
            'ru' : 'Russian'
            'sr' : 'Serbian'
            'si' : 'Sinhala'
            'sk' : 'Slovak'
            'es' : 'Spanish'
            'es-es' : 'Spanish (Spain)'
            'es-us' : 'Spanish (United States)'
            'sw' : 'Swahili'
            'sv' : 'Swedish'
            'ta' : 'Tamil'
            'th' : 'Thai'
            'tr' : 'Turkish'
            'uk' : 'Ukrainian'
            'vi' : 'Vietnamese'
            'cy' : 'Welsh'
        """

        print ('create_mp3_from_text:', text, mp3file)
        tts = gTTS(text, lang = lang, slow = slow)
        #tts.save(mp3file)
        with open(mp3file, 'w+b') as f:
            tts.write_to_fp(f)
        print ('create_mp3_from_text', 'done')

    def get_picture_location(self, image, timeout=15):
        """
        Get location (x, y) for picture availabe on screen, using
        """
        print('Get picture location of', image)
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        pyui.PAUSE = 1.0
        timeout= int(timeout)
        start = time.time()
        while time.time() - start < timeout:
            print('wait appear')
            location = pyui.locateCenterOnScreen(image)
            if location == None:
                time.sleep(1) #wait 1 seconds to another try
                continue
            else:
                return location

    def click_coordinate(self, x, y):
        """
        Click coordinate on screen
        """
        x = int(x)
        y = int(y)
        pyui.click(x, y)
        pyui.moveTo(1,1)

    def verify_picture_exists(self, image, timeout=15):
        """
        Verify Picture on screen exists, return false does not exists
        """
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        timeout= int(timeout)
        print('image file to verify:', image)
        return self.get_picture_location(image, timeout) != None

    def wait_picture_gone(self, image, timeout=30):
        """
        Wait the pictures disappear...
        """
        start = time.time()
        while time.time() - start < timeout:
            print('wait pictures disappear')
            if self.verify_picture_exists(image, 5):
                continue
            else:
                return True
        return False

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

    def click_picture_on_screen(self, image, timeout=10):
        """
        Click image on screen, using picture to locate
        """
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        timeout= int(timeout)
        x, y = pyui.locateCenterOnScreen(image)
        pyui.click(x, y)
        pyui.moveTo(1,1)
#        self.get_picture.click(image, timeout)

    @property
    def get_picture(self):
        """
        How to use
        u=Utils()
        u.get_picture.location(image='img/open.png')
        u.get_picture.click(image='img/open.png')
        u.get_picture.wait(image='img/open.png', timeout=1)
        """
        @param_to_property(action=["wait", "click", "location"])
        def _get_picture(action, image, timeout=15):
            if action == "wait":
                return self.get_picture_location(image, timeout) != None
            elif action == "click":
                x,y = self.get_picture_location(image, timeout)
                pyui.click(x, y)
                pyui.moveTo(1,1)
            elif action == "location":
                return self.get_picture_location(image, timeout)
        return _get_picture

    def play_sound_on_pc(self, input_file):
        """
        Play sound file *input_file*
        Examples:
        | Action     | Argument   |
        | Play Sound | input_file |
        """
        print('play_sound_on_pc:', input_file)
        return self.execute_command('mplayer %s' % input_file)

    def execute_command(self, cmd, block_parent_process = True):
        """
        Execute shell *cmd* command, with block_parent_process = True
        If block_parent_process = False, kill_command is needed to terminal the child process
        Example:
        | Execute Command | ping -c 5 127.0.0.1 |
        """
        if str(block_parent_process) == str(True):
            return subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
        else:
            return subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def play_sound_on_PC_from_text(self, text, lang='en', slow = False):
        """
        Play sound from Google TTS from text
        """
        temp_music = tempfile.gettempdir() + os.sep + str(random.randrange(1,1000)) + '.mp3'
        print('play_sound_on_PC_from_text file:', temp_music)
        try:
            self.create_mp3_from_text(temp_music, text, lang)
            self.play_sound_on_pc(temp_music)
        except  Exception, e:
            print (Exception, e)
        finally:
            print('remove the file', temp_music)
            os.remove(temp_music)

    def ocr_text(self, image):
        """
        OCR, please copy chi_sim.data to your tesseract training data directory
        """
        text = ''
        image = image.encode("ascii")
        image = self.convert_img_path(image)
        try:
            img = Image.open(image)
            img.load()
            text = pytesseract.image_to_string(img, lang='chi_sim').replace(' ', '')
        except Exception, ex:
            print ex
        return text

utils = Utils()

if __name__ == "__main__":

    from UiAutoTestLib import UiTestLib
    p = UiTestLib('d0caeb64')
    u = Utils()
    #p.clear_logcat()
    #u.play_sound_on_PC_from_text(u"今天北京天气怎么样", lang='zh-cn')
    #print p.wait_for_logcat_line(".*handleSpeechRecognizedResult\(\)isFinal=true.*", timeout =10)
    #print u.get_picture.wait(image='img/allow.png', timeout=1),u.get_picture.location(image='img/allow.png')
    #u.get_picture.click(image='img/allow.png')
    #u.play_sound_on_PC_from_text(u"今天北京天气怎么样", lang='zh-cn')
    #image = u"img/reload_btn.png"
    #print u.verify_picture_exists(image)
    #u.click_picture_on_screen(image)
    #print u.ocr_text('ok_btn.png')
    print u.wait_picture_gone(u'confirm.png')

