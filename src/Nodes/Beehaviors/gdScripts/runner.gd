extends ActionLeaf

func tick(_runner , _blackboard):
	
	_print_all_(_blackboard.get_value("runners"))
	
	var runner_nav: NavigationAgent2D = _get_node_nav(_runner)
	runner_nav.set_target_position(_random_direction())
	var direction = runner_nav.get_next_path_position() - _runner.global_position
	direction = direction.normalized()
	_runner.velocity = _runner.velocity.lerp(direction*300, .01)
	_runner.move_and_slide()
	
	
	if successfully_escaped():
		return SUCCESS

	return RUNNING



func _print_all_(runners_names):
	var names : Array[String] = []
	for runners in runners_names:
		names.append(runners.name)
		
	print(" All Runners : ",names,"\n")

func successfully_escaped():
	return true

func _get_node_nav(node: Node):
	for child in node.get_children():
		if child is NavigationAgent2D:
			return child

func _random_direction()-> Vector2:
	var screen = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(0, screen.x)
	var rndY = rng.randi_range(0, screen.y)
	return Vector2(rndX,rndY)

