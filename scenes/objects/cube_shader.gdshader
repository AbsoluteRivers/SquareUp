shader_type canvas_item;

//void vertex() {
	// Called for every vertex the material is visible on.
//}
uniform vec4 original_0: source_color;
uniform vec4 original_1: source_color;

uniform vec4 replace_0: source_color;
uniform vec4 replace_1: source_color;
const float precision = 0.1;

vec4 replace_color(vec4 rep_color) {
	vec4 original_color[2] = vec4[2](original_0, original_1);
	vec4 replacement_color[2] = vec4[2](replace_0, replace_1);
	
	for(int i = 0; i < 2; i++) {
		if(distance(rep_color, original_color[i]) <= precision){
		//distance(rep_color) represents the color at the UV
			rep_color = replacement_color[i];
		}
	}
	
	return rep_color;
}

void fragment() {
	
		//COLOR = rep_color * original_0;
	
	COLOR = replace_color(texture(TEXTURE, UV));
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
