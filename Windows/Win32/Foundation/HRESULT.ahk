#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hresult
 * @namespace Windows.Win32.Foundation
 */
export default struct HRESULT {
    value : Int32

    __value {
        set {
            if (value is HRESULT) {
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
