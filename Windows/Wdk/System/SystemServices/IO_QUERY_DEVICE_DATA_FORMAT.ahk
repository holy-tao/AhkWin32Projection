#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_QUERY_DEVICE_DATA_FORMAT {
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
    static IoQueryDeviceIdentifier => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceConfigurationData => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceComponentInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceMaxData => 3
}
