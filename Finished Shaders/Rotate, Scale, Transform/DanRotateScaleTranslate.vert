#version 330


layout (location=0) in vec3 vsPosition;
layout (location=1) in vec2 vsTexture;
uniform float Rotation;
uniform float Xoffset;
uniform float Yoffset;
uniform float XScale;
uniform float YScale;
uniform sampler2DRect inputTex;

out vec2 fsTexture;

vec2 translatev(vec2 vt, float xt, float yt) {
	//return v;
	return vec2(vt.x+xt, vt.y+yt);
}

vec2 rotate(vec2 v, float a) {
	float s = sin(a);
	float c = cos(a);
	ivec2 texSize=textureSize(inputTex);
	float xt = texSize.x/2;
	float yt = texSize.y/2;
	mat2 m = mat2(c, -s, s, c);
	vec2 moved = translatev(v,-xt/XScale,-yt/YScale);
	vec2 rotated = m * vec2(moved.x,moved.y);
	return vec2(rotated.x+xt, rotated.y+yt);
}


vec2 rotate2(vec2 v, float a) {
	float s = sin(a);
	float c = cos(a);
	mat2 m = mat2(c, -s, s, c);
	return m * vec2(v.x/XScale-Xoffset,v.y/YScale-Yoffset);
}

void main()
{
	gl_Position=vec4(vsPosition.x,vsPosition.y,vsPosition.z,1.0);
	vec2 scaled = vec2(vsTexture.x/XScale, vsTexture.y/YScale);
	vec2 rotated = rotate(scaled, Rotation*3.14159/180.0);
	fsTexture = translatev(rotated,Xoffset,Yoffset);
}
