#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the blend state for a render target. (D3D11_RENDER_TARGET_BLEND_DESC1)
 * @remarks
 * > [!NOTE]
 * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
 * 
 * You specify an array of <b>D3D11_RENDER_TARGET_BLEND_DESC1</b> structures in the <b>RenderTarget</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-cd3d11_blend_desc1">D3D11_BLEND_DESC1</a> structure to describe the blend states for render targets; you can bind up to eight render targets to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> at one time.
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
 * <td>D3D11_BLEND_ONE</td>
 * </tr>
 * <tr>
 * <td>DestBlend</td>
 * <td>D3D11_BLEND_ZERO</td>
 * </tr>
 * <tr>
 * <td>BlendOp</td>
 * <td>D3D11_BLEND_OP_ADD</td>
 * </tr>
 * <tr>
 * <td>SrcBlendAlpha</td>
 * <td>D3D11_BLEND_ONE</td>
 * </tr>
 * <tr>
 * <td>DestBlendAlpha</td>
 * <td>D3D11_BLEND_ZERO</td>
 * </tr>
 * <tr>
 * <td>BlendOpAlpha</td>
 * <td>D3D11_BLEND_OP_ADD</td>
 * </tr>
 * <tr>
 * <td>LogicOp</td>
 * <td>D3D11_LOGIC_OP_NOOP</td>
 * </tr>
 * <tr>
 * <td>RenderTargetWriteMask</td>
 * <td>D3D11_COLOR_WRITE_ENABLE_ALL</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_render_target_blend_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RENDER_TARGET_BLEND_DESC1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) blending.
     * 
     * > [!NOTE]
     * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
     * @type {BOOL}
     */
    BlendEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) a logical operation.
     * 
     * > [!NOTE]
     * > If you set *LogicOpEnable* to **TRUE**, then *BlendEnable* must be **FALSE**, and the system's [**D3D11_FEATURE_DATA_D3D11_OPTIONS::OutputMergerLogicOp**](../d3d11/ns-d3d11-d3d11_feature_data_d3d11_options.md) option must be **TRUE**.
     * @type {BOOL}
     */
    LogicOpEnable {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the RGB value that the pixel shader outputs. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     * @type {Integer}
     */
    SrcBlend {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the current RGB value in the render target. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     * @type {Integer}
     */
    DestBlend {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">D3D11_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">blend operation</a> defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     * @type {Integer}
     */
    BlendOp {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the alpha value that the pixel shader outputs. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     * @type {Integer}
     */
    SrcBlendAlpha {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the current alpha value in the render target. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     * @type {Integer}
     */
    DestBlendAlpha {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">D3D11_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">blend operation</a> defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     * @type {Integer}
     */
    BlendOpAlpha {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_logic_op">D3D11_LOGIC_OP</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_logic_op">D3D11_LOGIC_OP</a>-typed value that specifies the logical operation to configure for the render target.
     * @type {Integer}
     */
    LogicOp {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * A write mask.
     * @type {Integer}
     */
    RenderTargetWriteMask {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }
}
