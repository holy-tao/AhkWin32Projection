#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PCUSERIALIZEDPROPSTORAGE {
    value : IntPtr

    __value {
        set {
            if (value is PCUSERIALIZEDPROPSTORAGE) {
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
