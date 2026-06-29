#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTEXTUREMIPFILTER {
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
    static D3DTFP_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFP_POINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFP_LINEAR => 3
}
