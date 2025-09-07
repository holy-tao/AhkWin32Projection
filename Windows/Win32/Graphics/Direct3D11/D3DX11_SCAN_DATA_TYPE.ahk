#Requires AutoHotkey v2.0.0 64-bit

/**
 * Type for scan data.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_SCAN_DATA_TYPE{

    /**
     * FLOAT data.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_DATA_TYPE_FLOAT => 1

    /**
     * INT data.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_DATA_TYPE_INT => 2

    /**
     * UINT data.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_DATA_TYPE_UINT => 3
}
