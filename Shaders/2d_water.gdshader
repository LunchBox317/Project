shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

void fragment() {
vec2 pog = SCREEN_UV * texture(SCREEN_TEXTURE, SCREEN_UV).r;
vec4 shader = texture(TEXTURE , pog);
COLOR = shader;
COLOR.a = 0.35;
}

void vertex() {
	VERTEX.y += 1.0 * sin((TIME) + (UV.x + 2.0 * TIME));
}
