#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_BLEND.ahk" { D3D10_BLEND }
#Import ".\D3D10_BLEND_OP.ahk" { D3D10_BLEND_OP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the blend state for a render target for a Direct3D 10.1 device
 * @remarks
 * To see how blending is done, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">Output-Merger Stage (Direct3D 10)</a>.
 * 
 * These are the default values for blend state.
 * 
 * <table>
 * <tr>
 * <th>State</th>
 * <th>Default Value</th>
 * </tr>
 * <tr>
 * <td>BlendEnable</td>
 * <td>FALSE</td>
 * </tr>
 * <tr>
 * <td>SrcBlend</td>
 * <td>D3D10_BLEND_ONE</td>
 * </tr>
 * <tr>
 * <td>DestBlend</td>
 * <td>D3D10_BLEND_ZERO</td>
 * </tr>
 * <tr>
 * <td>BlendOp</td>
 * <td>D3D10_BLEND_OP_ADD</td>
 * </tr>
 * <tr>
 * <td>SrcBlendAlpha</td>
 * <td>D3D10_BLEND_ONE</td>
 * </tr>
 * <tr>
 * <td>DestBlendAlpha</td>
 * <td>D3D10_BLEND_ZERO</td>
 * </tr>
 * <tr>
 * <td>BlendOpAlpha</td>
 * <td>D3D10_BLEND_OP_ADD</td>
 * </tr>
 * <tr>
 * <td>RenderTargetWriteMask</td>
 * <td>D3D10_COLOR_WRITE_ENABLE_ALL</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/ns-d3d10_1-d3d10_render_target_blend_desc1
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_RENDER_TARGET_BLEND_DESC1 {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) blending.
     */
    BlendEnable : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the first RGB data source and includes an optional pre-blend operation.
     */
    SrcBlend : D3D10_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the second RGB data source and includes an optional pre-blend operation.
     */
    DestBlend : D3D10_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> defines how to combine the RGB data sources.
     */
    BlendOp : D3D10_BLEND_OP

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the first alpha data source and includes an optional pre-blend operation. Blend options that end in _COLOR are not allowed.
     */
    SrcBlendAlpha : D3D10_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the second alpha data source and includes an optional pre-blend operation. Blend options that end in _COLOR are not allowed.
     */
    DestBlendAlpha : D3D10_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> defines how to combine the alpha data sources.
     */
    BlendOpAlpha : D3D10_BLEND_OP

    /**
     * Type: <b>UINT8</b>
     * 
     * A write mask.
     */
    RenderTargetWriteMask : Int8

}
