#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies whether conservative rasterization is on or off. (D3D11_CONSERVATIVE_RASTERIZATION_MODE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_conservative_rasterization_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CONSERVATIVE_RASTERIZATION_MODE{

    /**
     * Conservative rasterization is off.
     * @type {Integer (Int32)}
     */
    static D3D11_CONSERVATIVE_RASTERIZATION_MODE_OFF => 0

    /**
     * Conservative rasterization is on.
     * @type {Integer (Int32)}
     */
    static D3D11_CONSERVATIVE_RASTERIZATION_MODE_ON => 1
}
