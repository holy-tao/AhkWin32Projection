#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_EVENT {
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
    static UsbfnEventMinimum => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventAttach => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventReset => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventDetach => 3

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventSuspend => 4

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventResume => 5

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventSetupPacket => 6

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventConfigured => 7

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventUnConfigured => 8

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventPortType => 9

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventBusTearDown => 10

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventSetInterface => 11

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnEventMaximum => 12
}
