shader_type canvas_item;

void fragment() {
	vec4 text = texture(TEXTURE, UV);
	if (COLOR.r + COLOR.b + COLOR.g > 2.65)
	COLOR.a = 0.0;
}
