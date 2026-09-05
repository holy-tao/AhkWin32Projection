#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the stencil operations that can be performed during depth-stencil testing.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc">D3D12_DEPTH_STENCILOP_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_stencil_op
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STENCIL_OP extends Win32Enum {

    /**
     * Keep the existing stencil data.
     * Native name: D3D12_STENCIL_OP_KEEP
     * @type {Integer (Int32)}
     */
    static KEEP => 1

    /**
     * Set the stencil data to 0.
     * Native name: D3D12_STENCIL_OP_ZERO
     * @type {Integer (Int32)}
     */
    static ZERO => 2

    /**
     * Set the stencil data to the reference value set by calling <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetstencilref">ID3D12GraphicsCommandList::OMSetStencilRef</a>.
     * Native name: D3D12_STENCIL_OP_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 3

    /**
     * Increment the stencil value by 1, and clamp the result.
     * Native name: D3D12_STENCIL_OP_INCR_SAT
     * @type {Integer (Int32)}
     */
    static INCR_SAT => 4

    /**
     * Decrement the stencil value by 1, and clamp the result.
     * Native name: D3D12_STENCIL_OP_DECR_SAT
     * @type {Integer (Int32)}
     */
    static DECR_SAT => 5

    /**
     * Invert the stencil data.
     * Native name: D3D12_STENCIL_OP_INVERT
     * @type {Integer (Int32)}
     */
    static INVERT => 6

    /**
     * Increment the stencil value by 1, and wrap the result if necessary.
     * Native name: D3D12_STENCIL_OP_INCR
     * @type {Integer (Int32)}
     */
    static INCR => 7

    /**
     * Decrement the stencil value by 1, and wrap the result if necessary.
     * Native name: D3D12_STENCIL_OP_DECR
     * @type {Integer (Int32)}
     */
    static DECR => 8
}
