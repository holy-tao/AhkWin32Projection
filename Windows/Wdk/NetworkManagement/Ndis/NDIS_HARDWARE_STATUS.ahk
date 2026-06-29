#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_HARDWARE_STATUS {
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
    static NdisHardwareStatusReady => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusInitializing => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusReset => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusClosing => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusNotReady => 4
}
