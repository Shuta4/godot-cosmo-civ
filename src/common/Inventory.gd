extends Control
class_name Inventory


@onready var type1 = $VBoxContainer/RowGold/Type1Value
@onready var type2 = $VBoxContainer/RowMetal/Type2Value
@onready var type3 = $VBoxContainer/RowPopulation/Type3Value
@onready var type4 = $VBoxContainer/RowFuel/Type4Value
var type1_value: int
var ability: bool
var type2_value: int
var type3_value: int
var type4_value: int

func update_inventory():
	type1.text = str(type1_value)
	type2.text = str(type2_value)
	type3.text = str(type4_value)
	type4.text = str(type3_value)


func _ready():
	type1_value = 2
	type2_value = 2
	type3_value = 2
	type4_value = 2
	type1.text = str(type1_value)
	type2.text = str(type2_value)
	type3.text = str(type3_value)
	type4.text = str(type4_value)


func check_ability(planet_type: int):
	match planet_type:
		0:
			print('first')
			if type1_value==0:
				ability = false
			else:
				type1_value -= 1
				ability = true
		1:
			print('second')
			if type2_value==0:
				ability = false
			else:
				type2_value -= 1
				ability = true
		2:
			print('third')
			if type3_value==0:
				ability = false
			else:
				type3_value -= 1
				ability = true
		3:
			print('fourth')
			if type4_value==0:
				ability =  false
			else:
				type4_value -= 1
				ability = true
	update_inventory()
	return ability
