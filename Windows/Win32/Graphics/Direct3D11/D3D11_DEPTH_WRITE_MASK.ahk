#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identify the portion of a depth-stencil buffer for writing depth data. (D3D11_DEPTH_WRITE_MASK)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_depth_write_mask
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_DEPTH_WRITE_MASK extends Win32Enum{

    /**
     * Turn off writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_DEPTH_WRITE_MASK_ZERO => 0

    /**
     * Turn on writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_DEPTH_WRITE_MASK_ALL => 1
}
