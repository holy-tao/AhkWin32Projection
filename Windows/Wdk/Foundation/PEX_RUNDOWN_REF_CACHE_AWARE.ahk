#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct PEX_RUNDOWN_REF_CACHE_AWARE {
    value : IntPtr

    __value {
        set {
            if (value is PEX_RUNDOWN_REF_CACHE_AWARE) {
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
