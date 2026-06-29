#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DEPTH_WRITE_MASK.ahk" { D3D12_DEPTH_WRITE_MASK }
#Import ".\D3D12_DEPTH_STENCILOP_DESC1.ahk" { D3D12_DEPTH_STENCILOP_DESC1 }
#Import ".\D3D12_STENCIL_OP.ahk" { D3D12_STENCIL_OP }
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEPTH_STENCIL_DESC2 {
    #StructPack 4

    DepthEnable : BOOL

    DepthWriteMask : D3D12_DEPTH_WRITE_MASK

    DepthFunc : D3D12_COMPARISON_FUNC

    StencilEnable : BOOL

    FrontFace : D3D12_DEPTH_STENCILOP_DESC1

    BackFace : D3D12_DEPTH_STENCILOP_DESC1

    DepthBoundsTestEnable : BOOL

}
