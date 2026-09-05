#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class CCM_SPECIAL extends Win32Enum {

    /**
     * Native name: CCM_SPECIAL_SEPARATOR
     * @type {Integer (Int32)}
     */
    static SEPARATOR => 1

    /**
     * Native name: CCM_SPECIAL_SUBMENU
     * @type {Integer (Int32)}
     */
    static SUBMENU => 2

    /**
     * Native name: CCM_SPECIAL_DEFAULT_ITEM
     * @type {Integer (Int32)}
     */
    static DEFAULT_ITEM => 4

    /**
     * Native name: CCM_SPECIAL_INSERTION_POINT
     * @type {Integer (Int32)}
     */
    static INSERTION_POINT => 8

    /**
     * Native name: CCM_SPECIAL_TESTONLY
     * @type {Integer (Int32)}
     */
    static TESTONLY => 16

    /**
     * Native name: CCM_SPECIAL_ELEVATION_ICON
     * @type {Integer (Int32)}
     */
    static ELEVATION_ICON => 32
}
