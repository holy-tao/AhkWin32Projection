#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct DUPLICATE_HANDLE_OPTIONS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_CLOSE_SOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_SAME_ACCESS => 2
}
