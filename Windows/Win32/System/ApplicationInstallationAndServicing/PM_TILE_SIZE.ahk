#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_TILE_SIZE extends Win32Enum {

    /**
     * Native name: PM_TILE_SIZE_SMALL
     * @type {Integer (Int32)}
     */
    static SMALL => 0

    /**
     * Native name: PM_TILE_SIZE_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 1

    /**
     * Native name: PM_TILE_SIZE_LARGE
     * @type {Integer (Int32)}
     */
    static LARGE => 2

    /**
     * Native name: PM_TILE_SIZE_SQUARE310X310
     * @type {Integer (Int32)}
     */
    static SQUARE310X310 => 3

    /**
     * Native name: PM_TILE_SIZE_TALL150X310
     * @type {Integer (Int32)}
     */
    static TALL150X310 => 4

    /**
     * Native name: PM_TILE_SIZE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 5
}
