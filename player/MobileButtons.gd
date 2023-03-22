extends CanvasLayer


var analog_pressed := false
var analog_offset : Vector2 = Vector2.ZERO

onready var player : Player = owner
onready var analog := $Control3/Analog
onready var analog_center := $Control3/Analog/Sprite

func _process(delta):
	if analog_pressed:
		var touch_position : Vector2 = (analog.get_local_mouse_position() - analog_offset).clamped(87)
		analog_center.position = touch_position + 87 * Vector2.ONE
		var strength : Vector2 = touch_position / 87
		Input.action_press("move_left", 1.0 - strength.x)
		Input.action_press("move_right", strength.x)
		Input.action_press("move_forward", 1.0 - strength.y)
		Input.action_press("move_back", strength.y)
		
	else:
		Input.action_release("move_back")
		Input.action_release("move_forward")
		Input.action_release("move_left")
		Input.action_release("move_right")
		analog_center.position = Vector2.ONE * 87


func _on_JumpButton_pressed():
	Input.action_press("jump") if not player.aiming else Input.action_press("shoot")


func _on_AimButton_released():
	Input.action_release("aim")


func _on_JumpButton_released():
	Input.action_release("jump") if not player.aiming else Input.action_release("shoot")


func _on_AimButton_pressed():
	Input.action_press("aim")


func _on_Analog_released():
	analog_pressed = false


func _on_Analog_pressed():
	analog_offset = analog.get_local_mouse_position()
	analog_pressed = true
