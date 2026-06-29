#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct NCRYPT_DESCRIPTOR_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is NCRYPT_DESCRIPTOR_HANDLE) {
                this.Value := value.Value
            }
            else {
                this.Value := value
            }
        }
    }

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    __New(Value := -1) {
        this.Value := Value
    }
}
