extends Control

onready var situation_input = preload("res://SituationInput.tscn")
onready var enunciado = $HBoxContainer/LineEdit
onready var numero_situacion = $HBoxContainer/LineEdit2

func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	var caja = find_node("VBoxContainer")
	var si = situation_input.instance()
	caja.add_child(si)


func _on_save_pressed():
	var preguntas = []
	for child in find_node("VBoxContainer").get_children():
		preguntas.append(child.get_data())
		
	var situacion = numero_situacion.get_text()
	Data.situaciones[situacion]['enunciado'] = enunciado.get_text()
	Data.situaciones[situacion]['preguntas'] = preguntas
	Data.save_data()
	queue_free()
