tool
extends TextureRect


const CHECKERS = [0xff, 0x80, 0x80, 0xff]
const CHECKERS_SIZE = 16 * Vector2.ONE

var _discrete_texture: DiscreteTexture

onready var checkers: TextureRect = $Checkers


func _ready() -> void:
	var checkers_image := Image.new()
	checkers_image.create_from_data(2, 2, false, Image.FORMAT_L8, CHECKERS)
	checkers.texture.create_from_image(checkers_image, Texture.FLAG_REPEAT)
	checkers.texture.set_size_override(CHECKERS_SIZE)


func setup(discrete_texture: DiscreteTexture) -> void:
	_discrete_texture = discrete_texture
	_discrete_texture.connect("changed", self, "_on_DiscreteTexture_changed")
	_update()


func _on_DiscreteTexture_changed() -> void:
	if _discrete_texture.gradient == null or _discrete_texture.gradient.is_connected("changed", self, "_update"):
		return
	
	_discrete_texture.gradient.connect("changed", self, "_update")
	_update()


func _update() -> void:
	texture = _discrete_texture.discrete()
