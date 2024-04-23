extends Object
class_name Resources


var gold: int = 0
var metal: int = 0
var population: int = 0
var fuel: int = 0


func add(res: Resources):
	gold += res.gold
	metal += res.metal
	population += res.population
	fuel += res.fuel


func sub(res: Resources):
	gold -= res.gold
	metal -= res.metal
	population -= res.population
	fuel -= res.fuel


func mult(val: int):
	gold *= val
	metal *= val
	population *= val
	fuel *= val


func div(val: int):
	gold /= val
	metal /= val
	population /= val
	fuel /= val
