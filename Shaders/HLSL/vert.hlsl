struct Attributes
{
    [[vk::location(0)]] float2 position: POSITION;
    [[vk::location(1)]] float3 color: COLOR;
};

struct Varyings
{
    float4 positionCS : SV_POSITION;
    [[vk::location(0)]] float4 color: COLOR;
};

Varyings vert(Attributes IN)
{
    Varyings OUT;
    OUT.positionCS = float4(IN.position.xy, 0, 1);
    OUT.color = float4(IN.color.xyz, 1);
    return OUT;
}

float4 frag(Varyings IN) : SV_TARGET
{
    return IN.color;
}