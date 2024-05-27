extends Node2D


var system_name: String = ""
var number_of_planet
var resources: Resources = Resources.new()
var resources_delta: Resources = Resources.new()
@onready var resources_view: ResourcesView = $VBoxContainer/ResourcesView
@onready var inventory: Inventory = $Inventory
@onready var label_name: Label = $VBoxContainer/LabelName
var planet_scene = preload("res://src/planet/planet.tscn")


func _ready():
	number_of_planet = randi_range(2,6)
	for i in range(number_of_planet):
		var planet_instance = planet_scene.instantiate()
		add_child(planet_instance)
		planet_instance.connect('planet_position',_on_planet_clicked)
		planet_instance.connect('recurces_producted',_on_planet_recurces_producted)
		planet_instance.connect('double_recources',double_recources)


func set_system_name(name: String):
	system_name = name
	label_name.text = system_name


func _on_planet_recurces_producted(delta_recources: Resources):
	resources.add(delta_recources)
	resources_view.update_resources(resources)


func _on_planet_clicked(position: Vector2):
	pass


func double_recources(recources: Resources, planet_type:int):
	var able = inventory.check_ability(planet_type)
	print(able)
	if able:
		recources.mult(2)
	
	
