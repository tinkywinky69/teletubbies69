extends Node

var situaciones = {}

func _ready():
	pass
	
var file_name = 'situaciones.dat'
func load_data():
	var f = File.new()
	f.open("data.json", File.READ)
	var json = JSON.parse(f.get_as_text())
	f.close()
	situaciones = json.result

func save_data():
	var f = File.new()
	f.open("data.json", File.WRITE)
	f.store_string(JSON.print(situaciones, "  ", true))
	f.close()


