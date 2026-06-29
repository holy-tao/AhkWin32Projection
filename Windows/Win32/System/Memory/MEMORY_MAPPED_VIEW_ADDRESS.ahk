#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEMORY_MAPPED_VIEW_ADDRESS {
    Value : IntPtr

    __value {
        set {
            if (value is MEMORY_MAPPED_VIEW_ADDRESS) {
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
    static invalidValues => [0]

    __New(Value := 0) {
        this.Value := Value
    }
}
