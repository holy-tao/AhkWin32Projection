#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct _DEVICE_OBJECT_POWER_EXTENSION {
    value : IntPtr

    __value {
        set {
            if (value is _DEVICE_OBJECT_POWER_EXTENSION) {
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
