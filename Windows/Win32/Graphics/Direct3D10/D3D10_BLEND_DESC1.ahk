#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_RENDER_TARGET_BLEND_DESC1.ahk

/**
 * Describes the blend state for a Direct3D 10.1 device.
 * @remarks
 * 
  * To see how blending is done, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">Output-Merger Stage (Direct3D 10)</a>.
  * 
  * These are the default values for the blend description.
  * 
  * <table>
  * <tr>
  * <th>State</th>
  * <th>Default Value</th>
  * </tr>
  * <tr>
  * <td>AlphaToCoverageEnable</td>
  * <td><b>FALSE</b></td>
  * </tr>
  * <tr>
  * <td>IndependentBlendEnable</td>
  * <td><b>FALSE</b></td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].BlendEnable</td>
  * <td><b>FALSE</b></td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].SrcBlend</td>
  * <td>D3D10_BLEND_ONE</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].DestBlend</td>
  * <td>D3D10_BLEND_ZERO</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].BlendOp</td>
  * <td>D3D10_BLEND_OP_ADD</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].SrcBlendAlpha</td>
  * <td>D3D10_BLEND_ONE</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].DestBlendAlpha</td>
  * <td>D3D10_BLEND_ZERO</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].BlendOpAlpha</td>
  * <td>D3D10_BLEND_OP_ADD</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].RenderTargetWriteMask</td>
  * <td>D3D10_COLOR_WRITE_ENABLE_ALL</td>
  * </tr>
  * </table>
  *  
  * 
  * This structure requires Windows Vista Service Pack 1.
  * 
  * If the driver type is set to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_HARDWARE</a>, the feature level is set to less than or equal to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_9_3</a>, and the pixel format of the render target is set to <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</a>, <b>DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</b>, or <b>DXGI_FORMAT_B8G8R8X8_UNORM_SRGB</b>, the device performs the blend in standard RGB (sRGB) space and not in linear space. However, if the feature level is set to greater than <b>D3D_FEATURE_LEVEL_9_3</b>, the device performs the blend in linear space.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/ns-d3d10_1-d3d10_blend_desc1
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_BLEND_DESC1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Determines whether or not to use the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">alpha-to-coverage</a>multisampling technique when setting a render-target pixel.
     * @type {Integer}
     */
    AlphaToCoverageEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Set to <b>TRUE</b> to enable independent blending in simultaneous render targets. If set to <b>FALSE</b>, only the RenderTarget[0] members are used. RenderTarget[1..7] are ignored.
     * @type {Integer}
     */
    IndependentBlendEnable {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_render_target_blend_desc1">D3D10_RENDER_TARGET_BLEND_DESC1</a></b>
     * 
     * An array of render-target-blend descriptions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_render_target_blend_desc1">D3D10_RENDER_TARGET_BLEND_DESC1</a>); these correspond to the eight rendertargets 
     *         that can be set to the output-merger stage at one time.
     * @type {Array<D3D10_RENDER_TARGET_BLEND_DESC1>}
     */
    RenderTarget{
        get {
            if(!this.HasProp("__RenderTargetProxyArray"))
                this.__RenderTargetProxyArray := Win32FixedArray(this.ptr + 8, 8, D3D10_RENDER_TARGET_BLEND_DESC1, "")
            return this.__RenderTargetProxyArray
        }
    }
}
