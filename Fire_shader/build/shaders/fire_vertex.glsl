//VERTEX
varying vec3 vNormal;
varying vec2 vTextureCoord;
void main()
{
    vNormal = (normalMatrix * normal);
    vec4 ViewPosition= modelViewMatrix * vec4(position,1.0);
    gl_Position=projectionMatrix * ViewPosition;
}