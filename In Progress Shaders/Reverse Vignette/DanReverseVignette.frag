//
// Fragment shader for reverse vignette
//
// Based from Vignette by Jeff Brown
// Modified by Dan Owen
//
//


#version 330

uniform sampler2DRect inputTex;
uniform float vertpos;
uniform float opacity;

in float fsOuterRadius;
in float fsInnerRadius;
in vec2 fsTexture;
in vec3 fsPosition;
out vec4 outColor;

void main()
{
    vec4 texel = texture(inputTex, fsTexture);
    float dist1=distance(fsPosition,vec3(-0.5,vertpos,0.0));
	float dist2=distance(fsPosition,vec3(0.5,vertpos,0.0));
	float dist=(dist1+dist2)/4;
    float darken=1.0-clamp(opacity*(fsOuterRadius-dist)/(fsOuterRadius-fsInnerRadius),0.0,1.0);
    outColor.rgb=texel.rgb*darken;
    outColor.a=texel.a;
}
