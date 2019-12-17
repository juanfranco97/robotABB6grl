% Franco Islas Juan Manuel
% Arenas MartinezAlberto
% Lopez Mondrag�n Angel
% 
% El archivo principal es 'Prueba 3', este contiene todos los movimienos del brazo, asi como los 
% submenus de funcioes para tipos de movimiento, el guardado de puntos y la ejecuci�n de programas.
% Se utiliz� el dispositivo de la familia Espressify ESP32, el cual tiene la capacidad de comunicaci�n
% por bluetooth, wifi y conexi�n USB serial directa. Las librerias de este disposiivo y la programaci�n
% se pueden enconrar en la carpeta 'Joysticks' ubicado en esta carpeta, y su programaci�n fue realizada 
% en el ID de Arduino.
% 
% Este programa fue creado para ser utilizado con la aplicaci�n de iOS y Android 'Blynk', disponible en
% la appstore, y se debe escanear el codigo mostrado en la carpeta 'QR Proyecto', ubicado en esta misma
% carpeta (Incluye un archivo de texto con instrucciones adicionales).
% 
% 
% *******SCRIPTS Y FUNCIONES*******
% 
% 'EjesMovil': Traza los marcos de referencia de las articulaci�nes del robot.
% 
% 'f1 - f12': Funciones utilizadas para la resoluci�n del metodo Newton para obener los angulos de las
% articulaci�nes del robot.
% 
% 'Newton': Realiza el metodo de Newton para obtener el valor de los angulos de las articulaci�nes del
% robot para cada punto deseado de movimiento.
% 
% 'RABB': Contiene los parametros del robot, la matriz de la cinematica del robot y el codigo de trazado
% del robot.
% 
% 'RX': Contiene una matriz de rotaci�n con respecto a x.
% 
% 'RY': Contiene una matriz de rotaci�n con respecto a y.
% 
% 'RZ': Contiene una matriz de rotaci�n con respecto a z.
% 
% 'TX': Contiene una matriz universal de traslaci�n en los 3 ejes (x, y, x).