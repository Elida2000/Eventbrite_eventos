import pymysql


def getConnection():
    connection = pymysql.connect(
        host="localhost",
        user="root",
        passwd="12345",
        db="eventbrite",
        cursorclass=pymysql.cursors.DictCursor,
    )
    return connection


def insertEvent(idUsuarios, nombre, categoria, fecha, hora, descripcion, valorEntrada, capacidad, disponibilidad, ciudad, pais, direccion, tipo):
    try:
        connection = getConnection()
        with connection.cursor() as mycursor:
            sql = (
                "INSERT INTO `eventbrite`.`eventos`(`idEventos`,`idUsuarios`,`nombre`,`categoria`,`fecha`,`hora`,`descripcion`,`valorEntrada`,`capacidad`,`disponibilidad`,`ciudad`,`pais`,`direccion`,`tipo`) "
                + f"VALUES(0,{1},'{nombre}',{categoria},{fecha},{hora},'{descripcion}',{valorEntrada},{capacidad},{disponibilidad},'{ciudad}','{pais}','{direccion}',{tipo});"
            )
            mycursor.execute(sql)
            connection.commit()
    finally:
        connection.close()


def updateEvent(idEventos, idUsuarios, nombre, categoria, fecha, hora, descripcion, valorEntrada, capacidad, disponibilidad, ciudad, pais, direccion, tipo):
    try:
        connection = getConnection()
        with connection.cursor() as mycursor:
            sql = (
                "UPDATE `eventbrite`.`eventos` "
                + f"SET `idUsuarios` = '{1}',`nombre` = '{nombre}',`categoria` = '{categoria}',`fecha` = '{fecha}',`hora`='{hora}',`descripcion`='{descripcion}',`valorEntrada`='{valorEntrada}',`capacidad`='{capacidad}',`disponibilidad`='{disponibilidad}',`ciudad`='{ciudad}',`pais`='{pais}',`direccion`='{direccion}',`tipo`='{tipo}' "
                + f"WHERE `idEventos` = {idEventos};"
            )
            mycursor.execute(sql)
            connection.commit()
    finally:
        connection.close()


def deleteEvent(idEventos):
    try:
        connection = getConnection()
        with connection.cursor() as mycursor:
            sql = f"DELETE FROM `eventbrite`.`eventos` WHERE idEventos={idEventos};"
            mycursor.execute(sql)
            connection.commit()
    finally:
        connection.close()


def getEventById(idEventos):
    try:
        connection = getConnection()
        with connection.cursor() as mycursor:
            sql = f"SELECT * FROM eventbrite.eventos where idEventos={idEventos};"
            mycursor.execute(sql)
            eventos = mycursor.fetchone()
    finally:
        connection.close()
    return eventos


def getAllEvents():
    try:
        connection = getConnection()
        with connection.cursor() as mycursor:
            sql = "SELECT * FROM eventbrite.eventos;"
            mycursor.execute(sql)
            eventos = mycursor.fetchall()
    finally:
        connection.close()
    return eventos
