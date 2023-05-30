//FRAGMENT
varying vec3 vNormal;
varying vec2 vTextureCoord;

void main()
{
    gl_FragColor = vec4( texCoordV, 0.0, 1.0 );
}