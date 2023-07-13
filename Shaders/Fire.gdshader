shader_type canvas_item;

uniform sampler2D noise : repeat_enable;
uniform sampler2D gradient : repeat_enable;

uniform vec2 scroll1 = vec2(0.05, 0.05);
uniform vec2 scroll2 = vec2(0.06, 0.06);

void fragment() {
	float base = texture(TEXTURE, UV + scroll1 * TIME).r;
	float noise_background = texture(noise, UV + scroll2 * TIME).r;
	float energy = (base * noise_background) - (1.0 - UV.y) * 0.5;
	vec4 color = texture(gradient, vec2(energy));

	COLOR = color;
}


