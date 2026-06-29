#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_MODE_ROTATION {
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
    static DXGI_MODE_ROTATION_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_IDENTITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_ROTATE90 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_ROTATE180 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MODE_ROTATION_ROTATE270 => 4
}
