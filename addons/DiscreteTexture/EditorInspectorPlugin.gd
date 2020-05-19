extends EditorInspectorPlugin


const Preview := preload("Preview.tscn")


func can_handle(object: Object) -> bool:
	return object is DiscreteTexture


func parse_begin(object: Object) -> void:
	var preview := Preview.instance()
	preview.setup(object)
	add_custom_control(preview)
