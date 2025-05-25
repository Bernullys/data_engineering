Chequiar version de mysql:
    mysql --version
Cambiar contraseña de mysql:
    sudo service mysql stop
    sudo mysqld --skip-grant-tables --user=mysql &
    Abre otra terminal (o una nueva pestaña en la misma terminal de WSL).
        sudo mysql -u root
        FLUSH PRIVILEGES;
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NuevaContraseña';
        EXIT;
    Regresa a la terminal donde ejecutaste mysqld_safe y presiona Ctrl+C para detenerlo.
    sudo service mysql stop
    sudo service mysql start
    sudo mysql -u root -p
    (MySQLBernard1#)

Nota importante:
    El servidor MySQL (el motor) se instala como un servicio en tu sistema Linux (en WSL).
    No importa en qué carpeta estés parado cuando escribes el comando mysql en la terminal, porque el comando está en tu PATH.
    Toda la configuración, bases de datos, usuarios, etc., se guardan en un lugar fijo del sistema (por defecto en /var/lib/mysql).
    Cuando tú creas una base de datos o tablas, no se crean archivos visibles en tu carpeta de usuario (como ~/proyectos/bootcamp).
    Pero puedes organizar tus scripts SQL o documentos relacionados en carpetas propias si quieres llevar una estructura clara de tu aprendizaje.

Correr un script .sql: si tengo el motor encendido y si estoy en la misma carpeta es SOURCE file_name.sql;

Otra forma sin el motor encendido: sudo mysql -u root -p < file_name.sql

----------------------------------------------------------------------------------------------------------------

Para conectar mysql con python utilizar esta libreria: (ver en modulo3)
pip install mysql.connector-python
Mejor con SQLAlchemy
pip install sqlalchemy

