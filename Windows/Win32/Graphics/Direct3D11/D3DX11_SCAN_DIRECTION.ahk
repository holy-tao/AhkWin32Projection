#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Direction to perform scan in.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_direction
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3DX11_SCAN_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
