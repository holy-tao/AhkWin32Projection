#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OFFER_PRIORITY {
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
    static D3DKMT_OFFER_PRIORITY_LOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_HIGH => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_OFFER_PRIORITY_AUTO => 4
}
