from eventos_db import insertEvent, updateEvent, getEventById, getAllEvents, deleteEvent
from prettytable import PrettyTable


def createNewEvent():
    idUsuarios = input("idUsuario:")
    nombre = input("Nombre:")
    categoria = input("Categoria:")
    fecha = (input("fechar:"))
    hora = input("Hora: ")
    descripcion = input("Descripcion: ")
    valorEntrada = float(input("Valor entrada: "))
    capacidad = int(input("Capacidad: "))
    disponibilidad = int(input("Disponibilidad: "))
    ciudad = input("Ciudad: ")
    pais = input("Pais: ")
    direccion = input("Direccion: ")
    tipo = int(input("Tipo :"))
    insertEvent(idUsuarios, nombre, categoria, fecha, hora, descripcion, valorEntrada, capacidad, disponibilidad, ciudad, pais, direccion, tipo)
    viewAllEvents()


def modifyEvent():
    idEventos = int(input("idEventos:"))
    oldEvent = getEventById(idEventos)

    print(f"old idUsuarios: {oldEvent['idUsuarios']}")
    idUsuarios = input("Nuevo idUsuarios: ")

    print(f"old nombre: {oldEvent['nombre']}")
    nombre = input("Nuevo nombre: ")

    print(f"old categoria: {oldEvent['categoria']}")
    categoria = input("Nueva categoria: ")

    print(f"old fecha: {oldEvent['fecha']}")
    fecha = int(input("Nueva fecha: "))

    print(f"old hora: {oldEvent['hora']}")
    hora = input("Nueva hora: ")

    print(f"old descripcion: {oldEvent['descripcion']}")
    descripcion = input("Nueva descripcion: ")

    print(f"old valorEntrada: {oldEvent['valorEntrada']}")
    valorEntrada = float(input("Nuevo valor de entrada: "))

    print(f"old capacidad: {oldEvent['capacidad']}")
    capacidad = int(input("Nueva capacidad: "))

    print(f"old disponibilidad: {oldEvent['disponibilidad']}")
    disponibilidad = int(input("Nueva disponibilidad: "))

    print(f"old ciudad: {oldEvent['ciudad']}")
    ciudad = input("Nueva ciudad: ")

    print(f"old pais: {oldEvent['pais']}")
    pais = input("Nuevo pais: ")

    print(f"old direccion: {oldEvent['direccion']}")
    direccion = input("Nueva direccion: ")

    print(f"old tipo: {oldEvent['tipo']}")
    tipo = int(input("Nuevo tipo: "))

    updateEvent(idEventos, idUsuarios, nombre, categoria, fecha, hora, descripcion, valorEntrada, capacidad, disponibilidad, ciudad, pais, direccion, tipo)
    viewEventById(idEventos)


def removeEvent():
    idEventos = int(input("idEventos:"))
    deleteEvent(idEventos)
    viewAllEvents()


def viewAllEvents():
    eventList = getAllEvents()

    table = PrettyTable()
    table.field_names = ["idEventos", "idUsuarios", "nombre", "categoria", "fecha", "hora", "descripcion", "valorEntrada", "capacidad", "disponibilidad", "ciudad", "pais", "direccion", "tipo"]

    for event in eventList:
        table.add_row(
            [event["idEventos"], event["idUsuarios"], event["nombre"], event["categoria"], event["fecha"], event["hora"], event["descripcion"], event["valorEntrada"], event["capacidad"], event["disponibilidad"], event["ciudad"], event["pais"], event["direccion"], event["tipo"]]
        )
    print(table)


def viewEventById(eventId):
    event = getEventById(eventId)
    table = PrettyTable()
    table.field_names = ["idEventos", "idUsuarios", "nombre", "categoria", "fecha", "hora", "descripcion", "valorEntrada", "capacidad", "disponibilidad", "ciudad", "pais", "direccion", "tipo"]
    table.add_row(
        [event["idEventos"], event["idUsuarios"], event["nombre"], event["categoria"], event["fecha"], event["hora"], event["descripcion"], event["valorEntrada"], event["capacidad"], event["disponibilidad"], event["ciudad"], event["pais"], event["direccion"], event["tipo"]]
    )
    print(table)
