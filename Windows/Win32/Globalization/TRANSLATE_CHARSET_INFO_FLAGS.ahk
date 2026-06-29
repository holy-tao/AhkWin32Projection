#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct TRANSLATE_CHARSET_INFO_FLAGS {
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
    static TCI_SRCCHARSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCCODEPAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCFONTSIG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCLOCALE => 4096
}
