#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateTimeScale {
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
    static UDTS_JAVA_TIME => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_UNIX_TIME => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_ICU4C_TIME => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_WINDOWS_FILE_TIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_DOTNET_DATE_TIME => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_MAC_OLD_TIME => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_MAC_TIME => 6

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_EXCEL_TIME => 7

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_DB2_TIME => 8

    /**
     * @type {Integer (Int32)}
     */
    static UDTS_UNIX_MICROSECONDS_TIME => 9
}
