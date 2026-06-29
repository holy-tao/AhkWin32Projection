#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct LOADER_PARAMETER_BLOCK {
    value : IntPtr

    __value {
        set {
            if (value is LOADER_PARAMETER_BLOCK) {
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
