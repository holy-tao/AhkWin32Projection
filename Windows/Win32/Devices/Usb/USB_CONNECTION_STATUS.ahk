#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CONNECTION_STATUS {
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
    static NoDeviceConnected => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceConnected => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceFailedEnumeration => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceGeneralFailure => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceCausedOvercurrent => 4

    /**
     * @type {Integer (Int32)}
     */
    static DeviceNotEnoughPower => 5

    /**
     * @type {Integer (Int32)}
     */
    static DeviceNotEnoughBandwidth => 6

    /**
     * @type {Integer (Int32)}
     */
    static DeviceHubNestedTooDeeply => 7

    /**
     * @type {Integer (Int32)}
     */
    static DeviceInLegacyHub => 8

    /**
     * @type {Integer (Int32)}
     */
    static DeviceEnumerating => 9

    /**
     * @type {Integer (Int32)}
     */
    static DeviceReset => 10
}
