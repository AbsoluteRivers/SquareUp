shader_type canvas_item;

//void vertex() {
	// Called for every vertex the material is visible on.
//}
uniform vec4 original_0: source_color;
uniform vec4 original_1: source_color;
uniform vec4 replace_0: source_color;
uniform vec4 replace_1: source_color;

void fragment() {
	vec4 rep_color = texture(TEXTURE, UV);
	COLOR = rep_color * original_0;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
