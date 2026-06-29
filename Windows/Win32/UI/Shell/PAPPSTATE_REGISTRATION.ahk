#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PAPPSTATE_REGISTRATION {
    value : IntPtr

    __value {
        set {
            if (value is PAPPSTATE_REGISTRATION) {
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
