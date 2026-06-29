#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Module_Self {
    value : IntPtr

    __value {
        set {
            if (value is MI_Module_Self) {
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
