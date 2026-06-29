#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct PSC_NOTIFICATION_REGISTRATION {
    value : IntPtr

    __value {
        set {
            if (value is PSC_NOTIFICATION_REGISTRATION) {
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
