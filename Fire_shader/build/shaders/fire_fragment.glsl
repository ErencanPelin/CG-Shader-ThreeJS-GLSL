//FRAGMENT
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec3 firePos = vec3(0.5, 0.2, 0);
    float strength = 10.0;
    float height = -0.1;
    float range = 3.816;
    float speed = 5.0;
    float curveSteps = 2.0;
    float flameSteps = 15.0;
    float curveAmount = 0.05;
    
    float dist = distance(firePos, 
                          vec3(st.x + (sin(st.y * curveSteps + (u_time * speed)) * curveAmount * st.y), 
                               st.y * height, 
                               0.0));
  	dist = floor((1.0 - clamp(pow(dist * range, strength), 0.0, 1.0)) * flameSteps) / flameSteps;
    vec3 color = vec3(dist, dist * 0.5, dist * 0.2);

    gl_FragColor = vec4(color,1.0);
}