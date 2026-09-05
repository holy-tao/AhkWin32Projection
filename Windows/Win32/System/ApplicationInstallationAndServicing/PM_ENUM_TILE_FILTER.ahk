#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_TILE_FILTER extends Win32Enum {

    /**
     * Native name: PM_TILE_FILTER_APPLIST
     * @type {Integer (Int32)}
     */
    static APPLIST => 8

    /**
     * Native name: PM_TILE_FILTER_PINNED
     * @type {Integer (Int32)}
     */
    static PINNED => 9

    /**
     * Native name: PM_TILE_FILTER_HUBTYPE
     * @type {Integer (Int32)}
     */
    static HUBTYPE => 10

    /**
     * Native name: PM_TILE_FILTER_APP_ALL
     * @type {Integer (Int32)}
     */
    static APP_ALL => 11

    /**
     * Native name: PM_TILE_FILTER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 12
}
