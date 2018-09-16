//
// adjust Opacity
//

#version 330

const vec4 std601X = vec4(  0.299 ,  0.587,  0.114, 0.0  );
const vec4 std601Y = vec4( -0.169 , -0.331,  0.500, 0.0  );
const vec4 std601Z = vec4(  0.500 , -0.419, -0.081, 0.0  );

const vec4 std601R = vec4( 1.596027*0.85882394366802,1.164383*0.85882394366802, 0.000000,0.0  );
const vec4 std601G = vec4(-0.812968*0.85882394366802,1.164383*0.85882394366802,-0.391762*0.85882394366802,0.0  );
const vec4 std601B = vec4( 0.000000,1.164383*0.85882394366802, 2.017232*0.85882394366802,0.0  );
const vec4 stdbias = vec4(-0.5  , -0.0625,  -0.5   ,0.0  );

uniform sampler2DRect inputTex;

uniform float Opacity;

in vec2 fsTexture;
//in float fsCosHue; (cos(1)=1)
//in float fsSinHue; (sin(0)=0)

out vec4 outColor;

void main(void)
{
	vec4 texColor;
	vec4 yuvIn;
    vec4 yuvOut;
    
    texColor = texture(inputTex, fsTexture);
    
	yuvIn = vec4(dot(std601X, texColor),
                 dot(std601Y, texColor),
                 dot(std601Z, texColor),
                 1.0 );

    yuvOut.g = yuvIn.r;
    yuvOut.r = yuvIn.b;
    yuvOut.b = yuvIn.g;
    
    outColor=vec4(dot(std601R, yuvOut),
                  dot(std601G, yuvOut),
                  dot(std601B, yuvOut),
                  Opacity);
}

