#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEV_QUERY_STATE {
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
    static DevQueryStateInitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateEnumCompleted => 1

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateAborted => 2

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateClosed => 3
}
