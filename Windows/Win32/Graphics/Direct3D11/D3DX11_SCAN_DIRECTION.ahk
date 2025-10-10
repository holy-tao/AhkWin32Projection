#Requires AutoHotkey v2.0.0 64-bit

/**
 * Direction to perform scan in.
 * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/ne-d3dcsx-d3dx11_scan_direction
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_SCAN_DIRECTION{

    /**
     * Scan forward.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_DIRECTION_FORWARD => 1

    /**
     * Scan backward.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_DIRECTION_BACKWARD => 2
}
