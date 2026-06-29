#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct STI_DEVICE_MJ_TYPE {
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
    static StiDeviceTypeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeScanner => 1

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeDigitalCamera => 2

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeStreamingVideo => 3
}
