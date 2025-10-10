#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the blend state for a render target.
 * @remarks
 * 
  * > [!NOTE]
  * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
  * 
  * You specify an array of <b>D3D12_RENDER_TARGET_BLEND_DESC</b> structures in the <b>RenderTarget</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_blend_desc">D3D12_BLEND_DESC</a> structure to describe the blend states for render targets; you can bind up to eight render targets to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> at one time.
  * 
  * For info about how blending is done, see the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a>.
  * 
  * Here are the default values for blend state.
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
  * <td>LogicOpEnable</td>
  * <td>FALSE</td>
  * </tr>
  * <tr>
  * <td>SrcBlend</td>
  * <td>D3D12_BLEND_ONE</td>
  * </tr>
  * <tr>
  * <td>DestBlend</td>
  * <td>D3D12_BLEND_ZERO</td>
  * </tr>
  * <tr>
  * <td>BlendOp</td>
  * <td>D3D12_BLEND_OP_ADD</td>
  * </tr>
  * <tr>
  * <td>SrcBlendAlpha</td>
  * <td>D3D12_BLEND_ONE</td>
  * </tr>
  * <tr>
  * <td>DestBlendAlpha</td>
  * <td>D3D12_BLEND_ZERO</td>
  * </tr>
  * <tr>
  * <td>BlendOpAlpha</td>
  * <td>D3D12_BLEND_OP_ADD</td>
  * </tr>
  * <tr>
  * <td>LogicOp</td>
  * <td>D3D12_LOGIC_OP_NOOP</td>
  * </tr>
  * <tr>
  * <td>RenderTargetWriteMask</td>
  * <td>D3D12_COLOR_WRITE_ENABLE_ALL</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_render_target_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_TARGET_BLEND_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Specifies whether to enable (or disable) blending. Set to <b>TRUE</b> to enable blending.
     * 
     * > [!NOTE]
     * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
     * @type {Integer}
     */
    BlendEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies whether to enable (or disable) a logical operation. Set to <b>TRUE</b> to enable a logical operation.
     * 
     * > [!NOTE]
     * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
     * @type {Integer}
     */
    LogicOpEnable {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the RGB value that the pixel shader outputs. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     * @type {Integer}
     */
    SrcBlend {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the current RGB value in the render target. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     * @type {Integer}
     */
    DestBlend {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend_op">D3D12_BLEND_OP</a>-typed value that defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     * @type {Integer}
     */
    BlendOp {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the alpha value that the pixel shader outputs. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     * @type {Integer}
     */
    SrcBlendAlpha {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the current alpha value in the render target. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     * @type {Integer}
     */
    DestBlendAlpha {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend_op">D3D12_BLEND_OP</a>-typed value that defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     * @type {Integer}
     */
    BlendOpAlpha {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_logic_op">D3D12_LOGIC_OP</a>-typed value that specifies the logical operation to configure for the render target.
     * @type {Integer}
     */
    LogicOp {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_color_write_enable">D3D12_COLOR_WRITE_ENABLE</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies a write mask.
     * @type {Integer}
     */
    RenderTargetWriteMask {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }
}
