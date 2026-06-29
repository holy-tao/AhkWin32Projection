#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BUS_QUERY_ID_TYPE {
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
    static BusQueryDeviceID => 0

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryHardwareIDs => 1

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryCompatibleIDs => 2

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryInstanceID => 3

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryDeviceSerialNumber => 4

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryContainerID => 5
}
