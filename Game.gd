extends Node2D

onready var pregunta_label :Label= $Situation/VBoxContainer/Label
onready var respuestas :VBoxContainer= $Situation/VBoxContainer/Options
onready var mensaje_label := $Message/Messages/Label
onready var menu_mensaje := $Message
onready var menu_pregunta:= $Situation
onready var menu_message:= $Message


var situacion_actual = '1'

func _ready() -> void:
	Data.load_data()
	$Message/Messages/Continue.connect("pressed", self, "_on_Continue_pressed")

	_cambiar_pregunta()

func _cambiar_pregunta() -> void:
	for b in respuestas.get_children():
		b.queue_free()
	
	var s = Data.situaciones[situacion_actual]
	
	pregunta_label.set_text(s['enunciado'])

	for p in s['preguntas']:
		var b = load("res://Opcion.tscn").instance()
		respuestas.add_child(b)
		b.set_text(p['pregunta'])
		b.get_node('Button').connect("pressed", self, "_on_click", [p])

func _on_click(pregunta) -> void:
	mensaje_label.set_text(pregunta['mensaje'])
	
	menu_mensaje.visible = true
	menu_pregunta.visible = false
	
	situacion_actual = pregunta['siguiente']
	
	_cambiar_pregunta()

func _on_Continue_pressed() -> void:
	menu_pregunta.visible = true
	menu_message.visible = false


func _on_Button_pressed():
	var insert_data = preload("res://DataInsert.tscn").instance()
	self.add_child(insert_data)
