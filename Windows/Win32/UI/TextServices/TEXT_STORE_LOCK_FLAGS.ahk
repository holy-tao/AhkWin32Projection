#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TEXT_STORE_LOCK_FLAGS {
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
    static TS_LF_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_LF_READWRITE => 6
}
