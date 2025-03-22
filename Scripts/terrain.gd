extends Node
@export var num_hills = 2
@export var slice = 10
@export var hill_range = 165

var screensize
var terrain = Array()
var texture = preload("res://asset/Ground_injek.png")

func _ready() -> void:
	randomize()
	screensize = get_viewport().get_visible_rect().size
	terrain = Array()
	var start_y = screensize.y * 3/4 + (-hill_range + randi() % hill_range * 2)
	terrain.append(Vector2(0, start_y))
	add_hills()

func _process(delta: float) -> void:
	if terrain[-1].x <$"../Player".position.x + screensize.x/2:
		add_hills()

func add_hills():
	var hill_width = screensize.x / num_hills
	var hill_slices = hill_width / slice
	var start = terrain[-1]
	var poly = PackedVector2Array()
	for i in range(num_hills):
		var height = randi() % hill_range
		start.y -= height
		for j in range(0, hill_slices):
			var hill_point = Vector2()
			hill_point.x = start.x + j * slice + hill_width * i
			hill_point.y = start.y + height * cos(2 * PI / hill_slices * j)
			#$Line2D.add_point(hill_point)
			terrain.append(hill_point)
			poly.append(hill_point)
		start.y += height
	
	poly.append(Vector2(terrain[-1].x, screensize.y))  # Added
	poly.append(Vector2(start.x, screensize.y))        # Added

	# Create a CollisionPolygon2D for the Area2D
	var collision_polygon = CollisionPolygon2D.new()  # Added
	var shape = CollisionPolygon2D.new()
	$StaticBody2D.add_child(shape)
	shape.polygon = poly
	collision_polygon.polygon = poly                  # Added
	$Area2D.add_child(collision_polygon)              # Added

	# Create a Polygon2D for visual representation
	var ground_polygon = Polygon2D.new()              # Added
	ground_polygon.polygon = poly                     # Added
	ground_polygon.texture = texture                  # Added
	add_child(ground_polygon)

	
	#var ground = Polygon2D.new()
	
	#$Area2D.add_child(shape)
	#poly.append(Vector2(terrain[-1].x, screensize.y))
	#poly.append(Vector2(start.x, screensize.y))
	#shape.polygon = poly
	#ground.polygon = poly
	#ground.texture = texture
	#add_child(ground)
