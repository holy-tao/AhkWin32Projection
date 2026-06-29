#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_BLEND.ahk" { D3D10_BLEND }
#Import ".\D3D10_BLEND_OP.ahk" { D3D10_BLEND_OP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the blend state. (D3D10_BLEND_DESC)
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
 * <td>AlphaToCoverageEnable</td>
 * <td>FALSE</td>
 * </tr>
 * <tr>
 * <td>BlendEnable[8]</td>
 * <td>FALSE (for all 8)</td>
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
 * <td>RenderTargetWriteMask[8]</td>
 * <td>D3D10_COLOR_WRITE_ENABLE_ALL (for all 8)</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_BLEND_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Determines whether or not to use <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">alpha-to-coverage</a> as a multisampling technique when setting a pixel to a rendertarget.
     */
    AlphaToCoverageEnable : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) blending. There are eight elements in this array; these correspond to the eight rendertargets that can be set to output-merger stage at one time.
     */
    BlendEnable : BOOL[8]

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
     * A per-pixel write mask that allows control over which components can be written (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_color_write_enable">D3D10_COLOR_WRITE_ENABLE</a>).
     */
    RenderTargetWriteMask : Int8[8]

}
