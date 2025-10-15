#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes the blend state.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_BLEND_DESC extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Determines whether or not to use <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">alpha-to-coverage</a> as a multisampling technique when setting a pixel to a rendertarget.
     * @type {BOOL}
     */
    AlphaToCoverageEnable{
        get {
            if(!this.HasProp("__AlphaToCoverageEnable"))
                this.__AlphaToCoverageEnable := BOOL(this.ptr + 0)
            return this.__AlphaToCoverageEnable
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) blending. There are eight elements in this array; these correspond to the eight rendertargets that can be set to output-merger stage at one time.
     * @type {Array<BOOL>}
     */
    BlendEnable{
        get {
            if(!this.HasProp("__BlendEnableProxyArray"))
                this.__BlendEnableProxyArray := Win32FixedArray(this.ptr + 8, 8, BOOL, "")
            return this.__BlendEnableProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the first RGB data source and includes an optional pre-blend operation.
     * @type {Integer}
     */
    SrcBlend {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the second RGB data source and includes an optional pre-blend operation.
     * @type {Integer}
     */
    DestBlend {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> defines how to combine the RGB data sources.
     * @type {Integer}
     */
    BlendOp {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the first alpha data source and includes an optional pre-blend operation. Blend options that end in _COLOR are not allowed.
     * @type {Integer}
     */
    SrcBlendAlpha {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> specifies the second alpha data source and includes an optional pre-blend operation. Blend options that end in _COLOR are not allowed.
     * @type {Integer}
     */
    DestBlendAlpha {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">blend operation</a> defines how to combine the alpha data sources.
     * @type {Integer}
     */
    BlendOpAlpha {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * A per-pixel write mask that allows control over which components can be written (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_color_write_enable">D3D10_COLOR_WRITE_ENABLE</a>).
     * @type {Array<Byte>}
     */
    RenderTargetWriteMask{
        get {
            if(!this.HasProp("__RenderTargetWriteMaskProxyArray"))
                this.__RenderTargetWriteMaskProxyArray := Win32FixedArray(this.ptr + 96, 8, Primitive, "char")
            return this.__RenderTargetWriteMaskProxyArray
        }
    }
}
