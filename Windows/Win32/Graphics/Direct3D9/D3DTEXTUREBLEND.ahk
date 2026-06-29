#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTEXTUREBLEND {
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
    static D3DTBLEND_DECAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_MODULATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_DECALALPHA => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_MODULATEALPHA => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_DECALMASK => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_MODULATEMASK => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_COPY => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DTBLEND_ADD => 8
}
