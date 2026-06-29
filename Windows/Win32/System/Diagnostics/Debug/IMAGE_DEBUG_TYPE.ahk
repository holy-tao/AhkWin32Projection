#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_DEBUG_TYPE {
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
    static IMAGE_DEBUG_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_COFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_CODEVIEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_FPO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_MISC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_EXCEPTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_FIXUP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_BORLAND => 9
}
