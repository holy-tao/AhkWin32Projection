#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DEPTH_WRITE_MASK.ahk" { D3D12_DEPTH_WRITE_MASK }
#Import ".\D3D12_DEPTH_STENCILOP_DESC.ahk" { D3D12_DEPTH_STENCILOP_DESC }
#Import ".\D3D12_STENCIL_OP.ahk" { D3D12_STENCIL_OP }
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes depth-stencil state. (D3D12_DEPTH_STENCIL_DESC1)
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> object contains a depth-stencil-state structure that controls how depth-stencil testing is performed by the output-merger stage.
 * 
 * This table shows the default values of depth-stencil states.
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
 * <td>D3D12_DEPTH_WRITE_MASK_ALL</td>
 * </tr>
 * <tr>
 * <td>DepthFunc</td>
 * <td>D3D12_COMPARISON_LESS</td>
 * </tr>
 * <tr>
 * <td>StencilEnable</td>
 * <td>FALSE</td>
 * </tr>
 * <tr>
 * <td>StencilReadMask</td>
 * <td>D3D12_DEFAULT_STENCIL_READ_MASK</td>
 * </tr>
 * <tr>
 * <td>StencilWriteMask</td>
 * <td>D3D12_DEFAULT_STENCIL_WRITE_MASK</td>
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
 * <td>D3D12_COMPARISON_ALWAYS</td>
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
 * <td>D3D12_STENCIL_OP_KEEP</td>
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
 * <td>D3D12_STENCIL_OP_KEEP</td>
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
 * <td>D3D12_STENCIL_OP_KEEP</td>
 * </tr>
 * <tr>
 * <td>DepthBoundsTestEnable</td>
 * <td>FALSE</td>
 * </tr>
 * </table>
 *  
 * 
 * The formats that support stenciling are DXGI_FORMAT_D24_UNORM_S8_UINT and DXGI_FORMAT_D32_FLOAT_S8X24_UINT.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEPTH_STENCIL_DESC1 {
    #StructPack 4

    /**
     * Specifies whether to enable depth testing. Set this member to <b>TRUE</b> to enable depth testing.
     */
    DepthEnable : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_depth_write_mask">D3D12_DEPTH_WRITE_MASK</a>-typed value that identifies a portion of the depth-stencil buffer that can be modified by depth data.
     */
    DepthWriteMask : D3D12_DEPTH_WRITE_MASK

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_comparison_func">D3D12_COMPARISON_FUNC</a>-typed value that identifies a function that compares depth data against existing depth data.
     */
    DepthFunc : D3D12_COMPARISON_FUNC

    /**
     * Specifies whether to enable stencil testing. Set this member to <b>TRUE</b> to enable stencil testing.
     */
    StencilEnable : BOOL

    /**
     * Identify a portion of the depth-stencil buffer for reading stencil data.
     */
    StencilReadMask : Int8

    /**
     * Identify a portion of the depth-stencil buffer for writing stencil data.
     */
    StencilWriteMask : Int8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc">D3D12_DEPTH_STENCILOP_DESC</a> structure that describes how to use the results of the depth test and the stencil test for pixels whose surface normal is facing towards the camera.
     */
    FrontFace : D3D12_DEPTH_STENCILOP_DESC

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc">D3D12_DEPTH_STENCILOP_DESC</a> structure that describes how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera.
     */
    BackFace : D3D12_DEPTH_STENCILOP_DESC

    /**
     * TRUE to enable depth-bounds testing; otherwise, FALSE. The default value is FALSE.
     */
    DepthBoundsTestEnable : BOOL

}
