#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_PIPE_TYPE {
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
    static UsbdPipeTypeControl => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeIsochronous => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeBulk => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbdPipeTypeInterrupt => 3
}
