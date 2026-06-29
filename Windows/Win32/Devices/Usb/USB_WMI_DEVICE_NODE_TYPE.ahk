#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_WMI_DEVICE_NODE_TYPE {
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
    static UsbDevice => 0

    /**
     * @type {Integer (Int32)}
     */
    static HubDevice => 1

    /**
     * @type {Integer (Int32)}
     */
    static CompositeDevice => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbController => 3
}
