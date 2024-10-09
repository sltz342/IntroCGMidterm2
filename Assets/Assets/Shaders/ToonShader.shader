Shader "Custom/ToonShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _RampTex ("Ramp Texture", 2D) = "white"{}
        
    }
    SubShader
    {
        CGPROGRAM
        
        #pragma surface surf ToonRamp

        float4 _Color;
        sampler2D _RampTex;


        struct Input
        {
            float2 uv_RampTex;
        };

        //Lecture 5 Slides Referenced for Toon Shader Code referenced by Sean Melyashkevich for the Intro to CG Midterm 2024
        //Code was used from Slide 25-27 from Lecture 5: Visual Effects created by Alvaro Quevedo


        //The LightingToonRamp here is 
        float4 LightingToonRamp (SurfaceOutput s, fixed2 lightDir, fixed atten)
        {
            float diff = dot (s.Normal, lightDir);
            float h = diff * 0.5 + 0.5;
            float2 rh= h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
            c.a = s.Alpha;
            return c;
        }
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
