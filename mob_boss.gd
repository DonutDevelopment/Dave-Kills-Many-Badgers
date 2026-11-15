extends Area2D

var mobHP = 50

func attack():
	mobHP = mobHP - 1
	print(mobHP)
	if mobHP <= 0:
		Global.Kills += 1
		queue_free()
