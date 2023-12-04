static float2 positions[3] = 
{
    float2(0.0f, -.5f),
    float2(0.5f, 0.5f),
    float2(-.5f, .5f)
};

static float3 colors[3] = 
{
    float3(1,0,0),
    float3(0,1,0),
    float3(0,0,1)
};

struct Attributes
{
    [[vk::location(0)]]uint vertexId : SV_VERTEXID;
};

struct Varyings
{
    float4 positionCS : SV_POSITION;
    [[vk::location(0)]] float4 color : COLOR;
};

Varyings vert(Attributes IN)
{
    Varyings OUT;
    OUT.positionCS = float4(positions[IN.vertexId].xy, 0, 1);
    OUT.color = float4(colors[IN.vertexId], 1);
    return OUT;
}

float4 frag(Varyings IN) : SV_TARGET
{
    return IN.color;
}