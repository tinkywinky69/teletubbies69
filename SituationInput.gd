extends VBoxContainer

func _ready():
	pass


func _on_Button_pressed():
	queue_free()


func get_data() -> Dictionary:
	var siguiente = find_node("Next").get_text()
	var pregunta = find_node("Option").get_text()
	var mensaje = find_node("Message").get_text()
	
	return {'pregunta':pregunta, 'mensaje':mensaje, 'siguiente':siguiente}
