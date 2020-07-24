extends Node2D

onready var pregunta_label :Label= $Situation/VBoxContainer/Label
onready var respuestas :VBoxContainer= $Situation/VBoxContainer/Options
onready var mensaje_label := $Message/Messages/Label
onready var menu_mensaje := $Message
onready var menu_pregunta:= $Situation
onready var menu_message:= $Message

var pregunta_numero = 0

var preguntas = [
	#0
	['estas en clases que haces', 'te matas', 'matas a la niña', 'robas el iphone', 'nada', 3],
	#1
	['ahora que estas millonario usas tus bitcoins en', 'comprar un buen coche', 'gastarlo en arruinarle la vida a un amigo', 'lo donas a los pobres', 'te lo comes', 2],
]

var mensajes = [
	#0
	[	'te has matado ya se ha terminado para ti', 
		'era tu hermana pinche flaite', 
		'el iphone que te has robado esta lleno de bitcoins te has forrado',
		'que nada pinche inutil de mierda'],
	#1
	[	'pinche culero inutil te has matado al salir con tu nuevo coche',
		'te has arruinado tu tambien',
		'pinche puto',
		'pinche culero'],
]


func _ready():
	$Message/Messages/Continue.connect("pressed", self, "_on_Continue_pressed")

	_cambiar_pregunta()

func _cambiar_pregunta():
	pregunta_label.set_text(preguntas[pregunta_numero][0])

	var texto_respuesta = ''
	for btn_respuesta in respuestas.get_children():
		btn_respuesta.set_text(preguntas[pregunta_numero][btn_respuesta.get_index()+1])
		btn_respuesta.connect("pressed", self, "_on_click", [btn_respuesta.get_index()])

func _on_click(boton_index):
	var texto_mensaje = mensajes[pregunta_numero][boton_index]
	mensaje_label.set_text(texto_mensaje)
	
	menu_mensaje.visible = true
	menu_pregunta.visible = false
	
	if(preguntas[pregunta_numero][5] == boton_index+1):
		pregunta_numero = pregunta_numero + 1
	else:
		pregunta_numero = 0
	
	_cambiar_pregunta()


func _on_Continue_pressed():
	menu_pregunta.visible = true
	menu_message.visible = false
