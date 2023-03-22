extends TouchScreenButton

var offset : Vector2 = Vector2.ZERO
var strength : Vector2 = Vector2.ZERO
var analog_pressed := false
var touch_position := Vector2.ZERO
var touch_id := 0

onready var texture_size := normal.get_size()
onready var analog_center := $Sprite

func _process(_delta):
	if analog_pressed:
		analog_center.position = touch_position + texture_size / 2.0
		strength = (touch_position) / (texture_size / 2.0)


func _on_Analog_pressed():
	analog_pressed = true
	offset = get_local_mouse_position() - texture_size / 2.0


func _on_Analog_released():
	analog_pressed = false
	analog_center.position = texture_size / 2

func _input(event):
	if analog_pressed:
		if event is InputEventScreenDrag and event.index == touch_id:
			var tpos = event.position - (global_position + texture_size / 2.0)
			touch_position = tpos.clamped(texture_size.x / 2.0)
				
	elif event is InputEventScreenTouch:
		var tpos = event.position - (global_position + texture_size / 2.0)
		if tpos.length() < texture_size.x:
			touch_id = event.index
		
			
