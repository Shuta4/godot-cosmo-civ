extends Node2D


var system_name: String = ""
var resources: Resources = Resources.new()
var resources_delta: Resources = Resources.new()
@onready var resources_view: ResourcesView = $VBoxContainer/ResourcesView
@onready var label_name: Label = $VBoxContainer/LabelName


func _ready():
	resources_delta.gold = 3
	resources_delta.population = 2
	update_resources()


func set_system_name(name: String):
	system_name = name
	label_name.text = system_name


func update_resources():
	resources.add(resources_delta)
	resources_view.update_resources(resources)
