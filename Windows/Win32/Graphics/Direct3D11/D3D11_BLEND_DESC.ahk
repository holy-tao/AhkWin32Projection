#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D11_RENDER_TARGET_BLEND_DESC.ahk

/**
 * Describes the blend state that you use in a call to ID3D11Device::CreateBlendState to create a blend-state object.
 * @remarks
 * 
  * Here are the default values for blend state.
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
  * <td>D3D11_BLEND_ONE</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].DestBlend</td>
  * <td>D3D11_BLEND_ZERO</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].BlendOp</td>
  * <td>D3D11_BLEND_OP_ADD</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].SrcBlendAlpha</td>
  * <td>D3D11_BLEND_ONE</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].DestBlendAlpha</td>
  * <td>D3D11_BLEND_ZERO</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].BlendOpAlpha</td>
  * <td>D3D11_BLEND_OP_ADD</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].RenderTargetWriteMask</td>
  * <td>D3D11_COLOR_WRITE_ENABLE_ALL</td>
  * </tr>
  * </table>
  *  
  * 
  * <div class="alert"><b>Note</b>  <b>D3D11_BLEND_DESC</b> is identical to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_blend_desc1">D3D10_BLEND_DESC1</a>.
  *         </div>
  * <div> </div>
  * If the driver type is set to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_HARDWARE</a>, the feature level is set to less than or equal to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_9_3</a>, and the pixel format of the render target is set to <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</a>, <b>DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</b>, or <b>DXGI_FORMAT_B8G8R8X8_UNORM_SRGB</b>, the display device performs the blend in standard RGB (sRGB) space and not in linear space. However, if the feature level is set to greater than <b>D3D_FEATURE_LEVEL_9_3</b>, the display device performs the blend in linear space, which is ideal.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BLEND_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target. For more info about using alpha-to-coverage, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Alpha-To-Coverage</a>.
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
     * Specifies whether to enable independent blending in simultaneous render targets.  Set to <b>TRUE</b> to enable independent blending. If set to <b>FALSE</b>, only the RenderTarget[0] members are used; RenderTarget[1..7] are ignored.
     * @type {BOOL}
     */
    IndependentBlendEnable{
        get {
            if(!this.HasProp("__IndependentBlendEnable"))
                this.__IndependentBlendEnable := BOOL(this.ptr + 4)
            return this.__IndependentBlendEnable
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_blend_desc">D3D11_RENDER_TARGET_BLEND_DESC</a>[8]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_blend_desc">D3D11_RENDER_TARGET_BLEND_DESC</a> structures that describe the blend states for render targets; these correspond to the eight render targets
     *             that can be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> at one time.
     * @type {Array<D3D11_RENDER_TARGET_BLEND_DESC>}
     */
    RenderTarget{
        get {
            if(!this.HasProp("__RenderTargetProxyArray"))
                this.__RenderTargetProxyArray := Win32FixedArray(this.ptr + 8, 8, D3D11_RENDER_TARGET_BLEND_DESC, "")
            return this.__RenderTargetProxyArray
        }
    }
}
