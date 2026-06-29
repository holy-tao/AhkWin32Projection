#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct TrackerHandle {
    value : IntPtr

    __value {
        set {
            if (value is TrackerHandle) {
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
