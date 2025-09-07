#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class D3D10_RENDER_TARGET_BLEND_DESC1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) blending.
     * @type {Integer}
     */
    BlendEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the first RGB data source and includes an optional pre-blend operation.
     * @type {Integer}
     */
    SrcBlend {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the second RGB data source and includes an optional pre-blend operation.
     * @type {Integer}
     */
    DestBlend {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> defines how to combine the RGB data sources.
     * @type {Integer}
     */
    BlendOp {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the first alpha data source and includes an optional pre-blend operation. Blend options that end in _COLOR are not allowed.
     * @type {Integer}
     */
    SrcBlendAlpha {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the second alpha data source and includes an optional pre-blend operation. Blend options that end in _COLOR are not allowed.
     * @type {Integer}
     */
    DestBlendAlpha {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> defines how to combine the alpha data sources.
     * @type {Integer}
     */
    BlendOpAlpha {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * A write mask.
     * @type {Integer}
     */
    RenderTargetWriteMask {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }
}
