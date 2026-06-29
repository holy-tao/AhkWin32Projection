#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTEXTUREFILTER {
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
    static D3DFILTER_NEAREST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILTER_LINEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILTER_MIPNEAREST => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILTER_MIPLINEAR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILTER_LINEARMIPNEAREST => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DFILTER_LINEARMIPLINEAR => 6
}
