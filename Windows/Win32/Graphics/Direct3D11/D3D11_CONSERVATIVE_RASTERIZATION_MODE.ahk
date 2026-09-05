#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies whether conservative rasterization is on or off. (D3D11_CONSERVATIVE_RASTERIZATION_MODE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_conservative_rasterization_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_CONSERVATIVE_RASTERIZATION_MODE extends Win32Enum {

    /**
     * Conservative rasterization is off.
     * Native name: D3D11_CONSERVATIVE_RASTERIZATION_MODE_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Conservative rasterization is on.
     * Native name: D3D11_CONSERVATIVE_RASTERIZATION_MODE_ON
     * @type {Integer (Int32)}
     */
    static ON => 1
}
