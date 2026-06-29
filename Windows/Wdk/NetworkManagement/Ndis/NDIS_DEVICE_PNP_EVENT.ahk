#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_DEVICE_PNP_EVENT {
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
    static NdisDevicePnPEventQueryRemoved => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventRemoved => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventSurpriseRemoved => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventQueryStopped => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventStopped => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventPowerProfileChanged => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventMaximum => 6
}
