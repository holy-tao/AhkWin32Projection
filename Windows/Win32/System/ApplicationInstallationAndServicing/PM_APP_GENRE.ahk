#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_APP_GENRE extends Win32Enum {

    /**
     * Native name: PM_APP_GENRE_GAMES
     * @type {Integer (Int32)}
     */
    static GAMES => 0

    /**
     * Native name: PM_APP_GENRE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 1

    /**
     * Native name: PM_APP_GENRE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 2
}
