#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberFormatPadPosition {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_BEFORE_PREFIX => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_AFTER_PREFIX => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_BEFORE_SUFFIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_AFTER_SUFFIX => 3
}
