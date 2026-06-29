#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct PNDR_ASYNC_MESSAGE {
    value : IntPtr

    __value {
        set {
            if (value is PNDR_ASYNC_MESSAGE) {
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
