varying vec3 vNormal;
varying vec3 vPosition;
varying vec2 vTextureCoord;

void main()
{
    vNormal = (normalMatrix * normal);
    vec4 ViewPosition= modelViewMatrix * vec4(position,1.0);
    vPosition = ViewPosition.xyz;
    vPosition.x += 0.5;
    gl_Position=projectionMatrix * ViewPosition;
}