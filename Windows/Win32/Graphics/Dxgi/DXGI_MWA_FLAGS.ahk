#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_MWA_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_NO_WINDOW_CHANGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_NO_ALT_ENTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_NO_PRINT_SCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MWA_VALID => 7
}
