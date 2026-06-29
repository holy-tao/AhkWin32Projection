#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_MAP_FLAGS {
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
    static DXGI_MAP_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MAP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MAP_DISCARD => 4
}
