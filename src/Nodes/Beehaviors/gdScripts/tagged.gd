extends ConditionLeaf
# we need to know who is playing
	# we need to know who is hunter (first player)
		# hunter needs to know who is available to tag
	# if we are not a hunter , we should not be here .

func tick(_hunter , _blackboard):
	
	# init condition
	if _blackboard.get_value("hunter") == null :
		print("Game starts with ",_hunter.name," as the hunter")
		_blackboard.set_value("hunter", _hunter)
		return RUNNING


	# check condition
	if _hunter == _blackboard.get_value("hunter"):
		print ("->",_hunter.name,
			" is the Hunter\n") 
		return SUCCESS
	
	else:
		if _blackboard.get_value("runners") == null :
			var runners : Array[Node] = []
			_blackboard.set_value("runners", runners)
		return FAILURE

# to restart tick return RUNNING
# to move to Hunter return SUCCESS
# to move to NotIt return FAILURE
