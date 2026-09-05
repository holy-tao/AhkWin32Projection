#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class VARFORMAT_FIRST_WEEK extends Win32Enum {

    /**
     * Native name: VARFORMAT_FIRST_WEEK_SYSTEMDEFAULT
     * @type {Integer (Int32)}
     */
    static SYSTEMDEFAULT => 0

    /**
     * Native name: VARFORMAT_FIRST_WEEK_CONTAINS_JANUARY_FIRST
     * @type {Integer (Int32)}
     */
    static CONTAINS_JANUARY_FIRST => 1

    /**
     * Native name: VARFORMAT_FIRST_WEEK_LARGER_HALF_IN_CURRENT_YEAR
     * @type {Integer (Int32)}
     */
    static LARGER_HALF_IN_CURRENT_YEAR => 2

    /**
     * Native name: VARFORMAT_FIRST_WEEK_HAS_SEVEN_DAYS
     * @type {Integer (Int32)}
     */
    static HAS_SEVEN_DAYS => 3
}
