#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOOLTIP_FLAGS {
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
    static TTF_IDISHWND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_CENTERTIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_RTLREADING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_SUBCLASS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_TRACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_ABSOLUTE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_TRANSPARENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_PARSELINKS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TTF_DI_SETITEM => 32768
}
