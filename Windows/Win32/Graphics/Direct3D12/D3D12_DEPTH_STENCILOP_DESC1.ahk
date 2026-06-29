#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STENCIL_OP.ahk" { D3D12_STENCIL_OP }
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEPTH_STENCILOP_DESC1 {
    #StructPack 4

    StencilFailOp : D3D12_STENCIL_OP

    StencilDepthFailOp : D3D12_STENCIL_OP

    StencilPassOp : D3D12_STENCIL_OP

    StencilFunc : D3D12_COMPARISON_FUNC

    StencilReadMask : Int8

    StencilWriteMask : Int8

}
