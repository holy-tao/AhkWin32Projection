#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct ENUM_DATE_FORMATS_FLAGS {
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
    static DATE_SHORTDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_LONGDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_YEARMONTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_MONTHDAY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_AUTOLAYOUT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_LTRREADING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_RTLREADING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_USE_ALT_CALENDAR => 4
}
