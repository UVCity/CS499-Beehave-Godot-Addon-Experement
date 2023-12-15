extends ActionLeaf


func tick(_runner , _blackboard):

	var runner_nav: NavigationAgent2D = _get_node_nav(_runner)
	runner_nav.set_target_position( _random_direction() )
	return SUCCESS

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
