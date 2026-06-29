#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_FILL_MODE.ahk" { D3D12_FILL_MODE }
#Import ".\D3D12_LINE_RASTERIZATION_MODE.ahk" { D3D12_LINE_RASTERIZATION_MODE }
#Import ".\D3D12_CONSERVATIVE_RASTERIZATION_MODE.ahk" { D3D12_CONSERVATIVE_RASTERIZATION_MODE }
#Import ".\D3D12_CULL_MODE.ahk" { D3D12_CULL_MODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RASTERIZER_DESC2 {
    #StructPack 4

    FillMode : D3D12_FILL_MODE

    CullMode : D3D12_CULL_MODE

    FrontCounterClockwise : BOOL

    DepthBias : Float32

    DepthBiasClamp : Float32

    SlopeScaledDepthBias : Float32

    DepthClipEnable : BOOL

    LineRasterizationMode : D3D12_LINE_RASTERIZATION_MODE

    ForcedSampleCount : UInt32

    ConservativeRaster : D3D12_CONSERVATIVE_RASTERIZATION_MODE

}
