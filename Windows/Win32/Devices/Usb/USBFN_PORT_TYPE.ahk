#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_PORT_TYPE {
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
    static UsbfnUnknownPort => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnStandardDownstreamPort => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnChargingDownstreamPort => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDedicatedChargingPort => 3

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnInvalidDedicatedChargingPort => 4

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnProprietaryDedicatedChargingPort => 5

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnPortTypeMaximum => 6
}
