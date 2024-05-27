extends Node2D
class_name Planet

var timer
var planet_name: String = ""
var mouse_on_planet = false
var recource_amount: int
var recource: String
var colonized: bool
var planet_recource: int
var happiness: float = 1
var ticks_before_happiness_reduction: int = 5
var planet_resources_delta: Resources = Resources.new()
signal recurces_producted(arg: Resources)
signal planet_position(arg: Vector2)
signal double_recources(delta: Resources, type: int)



func _ready():
	$Sprite/Area2D.mouse_entered.connect(on_mouse_entered)
	$Sprite/Area2D.mouse_exited.connect(on_mouse_exited)
	$Double_recources.pressed.connect(double_resource_amount)
	$Colonize.pressed.connect(colonize)
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2
	timer.start()
	timer.connect('timeout',on_Timer_timeout)
	position = generate_random_coordinates_2d()
	$ProgressBar.value = 1
	$ProgressBar.max_value = 1

func generate_recources():
	planet_recource = randi() % 4
	recource_amount = randi_range(1,5)
	if (planet_recource == 0):
		planet_resources_delta.gold = recource_amount
		recource = 'gold'
	elif (planet_recource == 1):
		planet_resources_delta.metal = recource_amount
		recource = 'metal'
	elif (planet_recource == 2):
		planet_resources_delta.fuel = recource_amount
		recource = 'fuel'
	else:
		planet_resources_delta.population = recource_amount
		recource = 'population'
	$ResourcesView.update_resources(planet_resources_delta)	

func on_Timer_timeout():
	emit_signal('recurces_producted',planet_resources_delta)
	if ticks_before_happiness_reduction != 1:
		ticks_before_happiness_reduction -= 1
	else:
		ticks_before_happiness_reduction = 5
		$ProgressBar.value -= 0.01



func generate_random_coordinates_2d():
	var random_x = randi_range(0,800)
	var random_y = randi_range(0,600)
	return Vector2(random_x, random_y)


func on_mouse_entered():
	mouse_on_planet = true
	$ResourcesView.visible = true
	$Double_recources.visible = true
	$Colonize.visible = true
	$Something.visible = true


func on_mouse_exited():
	mouse_on_planet = false
	$ResourcesView.visible = false


func double_resource_amount():
	if colonized:
		print("emmited ",planet_recource,' ',recource_amount)
		emit_signal('double_recources',planet_resources_delta,planet_recource)
		$Double_recources.disabled = true
		$ResourcesView.update_resources(planet_resources_delta)
		happiness -= 0.1
		$ProgressBar.value = happiness
	$Double_recources.visible = false
	$Something.visible = false
	$Colonize.visible = false	



func _input(event):
	if Input.is_action_just_pressed("LMB"):
		if mouse_on_planet:
			emit_signal("planet_position",position)
		else:
			$Double_recources.visible = false
			$Something.visible = false
			$Colonize.visible = false	


func colonize():
	$Colonize.text = "Colonized"
	colonized = true
	$Colonize.disabled = true
	generate_recources()
	$Double_recources.visible = false
	$Something.visible = false
	$Colonize.visible = false
	happiness -= 0.1	
	$ProgressBar.value = happiness

