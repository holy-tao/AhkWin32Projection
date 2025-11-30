#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_RESTRICTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_NO_RESTRICTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGGING_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WEB_FILTERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_HOURS_RESTRICTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_GAMES_BLOCKED => 8

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_APPS_RESTRICTED => 16

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_TIME_ALLOWANCE_RESTRICTED => 32

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_GAMES_RESTRICTED => 64
}
