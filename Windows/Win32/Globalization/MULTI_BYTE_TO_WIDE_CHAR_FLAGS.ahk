#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MULTI_BYTE_TO_WIDE_CHAR_FLAGS {
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
    static MB_COMPOSITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ERR_INVALID_CHARS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MB_PRECOMPOSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MB_USEGLYPHCHARS => 4
}
