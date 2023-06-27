shader_type canvas_item;
uniform float height = 1.0;
uniform float frequency = 10000.0;
uniform float speed = 10.0;


void vertex() {
	
	VERTEX.y +=  sin(( frequency * UV.x ) + (speed * TIME));
//	VERTEX.y +=  sin(( frequency * UV.x ) + (speed * TIME));
	
}
