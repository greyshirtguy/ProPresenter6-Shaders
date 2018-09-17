#version 330


layout (location=0) in vec3 vsPosition;
layout (location=1) in vec2 vsTexture;
uniform float QtrRotations;
uniform float Scale;
uniform sampler2DRect inputTex;


out vec2 fsTexture;

vec2 translatev(vec2 vt, float xt, float yt) {
	//return v;
	return vec2(vt.x+xt, vt.y+yt);
}

vec2 rotate(vec2 v, float a, float sf, float xt, float yt) {
	float s = sin(a);
	float c = cos(a);
	
	mat2 m = mat2(c, -s, s, c);
	vec2 moved = translatev(v,-xt/sf,-yt/sf);
	vec2 rotated = m * vec2(moved.x,moved.y);
	return vec2(rotated.x+xt, rotated.y+yt);
}


void main()
{
	// Rotate an integer amount of quarter turns (take a QtrRotations value from 0-3, round to nearest integer value and then mulitply by 90)
	gl_Position=vec4(vsPosition.x,vsPosition.y,vsPosition.z,1.0);
	ivec2 texSize=textureSize(inputTex);
	float xt = texSize.x/2;
	float yt = texSize.y/2;
	
	
	float sf = 1.0;
	if (mod(round(QtrRotations),2) == 1)
	{
		// The rotation is "sideways" - lets auto-scale (based on assumption of 16:9 source)
		sf = 0.5625;
		if (texSize.y > texSize.x)
		{
			sf = 1.0 / sf;
		}
		
	}
	
	
	vec2 scaled = vec2(vsTexture.x/(sf*Scale), vsTexture.y/(sf*Scale));
	vec2 rotated = rotate(scaled, -90*round(QtrRotations)*3.14159/180.0, sf*Scale, xt, yt);
	fsTexture = rotated;
}
