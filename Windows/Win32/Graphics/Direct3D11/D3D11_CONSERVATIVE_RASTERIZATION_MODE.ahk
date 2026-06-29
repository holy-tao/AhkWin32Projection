#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies whether conservative rasterization is on or off. (D3D11_CONSERVATIVE_RASTERIZATION_MODE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_conservative_rasterization_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_CONSERVATIVE_RASTERIZATION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
