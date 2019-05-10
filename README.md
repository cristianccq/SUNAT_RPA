# SUNAT - Demo RobotFramework

### Requisitos:
* Python3
* Flask

### Instalación:
* pip install robotframework
* pip install --upgrade robotframework-seleniumlibrary
* pip install -U requests
* pip install -U robotframework-requests

* Descargar los drivers para el navegador Chrome o Firefox : [driver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
* Agregar a Variables de Entorno del sistema la carpeta donde se encuentra el ejecutable descargado.

#### Linux
* Instalar [Tesseract](https://github.com/tesseract-ocr/tesseract)

#### Windows
* Ejecutable para windows: [Exe](https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-v4.1.0.20190314.exe)
* Seguir instalación tipica y agregar la carpeta del ejecutable(tesseract.exe) a variables de Entorno del sistema.


### Uso:
* Ejecutar `python server_cv.py`
* Ejecutar `robot sunat_captcha.robot`