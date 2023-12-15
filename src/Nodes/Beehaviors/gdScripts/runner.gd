extends ActionLeaf

func tick(_runner , _blackboard):
	
	#_print_all_(_blackboard.get_value("runners"))
	
	var runner_nav: NavigationAgent2D = _get_node_nav(_runner)
	var gos = runner_nav.get_next_path_position()
	var pos = _runner.global_position
	
	if (_runner != _blackboard.get_value("hunter")):
		if roundi(pos[0]) != roundi(gos[0]) :
		
			#print( _runner.name ," is at ", pos , " trying to get to ", gos)

			var direction = runner_nav.get_next_path_position() - _runner.global_position
			direction = direction.normalized()
			_runner.velocity = _runner.velocity.lerp(direction*300, .01)
			_runner.move_and_slide()

			return RUNNING

		return SUCCESS
		
	return FAILURE



func _print_all_(runners_names):
	var names : Array[String] = []
	for runners in runners_names:
		names.append(runners.name)
		
	print(" All Runners : ",names,"\n")

func _get_node_nav(node: Node):
	for child in node.get_children():
		if child is NavigationAgent2D:
			return child
