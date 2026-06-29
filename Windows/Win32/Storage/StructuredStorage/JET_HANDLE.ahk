#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_HANDLE
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-handle
 * @namespace Windows.Win32.Storage.StructuredStorage
 */
export default struct JET_HANDLE {
    Value : IntPtr

    __value {
        set {
            if (value is JET_HANDLE) {
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
