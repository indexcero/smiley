shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec2 r_displacement = vec2(3.0, 0.0);
uniform vec2 g_displacement = vec2(0.0, -15.0);
uniform vec2 b_displacement = vec2(-3.0, 0.0);
uniform float wave_count : hint_range(1.0, 50.0, 1.0) = 50.0;
uniform float speed : hint_range(0.0, 60.0, 0.1) = 60;
uniform float height : hint_range(0.0, 0.3, 0.003) = 0.3;



void fragment()
{
		
	vec2 cPos = -1.0 + 2.0 * UV / (1.0 / TEXTURE_PIXEL_SIZE);
	float cLength = length(cPos);
	vec2 uv = FRAGCOORD.xy / (0.99 / SCREEN_PIXEL_SIZE).xy + (cPos/cLength) * cos(cLength * wave_count - TIME * speed) * height;
	
	float r = sin(TIME*18.0) - texture(SCREEN_TEXTURE, uv + vec2(SCREEN_PIXEL_SIZE*r_displacement), 0.0).r;
	float g = texture(SCREEN_TEXTURE,uv).r;
	float b = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE*b_displacement), 0.0).b;

	COLOR = vec4(r, g, b, 1.0);
	
//    vec3 col = texture(vec4(r, g, b, 1.0),uv).xyz;
//		vec3 col = texture(SCREEN_TEXTURE,uv).xyz;
	//vec3 col = texture(SCREEN_TEXTURE,uv).xyz;
	//COLOR = vec4(col,1.0);
}