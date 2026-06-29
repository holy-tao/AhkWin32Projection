#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_TYPE {
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
    static UsbRootHub => 1

    /**
     * @type {Integer (Int32)}
     */
    static Usb20Hub => 2

    /**
     * @type {Integer (Int32)}
     */
    static Usb30Hub => 3
}
