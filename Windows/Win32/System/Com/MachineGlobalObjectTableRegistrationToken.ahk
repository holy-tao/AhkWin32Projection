#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct MachineGlobalObjectTableRegistrationToken {
    value : IntPtr

    __value {
        set {
            if (value is MachineGlobalObjectTableRegistrationToken) {
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
