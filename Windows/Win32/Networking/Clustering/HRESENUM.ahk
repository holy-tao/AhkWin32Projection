#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct HRESENUM {
    value : IntPtr

    __value {
        set {
            if (value is HRESENUM) {
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
