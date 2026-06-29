#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct HREGREADBATCHREPLY {
    value : IntPtr

    __value {
        set {
            if (value is HREGREADBATCHREPLY) {
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
