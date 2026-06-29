#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_FLIPINTERVAL_TYPE {
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
    static D3DDDI_FLIPINTERVAL_IMMEDIATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_ONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_TWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_THREE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_FOUR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_IMMEDIATE_ALLOW_TEARING => 5
}
