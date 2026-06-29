#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_DOORBELLSTATUS {
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
    static D3DDDI_DOORBELLSTATUS_CONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_CONNECTED_NOTIFY_KMD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_DISCONNECTED_RETRY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_DISCONNECTED_ABORT => 3
}
