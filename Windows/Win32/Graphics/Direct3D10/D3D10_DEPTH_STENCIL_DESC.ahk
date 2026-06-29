#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_STENCIL_OP.ahk" { D3D10_STENCIL_OP }
#Import ".\D3D10_DEPTH_STENCILOP_DESC.ahk" { D3D10_DEPTH_STENCILOP_DESC }
#Import ".\D3D10_COMPARISON_FUNC.ahk" { D3D10_COMPARISON_FUNC }
#Import ".\D3D10_DEPTH_WRITE_MASK.ahk" { D3D10_DEPTH_WRITE_MASK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes depth-stencil state. (D3D10_DEPTH_STENCIL_DESC)
 * @remarks
 * Depth-stencil state controls how <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">depth-stencil</a> testing is performed by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger</a> stage.
 * 
 * The formats that support stenciling are DXGI_FORMAT_D24_UNORM_S8_UINT and DXGI_FORMAT_D32_FLOAT_S8X24_UINT.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_DEPTH_STENCIL_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that enables depth testing.  The default value is <b>TRUE</b>.
     */
    DepthEnable : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_depth_write_mask">D3D10_DEPTH_WRITE_MASK</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_depth_write_mask">D3D10_DEPTH_WRITE_MASK</a> enumerated type that identifies a portion of the depth-stencil buffer that can be modified by depth data.  The default value is <b>D3D10_DEPTH_WRITE_MASK_ALL</b>.
     */
    DepthWriteMask : D3D10_DEPTH_WRITE_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_comparison_func">D3D10_COMPARISON_FUNC</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_comparison_func">D3D10_COMPARISON_FUNC</a> enumerated type that defines how depth data is compared against existing depth data.  The default value is <b>D3D10_COMPARISON_LESS</b>
     */
    DepthFunc : D3D10_COMPARISON_FUNC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that enables stencil testing.  The default value is <b>FALSE</b>.
     */
    StencilEnable : BOOL

    /**
     * Type: <b>UINT8</b>
     * 
     * A value that identifies a portion of the depth-stencil buffer for reading stencil data.  The default value is <b>D3D10_DEFAULT_STENCIL_READ_MASK</b>.
     */
    StencilReadMask : Int8

    /**
     * Type: <b>UINT8</b>
     * 
     * A value that identifies a portion of the depth-stencil buffer for writing stencil data. The default value is <b>D3D10_DEFAULT_STENCIL_WRITE_MASK</b>.
     */
    StencilWriteMask : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a> structure that identifies how to use the results of the depth test and the stencil test for pixels whose surface normal is facing toward the camera.
     */
    FrontFace : D3D10_DEPTH_STENCILOP_DESC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a> structure that identifies how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera.
     */
    BackFace : D3D10_DEPTH_STENCILOP_DESC

}
