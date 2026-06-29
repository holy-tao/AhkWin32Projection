#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 */
export default struct _SRP_REQUEST {
    value : IntPtr

    __value {
        set {
            if (value is _SRP_REQUEST) {
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
