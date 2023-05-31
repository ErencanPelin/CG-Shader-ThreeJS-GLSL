uniform float u_time;
uniform float u_speed;
uniform float u_flameThinningFactor = 3.0;
uniform float u_flameEdgeWidth = 0.07;
uniform float u_waveStrength; //max 0.1
uniform float u_waveFrequency; //max 30

varying vec3 vNormal;
varying vec3 vPosition;
varying vec2 vTextureCoord;

const float pi = 3.14;
const vec2 center = vec2(0.5, 0.5);

float circularVignette(in vec2 screenUV, in vec2 offset, in float scale) {
    return 1.0 - (length(screenUV - offset - center) / 0.5) / scale;
}

float circularVignette(in vec2 screenUV) { 
      return circularVignette(screenUV, vec2(sin((u_time * u_speed) + (screenUV.y * -u_waveFrequency)) * u_waveStrength, 0.0), 1.0); 
}

void main() {
    vec2 st = clamp(vPosition.xy, 0.0, 1.0);// gl_FragCoord.xy/u_resolution.xy;

    float fade;
    fade = clamp(fade + (1.0 - st.y) * 0.8, 0.0, 1.0);

    if (abs(st.x - 0.5) > 0.5 / flameThinningFactor)
    {
        gl_FragColor = vec4(0.0);
        return;
    }
    else
    {
    fade *= cos((st.x - 0.5) * pi * flameThinningFactor);
    }
    float blue = fade;

    if (st.y < 0.5)
    {
    fade *= circularVignette(st);   
    }
    else
    {
    fade *= 1.0 - abs(st.x - center.x) / 0.5;
    }
    float red = fade;
    float clampVal = st.y;
    if (fade < clampVal)
    {
    gl_FragColor = vec4(0.0);
    return;
    }
    else if (fade < clampVal + flameEdgeWidth)
    {
    fade = (fade - clampVal) / flameEdgeWidth;
    }
    else
    {
    fade = 1.0;
    }

    vec3 flameCol = mix(vec3(0.024,0.383,1.000), vec3(0.036,0.343,0.900), blue);
    vec3 outerCol = mix(vec3(0.985,0.727,0.086), vec3(7.0,2.2,2.0), red);
    vec3 col = mix(flameCol, outerCol, fade);
    gl_FragColor = vec4(col * fade, 1.0);
}