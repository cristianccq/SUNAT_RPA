*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Library   		 RequestsLibrary
Library  		OperatingSystem
Library  		String
Resource          resource.robot

*** Variables ***
${code}         AMDS

*** Test Cases ***
Cargar Web
    Open Browser To Login Page
Ingresar RUC
	Input ruc 		10483331857
Tomar Captura
	Capture Page Screenshot    foto.png
Llenar Captcha
	Create Session  google  http://localhost:5001
	${resp}=  Get Request  google  /56456.jpg
	Log 	${resp.json()['result']}  
	Input Codigo	${resp.json()['result']} 

Clic boton
    Submit
    Location Should Be    http://www.sunat.gob.pe/cl-ti-itmrconsruc/jcrS03Alias
    Title Should Be    Consulta RUC Celular
    ${nombre}	 Get Table Cell	class:form-table	2	2
    ${tipo}	 Get Table Cell	class:form-table	3	2
    ${doc}	 Get Table Cell	class:form-table	4	2
    write_variable_in_file  	${nombre}
	