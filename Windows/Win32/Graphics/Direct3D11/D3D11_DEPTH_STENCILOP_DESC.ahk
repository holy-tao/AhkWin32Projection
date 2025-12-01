#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stencil operations that can be performed based on the results of stencil test.
 * @remarks
 * All stencil operations are specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_stencil_op">D3D11_STENCIL_OP</a>. The stencil operation can be set differently based on the outcome of the stencil test (which is referred to as <b>StencilFunc</b> in the stencil test portion of depth-stencil testing.
 * 
 * This structure is a member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">depth-stencil description</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_DEPTH_STENCILOP_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_stencil_op">D3D11_STENCIL_OP</a></b>
     * 
     * The stencil operation to perform when stencil testing fails.
     * @type {Integer}
     */
    StencilFailOp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_stencil_op">D3D11_STENCIL_OP</a></b>
     * 
     * The stencil operation to perform when stencil testing passes and depth testing fails.
     * @type {Integer}
     */
    StencilDepthFailOp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_stencil_op">D3D11_STENCIL_OP</a></b>
     * 
     * The stencil operation to perform when stencil testing and depth testing both pass.
     * @type {Integer}
     */
    StencilPassOp {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a></b>
     * 
     * A function that compares stencil data against existing stencil data. The function options are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a>.
     * @type {Integer}
     */
    StencilFunc {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
