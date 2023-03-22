extends TouchScreenButton

var offset : Vector2 = Vector2.ZERO
var strength : Vector2 = Vector2.ZERO
var analog_pressed := false

onready var texture_size := normal.get_size()
onready var analog_center := $Sprite

func _process(_delta):
	if analog_pressed:
		var touch_position : Vector2 = (get_local_mouse_position() - texture_size / 2.0 - offset).clamped(texture_size.x / 2.0)
		analog_center.position = touch_position + texture_size / 2.0
		strength = (touch_position) / (texture_size / 2.0)
		print(strength)


func _on_Analog_pressed():
	analog_pressed = true
	offset = get_local_mouse_position() - texture_size / 2.0


func _on_Analog_released():
	analog_pressed = false
	analog_center.position = texture_size / 2
