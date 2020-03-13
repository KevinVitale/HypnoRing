// https://www.shadertoy.com/view/MtjBWy
void main()
{
    float speed = 1.0;
    float spokes = 50.0;
    vec4 original = SKDefaultShading();

    float theta = atan2(v_tex_coord.y - a_center.y, v_tex_coord.x - a_center.x);
    float percent = theta / (2.0*3.14159);
    if (mod(percent * spokes + speed*u_time, 2.0) < 1.0) {
        gl_FragColor = vec4(1, 1, 1, original.a);
    }
    else {
        gl_FragColor = vec4(a_color.r, a_color.g, a_color.b, a_color.a * original.a);
    }
}
