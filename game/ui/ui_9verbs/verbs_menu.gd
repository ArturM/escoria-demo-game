tool
extends Control

"""
This script is out of Escoria's scope. It controls the UI reaction to an
UI event (eg right click) to change the cursor accordingly.
"""

func _ready():
	for but in $actions.get_children():
		but.connect("pressed", self, "_on_action_selected", [but.name])
		but.toggle_mode = true

func _on_action_selected(action : String):
	escoria.esc_runner.set_current_action(action)

	for but in $actions.get_children():
		but.set_pressed(but.get_name() == action)
	
