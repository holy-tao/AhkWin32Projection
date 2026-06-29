#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct HANDLE_FLAGS {
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
    static HANDLE_FLAG_INHERIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HANDLE_FLAG_PROTECT_FROM_CLOSE => 2
}
