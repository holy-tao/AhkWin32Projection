#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct PCALLBACK_OBJECT {
    value : IntPtr

    __value {
        set {
            if (value is PCALLBACK_OBJECT) {
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
