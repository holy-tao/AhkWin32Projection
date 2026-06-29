#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDIGPUVIRTUALADDRESS_RESERVATION_TYPE {
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
    static D3DDDIGPUVIRTUALADDRESS_RESERVE_NO_ACCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIGPUVIRTUALADDRESS_RESERVE_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIGPUVIRTUALADDRESS_RESERVE_NO_COMMIT => 2
}
