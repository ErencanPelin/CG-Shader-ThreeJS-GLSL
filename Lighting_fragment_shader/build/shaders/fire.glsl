varying vec3 vNormal;

void main()
{
    vec3 light = vec3( 0.5, 0.2, 1.0 );
    light = normalize( light );
    float dProd = dot( vNormal, light );
    dProd=clamp(dProd,0.0,1.0);
    gl_FragColor = vec4(round(dProd * 4.0) * 0.25,round(dProd * 4.0) * 0.25,round(dProd * 4.0) * 0.25, 1.0 );
}