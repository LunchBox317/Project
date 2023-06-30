shader_type canvas_item;

uniform sampler2D noise :repeat_enable;
uniform sampler2D noise2: repeat_enable;
uniform vec2 scroll = vec2(0.05, 0.05);
uniform vec2 scroll2 = vec2(-0.06, -0.06);
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float distortion_strength : hint_range(0.0, 1.0) = 0.2;
uniform vec4 top_color : source_color;
uniform vec4 tone_color : source_color;

uniform float light_start : hint_range(0.0, 1.0) = 0.25;
uniform float light_end : hint_range(0.0, 1.0) = 0.50;

void fragment() {
float depth = texture(noise, UV + scroll * TIME).r * texture(noise2, UV + scroll2 * TIME).r;
//vec4 noise_col = texture(noise, UV + scroll * TIME); 
vec4 top_light = smoothstep(light_start,light_end, depth) * top_color;
vec4 layer1 = texture(SCREEN_TEXTURE, SCREEN_UV + distortion_strength * vec2(depth));
COLOR = layer1 * tone_color + top_light;
COLOR.a = 1.0;
}
