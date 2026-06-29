#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_DIRECTION {
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
    static UsbfnDirectionMinimum => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionTx => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionRx => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionMaximum => 3
}
