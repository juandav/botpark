# BootPark

BootPark es una aplicación prototipo pensada para el control de seguridad en el ingreso y salida de vehiculos de la Universidad de la Amazonia.

## Apps
 1. Nagrand: Es un servicio de windows para la gestión de eventos del dispositivo biometrico basado en sockets.
 2. Tanaris: Es un script para la manipulación de la cedula colombiana.
 3. TolBarad: Es una dll para la gestión de eventos del lector RFID.
 4. BootPark: Es la web app que permite la gestión vehiculos, carnets, tags, huellas y asignaciones a personal de la institución.
 5. Circulation: Es una app web enfocada a la validación biometrica con RFID de los vehiculos que desean ingresar o salir de la Institución.
 6. Kik: Es un instalador, es el que permite al Sistema Operativo entender los dispositivos Biometrico y RFID.

## Instalación
 Para poder ejecutar Nagrand y BootPark es necesario que se instale Nuget que es el Gestor de paquetes para .NET equivalente a NPM de NodeJS.
 [Nuget](https://www.nuget.org/)

En cada proyecto deberan ejectur "nuget install packages.config" para la instalación de los paquetes necesarios en el funcionamiento de la App.

### Comando de Instalación de paquetes
nuget install packages.config

### Modo Desarrollo
En Algunos de los proyectos se incluye el archivo "install.bat" que permite la instalación necesaria para la ejecución del proyecto en mode desarrollador.

### Modo Producción
Cabe aclarar que la versión de producción se brindaran los arhivos necesarios ya compliados para su posterior despliegue en Internet Information Server.



## Instalación
La dll "UHFReader28CSharp.dll" hace uso de la dll "Basic.dll", para un correcto uso, es necesario ejecutar el archivo; "install.bat"


Ejemplo de una consulta a un script JS: https://raw.githubusercontent.com/username/project/master/script.js