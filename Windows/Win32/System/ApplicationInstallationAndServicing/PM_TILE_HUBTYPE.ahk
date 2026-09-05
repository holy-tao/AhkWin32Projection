#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_TILE_HUBTYPE extends Win32Enum {

    /**
     * Native name: PM_TILE_HUBTYPE_MUSIC
     * @type {Integer (Int32)}
     */
    static MUSIC => 1

    /**
     * Native name: PM_TILE_HUBTYPE_MOSETTINGS
     * @type {Integer (Int32)}
     */
    static MOSETTINGS => 268435456

    /**
     * Native name: PM_TILE_HUBTYPE_GAMES
     * @type {Integer (Int32)}
     */
    static GAMES => 536870912

    /**
     * Native name: PM_TILE_HUBTYPE_APPLIST
     * @type {Integer (Int32)}
     */
    static APPLIST => 1073741824

    /**
     * Native name: PM_TILE_HUBTYPE_STARTMENU
     * @type {Integer (Int32)}
     */
    static STARTMENU => -2147483648

    /**
     * Native name: PM_TILE_HUBTYPE_LOCKSCREEN
     * @type {Integer (Int32)}
     */
    static LOCKSCREEN => 16777216

    /**
     * Native name: PM_TILE_HUBTYPE_KIDZONE
     * @type {Integer (Int32)}
     */
    static KIDZONE => 33554432

    /**
     * Native name: PM_TILE_HUBTYPE_CACHED
     * @type {Integer (Int32)}
     */
    static CACHED => 67108864

    /**
     * Native name: PM_TILE_HUBTYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 67108865
}
