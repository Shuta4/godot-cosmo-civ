extends Control
class_name ResourcesView


@onready var label_gold = $VBoxContainer/RowGold/LabelGold
@onready var label_metal = $VBoxContainer/RowGold/LabelMetal
@onready var label_population = $VBoxContainer/RowGold/LabelPopulation
@onready var label_fuel = $VBoxContainer/RowGold/LabelFuel


func update_resources(res: Resources):
	label_gold.text = res.gold
	label_metal.text = res.metal
	label_population.text = res.population
	label_fuel.text = res.fuel
