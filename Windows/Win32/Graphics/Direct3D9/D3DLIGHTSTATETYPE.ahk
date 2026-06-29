#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHTSTATETYPE {
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
    static D3DLIGHTSTATE_MATERIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_AMBIENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_COLORMODEL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_FOGMODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_FOGSTART => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_FOGEND => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_FOGDENSITY => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTSTATE_COLORVERTEX => 8
}
