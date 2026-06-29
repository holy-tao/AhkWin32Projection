#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NET_IF_COMPARTMENT_ID {
    value : UInt32

    __value {
        set {
            if (value is NET_IF_COMPARTMENT_ID) {
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
