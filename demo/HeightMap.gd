tool
extends TextureRect


const L8_MAX := float(0xff)

export var colormap: Texture = DiscreteTexture.new()


func _ready() -> void:
	colormap.gradient.connect("changed", self, "_on_ColormapGradient_changed")
	yield(texture, "changed")
	
	var height_map := texture.get_data()
	height_map.convert(Image.FORMAT_L8)
	var height_map_minmax := get_minmax(height_map.get_data())
	height_map_minmax.min /= L8_MAX
	height_map_minmax.max /= L8_MAX
	
	material.set_shader_param("noise_min", height_map_minmax.min)
	material.set_shader_param("noise_max", height_map_minmax.max)


func _on_ColormapGradient_changed() -> void:
	material.set_shader_param("colormap", colormap.discrete())


func get_minmax(array: Array) -> Dictionary:
	var out := {"min": INF, "max": -INF}
	for value in array:
		out.min = min(out.min, value)
		out.max = max(out.max, value)
	return out
