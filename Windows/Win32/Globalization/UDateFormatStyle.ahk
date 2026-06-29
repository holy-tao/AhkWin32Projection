#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateFormatStyle {
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
    static UDAT_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_LONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_MEDIUM => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DEFAULT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE => 128

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_FULL_RELATIVE => 128

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_LONG_RELATIVE => 129

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_MEDIUM_RELATIVE => 130

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT_RELATIVE => 131

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_NONE => -1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PATTERN => -2
}
