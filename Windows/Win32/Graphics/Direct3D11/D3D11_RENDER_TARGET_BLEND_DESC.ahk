#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_BLEND_OP.ahk" { D3D11_BLEND_OP }
#Import ".\D3D11_BLEND.ahk" { D3D11_BLEND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the blend state for a render target. (D3D11_RENDER_TARGET_BLEND_DESC)
 * @remarks
 * You specify an array of <b>D3D11_RENDER_TARGET_BLEND_DESC</b> structures in the <b>RenderTarget</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a> structure to describe the blend states for render targets; you can bind up to eight render targets to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> at one time.
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
 * <td>RenderTargetWriteMask</td>
 * <td>D3D11_COLOR_WRITE_ENABLE_ALL</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_render_target_blend_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_RENDER_TARGET_BLEND_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable (or disable) blending.
     */
    BlendEnable : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the RGB value that the pixel shader outputs. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     */
    SrcBlend : D3D11_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the current RGB value in the render target. The <b>BlendOp</b> member defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     */
    DestBlend : D3D11_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">D3D11_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">blend operation</a> defines how to combine the <b>SrcBlend</b> and <b>DestBlend</b> operations.
     */
    BlendOp : D3D11_BLEND_OP

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the alpha value that the pixel shader outputs. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     */
    SrcBlendAlpha : D3D11_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">D3D11_BLEND</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend">blend option</a> specifies the operation to perform on the current alpha value in the render target. Blend options that end in _COLOR are not allowed. The <b>BlendOpAlpha</b> member defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     */
    DestBlendAlpha : D3D11_BLEND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">D3D11_BLEND_OP</a></b>
     * 
     * This <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_blend_op">blend operation</a> defines how to combine the <b>SrcBlendAlpha</b> and <b>DestBlendAlpha</b> operations.
     */
    BlendOpAlpha : D3D11_BLEND_OP

    /**
     * Type: <b>UINT8</b>
     * 
     * A write mask.
     */
    RenderTargetWriteMask : Int8

}
