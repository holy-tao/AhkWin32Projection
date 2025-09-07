#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identify the portion of a depth-stencil buffer for writing depth data. (D3D10_DEPTH_WRITE_MASK)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_depth_write_mask
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_DEPTH_WRITE_MASK{

    /**
     * Turn off writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_DEPTH_WRITE_MASK_ZERO => 0

    /**
     * Turn on writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_DEPTH_WRITE_MASK_ALL => 1
}
