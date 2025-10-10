#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_RENDER_TARGET_BLEND_DESC1.ahk

/**
 * Describes the blend state that you use in a call to ID3D11Device1::CreateBlendState1 to create a blend-state object.
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
  * <td>RenderTarget[0].LogicOpEnable</td>
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
  * <td>RenderTarget[0].LogicOp</td>
  * <td>D3D11_LOGIC_OP_NOOP</td>
  * </tr>
  * <tr>
  * <td>RenderTarget[0].RenderTargetWriteMask</td>
  * <td>D3D11_COLOR_WRITE_ENABLE_ALL</td>
  * </tr>
  * </table>
  * 
  * If the driver type is set to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_HARDWARE</a>, the feature level is set to less than or equal to <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_9_3</a>, and the pixel format of the render target is set to <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</a>, <b>DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</b>, or <b>DXGI_FORMAT_B8G8R8X8_UNORM_SRGB</b>, the display device performs the blend in standard RGB (sRGB) space and not in linear space. However, if the feature level is set to greater than <b>D3D_FEATURE_LEVEL_9_3</b>, the display device performs the blend in linear space, which is ideal.
  * 
  * When you set the <b>LogicOpEnable</b> member of the first element of the <b>RenderTarget</b> array (<b>RenderTarget</b>[0]) to <b>TRUE</b>, you must also set the <b>BlendEnable</b> member of <b>RenderTarget</b>[0] to <b>FALSE</b>, and the <b>IndependentBlendEnable</b> member of this <b>D3D11_BLEND_DESC1</b> to <b>FALSE</b>. This reflects the limitation in hardware that you can't mix logic operations with blending across multiple render targets, and that when you use a logic operation, you must apply the same logic operation to all render targets.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/ns-d3d11_1-d3d11_blend_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BLEND_DESC1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target. For more info about using alpha-to-coverage, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Alpha-To-Coverage</a>.
     * @type {Integer}
     */
    AlphaToCoverageEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether to enable independent blending in simultaneous render targets. Set to <b>TRUE</b> to enable independent blending. If set to <b>FALSE</b>, only the <b>RenderTarget</b>[0] members are used; <b>RenderTarget</b>[1..7] are ignored.
     * 
     * See the **Remarks** section for restrictions.
     * @type {Integer}
     */
    IndependentBlendEnable {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_render_target_blend_desc1">D3D11_RENDER_TARGET_BLEND_DESC1</a>[8]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_render_target_blend_desc1">D3D11_RENDER_TARGET_BLEND_DESC1</a> structures that describe the blend states for render targets; these correspond to the eight render targets that can be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> at one time.
     * @type {Array<D3D11_RENDER_TARGET_BLEND_DESC1>}
     */
    RenderTarget{
        get {
            if(!this.HasProp("__RenderTargetProxyArray"))
                this.__RenderTargetProxyArray := Win32FixedArray(this.ptr + 8, 8, D3D11_RENDER_TARGET_BLEND_DESC1, "")
            return this.__RenderTargetProxyArray
        }
    }
}
