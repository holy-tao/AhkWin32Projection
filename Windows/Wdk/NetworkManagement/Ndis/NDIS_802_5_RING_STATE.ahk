#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_5_RING_STATE {
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
    static NdisRingStateOpened => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisRingStateClosed => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisRingStateOpening => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisRingStateClosing => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisRingStateOpenFailure => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisRingStateRingFailure => 6
}
