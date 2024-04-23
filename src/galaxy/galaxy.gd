extends Node2D
class_name Galaxy


var planet_system_scene = preload("res://src/planet_system/planet_system.tscn")
var systems: Array = []
var players: Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	var system = planet_system_scene.instantiate()
	add_child(system)
	system.set_system_name("Test")
