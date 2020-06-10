extends KinematicBody2D

export var initialBallSpeed = 300
export var speedAccumulator = 50
var ballSpeed = initialBallSpeed

var hitCounter = 0
var maxHitCounter = 12
var direction = Vector2()

func _ready():
	randomize()
	set_start_direction()

func set_start_direction():
	var randomX = 0
	
	if randi()%10 < 5:
		randomX = 1
	else:
		randomX = -1
		
	direction = Vector2(randomX, rand_range(-1,1))
	direction = direction.normalized() * ballSpeed
	
func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	if collision:
		direction = direction.bounce(collision.normal)
		if collision.collider.is_in_group("rackets"):
			var y = direction.y / 2 + collision.collider_velocity.y
			direction = Vector2(direction.x, y)
			direction = direction.normalized()
			direction *= ballSpeed + hitCounter * speedAccumulator;
			
			if hitCounter < maxHitCounter:
				hitCounter += 1
				
			$RacketSound.play()
		else:
			$WallSound.play()

func reset():
	position = Vector2(512,256)
	direction = Vector2()
	hitCounter = 0
