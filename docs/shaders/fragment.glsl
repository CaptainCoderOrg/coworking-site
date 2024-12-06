#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_mouse;

vec2 rotate(vec2 v, float angle) {
    return v * mat2(
    cos(angle), -sin(angle),
    sin(angle), cos(angle)
  );
}

void main() {
  vec2 m = (u_mouse/u_resolution) - 0.5;
  float t = u_time * 0.1;
  float angle = t;
  float size = 2.0;
  float center = size * 0.5;
  vec2 st = gl_FragCoord.xy/u_resolution * size - center;
  const float fractures = 8.0;
  for (float i = 0.0; i < fractures; i += 1.0)
  {
    st = abs(st);
    st -= 0.5;
    st *= 1.2;
    st = rotate(st, angle);
  }

  gl_FragColor = vec4(
    length(st.x*abs(sin(t*3.14152)+0.2)), 
    length(st.y*abs(cos(t) + 0.1)), 
    length(st.x + st.y), 1.0);
}
