#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_POINTER_QUEUE_STATE {
    value : IntPtr

    __value {
        set {
            if (value is NDR_POINTER_QUEUE_STATE) {
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
