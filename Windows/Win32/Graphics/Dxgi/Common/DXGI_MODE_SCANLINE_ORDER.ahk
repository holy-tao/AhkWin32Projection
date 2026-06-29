#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_MODE_SCANLINE_ORDER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST => 3
}
