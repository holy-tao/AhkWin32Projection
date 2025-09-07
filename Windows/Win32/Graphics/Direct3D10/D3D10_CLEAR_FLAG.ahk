#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the parts of the depth stencil to clear. Usually used with ID3D10Device::ClearDepthStencilView.
 * @remarks
 * These flags can be bitwise ORed together.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_clear_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_CLEAR_FLAG{

    /**
     * Clear the depth buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_CLEAR_DEPTH => 1

    /**
     * Clear the stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_CLEAR_STENCIL => 2
}
