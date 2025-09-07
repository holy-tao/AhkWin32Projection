#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTraceFunctionNumber{

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_FUNCTION_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_U_INIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_U_CLEANUP => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_CONVERSION_START => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_OPEN => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_OPEN_PACKAGE => 4097

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_OPEN_ALGORITHMIC => 4098

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_CLONE => 4099

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_CLOSE => 4100

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_FLUSH_CACHE => 4101

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_LOAD => 4102

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCNV_UNLOAD => 4103

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_COLLATION_START => 8192

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_OPEN => 8192

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_CLOSE => 8193

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_STRCOLL => 8194

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_GET_SORTKEY => 8195

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_GETLOCALE => 8196

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_NEXTSORTKEYPART => 8197

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_STRCOLLITER => 8198

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_OPEN_FROM_SHORT_STRING => 8199

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UCOL_STRCOLLUTF8 => 8200

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UDATA_START => 12288

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UDATA_RESOURCE => 12288

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UDATA_BUNDLE => 12289

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UDATA_DATA_FILE => 12290

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_UDATA_RES_FILE => 12291
}
