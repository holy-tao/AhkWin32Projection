#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_LOGIC_OP.ahk" { D3D12_LOGIC_OP }
#Import ".\D3D12_BLEND_OP.ahk" { D3D12_BLEND_OP }
#Import ".\D3D12_BLEND.ahk" { D3D12_BLEND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the blend state for a render target. (D3D12_RENDER_TARGET_BLEND_DESC)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_TARGET_BLEND_DESC {
    #StructPack 4

    /**
     * Specifies whether to enable (or disable) blending. Set to <b>TRUE</b> to enable blending.
     * 
     * > [!NOTE]
     * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
     */
    BlendEnable : BOOL

    /**
     * Specifies whether to enable (or disable) a logical operation. Set to <b>TRUE</b> to enable a logical operation.
     * 
     * > [!NOTE]
     * > It's not valid for *LogicOpEnable* and *BlendEnable* to both be **TRUE**.
     */
    LogicOpEnable : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the RGB value that the pixel shader outputs. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     */
    SrcBlend : D3D12_BLEND

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the current RGB value in the render target. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     */
    DestBlend : D3D12_BLEND

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend_op">D3D12_BLEND_OP</a>-typed value that defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     */
    BlendOp : D3D12_BLEND_OP

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the alpha value that the pixel shader outputs. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     */
    SrcBlendAlpha : D3D12_BLEND

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a>-typed value that specifies the operation to perform on the current alpha value in the render target. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     */
    DestBlendAlpha : D3D12_BLEND

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend_op">D3D12_BLEND_OP</a>-typed value that defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     */
    BlendOpAlpha : D3D12_BLEND_OP

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_logic_op">D3D12_LOGIC_OP</a>-typed value that specifies the logical operation to configure for the render target.
     */
    LogicOp : D3D12_LOGIC_OP

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_color_write_enable">D3D12_COLOR_WRITE_ENABLE</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies a write mask.
     */
    RenderTargetWriteMask : Int8

}
