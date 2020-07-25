extends Node2D

onready var pregunta_label :Label= $Situation/VBoxContainer/Label
onready var respuestas :VBoxContainer= $Situation/VBoxContainer/Options
onready var mensaje_label := $Message/Messages/Label
onready var menu_mensaje := $Message
onready var menu_pregunta:= $Situation
onready var menu_message:= $Message

var situacion_actual = 1
var situaciones = {
	1: {'enunciado': 'estas en clases que haces',
		'preguntas': {
			1: {'pregunta': 'te matas',
				'mensaje': 'te has matado ya se ha terminado para ti',
				'siguiente': 1}, 
			2: {'pregunta': 'matas a la niña',
				'mensaje': 'era tu hermana pinche flaite',
				'siguiente': 1}, 
			3: {'pregunta': 'robas el iphone',
				'mensaje': 'el iphone que te has robado esta lleno de bitcoins te has forrado',
				'siguiente': 2}, 
			4: {'pregunta': 'nada',
				'mensaje': 'que nada pinche inutil de mierda',
				'siguiente': 1}, 
			}
	},
	2: {'enunciado': 'ahora que estas millonario usas tus bitcoins en',
		'preguntas': {
			1: {'pregunta': 'comprar un buen coche',
				'mensaje': 'pinche culero inutil te has matado al salir con tu nuevo coche',
				'siguiente': 1}, 
			2: {'pregunta': 'gastarlo en arruinarle la vida a un amigo',
				'mensaje': 'te has arruinado tu tambien',
				'siguiente': 1}, 
			3: {'pregunta': 'lo donas a los pobres',
				'mensaje': 'pinche puto',
				'siguiente': 2}, 
			4: {'pregunta': 'te lo comes',
				'mensaje': 'pinche culiao flaite',
				'siguiente': 1}, 
			}
	}
}

func _ready():
	$Message/Messages/Continue.connect("pressed", self, "_on_Continue_pressed")

	_cambiar_pregunta()

func _cambiar_pregunta():
	for b in respuestas.get_children():
		b.queue_free()
	
	var s = situaciones[situacion_actual]
	
	pregunta_label.set_text(s['enunciado'])

	for p in s['preguntas'].values():
		var b = Button.new()
		b.set_text(p['pregunta'])
		respuestas.add_child(b)
		b.connect("pressed", self, "_on_click", [p])

func _on_click(pregunta):
	mensaje_label.set_text(pregunta['mensaje'])
	
	menu_mensaje.visible = true
	menu_pregunta.visible = false
	
	situacion_actual = pregunta['siguiente']
	
	_cambiar_pregunta()

func _on_Continue_pressed():
	menu_pregunta.visible = true
	menu_message.visible = false
