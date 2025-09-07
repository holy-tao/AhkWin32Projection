#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateTimeScale{

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
