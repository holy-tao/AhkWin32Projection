#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CHANGE_REGISTRATION_HANDLE {
    value : IntPtr

    __value {
        set {
            if (value is USB_CHANGE_REGISTRATION_HANDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
