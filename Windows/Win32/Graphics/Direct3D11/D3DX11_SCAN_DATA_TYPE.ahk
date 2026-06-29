#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Type for scan data.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_SCAN_DATA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
