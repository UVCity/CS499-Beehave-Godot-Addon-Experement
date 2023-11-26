extends ActionLeaf


func tick(_hunter , _blackboard):
	var runners: Array[Node] = _no_tag_backs(_blackboard.get_value("runners"))

	var hunt_nav: NavigationAgent2D = _get_node_nav(_hunter)
	hunt_nav.set_target_position(_get_nearest(runners))
	var direction = hunt_nav.get_next_path_position() - _hunter.global_position
	direction = direction.normalized()
	_hunter.velocity = _hunter.velocity.lerp(direction*256, 2)
	_hunter.move_and_slide()
	
	
	_print_available_(runners)
	var tagged_ = _successfully_tagged(_hunter, runners);
	
	if tagged_:
		_blackboard.get_value("runners").erase(tagged_)
		_blackboard.set_value("hunter", tagged_)
		return FAILURE

# to restart tick return RUNNING
# to move to Tagged return SUCCESS
# to move to NotIt return FAILURE

func _successfully_tagged(_self : Node , runners : Array[Node]):
	for touched in _self.get_slide_collision_count():
		var collision = _self.get_slide_collision(touched)
		var target = collision.get_collider()
		if target in runners :
			print(">>",_self.name ," just tagged ", target.name, "\n")
			return target

func _get_node_nav(node: Node):
	for child in node.get_children():
		if child is NavigationAgent2D:
			return child

func _get_nearest(runners: Array[Node]) -> Vector2:
	var available_runners = runners.duplicate()
	available_runners.sort_custom(_sort_closest)
	return available_runners.front().get_position()
	
func _no_tag_backs(runners) ->Array[Node]:
	var available_runners = runners.duplicate()
	available_runners.erase( runners[-1] )
	return available_runners

func _print_available_(runners_names):
	var names : Array[String] = []
	for runners in runners_names:
		names.append(runners.name)
		
	print(" Available Runners : ",names,"\n")

func _sort_closest(a, b):
	return a.position < b.position
