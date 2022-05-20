#version 330 core

// Variable de sortie (sera utilisé comme couleur)
out vec4 color;

// Un Fragment Shader minimaliste


// void main (void)
// {
//   //Couleur du fragment
//   color = vec4(0.0,0.0,1.0,1.0);



// }


// void main (void)
// {
//   float r=gl_FragCoord.x/800.0;
//   float g=gl_FragCoord.y/800.0;
//   color = vec4(r,g,0.0,0.0);
  
// }

// Il est possible d’affecter des fonctions sur les couleurs plus complexes. Essayez par exemple
// ces fonctions
// void main (void)
// {
//   float x=gl_FragCoord.x/800.0;
//   float y=gl_FragCoord.y/800.0;
//   float r=abs(cos(15.0*x+29.0*y));
//   float g=0.0;
//   if(abs(cos(25.0*x*x))>0.95){
//     g=1.0;
//   }
//   else{
//     g=0.0;
//   }
//   color = vec4(r,g,0.0,0.0);
// }


void main (void)
{
  float x=gl_FragCoord.x/800.0 - 0.5;
  float y=gl_FragCoord.y/800.0 - 0.5;

  if  (x*x + y*y > 0.2*0.2)
    color = vec4(0.0,0.0,1.0,1.0);
  else 
    color = vec4(1.0,0.0,0.0,1.0);
}