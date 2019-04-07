#!/usr/bin/env python
# -*- coding: utf-8 -*-

from robot.api import logger
import subprocess
import os
import time
import datetime
from robot.libraries.BuiltIn import BuiltIn
import re

import uiautomator2 as u2


class Uitestlib(object):

    def __init__(self, serial = None):

        logger.info('<p>Device=%s>' % serial, html=True)
        print '<p>Device=%s>' % serial
        self._result = ''
        self.starttime = 0
        self.d = Devices(serial)
        self.adb = Adb(serial)
        self.debug = 'True'
        self.serial = serial

    def set_serial(self, serial):
        self.set_serial = serial
        return u2.connect_usb(serial)

    def set_debugable(self, flag):
        self.debug = flag

    def logmsg(self, msg):
        if self.debug = 'True':
            print msg

    def adb_execute(self, *args, **kwargs):
        """return process of adb execution"""
        if self.serial is not None:
            cmds = ['adb', '-s', self.serial]
        else:
            cmds = 'adb'
        cmds.extend(args)
        cmdline = subprocess.list2cmdline(map(str, cmds))
        print cmdline
        try:
            return subprocess.Popen(cmdline, stdout=subprocess.PIPE, shell=True)
        except subprocess.CalledProcessError as e:
            if kwargs.get('raise_error', True):
                raise e
            return None

    def adb_shell(self, *args, **kwargs):
        args = ['shell'] + list(args)
        return self.adb_execute(*args, **kwargs)

    def exe_adb_and_result(self, *args, **kwargs):
        """Execute adb *cmd* and return lines of the command"""
        try:
            if self.serial is not None:
                cmds = ['adb', '-s', self.serial]
            else:
                cmds = 'adb'
            cmds.extend(args)
            cmdline = subprocess.list2cmdline(map(str, cmds))
            # print cmdline
            output = subprocess.check_output(cmdline, stderr=subprocess.STDOUT, shell=True).decode('utf-8')
            # print output
            return output
        except Exception, e:
            print e
            return None

    def get_device_info(self):
        """Get Device information
        return info dictionary
        """
        return self.d.info

    def light_screen(self):
        """Light screen by wakeup.

        Examples:
        | Action     |
        |Light screen|

        Use `Light screen` to light screen.
        """

        self.d.wakeup()
        self._result = self.d.press.home()





































if __name__ == "__main__":














