#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The stencil operations that can be performed during depth-stencil testing. (D3D10_STENCIL_OP)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_stencil_op
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_STENCIL_OP extends Win32Enum{

    /**
     * Keep the existing stencil data.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_KEEP => 1

    /**
     * Set the stencil data to 0.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_ZERO => 2

    /**
     * Set the stencil data to the reference value set by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetdepthstencilstate">ID3D10Device::OMSetDepthStencilState</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_REPLACE => 3

    /**
     * Increment the stencil value by 1, and clamp the result.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_INCR_SAT => 4

    /**
     * Decrement the stencil value by 1, and clamp the result.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_DECR_SAT => 5

    /**
     * Invert the stencil data.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_INVERT => 6

    /**
     * Increment the stencil value by 1, and wrap the result if necessary.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_INCR => 7

    /**
     * Increment the stencil value by 1, and wrap the result if necessary.
     * @type {Integer (Int32)}
     */
    static D3D10_STENCIL_OP_DECR => 8
}
