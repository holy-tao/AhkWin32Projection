#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_GAMMARAMP_TYPE {
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
    static D3DDDI_GAMMARAMP_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_RGB256x3x16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_DXGI_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_MATRIX_3x4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_MATRIX_V2 => 5
}
