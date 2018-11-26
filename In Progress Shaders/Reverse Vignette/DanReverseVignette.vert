#version 330


layout (location=0) in vec3 vsPosition;
layout (location=1) in vec2 vsTexture;
uniform float radius;

out vec2 fsTexture;
out vec3 fsPosition;
out float fsInnerRadius;
out float fsOuterRadius;

void main()
{
	gl_Position=vec4(vsPosition.x,vsPosition.y,vsPosition.z,1.0);

    fsOuterRadius=radius/100.0;
    fsInnerRadius=fsOuterRadius*.5;
    fsPosition=vsPosition*vec3(1.0,1080.0/1920.0,1.0);
    fsTexture = vsTexture;
}