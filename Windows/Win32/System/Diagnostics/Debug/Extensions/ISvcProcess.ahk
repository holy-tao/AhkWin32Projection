#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ISvcProcess {
    value : IntPtr

    __value {
        set {
            if (value is ISvcProcess) {
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
