#version 330


layout (location=0) in vec3 vsPosition;
layout (location=1) in vec2 vsTexture;
uniform float hue;

out vec2 fsTexture;
out float fsCosHue;
out float fsSinHue;

void main()
{
	gl_Position=vec4(vsPosition.x,vsPosition.y,vsPosition.z,1.0);
	fsTexture = vsTexture;
    fsCosHue=cos(hue);
    fsSinHue=sin(hue);
}
