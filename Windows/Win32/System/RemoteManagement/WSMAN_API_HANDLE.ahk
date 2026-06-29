#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_API_HANDLE {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_API_HANDLE) {
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
