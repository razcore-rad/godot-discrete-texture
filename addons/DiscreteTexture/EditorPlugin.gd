tool
extends EditorPlugin


var _discrete_texture_inspector_plugin := preload("EditorInspectorPlugin.gd").new()


func _enter_tree() -> void:
	add_inspector_plugin(_discrete_texture_inspector_plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(_discrete_texture_inspector_plugin)
