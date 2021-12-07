# -*- coding: utf-8 -*-
"""
Created on Mon Dec  6 22:31:46 2021

@author: toman
"""

import pyautogui
import time
import pytesseract

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract'


# while 1:
#     print(pyautogui.position())
#     time.sleep(1)
    
pyautogui.PAUSE = 0.5
pyautogui.FAILSAFE = True
time.sleep(4)


X = [100, 125 ,150 ,175 ,200 ,225 ,250 ,275 ,300 ,325 ,350 ,375 ,400 ,425 ,450 ,475 ,500 ,525 ,550 ,575]

for x in X:
    pyautogui.doubleClick(x=449, y=802) #cambiar el x
    pyautogui.typewrite(f"{x}")
    pyautogui.doubleClick(x=492, y=802) #cambiar el x
    pyautogui.screenshot('my_screenshot.png', region=(772,377, 94, 39) )
    y = pytesseract.image_to_string('my_screenshot.png')
    #print(str(x) + " " + y.replace("~", "-"), end='')
    print(y.replace("~", "-").rstrip("\n") + ",", end="")

print("\n\ndone!")