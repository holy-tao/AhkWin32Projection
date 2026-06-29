#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTimeZoneNameType {
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
    static UTZNM_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_LONG_GENERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_LONG_STANDARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_LONG_DAYLIGHT => 4

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_SHORT_GENERIC => 8

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_SHORT_STANDARD => 16

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_SHORT_DAYLIGHT => 32

    /**
     * @type {Integer (Int32)}
     */
    static UTZNM_EXEMPLAR_LOCATION => 64
}
