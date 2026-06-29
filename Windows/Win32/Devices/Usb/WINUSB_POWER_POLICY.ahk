#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct WINUSB_POWER_POLICY {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_SUSPEND => 129

    /**
     * @type {Integer (UInt32)}
     */
    static SUSPEND_DELAY => 131
}
