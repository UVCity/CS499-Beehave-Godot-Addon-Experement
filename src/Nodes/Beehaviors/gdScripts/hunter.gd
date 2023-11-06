extends ActionLeaf

var AvalableTargets
var SuccessfulTag = false

func tick(_actor , _blackboard):

	if SuccessfulTag:
		return SUCCESS
	else:
		# if we do not return anything else ,
		# then move on the the next condition
		print(_actor.name ," is hunting for a target ..")
		# previous player tagged is exemtpt
