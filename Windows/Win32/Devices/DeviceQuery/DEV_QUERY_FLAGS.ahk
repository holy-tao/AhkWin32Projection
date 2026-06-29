#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEV_QUERY_FLAGS {
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
    static DevQueryFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagUpdateResults => 1

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagAllProperties => 2

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagLocalize => 4

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagAsyncClose => 8
}
