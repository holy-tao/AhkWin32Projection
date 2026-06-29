#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WAN_QUALITY {
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
    static NdisWanRaw => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanErrorControl => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanReliable => 2
}
