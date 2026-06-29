#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SECURITY_CONTEXT_TRACKING_MODE {
    value : Int8

    __value {
        set {
            if (value is SECURITY_CONTEXT_TRACKING_MODE) {
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
