# Godot DiscreteTexture

This addon adds a `DiscreteTexture` resource that builds on top of `GradientTexture`.


## API

It provides this new method:

- `discrete() -> ImageTexture` which uses the `Gradient` resouce to produce an `ImageTexture` of size `Vector2(width, 1)`. This can be previewed in the _Inspector_ as shown in the image below

![GradientTexture to DiscreteTexture](./screenshots/inspector.png)
