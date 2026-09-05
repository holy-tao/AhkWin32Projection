#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Type for scan data.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3DX11_SCAN_DATA_TYPE extends Win32Enum {

    /**
     * FLOAT data.
     * Native name: D3DX11_SCAN_DATA_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 1

    /**
     * INT data.
     * Native name: D3DX11_SCAN_DATA_TYPE_INT
     * @type {Integer (Int32)}
     */
    static INT => 2

    /**
     * UINT data.
     * Native name: D3DX11_SCAN_DATA_TYPE_UINT
     * @type {Integer (Int32)}
     */
    static UINT => 3
}
