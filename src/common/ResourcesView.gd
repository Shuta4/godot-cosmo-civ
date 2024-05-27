extends Control
class_name ResourcesView


@onready var label_gold = $VBoxContainer/RowGold/LabelGoldValue
@onready var label_metal = $VBoxContainer/RowMetal/LabelMetalValue
@onready var label_population = $VBoxContainer/RowPopulation/LabelPopulationValue
@onready var label_fuel = $VBoxContainer/RowFuel/LabelFuelValue


func update_resources(res: Resources):
	label_gold.text = str(res.gold)
	label_metal.text = str(res.metal)
	label_population.text = str(res.population)
	label_fuel.text = str(res.fuel)
