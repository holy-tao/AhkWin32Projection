#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct PACKAGEDEPENDENCY_CONTEXT {
    value : IntPtr

    __value {
        set {
            if (value is PACKAGEDEPENDENCY_CONTEXT) {
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
