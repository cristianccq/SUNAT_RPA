# -*- coding: utf-8 -*-
"""
Created on Wed Jan 08 10:54:39 2018

@author: amanosalva
"""

from flask import Flask, jsonify
from flask import abort
import json
import cv2
import subprocess
import time


app = Flask(__name__) 

# servicio para autenticar
    
@app.route('/<foto>', methods=['GET'])
def get_tasks(foto):
	img = cv2.imread('foto.png',0)
	# varia segun imagen
	code = img[130:190,560:680]

	retval, threshold = cv2.threshold(code, 240, 255, cv2.THRESH_BINARY)

	cv2.imwrite('code.jpg',threshold)

	time.sleep(1.5)

	proc = subprocess.Popen(['C:/Program Files/Tesseract-OCR/tesseract.exe',"code.jpg",'out'],stdout=subprocess.PIPE)
	time.sleep(1.5)
	with open('out.txt') as file:  
	    data = file.read() 
	    data = data.strip()

	return jsonify({'result': data.replace(' ','')})




    
    

if __name__ == '__main__':
    app.run(debug=True, port=5001, host='0.0.0.0')
    

    