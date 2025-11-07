#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_RENDER_TARGET_BLEND_DESC.ahk

/**
 * Describes the blend state.
 * @remarks
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> object contains a blend-state structure that controls blending by the output-merger stage.
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
 * <td>D3D12_BLEND_ONE</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].DestBlend</td>
 * <td>D3D12_BLEND_ZERO</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].BlendOp</td>
 * <td>D3D12_BLEND_OP_ADD</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].SrcBlendAlpha</td>
 * <td>D3D12_BLEND_ONE</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].DestBlendAlpha</td>
 * <td>D3D12_BLEND_ZERO</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].BlendOpAlpha</td>
 * <td>D3D12_BLEND_OP_ADD</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].LogicOp</td>
 * <td>D3D12_LOGIC_OP_NOOP</td>
 * </tr>
 * <tr>
 * <td>RenderTarget[0].RenderTargetWriteMask</td>
 * <td>D3D12_COLOR_WRITE_ENABLE_ALL</td>
 * </tr>
 * </table>
 * 
 * When you set the <b>LogicOpEnable</b> member of the first element of the <b>RenderTarget</b> array (<b>RenderTarget</b>[0]) to <b>TRUE</b>, you must also set the <b>BlendEnable</b> member of <b>RenderTarget</b>[0] to <b>FALSE</b>, and the <b>IndependentBlendEnable</b> member of this structure to <b>FALSE</b>. This reflects the limitation in hardware that you can't mix logic operations with blending across multiple render targets, and that when you use a logic operation, you must apply the same logic operation to all render targets.
 * 
 * Note the helper structure, <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-blend-desc">CD3DX12_BLEND_DESC</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BLEND_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target. For more info about using alpha-to-coverage, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Alpha-To-Coverage</a>.
     * @type {BOOL}
     */
    AlphaToCoverageEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies whether to enable independent blending in simultaneous render targets. Set to <b>TRUE</b> to enable independent blending. If set to <b>FALSE</b>, only the <b>RenderTarget</b>[0] members are used; <b>RenderTarget</b>[1..7] are ignored.
     * 
     * See the **Remarks** section for restrictions.
     * @type {BOOL}
     */
    IndependentBlendEnable {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc">D3D12_RENDER_TARGET_BLEND_DESC</a> structures that describe the blend states for render targets; these correspond to the eight render targets that can be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> at one time.
     * @type {Array<D3D12_RENDER_TARGET_BLEND_DESC>}
     */
    RenderTarget{
        get {
            if(!this.HasProp("__RenderTargetProxyArray"))
                this.__RenderTargetProxyArray := Win32FixedArray(this.ptr + 8, 8, D3D12_RENDER_TARGET_BLEND_DESC, "")
            return this.__RenderTargetProxyArray
        }
    }
}
