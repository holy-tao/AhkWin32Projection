#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes stencil operations that can be performed based on the results of stencil test.
 * @remarks
 * 
 * All stencil operations are specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_stencil_op">D3D12_STENCIL_OP</a>-typed value. Each stencil operation can be set differently based on the outcome of the stencil test, which is referred to as <b>StencilFunc</b>, in the stencil test portion of depth-stencil testing.
 * 
 * Members of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a> have this structure for their data type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_depth_stencilop_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEPTH_STENCILOP_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_stencil_op">D3D12_STENCIL_OP</a>-typed value that identifies the stencil operation to perform when stencil testing fails.
     * @type {Integer}
     */
    StencilFailOp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_stencil_op">D3D12_STENCIL_OP</a>-typed value that identifies the stencil operation to perform when stencil testing passes and depth testing fails.
     * @type {Integer}
     */
    StencilDepthFailOp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_stencil_op">D3D12_STENCIL_OP</a>-typed value that identifies the stencil operation to perform when stencil testing and depth testing both pass.
     * @type {Integer}
     */
    StencilPassOp {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_comparison_func">D3D12_COMPARISON_FUNC</a>-typed value that identifies the function that compares stencil data against existing stencil data.
     * @type {Integer}
     */
    StencilFunc {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
