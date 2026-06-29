#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_DEVICE_STATE {
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
    static UsbfnDeviceStateMinimum => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateAttached => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateDefault => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateDetached => 3

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateAddressed => 4

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateConfigured => 5

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateSuspended => 6

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateStateMaximum => 7
}
