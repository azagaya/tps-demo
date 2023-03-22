extends CanvasLayer

onready var player : Player = owner
onready var analog := $Control3/Analog
onready var camera_analog := $Camera/Camera


func _process(delta):
	if analog.analog_pressed:
		var strength : Vector2 = analog.strength
		
		if strength.x >= 0:
			Input.action_press("move_right", strength.x)
			Input.action_press("move_left", 0.0)
		else:
			Input.action_press("move_right", 0.0)
			Input.action_press("move_left", -strength.x)
		if strength.y >= 0:
			Input.action_press("move_forward", 0.0)
			Input.action_press("move_back", strength.y)
		else:
			Input.action_press("move_forward", -strength.y)
			Input.action_press("move_back", 0.0)
		
	if camera_analog.analog_pressed:
		var strength : Vector2 = camera_analog.strength
		if strength.x >= 0:
			Input.action_press("view_right", strength.x)
			Input.action_press("view_left", 0.0)
		else:
			Input.action_press("view_right", 0.0)
			Input.action_press("view_left", -strength.x)
		if strength.y >= 0:
			Input.action_press("view_up", 0.0)
			Input.action_press("view_down", strength.y)
		else:
			Input.action_press("view_up", -strength.y)
			Input.action_press("view_down", 0.0)

func _on_JumpButton_pressed():
	Input.action_press("jump") if not player.aiming else Input.action_press("shoot")


func _on_AimButton_released():
	Input.action_release("aim")


func _on_JumpButton_released():
	Input.action_release("jump") if not player.aiming else Input.action_release("shoot")


func _on_AimButton_pressed():
	Input.action_press("aim")


func _on_Analog_released():
	Input.action_release("move_back")
	Input.action_release("move_forward")
	Input.action_release("move_left")
	Input.action_release("move_right")



func _on_Camera_released():
	Input.action_release("view_up")
	Input.action_release("view_left")
	Input.action_release("view_right")
	Input.action_release("view_down")


func _on_Analog_pressed():
	pass # Replace with function body.


func _on_Camera_pressed():
	pass # Replace with function body.
