#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPCFLAG_RESTRICTION extends Win32Enum {

    /**
     * Native name: WPCFLAG_NO_RESTRICTION
     * @type {Integer (Int32)}
     */
    static NO_RESTRICTION => 0

    /**
     * Native name: WPCFLAG_LOGGING_REQUIRED
     * @type {Integer (Int32)}
     */
    static LOGGING_REQUIRED => 1

    /**
     * Native name: WPCFLAG_WEB_FILTERED
     * @type {Integer (Int32)}
     */
    static WEB_FILTERED => 2

    /**
     * Native name: WPCFLAG_HOURS_RESTRICTED
     * @type {Integer (Int32)}
     */
    static HOURS_RESTRICTED => 4

    /**
     * Native name: WPCFLAG_GAMES_BLOCKED
     * @type {Integer (Int32)}
     */
    static GAMES_BLOCKED => 8

    /**
     * Native name: WPCFLAG_APPS_RESTRICTED
     * @type {Integer (Int32)}
     */
    static APPS_RESTRICTED => 16

    /**
     * Native name: WPCFLAG_TIME_ALLOWANCE_RESTRICTED
     * @type {Integer (Int32)}
     */
    static TIME_ALLOWANCE_RESTRICTED => 32

    /**
     * Native name: WPCFLAG_GAMES_RESTRICTED
     * @type {Integer (Int32)}
     */
    static GAMES_RESTRICTED => 64
}
