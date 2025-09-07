#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the stencil operations that can be performed based on the results of stencil test.
 * @remarks
 * The stencil operation can be set differently based on the outcome of the stencil test by using the <b>StencilFunc</b> member.  This can be done for the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">stencil test</a> portion of depth-stencil testing.
  * 
  * The D3D10_DEPTH_STENCILOP_DESC structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_DEPTH_STENCILOP_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_stencil_op">D3D10_STENCIL_OP</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_stencil_op">D3D10_STENCIL_OP</a> enumerated type that describes the stencil operation to perform when stencil testing fails. The default value is <b>D3D10_STENCIL_OP_KEEP</b>.
     * @type {Integer}
     */
    StencilFailOp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_stencil_op">D3D10_STENCIL_OP</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_stencil_op">D3D10_STENCIL_OP</a> enumerated type that describes the stencil operation to perform when stencil testing passes and depth testing fails. The default value is <b>D3D10_STENCIL_OP_KEEP</b>.
     * @type {Integer}
     */
    StencilDepthFailOp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_stencil_op">D3D10_STENCIL_OP</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_stencil_op">D3D10_STENCIL_OP</a> enumerated type that describes the stencil operation to perform when stencil testing and depth testing both pass. The default value is <b>D3D10_STENCIL_OP_KEEP</b>.
     * @type {Integer}
     */
    StencilPassOp {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_comparison_func">D3D10_COMPARISON_FUNC</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_comparison_func">D3D10_COMPARISON_FUNC</a> enumerated type that describes how stencil data is compared against existing stencil data. The default value is <b>D3D10_COMPARISON_ALWAYS</b>.
     * @type {Integer}
     */
    StencilFunc {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
