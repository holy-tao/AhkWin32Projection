#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NOTIFICATION_TYPE {
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
    static EnumerationFailure => 0

    /**
     * @type {Integer (Int32)}
     */
    static InsufficentBandwidth => 1

    /**
     * @type {Integer (Int32)}
     */
    static InsufficentPower => 2

    /**
     * @type {Integer (Int32)}
     */
    static OverCurrent => 3

    /**
     * @type {Integer (Int32)}
     */
    static ResetOvercurrent => 4

    /**
     * @type {Integer (Int32)}
     */
    static AcquireBusInfo => 5

    /**
     * @type {Integer (Int32)}
     */
    static AcquireHubName => 6

    /**
     * @type {Integer (Int32)}
     */
    static AcquireControllerName => 7

    /**
     * @type {Integer (Int32)}
     */
    static HubOvercurrent => 8

    /**
     * @type {Integer (Int32)}
     */
    static HubPowerChange => 9

    /**
     * @type {Integer (Int32)}
     */
    static HubNestedTooDeeply => 10

    /**
     * @type {Integer (Int32)}
     */
    static ModernDeviceInLegacyHub => 11
}
