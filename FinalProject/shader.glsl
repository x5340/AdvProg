
#version 410 core

out vec4 colorOut;
uniform float screen_ratio;
uniform vec2 screen_size;
uniform vec2 center;
uniform float zoom;
uniform int itr;
uniform int p;

out vec4 FragColor;
in vec3 ourColor;
in vec2 TexCoord;
uniform sampler2D texture1;

vec4 map_to_color(float t) {
    float r = 9.0 * (1.0 - t) * t * t * t;
    float g = 15.0 * (1.0 - t) * (1.0 - t) * t * t;
    float b = 8.5 * (1.0 - t) * (1.0 - t) * (1.0 - t) * t;
    
    return vec4(r, g, b, 1.0);
}

vec2 zPower(vec2 z, int p){
    float angle, radius, x, y;
    radius = sqrt((z.x*z.x + z.y*z.y));
    if (z.x == 0 && z.y == 0)
        angle = 0;
    else if (z.x == 0)
        angle = 3.14159 / 2;
    else
        angle = atan(z.y/z.x);
    //if(z.x < 0)
    //    angle = 3.14-angle;
    //if (z.y < 0)
    //    angle = (2*3.14) - angle;
    angle = angle * p;
    radius = pow(radius,p);
    x = radius*cos(angle);
    y = radius*sin(angle);
    
    z.x = x;
    z.y = y;
    return z;
}

void main()
{
    vec2 z, c;
    z.x = 0, z.y = 0;
    c.x = screen_ratio * (gl_FragCoord.x / screen_size.x - 0.5);
    c.y = (gl_FragCoord.y / screen_size.y - 0.5);
    
    c.x /= zoom;
    c.y /= zoom;
    
    c.x += center.x;
    c.y += center.y;
    z = c;
    
    int i;
    for(i = 0; i < itr; i++) {
        //float x = (z.x * z.x - z.y * z.y) + c.x;
        //float y = (z.y * z.x + z.x * z.y) + c.y;
        if((z.x * z.x + z.y * z.y) > 2.0) break;
        
        z = zPower(z,p) + c;
        z = zPower(z,p)+c;
        
    }
    
    float t = float(i) / float(itr);
    
    colorOut = map_to_color(float(t));
    
    FragColor = mix(texture(texture1, TexCoord), colorOut, 0.4);
}
