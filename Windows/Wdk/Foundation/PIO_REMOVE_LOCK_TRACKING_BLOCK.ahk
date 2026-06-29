#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct PIO_REMOVE_LOCK_TRACKING_BLOCK {
    value : IntPtr

    __value {
        set {
            if (value is PIO_REMOVE_LOCK_TRACKING_BLOCK) {
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
