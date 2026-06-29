#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_DEVICE_POWER_STATE {
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
    static NdisDeviceStateUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateMaximum => 5
}
