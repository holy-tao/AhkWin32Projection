#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_BUS_SPEED {
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
    static UsbfnBusSpeedLow => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnBusSpeedFull => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnBusSpeedHigh => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnBusSpeedSuper => 3

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnBusSpeedMaximum => 4
}
