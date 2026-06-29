#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Properties
 */
export default struct DEVPROP_BOOLEAN {
    value : Int8

    __value {
        set {
            if (value is DEVPROP_BOOLEAN) {
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
