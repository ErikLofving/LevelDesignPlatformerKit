shader_type spatial;



uniform vec4 primary_color :source_color;
uniform float rougness = 0.2;

uniform sampler2D normalmap_a :hint_normal;
uniform sampler2D normalmap_b :hint_normal;
uniform float normalmap_a_strenght = 0.3;
uniform float normalmap_b_strenght = 0.4;

uniform vec2 movement_direction = vec2(0.1, 0.1);
uniform float movement_strenght = 0.5;
uniform float uv_scale = 1.0;

float fresnel (float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp (dot(normalize(normal), normalize(view)), 0.0, 1.0)), amount);
}

void fragment() {
	float basic_fresnel = fresnel(3.0, NORMAL, VIEW);
	
	vec2 uv = UV * uv_scale;
	vec2 uv_movement = movement_direction * TIME * movement_strenght;
	
	vec3 normalmap = texture(normalmap_a, uv + uv_movement).rgb * normalmap_a_strenght;
	normalmap += texture(normalmap_b, uv - uv_movement).rgb * normalmap_b_strenght;
	
	ALBEDO = primary_color.rgb + (0.2 * basic_fresnel);
	ROUGHNESS = rougness * (1.0 - basic_fresnel);
	NORMAL_MAP = normalmap;
}