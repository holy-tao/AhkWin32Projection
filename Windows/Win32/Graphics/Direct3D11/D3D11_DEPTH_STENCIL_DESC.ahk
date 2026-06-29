#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_DEPTH_STENCILOP_DESC.ahk" { D3D11_DEPTH_STENCILOP_DESC }
#Import ".\D3D11_STENCIL_OP.ahk" { D3D11_STENCIL_OP }
#Import ".\D3D11_COMPARISON_FUNC.ahk" { D3D11_COMPARISON_FUNC }
#Import ".\D3D11_DEPTH_WRITE_MASK.ahk" { D3D11_DEPTH_WRITE_MASK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes depth-stencil state. (D3D11_DEPTH_STENCIL_DESC)
 * @remarks
 * Pass a pointer to <b>D3D11_DEPTH_STENCIL_DESC</b> to the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate">ID3D11Device::CreateDepthStencilState</a> method to create the depth-stencil state object.
 * 
 * Depth-stencil state controls how depth-stencil testing is performed by the output-merger stage.
 * 
 * The following table shows the default values of depth-stencil states.
 * 
 * <table>
 * <tr>
 * <th>State</th>
 * <th>Default Value</th>
 * </tr>
 * <tr>
 * <td>DepthEnable</td>
 * <td>TRUE</td>
 * </tr>
 * <tr>
 * <td>DepthWriteMask</td>
 * <td>D3D11_DEPTH_WRITE_MASK_ALL</td>
 * </tr>
 * <tr>
 * <td>DepthFunc</td>
 * <td>D3D11_COMPARISON_LESS</td>
 * </tr>
 * <tr>
 * <td>StencilEnable</td>
 * <td>FALSE</td>
 * </tr>
 * <tr>
 * <td>StencilReadMask</td>
 * <td>D3D11_DEFAULT_STENCIL_READ_MASK</td>
 * </tr>
 * <tr>
 * <td>StencilWriteMask</td>
 * <td>D3D11_DEFAULT_STENCIL_WRITE_MASK</td>
 * </tr>
 * <tr>
 * <td>
 * FrontFace.StencilFunc
 * 
 * and
 * 
 * BackFace.StencilFunc
 * 
 * </td>
 * <td>D3D11_COMPARISON_ALWAYS</td>
 * </tr>
 * <tr>
 * <td>
 * FrontFace.StencilDepthFailOp
 * 
 * and
 * 
 * BackFace.StencilDepthFailOp
 * 
 * </td>
 * <td>D3D11_STENCIL_OP_KEEP</td>
 * </tr>
 * <tr>
 * <td>
 * FrontFace.StencilPassOp
 * 
 * and
 * 
 * BackFace.StencilPassOp
 * 
 * </td>
 * <td>D3D11_STENCIL_OP_KEEP</td>
 * </tr>
 * <tr>
 * <td>
 * FrontFace.StencilFailOp
 * 
 * and
 * 
 * BackFace.StencilFailOp
 * 
 * </td>
 * <td>D3D11_STENCIL_OP_KEEP</td>
 * </tr>
 * </table>
 *  
 * 
 * The formats that support stenciling are DXGI_FORMAT_D24_UNORM_S8_UINT and DXGI_FORMAT_D32_FLOAT_S8X24_UINT.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_DEPTH_STENCIL_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable depth testing.
     */
    DepthEnable : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_depth_write_mask">D3D11_DEPTH_WRITE_MASK</a></b>
     * 
     * Identify a portion of the depth-stencil buffer that can be modified by depth data (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_depth_write_mask">D3D11_DEPTH_WRITE_MASK</a>).
     */
    DepthWriteMask : D3D11_DEPTH_WRITE_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a></b>
     * 
     * A function that compares depth data against existing depth data. The function options are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a>.
     */
    DepthFunc : D3D11_COMPARISON_FUNC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable stencil testing.
     */
    StencilEnable : BOOL

    /**
     * Type: <b>UINT8</b>
     * 
     * Identify a portion of the depth-stencil buffer for reading stencil data.
     */
    StencilReadMask : Int8

    /**
     * Type: <b>UINT8</b>
     * 
     * Identify a portion of the depth-stencil buffer for writing stencil data.
     */
    StencilWriteMask : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a></b>
     * 
     * Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing towards the camera (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a>).
     */
    FrontFace : D3D11_DEPTH_STENCILOP_DESC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a></b>
     * 
     * Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a>).
     */
    BackFace : D3D11_DEPTH_STENCILOP_DESC

}
